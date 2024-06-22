open! Base
open! Ppxlib

module Class = struct
  let expand ~ctxt class_name =
    let loc = Expansion_context.Extension.extension_point_loc ctxt in
    [%stri
      let (godot_class_name, godot_inherits) : string * string =
        ( [%e Ast_builder.Default.estring ~loc class_name],
          [%e Ast_builder.Default.estring ~loc "RefCounted"] )]

  let gclass =
    let p_class_name =
      Ast_pattern.(loc (lident (string "class_name")) ** estring __)
    in
    Extension.V3.declare "gclass" Extension.Context.structure_item
      Ast_pattern.(
        single_expr_payload (pexp_record (p_class_name ^:: nil) none))
      expand

  let rule = Context_free.Rule.extension gclass
  let () = Driver.register_transformation ~rules:[ rule ] "gclass"
end
