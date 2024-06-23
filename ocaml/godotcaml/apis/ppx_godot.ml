open! Base
open! Ppxlib

module Class = struct
  let expander ~ctxt class_name str_items =
    let loc = Expansion_context.Extension.extension_point_loc ctxt in
    let registrations =
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
          Stdio.print_endline ("Loading " ^ _godot_class_name ^ " into chain");
          let new_on_load_func () =
            on_load_func ();
            classdb_register_extension_class2
              !Godotcaml_api.Gdforeign.library
              (string_name_of_string _godot_class_name)
              (string_name_of_string _godot_inherits)
              _godot_class_info
          in
          on_load := new_on_load_func]
    in
    Ast_builder.Default.(
      pstr_module ~loc
        (module_binding ~loc
           ~name:{ txt = Option.some class_name; loc }
           ~expr:
             (pmod_structure ~loc
                ([%stri
                   let _godot_class_name : string = [%e estring ~loc class_name]]
                 :: [%stri
                      let _godot_inherits : string =
                        [%e estring ~loc "RefCounted"]]
                 :: str_items
                @ registrations))))

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
  let expander ~ctxt parent_class_name =
    let loc = Expansion_context.Extension.extension_point_loc ctxt in
    Ast_builder.Default.([%stri let () = [%e estring ~loc parent_class_name]])

  let pattern =
    Ast_pattern.(
      pstr
        (pstr_value drop (value_binding ~pat:(ppat_var __) ~expr:drop ^:: nil)
        ^:: nil))

  let extender =
    Extension.V3.declare "gfunc" Extension.Context.structure_item pattern
      expander

  let rule = Context_free.Rule.extension extender
  let () = Driver.register_transformation ~rules:[ rule ] "gfunc"
end
