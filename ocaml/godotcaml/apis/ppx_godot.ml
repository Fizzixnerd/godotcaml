open! Base
open! Ppxlib

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
          @@ InstanceBindingCallbacks.make
               (gc_alloc ~count:1
                  ?finalise:
                    (Some
                       (fun _ -> Stdio.print_endline "THE INSTANCE BINDINGS!")))

        let new_ _ =
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
          Living_core.Default.return ret

        let new_ptr =
          let open Godotcaml_base.Godotcaml.C in
          let open Godotcaml_apis.Gdforeign in
          ClassCreateInstance.of_fun new_

        let finalizer _ _ = Stdio.print_endline "collecting"

        let finalizer_ptr =
          let open Godotcaml_base.Godotcaml.C in
          let open Godotcaml_apis.Gdforeign in
          ClassFreeInstance.of_fun finalizer

        let _godot_class_info =
          let open Godotcaml_base.Godotcaml.C in
          let open Godotcaml_apis.Gdforeign in
          Living_core.Default.unsafe_free
          @@ ClassCreationInfo2.make
               (gc_alloc ~count:1 ~finalise:(fun _ ->
                    Stdio.print_endline "Blarg!"))
               new_ptr finalizer_ptr

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
              string_name_of_string _godot_class_name
            in
            classdb_register_extension_class2
              !Godotcaml_apis.Gdforeign.library
              godot_class_name_strname godot_inherits_strname _godot_class_info;
            !_godot_methods_loader ();
            Living_core.Default.return (on_load_func ())
          in
          on_load := new_on_load_func]
    in
    let top_of_module_defs =
      [%str
        let _godot_class_name : string =
          [%e Ast_builder.Default.estring ~loc class_name]

        let _godot_methods_loader = ref (fun () -> ())

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
    let extract_module_expr e =
      match e.pexp_desc with
      | Pexp_pack me -> me
      | _ ->
          failwith
            "Expected module pack expressions (e.g. `(module \
             MyInScopeModule)`) for all but the last argument in a gfunc \
             binding."
    in
    ( args |> List.map ~f:extract_module_expr,
      extract_module_expr self,
      extract_module_expr ret,
      impl )

  let expander is_void_returning ~ctxt rec_flag f_name class_method_flags args =
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
    pstr_module
    @@ module_binding
         ~name:{ txt = Some ("Gfunc_" ^ f_name); loc }
         ~expr:
           (pmod_structure @@ mod_xs
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
                                      ( Printf.sprintf "%d"
                                          (mod_xs |> List.length),
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
                 let ptrcall_func :
                     Godotcaml_base.Godotcaml.C.ClassMethodPtrCall.fn =
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
                        (Godotcaml_base.Godotcaml.C.ClassMethodCall.of_fun
                           call_func))];
               [%stri
                 let ptrcall_func_ptr =
                   Ctypes.Root.get
                     (Ctypes.Root.create
                        (Godotcaml_base.Godotcaml.C.ClassMethodPtrCall.of_fun
                           ptrcall_func))];
               [%stri
                 let () =
                   let open Living in
                   let open Living_core.Default.Let_syntax in
                   let count =
                     [%e
                       pexp_constant
                         (Pconst_integer
                            (Printf.sprintf "%d" (mod_xs |> List.length), None))]
                   in
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
                       let* xn = mkstrnamep "x" in
                       let* int = mkstrnamep "int" in
                       let* callable = mkstrnamep "Callable" in
                       let$ hint_str =
                         Godotcaml_apis.Api_builtins.BuiltinClass0.String
                         .of_ocaml "??"
                         |> coerce_ptr string_ptr.plain
                       in
                       let zero = Unsigned.UInt32.of_int 0 in
                       let six = Unsigned.UInt32.of_int 6 in
                       let* argument_infos =
                         List.range 0 count
                         |> List.map ~f:(fun _i ->
                                PropertyInfo.make
                                  (gc_alloc ~count:1 ~finalise:(fun _ ->
                                       Stdio.print_endline "THE PROPERTY INFOS"))
                                  VariantType.int xn int zero hint_str six)
                         |> Living_core.Default.sequence_list
                       in
                       (* FIXME: Make not O(n^2)! *)
                       for i = 0 to count - 1 do
                         let ret =
                           let* ai = !@(List.nth_exn argument_infos i) in
                           let* () = arguments_info +@ i <-@ ai in
                           arguments_metadata +@ i
                           <-@ ClassMethodArgumentMetadata.none
                         in
                         Living_core.Default.unsafe_free ret
                       done;
                       let* ret_info =
                         PropertyInfo.make
                           (gc_alloc ~count:1 ~finalise:(fun _ ->
                                Stdio.print_endline "THE PROPERTY INFOS RET"))
                           VariantType.callable xn callable zero hint_str six
                       in
                       let flags =
                         [%e pexp_array class_method_flags]
                         |> Base.Array.fold ~init:(Unsigned.UInt32.of_int 0)
                              ~f:Unsigned.UInt32.add
                       in
                       let* function_name =
                         mkstrnamep
                           [%e
                             pexp_constant (Pconst_string (f_name, loc, None))]
                       in
                       let count' = Unsigned.UInt32.of_int count in
                       let* method_info =
                         let open Godotcaml_base.Godotcaml.C in
                         ClassMethodInfo.make ~return_value_info:ret_info
                           ~return_value_metadata:
                             ClassMethodArgumentMetadata.none
                           ~method_flags:flags
                           (gc_alloc ~count:1 ~finalise:(fun _ ->
                                Stdio.print_endline "the method infos!"))
                           function_name true count' arguments_info
                           arguments_metadata call_func_ptr ptrcall_func_ptr
                       in
                       let* class_name =
                         string_name_of_string _godot_class_name
                       in
                       classdb_register_extension_class_method
                         !Godotcaml_apis.Gdforeign.library
                         class_name method_info;
                       Living_core.Default.return (old_methods_loader ())
                       (* Tail "recursion" *)
                     in
                     Living_core.Default.unsafe_free final_ret
                   in
                   _godot_methods_loader := new_methods_loader];
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
                 (gc_alloc ~count:1 ~finalise:(fun _ ->
                      Stdio.prerr_endline "Woof!"))
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
