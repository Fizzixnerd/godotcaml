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
              coerce_ptr object_ptr.plain
              @@ classdb_construct_object
                   (string_name_of_string _godot_inherits))
            (fun _ _ -> ())

        let () =
          let open Godotcaml_base.Godotcaml.C in
          let open Godotcaml_api.Gdforeign in
          let on_load_func = !on_load in
          Stdio.prerr_endline ("Loading " ^ _godot_class_name ^ " into chain");
          let new_on_load_func () =
            on_load_func ();
            classdb_register_extension_class2
              !Godotcaml_api.Gdforeign.library
              (string_name_of_string _godot_class_name)
              (string_name_of_string _godot_inherits)
              _godot_class_info;
            !_godot_methods_loader ()
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

module Func1 = struct
  let expander ~ctxt rec_flag f_name mod_x0_expr mod_self_expr mod_ret_expr f =
    let loc = Expansion_context.Extension.extension_point_loc ctxt in
    let (module M) = Ast_builder.make loc in
    let open M in
    let gen_name = gen_symbol ~prefix:"Func" () in
    let gen_x0 = "X0" in
    let gen_self = "Self" in
    let gen_ret = "Ret" in
    let mod_x0 =
      pstr_module
      @@ module_binding ~name:{ txt = Some gen_x0; loc } ~expr:mod_x0_expr
    in
    let mod_self =
      pstr_module
      @@ module_binding ~name:{ txt = Some gen_self; loc } ~expr:mod_self_expr
    in
    let mod_ret =
      pstr_module
      @@ module_binding ~name:{ txt = Some gen_ret; loc } ~expr:mod_ret_expr
    in
    let let_func =
      pstr_value rec_flag
        [ value_binding ~pat:(ppat_var { txt = f_name; loc }) ~expr:f ]
    in
    pstr_module
    @@ module_binding
         ~name:{ txt = Some gen_name; loc }
         ~expr:
           (pmod_structure
              [
                mod_x0;
                mod_self;
                mod_ret;
                let_func;
                [%stri
                  let call_func : Godotcaml_base.Godotcaml.C.ClassMethodCall.fn =
                    let open Godotcaml_base.Godotcaml.C in
                    let open Godotcaml_api.Gdforeign in
                    fun _method_userdata instance args count ret _err ->
                      (* FIXME: Make this set err appropriately! *)
                      let () = assert (Int64.(count = 1L)) in
                      let args = coerce (ptr variant_ptr.const) (ptr variant_ptr.plain) args in
                      let x0 = X0.ocaml_of_variant !@args in
                      let self =
                        coerce class_instance_ptr.plain Self.godot_typ instance
                      in
                      variant_new_copy
                      (coerce variant_ptr.plain variant_ptr.uninit ret)
                      (coerce_ptr variant_ptr.const @@ Ret.ocaml_to_variant
                        ([%e pexp_ident { txt = lident f_name; loc }] x0 self))];
                [%stri
                  let ptrcall_func : Godotcaml_base.Godotcaml.C.ClassMethodPtrCall.fn =
                    let open Godotcaml_base.Godotcaml.C in
                    let open Godotcaml_api.Gdforeign in
                    fun _method_userdata instance args ret ->
                      let x0 = X0.to_ocaml !@(coerce_ptr (ptr X0.typ) args) in
                      let self = coerce class_instance_ptr.plain Self.godot_typ instance in
                      let ret' = coerce_ptr Ret.typ ret in
                      ret' <-@ !@ (Ret.of_ocaml ([%e pexp_ident { txt = lident f_name; loc }] x0 self))
                ];
                [%stri
                  let () =
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
                      old_methods_loader ();
                      let arguments_info = gc_alloc ~count:1 PropertyInfo.s in
                      let arguments_metadata = gc_alloc ~count:1 int in
                      let () =
                        arguments_info
                        <-@ !@(PropertyInfo.make
                                 (gc_alloc ~count:1 ?finalise:None)
                                 VariantType.int
                                 (mkstrnamep "x0") (mkstrnamep "int")
                                 (Unsigned.UInt32.of_int 0)
                                 (Godotcaml_api.Api_builtins.BuiltinClass0.String.of_ocaml "??" |> coerce_ptr string_ptr.plain)
                                 (Unsigned.UInt32.of_int 6))
                      in
                      let () =
                        arguments_metadata <-@ ClassMethodArgumentMetadata.none
                      in
                      let method_info =
                        ClassMethodInfo.make
                          ~return_value_info:arguments_info
                          ~return_value_metadata:!@arguments_metadata
                          (gc_alloc ~count:1 ?finalise:None)
                          (mkstrnamep [%e pexp_constant (Pconst_string (f_name, loc, None))]) true (Unsigned.UInt32.of_int 1) arguments_info
                          arguments_metadata
                          (ClassMethodCall.of_fun call_func)
                          (ClassMethodPtrCall.of_fun ptrcall_func)
                      in
                      classdb_register_extension_class_method
                        !Godotcaml_api.Gdforeign.library
                        (string_name_of_string _godot_class_name)
                        method_info
                    in
                    _godot_methods_loader := new_methods_loader];
              ])

  (* let expander ~ctxt gfunc_name expr =
     let loc = Expansion_context.Extension.extension_point_loc ctxt in
     Ast_builder.Default.(
       [%stri
         let [%p ppat_var ~loc { txt = gfunc_name; loc }] =
           let [%p ppat_var ~loc { txt = gfunc_name; loc }] = [%e expr] in
           let open Godotcaml_base.Godotcaml.C in
           let open Godotcaml_api.Gdforeign in
           let open Godotcaml_api.Api_helpers in
           let call_func, ptrcall_func =
             to_calls1 [%e pexp_ident ~loc { txt = lident gfunc_name; loc }]
           in
           let methods_loader = !_godot_methods_loader in
           let mkstrnamep s =
             coerce_ptr string_name_ptr.plain @@ string_name_of_string s
           in
           let new_methods_loader () =
             let () = methods_loader () in
             let arguments_info = gc_alloc ~count:1 PropertyInfo.s in
             let arguments_metadata = gc_alloc ~count:1 int in
             let () =
               arguments_info
               <-@ !@(PropertyInfo.make VariantType.int (mkstrnamep "x0")
                        (mkstrnamep "int") (Unsigned.UInt32.of_int 0)
                        (Unsigned.UInt32.of_int 6))
             in
             let () = arguments_metadata <-@ ClassMethodArgumentMetadata.none in
             let method_info =
               ClassMethodInfo.make
                 (gc_alloc ~count:1 ?finalise:None)
                 ~call_func gfunc_name true 1L arguments_info arguments_metadata
                 0
                 (coerce_ptr variant_ptr.plain null)
             in
             classdb_register_extension_class_method !library
               (string_name_of_string _godot_class_name)
               method_info
           in
           _godot_methods_loader := new_methods_loader;
           [%e expr].impl])
  *)
  let pattern =
    Ast_pattern.(
      pstr
        (pstr_value __
           (value_binding ~pat:(ppat_var __)
              ~expr:
                (pexp_apply drop
                   ((drop ** pexp_pack __)
                   ^:: (drop ** pexp_pack __)
                   ^:: (drop ** pexp_pack __)
                   ^:: (drop ** __) ^:: nil))
           ^:: nil)
        ^:: nil))

  let extender =
    Extension.V3.declare "gfunc" Extension.Context.structure_item pattern
      expander

  let rule = Context_free.Rule.extension extender
  let () = Driver.register_transformation ~rules:[ rule ] "gfunc"
end
