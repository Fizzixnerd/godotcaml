open! Base
open! Ppxlib

let extract_module_expr e =
  match e.pexp_desc with
  | Pexp_pack me -> me
  | _ ->
      failwith
        "Expected module pack expressions (e.g. `(module MyInScopeModule)`) \
         for all but the last argument in this binding."

module Class = struct
  let expander ~ctxt class_name module_items =
    let loc = Expansion_context.Extension.extension_point_loc ctxt in
    let bottom_of_module_defs =
      [%str
        open Living
        open Living_core.Default.Let_syntax

        let instance_binding_callbacks =
          let open Godotcaml_base.Godotcaml.C in
          let open Godotcaml_apis.Gdforeign in
          Living_core.Default.unsafe_free
          @@ InstanceBindingCallbacks.make (gc_alloc ~count:1 ?finalise:None)

        let _godot_create _ =
          let open Godotcaml_base.Godotcaml.C in
          let open Godotcaml_apis.Gdforeign in
          let open Living in
          let open Living_core.Default.Let_syntax in
          Living_core.Default.unsafe_free
          @@
          let* ret =
            Living_core.Default.map
              (coerce_ptr object_ptr.plain)
              (Living_core.Default.map classdb_construct_object
                 (string_name_of_string _godot_inherits))
          in
          let* class_name = string_name_of_string _godot_class_name in
          object_set_instance ret class_name
            (coerce_ptr class_instance_ptr.plain null);
          object_set_instance_binding ret
            (coerce_ptr (ptr void) !library)
            (coerce_ptr (ptr void) null)
            instance_binding_callbacks;
          init ret

        let new_ () = Living_core.Default.return @@ _godot_create ()

        let new_ptr =
          let open Godotcaml_base.Godotcaml.C in
          let open Godotcaml_apis.Gdforeign in
          ClassCreateInstance.of_fun _godot_create

        let finalizer_ptr =
          let open Godotcaml_base.Godotcaml.C in
          let open Godotcaml_apis.Gdforeign in
          ClassFreeInstance.of_fun _godot_finalizer

        let _godot_class_info =
          let open Godotcaml_base.Godotcaml.C in
          let open Godotcaml_apis.Gdforeign in
          let get_virtual =
            ClassGetVirtual.of_fun (fun _ f_str_name ->
                _godot_virtual_function_lookup f_str_name
                |> Option.value ~default:(coerce_ptr ClassCallVirtual.t null))
          in
          Living_core.Default.unsafe_free
          @@ ClassCreationInfo2.make
               (gc_alloc ~count:1 ?finalise:None)
               new_ptr finalizer_ptr ~get_virtual

        let () =
          let open Godotcaml_base.Godotcaml.C in
          let open Godotcaml_apis.Gdforeign in
          let open Living in
          let open Living_core.Default.Let_syntax in
          let on_load_func = !on_load in
          let new_on_load_func () =
            Living_core.Default.unsafe_free
            @@
            let* godot_inherits_strname =
              string_name_of_string _godot_inherits
            in
            let* godot_class_name_strname =
              string_name_of_string _godot_class_name in
            let () = on_load_func () in
            classdb_register_extension_class2
              !Godotcaml_apis.Gdforeign.library
              godot_class_name_strname godot_inherits_strname _godot_class_info;
            !_godot_vars_loader ();
            !_godot_signals_loader ();
            !_godot_methods_loader ();
            Living_core.Default.return ()
          in
          on_load := new_on_load_func]
    in
    let top_of_module_defs =
      [%str
        let _godot_class_name : string =
          [%e Ast_builder.Default.estring ~loc class_name]

        let _godot_methods_loader = ref (fun () -> ())
        let _godot_signals_loader = ref (fun () -> ())
        let _godot_vars_loader = ref (fun () -> ())
        let _godot_virtual_function_table = Hashtbl.create (module String)
        let _godot_finalizer _ _ = ()

        let _godot_virtual_function_add function_name
            (f : Godotcaml_base.Godotcaml.C.ClassCallVirtual.t) =
          Hashtbl.add _godot_virtual_function_table ~key:function_name ~data:f

        let _godot_virtual_function_lookup function_stringname =
          let open Godotcaml_apis.Api_builtins in
          let open Godotcaml_apis.Gdforeign in
          let open Living in
          let open Living_core.Default.Let_syntax in
          Living_core.Default.unsafe_free
          @@
          let* s =
            Living_core.Default.map BuiltinClass0.String.to_ocaml
              (BuiltinClass.StringName.substr
                 (BuiltinClass0.Int.of_ocaml 0L)
                 (BuiltinClass0.Int.of_ocaml (-1L))
                 (coerce_ptr StringName.typ function_stringname))
          in
          Living_core.Default.return
            (Hashtbl.find _godot_virtual_function_table s)

        let _godot_inherits : string =
          [%e Ast_builder.Default.estring ~loc "RefCounted"]]
    in
    Ast_builder.Default.(
      pstr_module ~loc
        (module_binding ~loc
           ~name:{ txt = Option.some class_name; loc }
           ~expr:
             (pmod_structure ~loc
                (top_of_module_defs @ module_items @ bottom_of_module_defs))))

  let pattern =
    Ast_pattern.(
      pstr
        (pstr_module (module_binding ~name:(some __) ~expr:(pmod_structure __))
        ^:: nil))

  let extender =
    Extension.V3.declare "gclass" Extension.Context.structure_item pattern
      expander

  let rule = Context_free.Rule.extension extender
  let () = Driver.register_transformation ~rules:[ rule ] "gclass"
end

module Inherits = struct
  let expander ~ctxt parent_class_name =
    let loc = Expansion_context.Extension.extension_point_loc ctxt in
    Ast_builder.Default.(
      [%stri let _godot_inherits : string = [%e estring ~loc parent_class_name]])

  let pattern =
    Ast_pattern.(single_expr_payload (pexp_construct (lident __) none))

  let extender =
    Extension.V3.declare "ginherits" Extension.Context.structure_item pattern
      expander

  let rule = Context_free.Rule.extension extender
  let () = Driver.register_transformation ~rules:[ rule ] "ginherits"
end

module Signal = struct
  let parse_args : (arg_label * expression) list -> module_expr list =
   fun args_with_labels ->
    args_with_labels |> List.map ~f:(fun x -> extract_module_expr (snd x))

  let expander ~ctxt _rec_flag signal_name _trash args =
    let loc = Expansion_context.Extension.extension_point_loc ctxt in
    let (module M) = Ast_builder.make loc in
    let open M in
    let args = parse_args args in
    let xs =
      args |> List.mapi ~f:(fun i arg -> (Printf.sprintf "X%d" i, arg))
    in
    let mod_xs =
      xs
      |> List.map ~f:(fun (name, mod_expr) ->
             pstr_module
             @@ module_binding ~name:{ txt = Some name; loc } ~expr:mod_expr)
    in
    let type_enums_and_names =
      xs
      |> List.map ~f:(fun (mod_name, _) ->
             pexp_tuple
               [
                 pexp_ident { txt = Ldot (lident mod_name, "type_enum"); loc };
                 pexp_ident { txt = Ldot (lident mod_name, "type_name"); loc };
               ])
    in
    let stris =
      mod_xs
      @ [%str
          let _register_signal () =
            let open Godotcaml_base.Godotcaml.C in
            let open Godotcaml_apis.Gdforeign in
            let open Living in
            let _signal_name =
              [%e Ast_builder.Default.estring ~loc signal_name]
            in
            let count =
              [%e
                pexp_constant
                  (Pconst_integer
                     (Printf.sprintf "%d" (mod_xs |> List.length), None))]
            in
            let ret =
              let open Living_core.Default.Let_syntax in
              let mkstrnamep x =
                Living_core.Default.map
                  (coerce_ptr string_name_ptr.plain)
                  (string_name_of_string x)
              in
              let* class_name_strname =
                string_name_of_string _godot_class_name
              in
              let* signal_name_strname = string_name_of_string _signal_name in
              let* x = mkstrnamep "x" in
              let* int = mkstrnamep "int" in
              let$ hint_str =
                Godotcaml_apis.Api_builtins.BuiltinClass0.String.of_ocaml "??"
                |> coerce_ptr string_ptr.plain
              in
              let zero = Unsigned.UInt32.of_int 0 in
              let six = Unsigned.UInt32.of_int 6 in
              let* argument_info_ptr = gc_alloc ~count PropertyInfo.s in
              let* argument_infos =
                [%e pexp_array type_enums_and_names]
                |> Base.Array.map ~f:(fun (te, tn) ->
                       let* tn = mkstrnamep tn in
                       PropertyInfo.make
                         (gc_alloc ~count:1 ?finalise:None)
                         te tn tn zero hint_str six)
                |> Base.Array.to_list |> Living_core.Default.sequence_list
              in
              (* FIXME: Make not O(n^2)! *)
              for i = 0 to count - 1 do
                let ret =
                  let* ai = !@(List.nth_exn argument_infos i) in
                  argument_info_ptr +@ i <-@ ai
                in
                Living_core.Default.unsafe_free ret
              done;
              Living_core.Default.return
              @@ classdb_register_extension_class_signal
                   !Godotcaml_apis.Gdforeign.library
                   class_name_strname signal_name_strname argument_info_ptr
                   (count |> Int64.of_int)
            in
            Living_core.Default.unsafe_free ret

          let () =
            let old_signals_loader = !_godot_signals_loader in
            let new_signals_loader () =
              _register_signal ();
              old_signals_loader ()
            in
            _godot_signals_loader := new_signals_loader]
    in
    pstr_module
    @@ module_binding
         ~name:{ txt = Some ("Gsignal_" ^ signal_name); loc }
         ~expr:(pmod_structure stris)

  let pattern =
    Ast_pattern.(
      pstr
        (pstr_value __
           (value_binding ~pat:(ppat_var __) ~expr:(pexp_apply __ __) ^:: nil)
        ^:: nil))

  let extender =
    Extension.V3.declare "gsignal" Extension.Context.structure_item pattern
      expander

  let non_void_rule = Context_free.Rule.extension extender
  let () = Driver.register_transformation ~rules:[ non_void_rule ] "gsignal"
end

module Var = struct end

module Func = struct
  let parse_args :
      (arg_label * expression) list ->
      module_expr list * module_expr * module_expr * expression =
   fun args ->
    let rec parse_args' acc args =
      match args with
      | (_, a) :: (_ :: _ :: _ :: _ as rest) -> parse_args' (a :: acc) rest
      | [ (_, self); (_, ret); (_, impl) ] -> (List.rev acc, self, ret, impl)
      | _ -> failwith "Not enough args in a gfunc binding: requires at least 3."
    in
    let args, self, ret, impl = parse_args' [] args in
    ( args |> List.map ~f:extract_module_expr,
      extract_module_expr self,
      extract_module_expr ret,
      impl )

  let module_defs is_void_returning ~ctxt rec_flag f_name class_method_flags
      args =
    let loc = Expansion_context.Extension.extension_point_loc ctxt in
    let (module M) = Ast_builder.make loc in
    let open M in
    let args, self, ret, impl = parse_args args in
    let xs =
      args |> List.mapi ~f:(fun i arg -> (Printf.sprintf "X%d" i, arg))
    in
    let mod_xs =
      xs
      |> List.map ~f:(fun (name, mod_expr) ->
             pstr_module
             @@ module_binding ~name:{ txt = Some name; loc } ~expr:mod_expr)
    in
    let arg_enums_and_names =
      xs
      |> List.map ~f:(fun (mod_name, _) ->
             pexp_tuple
               [
                 pexp_ident { txt = Ldot (lident mod_name, "type_enum"); loc };
                 pexp_ident { txt = Ldot (lident mod_name, "type_name"); loc };
               ])
    in
    let ret_enum_and_name =
      if is_void_returning then
        pexp_tuple
          [
            pexp_constant (Pconst_integer ("0", None));
            pexp_constant (Pconst_string ("", loc, None));
          ]
      else
        pexp_tuple
          [
            pexp_ident { txt = Ldot (lident "Ret", "type_enum"); loc };
            pexp_ident { txt = Ldot (lident "Ret", "type_name"); loc };
          ]
    in
    let call : label -> label -> expression -> expression =
     fun func_name mod_name e ->
      let ident = pexp_ident { txt = Ldot (lident mod_name, func_name); loc } in
      pexp_apply ident [ (Nolabel, e) ]
    in
    let call_to_ocaml = call "to_ocaml" in
    let call_ocaml_of_variant = call "ocaml_of_variant" in

    let call_es =
      xs
      |> List.mapi ~f:(fun i (mod_name, _) ->
             ( Nolabel,
               call_ocaml_of_variant mod_name
                 [%expr
                   let open Living in
                   let open Living_core.Default.Let_syntax in
                   let args' = coerce_ptr (ptr variant_ptr.plain) args in
                   let arg_i =
                     let* arg_i =
                       args'
                       +@ [%e
                            pexp_constant
                              (Pconst_integer (Int.to_string i, None))]
                     in
                     !@arg_i
                   in
                   Living_core.Default.unsafe_free arg_i] ))
    in

    let ptrcall_es : (arg_label * expression) list =
      xs
      |> List.mapi ~f:(fun i (mod_name, _) ->
             let typ =
               pexp_ident { txt = Ldot (lident mod_name, "typ"); loc }
             in
             ( Nolabel,
               call_to_ocaml mod_name
                 [%expr
                   let open Living in
                   let open Living_core.Default.Let_syntax in
                   let args' = coerce_ptr (ptr [%e typ]) args in
                   let arg_i =
                     let* arg_i =
                       args'
                       +@ [%e
                            pexp_constant
                              (Pconst_integer (Int.to_string i, None))]
                     in
                     !@arg_i
                   in
                   Living_core.Default.unsafe_free arg_i] ))
    in
    let mod_self =
      pstr_module @@ module_binding ~name:{ txt = Some "Self"; loc } ~expr:self
    in
    let mod_ret =
      pstr_module @@ module_binding ~name:{ txt = Some "Ret"; loc } ~expr:ret
    in
    let let_func =
      pstr_value rec_flag
        [ value_binding ~pat:(ppat_var { txt = f_name; loc }) ~expr:impl ]
    in
    mod_xs
    @ [
        mod_self;
        mod_ret;
        let_func;
        [%stri
          let call_func : Godotcaml_base.Godotcaml.C.ClassMethodCall.fn =
            let open Godotcaml_base.Godotcaml.C in
            let open Godotcaml_apis.Gdforeign in
            fun _method_userdata instance args count ret _err ->
              (* FIXME: Make this set err appropriately! *)
              let () =
                assert (
                  Int64.(
                    count
                    = of_int
                        [%e
                          pexp_constant
                            (Pconst_integer
                               ( Printf.sprintf "%d" (mod_xs |> List.length),
                                 None ))]))
              in
              let self =
                coerce class_instance_ptr.plain Self.godot_typ instance
              in
              let ret'' =
                [%e
                  pexp_apply
                    (pexp_ident { txt = lident f_name; loc })
                    (call_es @ [ (Nolabel, [%expr self]) ])]
              in
              ignore ret'';
              [%e
                if not is_void_returning then
                  [%expr
                    variant_new_copy
                      (coerce variant_ptr.plain variant_ptr.uninit ret)
                      (coerce_ptr variant_ptr.const
                      @@ Ret.ocaml_to_variant ret'')]
                else [%expr ignore self]]];
        [%stri
          let ptrcall_func : Godotcaml_base.Godotcaml.C.ClassMethodPtrCall.fn =
            let open Godotcaml_base.Godotcaml.C in
            let open Godotcaml_apis.Gdforeign in
            let open Living.Living_core.Default.Let_syntax in
            fun _method_userdata instance args ret ->
              let self =
                coerce class_instance_ptr.plain Self.godot_typ instance
              in
              let ret'' =
                [%e
                  pexp_apply
                    (pexp_ident { txt = lident f_name; loc })
                    (ptrcall_es @ [ (Nolabel, [%expr self]) ])]
              in
              ignore ret'';
              let final_ret =
                [%e
                  if not is_void_returning then
                    [%expr
                      let ret' =
                        Living.Living_core.Default.return
                          (coerce_ptr Ret.typ ret)
                      in
                      let* ret_ptr = !@(Ret.of_ocaml ret'') in
                      ret' <-@ ret_ptr]
                  else [%expr Living.Living_core.Default.return ()]]
              in
              Living.Living_core.Default.unsafe_free final_ret];
        [%stri
          let call_func_ptr =
            Ctypes.Root.get
              (Ctypes.Root.create
                 (Godotcaml_base.Godotcaml.C.ClassMethodCall.of_fun call_func))];
        [%stri
          let ptrcall_func_ptr =
            Ctypes.Root.get
              (Ctypes.Root.create
                 (Godotcaml_base.Godotcaml.C.ClassMethodPtrCall.of_fun
                    ptrcall_func))];
        [%stri
          let count =
            [%e
              pexp_constant
                (Pconst_integer
                   (Printf.sprintf "%d" (mod_xs |> List.length), None))]];
        [%stri
          let () =
            let open Living in
            let open Living_core.Default.Let_syntax in
            let old_methods_loader = !_godot_methods_loader in
            let mkstrnamep s =
              let open Godotcaml_base.Godotcaml.C in
              let open Godotcaml_apis.Gdforeign in
              Living_core.Default.map
                (coerce string_name_ptr.const string_name_ptr.plain)
                (string_name_of_string s)
            in
            let new_methods_loader () =
              let final_ret =
                let open Godotcaml_base.Godotcaml.C in
                let open Godotcaml_apis.Gdforeign in
                let* arguments_info = gc_alloc ~count PropertyInfo.s in
                let* arguments_metadata = gc_alloc ~count int in
                let* callable = mkstrnamep "Callable" in
                let$ hint_str =
                  Godotcaml_apis.Api_builtins.BuiltinClass0.String.of_ocaml "??"
                  |> coerce_ptr string_ptr.plain
                in
                let zero = Unsigned.UInt32.of_int 0 in
                let six = Unsigned.UInt32.of_int 6 in
                let* argument_infos =
                  [%e pexp_array arg_enums_and_names]
                  |> Base.Array.map ~f:(fun (te, tn) ->
                         let* tn = mkstrnamep tn in
                         PropertyInfo.make
                           (gc_alloc ~count:1 ?finalise:None)
                           te tn tn zero hint_str six)
                  |> Base.Array.to_list |> Living_core.Default.sequence_list
                in
                (* FIXME: Make not O(n^2)! *)
                for i = 0 to count - 1 do
                  let ret =
                    let* ai = !@(List.nth_exn argument_infos i) in
                    let* () = arguments_info +@ i <-@ ai in
                    arguments_metadata +@ i <-@ ClassMethodArgumentMetadata.none
                  in
                  Living_core.Default.unsafe_free ret
                done;
                let ret_enum, ret_name = [%e ret_enum_and_name] in
                let* ret_name = mkstrnamep ret_name in
                let* ret_info =
                  PropertyInfo.make
                    (gc_alloc ~count:1 ?finalise:None)
                    ret_enum ret_name ret_name zero hint_str six
                in
                let flags =
                  [%e pexp_array class_method_flags]
                  |> Base.Array.fold ~init:(Unsigned.UInt32.of_int 0)
                       ~f:Unsigned.UInt32.add
                in
                let* function_name =
                  mkstrnamep
                    [%e pexp_constant (Pconst_string (f_name, loc, None))]
                in
                let count' = Unsigned.UInt32.of_int count in
                let* method_info =
                  let open Godotcaml_base.Godotcaml.C in
                  ClassMethodInfo.make ~return_value_info:ret_info
                    ~return_value_metadata:ClassMethodArgumentMetadata.none
                    ~method_flags:flags
                    (gc_alloc ~count:1 ?finalise:None)
                    function_name true count' arguments_info arguments_metadata
                    call_func_ptr ptrcall_func_ptr
                in
                let* class_name = string_name_of_string _godot_class_name in
                classdb_register_extension_class_method
                  !Godotcaml_apis.Gdforeign.library
                  class_name method_info;
                Living_core.Default.return (old_methods_loader ())
                (* Tail "recursion" *)
              in
              Living_core.Default.unsafe_free final_ret
            in
            _godot_methods_loader := new_methods_loader];
      ]

  let expander is_void_returning ~ctxt rec_flag f_name class_method_flags args =
    let loc = Expansion_context.Extension.extension_point_loc ctxt in
    let (module M) = Ast_builder.make loc in
    let open M in
    pstr_module
    @@ module_binding
         ~name:{ txt = Some ("Gfunc_" ^ f_name); loc }
         ~expr:
           (pmod_structure
           @@ module_defs is_void_returning ~ctxt rec_flag f_name
                class_method_flags args)

  let pattern =
    Ast_pattern.(
      pstr
        (pstr_value __
           (value_binding ~pat:(ppat_var __)
              ~expr:(pexp_apply (pexp_array __) __)
           ^:: nil)
        ^:: nil))

  let non_void_extender =
    Extension.V3.declare "gfunc" Extension.Context.structure_item pattern
      (expander false)

  let void_extender =
    Extension.V3.declare "gfunc_void" Extension.Context.structure_item pattern
      (expander true)

  let non_void_rule = Context_free.Rule.extension non_void_extender
  let () = Driver.register_transformation ~rules:[ non_void_rule ] "gfunc"
  let void_rule = Context_free.Rule.extension void_extender
  let () = Driver.register_transformation ~rules:[ void_rule ] "gfunc_void"
end

module Override = struct
  let expander is_void_returning ~ctxt rec_flag f_name class_method_flags args =
    let loc = Expansion_context.Extension.extension_point_loc ctxt in
    let (module M) = Ast_builder.make loc in
    let open M in
    let xs, _, _, _ = Func.parse_args args in
    let ys = xs |> List.mapi ~f:(fun i _ -> Printf.sprintf "y%d" i) in
    let xs = xs |> List.mapi ~f:(fun i arg -> (Printf.sprintf "X%d" i, arg)) in
    let function_name_expr =
      pexp_constant @@ Pconst_string (f_name, loc, None)
    in
    let count = List.length xs in
    let lets (n : int) : (expression -> expression) list =
      let rec lets (k : int) acc =
        if k = -1 then acc
        else
          let new_let body =
            [%expr
              let* loc_k =
                args
                +@ [%e
                     pexp_constant
                       (Pconst_integer (Printf.sprintf "%d" k, None))]
              in
              let* arg_k = !@loc_k in
              let [%p ppat_var { txt = Printf.sprintf "y%d" k; loc }] =
                [%e
                  pexp_ident
                    {
                      txt = Ldot (lident (Printf.sprintf "X%d" k), "to_ocaml");
                      loc;
                    }]
                  (coerce_ptr
                     [%e
                       pexp_ident
                         {
                           txt =
                             Ldot (lident (Printf.sprintf "X%d" k), "godot_typ");
                           loc;
                         }]
                     arg_k)
              in
              [%e body]]
          in
          lets (k - 1) (new_let :: acc)
      in
      lets (n - 1) []
    in
    let composed_lets body =
      lets count |> List.fold ~init:body ~f:(fun acc let_i -> let_i acc)
    in
    let function_expr args =
      pexp_apply
        (pexp_ident { txt = lident f_name; loc })
        (args
        |> List.map ~f:(fun arg ->
               (Nolabel, pexp_ident { txt = lident arg; loc })))
    in
    pstr_module
    @@ module_binding
         ~name:{ txt = Some ("Goverride_" ^ f_name); loc }
         ~expr:
           (pmod_structure
           @@ Func.module_defs is_void_returning ~ctxt rec_flag f_name
                class_method_flags args
           @ [
               [%stri
                 let () =
                   let _call_virtual_func :
                       Godotcaml_base.Godotcaml.C.ClassCallVirtual.t =
                     Godotcaml_base.Godotcaml.C.ClassCallVirtual.of_fun
                       (fun self args ret ->
                         let open Living in
                         let open Living_core.Default.Let_syntax in
                         let open Living_ctypes.Default in
                         let open Godotcaml_apis.Gdforeign in
                         Living_core.Default.unsafe_free
                         @@
                         let self = coerce_ptr Self.godot_typ self in
                         let self = Self.to_ocaml self in
                         [%e
                           composed_lets
                           @@
                           if is_void_returning then
                             [%expr
                               Living_core.Default.return
                                 ([%e function_expr ys] self)]
                           else
                             [%expr
                               let ret' =
                                 Ret.of_ocaml ([%e function_expr ys] self)
                               in
                               Living_core.Default.return
                                 (coerce_ptr Ret.godot_t ret)
                               <-@ ret']])
                   in
                   let _res =
                     _godot_virtual_function_add [%e function_name_expr]
                       _call_virtual_func
                   in
                   ()];
             ])

  let pattern =
    Ast_pattern.(
      pstr
        (pstr_value __
           (value_binding ~pat:(ppat_var __)
              ~expr:(pexp_apply (pexp_array __) __)
           ^:: nil)
        ^:: nil))

  let non_void_extender =
    Extension.V3.declare "goverride" Extension.Context.structure_item pattern
      (expander false)

  let void_extender =
    Extension.V3.declare "goverride_void" Extension.Context.structure_item
      pattern (expander true)

  let non_void_rule = Context_free.Rule.extension non_void_extender
  let () = Driver.register_transformation ~rules:[ non_void_rule ] "goverride"
  let void_rule = Context_free.Rule.extension void_extender
  let () = Driver.register_transformation ~rules:[ void_rule ] "goverride_void"
end

module Callable = struct
  let parse_args :
      (arg_label * expression) list ->
      module_expr list * module_expr * expression =
   fun args ->
    let rec parse_args' acc args =
      match args with
      | (_, a) :: (_ :: _ :: _ as rest) -> parse_args' (a :: acc) rest
      | [ (_, ret); (_, impl) ] -> (List.rev acc, ret, impl)
      | _ ->
          failwith
            "Not enough args in a gcallable binding: requires at least 2."
    in
    let args, ret, impl = parse_args' [] args in
    let extract_module_expr e =
      match e.pexp_desc with
      | Pexp_pack me -> me
      | _ ->
          failwith
            "Expected module pack expressions (e.g. `(module \
             MyInScopeModule)`) for all but the last argument in a gcallable \
             binding."
    in
    (args |> List.map ~f:extract_module_expr, extract_module_expr ret, impl)

  let expander is_void_returning ~ctxt rec_flag f_name _ args in_body =
    let loc = Expansion_context.Extension.extension_point_loc ctxt in
    let (module M) = Ast_builder.make loc in
    let open M in
    let args, ret, impl = parse_args args in
    let xs =
      args |> List.mapi ~f:(fun i arg -> (Printf.sprintf "X%d" i, arg))
    in
    let let_mod_xs_in =
      xs
      |> List.map ~f:(fun (name, mod_expr) ->
             pexp_letmodule { txt = Some name; loc } mod_expr)
    in
    let call func_name mod_name e =
      let ident = pexp_ident { txt = Ldot (lident mod_name, func_name); loc } in
      pexp_apply ident [ (Nolabel, e) ]
    in
    let call_ocaml_of_variant = call "ocaml_of_variant" in
    let call_es =
      xs
      |> List.mapi ~f:(fun i (mod_name, _) ->
             ( Nolabel,
               call_ocaml_of_variant mod_name
                 [%expr
                   let args' = coerce_ptr (ptr variant_ptr.plain) args in
                   let arg_i =
                     let* arg_i =
                       args'
                       +@ [%e
                            pexp_constant
                              (Pconst_integer (Int.to_string i, None))]
                     in
                     !@arg_i
                   in
                   Living_core.Default.unsafe_free arg_i] ))
    in
    let let_mod_ret_in = pexp_letmodule { txt = Some "Ret"; loc } ret in
    let let_func_in =
      pexp_let rec_flag
        [ value_binding ~pat:(ppat_var { txt = f_name; loc }) ~expr:impl ]
    in
    let composed_let_xs =
      let_mod_xs_in |> List.fold ~f:(fun acc y z -> acc (y z)) ~init:Fn.id
    in
    let composed_lets x = let_func_in (let_mod_ret_in (composed_let_xs x)) in
    let let_callable e =
      pexp_let Nonrecursive
        [ value_binding ~pat:(ppat_var { txt = f_name; loc }) ~expr:e ]
        in_body
    in
    let_callable
      (composed_lets
         [%expr
           let final_ret =
             let open Living in
             let open Living_core.Default.Let_syntax in
             let open Godotcaml_apis.Gdforeign in
             let open Godotcaml_base.Godotcaml.C in
             let callable_func :
                 Godotcaml_base.Godotcaml.C.CallableCustomCall.fn =
              fun _userdata args count ret call_error ->
               let final_ret =
                 let () =
                   assert (
                     Int64.(
                       count
                       = of_int
                           [%e
                             pexp_constant
                               (Pconst_integer
                                  ( Printf.sprintf "%d"
                                      (let_mod_xs_in |> List.length),
                                    None ))]))
                 in
                 let* call_ok = !@CallError.call_ok in
                 let* () = Living_core.Default.return call_error <-@ call_ok in
                 let ret' =
                   [%e
                     pexp_apply
                       (pexp_ident { txt = lident f_name; loc })
                       call_es]
                 in
                 ignore ret';
                 [%e
                   if not is_void_returning then
                     [%expr
                       Living_core.Default.return
                       @@ variant_new_copy
                            (coerce variant_ptr.plain variant_ptr.uninit ret)
                            (coerce_ptr variant_ptr.const
                               (Ret.ocaml_to_variant ret'))]
                   else [%expr Living_core.Default.return ()]]
               in
               Living_core.Default.unsafe_free final_ret
             in
             let$ callable_func_ptr = CallableCustomCall.of_fun callable_func in
             let* info_struct =
               Godotcaml_base.Godotcaml.C.CallableInfoStruct.make
                 (gc_alloc ~count:1 ?finalise:None)
                 !Godotcaml_apis.Gdforeign.library
                 callable_func_ptr
             in
             let callable_ptr =
               coerce_ptr Godotcaml_base.Godotcaml.C.type_ptr.uninit
                 (Living_core.Default.unsafe_free
                 @@ Godotcaml_apis.Gdforeign.gc_alloc ~count:1
                      Godotcaml_apis.Api_types.ApiTypes.Callable.s)
             in
             let () = callable_custom_create callable_ptr info_struct in
             Living_core.Default.return
             @@ coerce_ptr
                  (ptr Godotcaml_apis.Api_types.ApiTypes.Callable.s)
                  callable_ptr
           in
           Living_core.Default.unsafe_free final_ret])

  let pattern =
    Ast_pattern.(
      single_expr_payload
        (pexp_let __
           (value_binding ~pat:(ppat_var __) ~expr:(pexp_apply __ __) ^:: nil)
           __))

  let non_void_extender =
    Extension.V3.declare "gcallable" Extension.Context.expression pattern
      (expander false)

  let void_extender =
    Extension.V3.declare "gcallable_void" Extension.Context.expression pattern
      (expander true)

  let non_void_rule = Context_free.Rule.extension non_void_extender
  let () = Driver.register_transformation ~rules:[ non_void_rule ] "gcallable"
  let void_rule = Context_free.Rule.extension void_extender
  let () = Driver.register_transformation ~rules:[ void_rule ] "gcallable_void"
end
