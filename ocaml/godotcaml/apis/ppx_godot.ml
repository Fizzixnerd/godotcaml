open! Base
open! Ppxlib

module Class = struct
  let expander ~ctxt class_name module_items =
    let loc = Expansion_context.Extension.extension_point_loc ctxt in
    let bottom_of_module_defs =
      [%str
        let _godot_class_info =
          let open Godotcaml_base.Godotcaml.C in
          let open Godotcaml_api.Gdforeign in
          ClassCreationInfo2.make
            (gc_alloc ~count:1 ?finalise:None)
            (fun _ ->
              let ret =
                coerce_ptr object_ptr.plain
                @@ classdb_construct_object
                     (string_name_of_string _godot_inherits)
              in
              let instance_binding_callbacks = InstanceBindingCallbacks.make 
                (gc_alloc ~count:1 ?finalise:None)
              in
              object_set_instance ret
                (string_name_of_string _godot_class_name)
                (coerce_ptr class_instance_ptr.plain null);
              object_set_instance_binding ret
                (coerce_ptr (ptr void) !library)
                (coerce_ptr (ptr void) null)
                instance_binding_callbacks;
              ret)
            (fun _ _ -> Stdio.print_endline "collecting")

        let () =
          let open Godotcaml_base.Godotcaml.C in
          let open Godotcaml_api.Gdforeign in
          let on_load_func = !on_load in
          Stdio.prerr_endline ("Loading " ^ _godot_class_name ^ " into chain");
          let new_on_load_func () =
            classdb_register_extension_class2
              !Godotcaml_api.Gdforeign.library
              (string_name_of_string _godot_class_name)
              (string_name_of_string _godot_inherits)
              _godot_class_info;
            !_godot_methods_loader ();
            on_load_func ()
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
    let call_to_ocaml : label -> expression -> expression =
     fun mod_name e ->
      let to_ocaml_ident =
        pexp_ident { txt = Ldot (lident mod_name, "to_ocaml"); loc }
      in
      pexp_apply to_ocaml_ident [ (Nolabel, e) ]
    in
    let call_ocaml_of_variant : label -> expression -> expression =
     fun mod_name e ->
      let to_ocaml_ident =
        pexp_ident { txt = Ldot (lident mod_name, "ocaml_of_variant"); loc }
      in
      pexp_apply to_ocaml_ident [ (Nolabel, e) ]
    in

    let call_es =
      xs
      |> List.mapi ~f:(fun i (mod_name, _) ->
             ( Nolabel,
               call_ocaml_of_variant mod_name
                 [%expr
                   !@(coerce_ptr (ptr variant_ptr.plain) args
                     +@ [%e
                          pexp_constant (Pconst_integer (Int.to_string i, None))]
                     )] ))
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
                   !@(coerce_ptr (ptr [%e typ]) args
                     +@ [%e
                          pexp_constant (Pconst_integer (Int.to_string i, None))]
                     )] ))
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
         ~name:
           {
             txt = Some (gen_symbol ~prefix:(String.capitalize f_name) ());
             loc;
           }
         ~expr:
           (pmod_structure @@ mod_xs
           @ [
               mod_self;
               mod_ret;
               let_func;
               [%stri
                 let call_func : Godotcaml_base.Godotcaml.C.ClassMethodCall.fn =
                   let open Godotcaml_base.Godotcaml.C in
                   let open Godotcaml_api.Gdforeign in
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
                   let open Godotcaml_api.Gdforeign in
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
                     [%e
                       if not is_void_returning then
                         [%expr
                           let ret' = coerce_ptr Ret.typ ret in
                           ret' <-@ !@(Ret.of_ocaml ret'')]
                       else [%expr ()]]];
               [%stri
                 let () =
                   let count =
                     [%e
                       pexp_constant
                         (Pconst_integer
                            (Printf.sprintf "%d" (mod_xs |> List.length), None))]
                   in
                   let old_methods_loader = !_godot_methods_loader in
                   let mkstrnamep s =
                     let open Godotcaml_base.Godotcaml.C in
                     let open Godotcaml_api.Gdforeign in
                     coerce string_name_ptr.const string_name_ptr.plain
                     @@ string_name_of_string s
                   in
                   let new_methods_loader () =
                     let open Godotcaml_base.Godotcaml.C in
                     let open Godotcaml_api.Gdforeign in
                     let arguments_info = gc_alloc ~count PropertyInfo.s in
                     let arguments_metadata = gc_alloc ~count int in
                     for i = 0 to count do
                       arguments_info +@ i
                       <-@ !@(PropertyInfo.make
                                (gc_alloc ~count:1 ?finalise:None)
                                VariantType.int
                                (mkstrnamep (Printf.sprintf "x%d" i))
                                (mkstrnamep "int") (Unsigned.UInt32.of_int 0)
                                (Godotcaml_api.Api_builtins.BuiltinClass0.String
                                 .of_ocaml "??"
                                |> coerce_ptr string_ptr.plain)
                                (Unsigned.UInt32.of_int 6));
                       arguments_metadata +@ i
                       <-@ ClassMethodArgumentMetadata.none
                     done;
                     let flags =
                       [%e pexp_array class_method_flags]
                       |> Base.Array.fold ~init:(Unsigned.UInt32.of_int 0)
                            ~f:Unsigned.UInt32.add
                     in
                     let method_info =
                       let open Godotcaml_base.Godotcaml.C in
                       ClassMethodInfo.make ~return_value_info:arguments_info
                         ~return_value_metadata:!@arguments_metadata
                         ~method_flags:flags
                         (gc_alloc ~count:1 ?finalise:None)
                         (mkstrnamep
                            [%e
                              pexp_constant (Pconst_string (f_name, loc, None))])
                         true
                         (Unsigned.UInt32.of_int count)
                         arguments_info arguments_metadata
                         (ClassMethodCall.of_fun call_func)
                         (ClassMethodPtrCall.of_fun ptrcall_func)
                     in
                     classdb_register_extension_class_method
                       !Godotcaml_api.Gdforeign.library
                       (string_name_of_string _godot_class_name)
                       method_info;
                     old_methods_loader () (* Tail "recursion" *)
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
