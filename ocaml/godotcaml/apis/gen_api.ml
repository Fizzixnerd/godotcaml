open! Base
open! Core
open Ppx_yojson_conv_lib.Yojson_conv.Primitives

module Api = struct
  module Header = struct
    type t = {
      version_major : int;
      version_minor : int;
      version_patch : int;
      version_status : string;
      version_build : string;
      version_full_name : string;
    }
    [@@deriving yojson]
  end

  module BuiltinClassSize = struct
    type type_ = { name : string; size : int } [@@deriving yojson]

    type t = { build_configuration : string; types : type_ list [@key "sizes"] }
    [@@deriving yojson]
  end

  module BuiltinClassMemberOffset = struct
    type member = { member : string; offset : int; meta : string }
    [@@deriving yojson]

    type class_ = { name : string; members : member list } [@@deriving yojson]

    type t = { build_configuration : string; classes : class_ list }
    [@@deriving yojson]
  end

  (* Dunno what to put here! *)
  module GlobalConstant = struct
    type t = string * string [@@deriving yojson]
  end

  module GlobalEnum = struct
    type value = {
      name : string;
      value : int;
      description : string option; [@yojson.option]
    }
    [@@deriving yojson]

    type t = { name : string; is_bitfield : bool; values : value list }
    [@@deriving yojson]
  end

  module UtilityFunction = struct
    type argument = {
      name : string;
      type_ : string; [@key "type"]
      default_value : string option; [@yojson.option]
    }
    [@@deriving yojson]

    type t = {
      name : string;
      return_type : string option; [@yojson.option]
      category : string;
      is_vararg : bool;
      hash : int;
      arguments : argument list option; [@yojson.option]
      description : string option; [@yojson.option]
    }
    [@@deriving yojson]
  end

  module BuiltinClass = struct
    type argument = {
      name : string;
      type_ : string; [@key "type"]
      meta : string option; [@yojson.option]
      default_value : string option; [@yojson.option]
    }
    [@@deriving yojson]

    type method_ = {
      name : string;
      return_type : string option; [@yojson.option]
      is_vararg : bool;
      is_const : bool;
      is_static : bool;
      hash : int64;
      arguments : argument list option; [@yojson.option]
      description : string option; [@yojson.option]
    }
    [@@deriving yojson]

    type constructor = {
      index : int;
      arguments : argument list option; [@yojson.option]
      description : string option; [@yojson.option]
    }
    [@@deriving yojson]

    type operator = {
      name : string;
      right_type : string option; [@yojson.option]
      return_type : string;
      description : string option; [@yojson.option]
    }
    [@@deriving yojson]

    type member = {
      name : string;
      type_ : string; [@key "type"]
      description : string option; [@yojson.option]
    }
    [@@deriving yojson]

    type constant = {
      name : string;
      type_ : string; [@key "type"]
      value : string;
      description : string option; [@yojson.option]
    }
    [@@deriving yojson]

    type enum_value = {
      name : string;
      value : int;
      description : string option; [@yojson.option]
    }
    [@@deriving yojson]

    type enum = { name : string; values : enum_value list } [@@deriving yojson]

    type t = {
      name : string;
      indexing_return_type : string option; [@yojson.option]
      is_keyed : bool;
      members : member list option; [@yojson.option]
      constants : constant list option; [@yojson.option]
      enums : enum list option; [@yojson.option]
      operators : operator list option; [@yojson.option]
      methods : method_ list option; [@yojson.option]
      constructors : constructor list option; [@yojson.option]
      has_destructor : bool;
      brief_description : string option; [@yojson.option]
      description : string option; [@yojson.option]
    }
    [@@deriving yojson]
  end

  module Class = struct
    type enum_value = {
      name : string;
      value : int;
      description : string option; [@yojson.option]
    }
    [@@deriving yojson]

    type enum = {
      name : string;
      is_bitfield : bool option; [@yojson.option]
      values : enum_value list;
    }
    [@@deriving yojson]

    type return_value = {
      type_ : string; [@key "type"]
      meta : string option; [@yojson.option]
    }
    [@@deriving yojson]

    type method_argument = {
      name : string;
      type_ : string; [@key "type"]
      meta : string option; [@yojson.option]
      default_value : string option; [@yojson.option]
    }
    [@@deriving yojson]

    type method_ = {
      name : string;
      is_const : bool;
      is_vararg : bool;
      is_static : bool;
      is_virtual : bool;
      hash : int64 option; [@yojson.option]
      hash_compatibility : int64 list option; [@yojson.option]
      return_value : return_value option; [@yojson.option]
      arguments : method_argument list option; [@yojson.option]
      description : string option; [@yojson.option]
    }
    [@@deriving yojson]

    type constant = {
      name : string;
      value : int;
      description : string option; [@yojson.option]
    }
    [@@deriving yojson]

    type signal_argument = { name : string; type_ : string [@key "type"] }
    [@@deriving yojson]

    type signal = {
      name : string;
      arguments : signal_argument list option; [@yojson.option]
      description : string option; [@yojson.option]
    }
    [@@deriving yojson]

    type property = {
      name : string;
      type_ : string; [@key "type"]
      index : int option; [@yojson.option]
      setter : string option; [@yojson.option]
      getter : string;
      description : string option; [@yojson.option]
    }
    [@@deriving yojson]

    type t = {
      name : string;
      is_refcounted : bool;
      is_instantiable : bool;
      inherits : string option; [@yojson.option]
      api_type : string;
      enums : enum list option; [@yojson.option]
      methods : method_ list option; [@yojson.option]
      signals : signal list option; [@yojson.option]
      constants : constant list option; [@yojson.option]
      properties : property list option; [@yojson.option]
      brief_description : string option; [@yojson.option]
      description : string option; [@yojson.option]
    }
    [@@deriving yojson]
  end

  module Singleton = struct
    type t = { name : string; type_ : string [@key "type"] } [@@deriving yojson]
  end

  module NativeStructure = struct
    type t = { name : string; format : string } [@@deriving yojson]
  end

  type t = {
    header : Header.t;
    builtin_class_sizes : BuiltinClassSize.t list;
    builtin_class_member_offsets : BuiltinClassMemberOffset.t list;
    global_constants : GlobalConstant.t list;
    global_enums : GlobalEnum.t list;
    utility_functions : UtilityFunction.t list;
    builtin_classes : BuiltinClass.t list;
    classes : Class.t list;
    singletons : Singleton.t list;
    native_structures : NativeStructure.t list;
  }
  [@@deriving yojson]
end

module Gen = struct
  open PPrint

  type ocaml = document

  module OpMap = Map.Make (String)

  let op_map =
    OpMap.of_alist_exn
      [
        ("==", "OP_EQUAL");
        ("!=", "OP_NOT_EQUAL");
        ("<", "OP_LESS");
        ("<=", "OP_LESS_EQUAL");
        (">", "OP_GREATER");
        (">=", "OP_GREATER_EQUAL");
        ("+", "OP_ADD");
        ("-", "OP_SUBTRACT");
        ("*", "OP_MULTIPLY");
        ("/", "OP_DIVIDE");
        ("unary-", "OP_NEGATE");
        ("unary+", "OP_POSITIVE");
        ("%", "OP_MODULE");
        ("**", "OP_POWER");
        ("<<", "OP_SHIFT_LEFT");
        (">>", "OP_SHIFT_RIGHT");
        ("&", "OP_BIT_AND");
        ("|", "OP_BIT_OR");
        ("^", "OP_BIT_XOR");
        ("~", "OP_BIT_NEGATE");
        ("and", "OP_AND");
        ("or", "OP_OR");
        ("xor", "OP_XOR");
        ("not", "OP_NOT");
        ("in", "OP_IN");
      ]

  let op_ocaml_names =
    OpMap.of_alist_exn
      [
        ("==", "(=)");
        ("!=", "(<>)");
        ("<", "(<)");
        ("<=", "(<=)");
        (">", "(>)");
        (">=", "(>=)");
        ("+", "(+)");
        ("-", "(-)");
        ("*", "( * )");
        ("/", "(/)");
        ("unary-", "(~-)");
        ("unary+", "(~+)");
        ("%", "(%)");
        ("**", "( ** )");
        ("<<", "(<<<)");
        (">>", "(>>>)");
        ("&", "(&&&)");
        ("|", "(|||)");
        ("^", "(^^^)");
        ("~", "(~~~)");
        ("and", "(&&)");
        ("or", "(||)");
        ("xor", "(~^^)");
        ("not", "not");
        ("in", "elem");
      ]

  let doc_comment contents =
    let escape c =
      match c with '\"' -> "\"\"" | '*' -> " * " | _ as c -> String.of_char c
    in
    string "(** "
    ^^ string (String.concat_map ~f:escape contents)
    ^^ string " *)"

  (** Some explanation: This removes the weird `enum::` prefix and replaces it with either "GlobalEnum" if it is unqualified, or leaves it as the qualified enum it is.*)
  let remove_enum_prefix this s =
    if String.is_prefix ~prefix:"enum::" s then
      let s' = String.drop_prefix s 6 in
      if String.contains s '.' then
        String.split s' ~on:'.' |> function
        | x :: xs when String.(x = this) -> String.concat ~sep:"." xs
        | _ :: _ -> s'
        | _ -> assert false
      else "GlobalEnum." ^ s'
    else s

  let remove_dots s =
    String.concat_map ~f:(function '.' -> "" | _ as c -> String.of_char c) s

  let rec mod_var_str = function
    | _ as name when String.is_empty name -> assert false
    | _ as name when (not (String.is_empty name)) && Char.(name.[0] = '_') ->
        mod_var_str (String.slice name 1 (String.length name))
    | _ as name when String.(capitalize name = name) -> name
    | _ as name -> String.capitalize name

  let mod_var s = string (mod_var_str s)

  let var_str name =
    match name with
    | ( "object" | "type" | "method" | "struct" | "end" | "module" | "val"
      | "let" | "open" | "functor" | "match" | "inherit" | "new" | "begin" ) as
      name ->
        name ^ "_"
    | "" as name -> name
    | _ as name when String.(prefix name 1 = "(") -> name
    | _ as name when String.(capitalize name = name) -> "_" ^ name
    | _ as name -> name

  let var name = string (var_str name)

  let let_ name value =
    string "let " ^^ var name ^^ string " =" ^/^ nest 2 value

  let module_ module_name defs =
    string "module " ^^ mod_var module_name ^^ string " = struct"
    ^^ nest 2 (break 1 ^^ separate (hardline ^^ hardline) defs ^^ break 1)
    ^^ string "end"

  let functor_ module_name m_name sig_name defs =
    string "module " ^^ mod_var module_name
    ^^ parens (mod_var m_name ^^ string " : " ^^ mod_var sig_name)
    ^^ string " = struct"
    ^^ nest 2 (break 1 ^^ separate (hardline ^^ hardline) defs ^^ break 1)
    ^^ string "end"

  let binary_op_type : string -> string -> string -> ocaml =
   fun t1 t2 rty ->
    string
    @@ sprintf "(%s.typ @-> %s.typ @-> %s.typ @-> returning void)"
         (mod_var_str t1) (mod_var_str t2) (mod_var_str rty)

  let to_type_enum s =
    let var_str = var_str s in
    let var_str =
      if String.(prefix var_str 1 = "_") then String.drop_prefix var_str 1
      else var_str
    in
    let type_str =
      let tail_str = String.drop_prefix var_str 1 in
      String.prefix var_str 1
      ^ String.concat_map tail_str ~f:(fun c ->
            if Char.is_uppercase c then sprintf "_%c" c else String.of_char c)
    in
    "_TYPE_" ^ String.uppercase type_str

  let gen_file filename ocaml =
    Out_channel.with_file
      ~f:(fun oc -> PPrint.ToChannel.pretty 1.0 100 oc ocaml)
      filename

  module BuiltinClassSize = struct
    open Api.BuiltinClassSize

    let type_to_ocaml : type_ -> ocaml =
     fun ty -> let_ ty.name (OCaml.int ty.size)

    let t_to_ocaml : t -> ocaml =
     fun bcs ->
      let module_name = bcs.build_configuration in
      let types = bcs.types |> List.map ~f:type_to_ocaml in
      module_ module_name types

    let t_list_to_ocaml : t list -> ocaml =
     fun bcss ->
      let module_name = "BuiltinClassSize" in
      let defs = bcss |> List.map ~f:t_to_ocaml in
      module_ module_name defs
  end

  module BuiltinClassMemberOffset = struct end
  module GlobalConstant = struct end

  module GlobalEnum = struct
    open Api.GlobalEnum

    let value_to_ocaml : value -> ocaml =
     fun value ->
      let dc = optional doc_comment value.description in
      let int_value = value.value in
      dc ^/^ let_ value.name (OCaml.int int_value)

    let t_to_ocaml : t -> ocaml =
     fun ge ->
      let module_name = remove_dots ge.name in
      let is_bitfield = OCaml.bool ge.is_bitfield in
      let defs = ge.values |> List.map ~f:value_to_ocaml in
      module_ module_name (let_ "is_bitfield" is_bitfield :: defs)

    let t_list_to_ocaml : t list -> ocaml =
     fun ges ->
      let module_name = "GlobalEnum" in
      let defs = ges |> List.map ~f:t_to_ocaml in
      module_ module_name defs
  end

  (** Qualify a name as (roughly) <name>.t`. *)
  let qualified_t this name =
    if String.(name <> this) then mod_var name ^^ string ".t" else string "t"

  let qualified_typ this name =
    if String.(name <> this) then mod_var name ^^ string ".typ"
    else string "typ"

  module UtilityFunction = struct
    open Api.UtilityFunction

    let argument_to_ocaml_fragment : argument -> ocaml =
     fun arg ->
      let ty = qualified_typ "@NONE" arg.type_ in
      ty ^^ string " @-> "

    let return_type_to_ocaml_fragment : string -> ocaml =
     fun return_type -> string "returning " ^^ qualified_typ "@NONE" return_type

    let assemble_type : ocaml list -> ocaml -> ocaml =
     fun ty_frags return_ty ->
      PPrint.parens (PPrint.concat ty_frags ^^ return_ty)

    let t_to_ocaml : t -> ocaml =
     fun uf ->
      let ty_frags =
        uf.arguments |> Option.value ~default:[]
        |> List.map ~f:argument_to_ocaml_fragment
      in
      let ty_frags =
        match ty_frags with
        | [] -> [ string "void @-> " ]
        | _ as ty_frags -> ty_frags
      in
      let ret_ty_frag =
        uf.return_type
        |> Option.value ~default:"void"
        |> return_type_to_ocaml_fragment
      in
      let c_type = assemble_type ty_frags ret_ty_frag in
      let rhs name t =
        string "foreign_utility_function \"" ^^ name ^^ string "\" " ^^ t
      in
      let fun_name = var uf.name in
      let dc = uf.description |> PPrint.optional doc_comment in
      dc ^/^ let_ uf.name (rhs fun_name c_type)

    let t_list_to_ocaml : t list -> ocaml =
     fun ufs -> module_ "UtilityFunction" (List.map ~f:t_to_ocaml ufs)
  end

  module BuiltinClass = struct
    open Api.BuiltinClass

    let argument_to_ocaml_fragment : string -> argument -> ocaml =
     fun this arg ->
      let ty = qualified_typ this arg.type_ in
      ty ^^ string " @-> "

    let return_type_to_ocaml_fragment : string -> string -> ocaml =
     fun this return_type ->
      string "returning " ^^ qualified_typ this return_type

    let assemble_type : ocaml list -> ocaml -> ocaml =
     fun ty_frags return_ty ->
      PPrint.parens (PPrint.concat ty_frags ^^ return_ty)

    let mktype this args return_type is_static is_vararg =
      let primary_arguments = args |> Option.value ~default:[] in
      let var_arg =
        [
          {
            name = "variadic_args";
            type_ = "variadic";
            meta = None;
            default_value = None;
          };
        ]
      in
      let self_arg =
        [ { name = "self"; type_ = this; meta = None; default_value = None } ]
      in
      (* arguments is guaranteed never empty! *)
      let arguments =
        match (primary_arguments, is_static, is_vararg) with
        | [], true, false ->
            [
              {
                name = "_dummy";
                type_ = "void";
                meta = None;
                default_value = None;
              };
            ]
        | (_ :: _ as args), true, false -> args
        | args, true, true -> args @ var_arg
        | args, false, true -> args @ var_arg @ self_arg
        | args, false, false -> args @ self_arg
      in
      let return_type =
        return_type
        |> Option.value ~default:"void"
        |> return_type_to_ocaml_fragment this
      in
      let method_type =
        assemble_type
          (List.map ~f:(argument_to_ocaml_fragment this) arguments)
          return_type
      in
      method_type

    let method_to_ocaml : string -> method_ -> ocaml =
     fun this meth ->
      let method_name = meth.name in
      let dc = meth.description |> PPrint.optional doc_comment in
      let method_type =
        mktype this meth.arguments meth.return_type meth.is_static
          meth.is_vararg
      in
      let rhs name t =
        string "foreign_builtin_method"
        ^/^ string "GlobalEnum.VariantType."
        ^^ string (to_type_enum this)
        ^/^ string "\"" ^^ name ^^ string "\""
        ^/^ parens
              (string "Base.Int64.of_string \""
              ^^ OCaml.int64 meth.hash ^^ string "\"")
        ^/^ t
      in
      dc ^/^ let_ method_name (rhs (var method_name) method_type)

    let constructor_to_ocaml : string -> constructor -> ocaml =
     fun this cons ->
      let constructor_name index _types =
        var_str this ^ "_" ^ Int.to_string index
      in
      let rhs idx type_name t =
        string "foreign_builtin_constructor "
        ^^ OCaml.int idx ^^ string " \"" ^^ type_name ^^ string "\" " ^^ t
      in
      let constructor_type =
        mktype this cons.arguments (Some this) true false
      in
      let dc = cons.description |> PPrint.optional doc_comment in
      dc
      ^/^ let_
            (constructor_name cons.index cons.arguments)
            (rhs cons.index (var this) constructor_type)

    let operator_to_ocaml : string -> operator -> ocaml =
     fun this op ->
      let rhs : ocaml option =
        match (op.name, op.right_type) with
        | ( "in",
            Some
              (( "Dictionary" | "Array" | "Object" | "PackedByteArray"
               | "PackedStringArray" | "PackedInt32Array" | "PackedInt64Array"
               | "PackedFloat32Array" | "PackedFloat64Array" | "String"
               | "StringName" | "PackedVector2Array" | "PackedVector3Array"
               | "PackedVector4Array" | "PackedColorArray" ) as t) ) ->
            Some
              (string "foreign_builtin_operator GlobalEnum.VariantType."
              ^^ string (to_type_enum this)
              ^^ string " (Some GlobalEnum.VariantType."
              ^^ string (to_type_enum t)
              ^^ string ") GlobalEnum.VariantOperator._OP_IN"
              ^/^ parens
                    (string "funptr " ^^ binary_op_type this t op.return_type))
        | "in", _ ->
            (* Should have covered all the cases; fail otherwise for my sake. *)
            assert false
        | op_name, None ->
            (* Unary operators. *)
            Some
              (string "foreign_builtin_operator GlobalEnum.VariantType."
              ^^ string (to_type_enum this)
              ^^ string " None "
              ^^ string " GlobalEnum.VariantOperator."
              ^^ var (Map.find_exn op_map op_name)
              ^/^ parens
                    (string "funptr " ^^ binary_op_type this this op.return_type)
              )
        | op_name, Some t when String.(t = this) ->
            (* Normal path: binary operator. *)
            Some
              (string "foreign_builtin_operator GlobalEnum.VariantType."
              ^^ string (to_type_enum this)
              ^^ string " (Some GlobalEnum.VariantType."
              ^^ string (to_type_enum t)
              ^^ string ") GlobalEnum.VariantOperator."
              ^^ var (Map.find_exn op_map op_name)
              ^/^ parens
                    (string "funptr " ^^ binary_op_type this t op.return_type))
        | _ ->
            (* We don't care about the forest of pointless operators.
               We will provide Variant-polymorphic ones if you need them. *)
            None
      in
      let lhs = Map.find_exn op_ocaml_names op.name in
      let lhs =
        if String.(lhs = "elem") then
          this ^ "_elem_" ^ Option.value_exn op.right_type
        else lhs
      in
      let dc = op.description |> PPrint.optional doc_comment in
      rhs
      |> Option.map ~f:(fun the_rhs -> dc ^/^ let_ lhs the_rhs)
      |> Option.value ~default:(string "")

    let enum_value_to_ocaml : enum_value -> ocaml =
     fun value ->
      let dc = optional doc_comment value.description in
      let int_value = value.value in
      dc ^/^ let_ value.name (OCaml.int int_value)

    let enum_to_ocaml : enum -> ocaml =
     fun e ->
      let module_name = remove_dots e.name in
      let defs = e.values |> List.map ~f:enum_value_to_ocaml in
      let enum_t_def = string "type t = int" in
      let enum_typ_def = let_ "typ" (string "int") in
      module_ module_name (enum_t_def :: enum_typ_def :: defs)

    let constant_to_ocaml : constant -> ocaml =
     fun c ->
      let dc = c.description |> PPrint.optional doc_comment in
      dc ^/^ let_ c.name (string c.value)

    let t_to_ocaml : t -> ocaml =
     fun bic ->
      let defs =
        List.concat
          [
            List.map ~f:(method_to_ocaml bic.name)
              (bic.methods |> Option.value ~default:[]);
            List.map
              ~f:(operator_to_ocaml bic.name)
              (bic.operators |> Option.value ~default:[]);
            List.map ~f:enum_to_ocaml (bic.enums |> Option.value ~default:[]);
            List.map ~f:constant_to_ocaml
              (bic.constants |> Option.value ~default:[]);
          ]
      in
      module_ bic.name
        (string (sprintf "include M.%s\n" (mod_var_str bic.name)) :: defs)

    let t_list_to_ocaml : t list -> ocaml =
     fun bics -> bics |> List.map ~f:t_to_ocaml |> module_ "BuiltinClass"
  end

  module Class = struct
    open Api.Class

    let enum_value_to_ocaml : enum_value -> ocaml =
     fun value ->
      let dc = optional doc_comment value.description in
      let int_value = value.value in
      dc ^/^ let_ value.name (OCaml.int int_value)

    let enum_to_ocaml : enum -> ocaml =
     fun e ->
      let module_name = remove_dots e.name in
      let defs = e.values |> List.map ~f:enum_value_to_ocaml in
      let enum_t_def = string "type t = int" in
      let enum_typ_def = let_ "typ" (string "int") in
      module_ module_name (enum_t_def :: enum_typ_def :: defs)

    let method_argument_to_ocaml_fragment : string -> method_argument -> ocaml =
     fun this arg ->
      let ty = qualified_typ this (remove_enum_prefix this arg.type_) in
      ty ^^ string " @-> "

    let signal_argument_to_ocaml_fragment : string -> signal_argument -> ocaml =
     fun this arg ->
      let ty = qualified_typ this (remove_enum_prefix this arg.type_) in
      ty ^^ string " @-> "

    let return_type_to_ocaml_fragment : string -> string -> ocaml =
     fun this return_type ->
      string "returning "
      ^^ qualified_typ this (remove_enum_prefix this return_type)

    let assemble_type : ocaml list -> ocaml -> ocaml =
     fun ty_frags return_ty ->
      PPrint.parens (PPrint.concat ty_frags ^^ return_ty)

    let mk_method_type this args return_type is_static is_vararg =
      let primary_arguments = args |> Option.value ~default:[] in
      let var_arg =
        [
          {
            name = "variadic_args";
            type_ = "variadic";
            meta = None;
            default_value = None;
          };
        ]
      in
      let self_arg =
        [ { name = "self"; type_ = this; meta = None; default_value = None } ]
      in
      (* arguments is guaranteed never empty! *)
      let arguments =
        match (primary_arguments, is_static, is_vararg) with
        | [], true, false ->
            [
              {
                name = "_dummy";
                type_ = "void";
                meta = None;
                default_value = None;
              };
            ]
        | (_ :: _ as args), true, false -> args
        | args, true, true -> args @ var_arg
        | args, false, true -> args @ var_arg @ self_arg
        | args, false, false -> args @ self_arg
      in
      let return_type =
        return_type
        |> Option.value ~default:"void"
        |> return_type_to_ocaml_fragment this
      in
      let method_type =
        assemble_type
          (List.map ~f:(method_argument_to_ocaml_fragment this) arguments)
          return_type
      in
      method_type

    let mk_signal_type : string -> signal_argument list option -> ocaml =
     fun this args ->
      let return_type = return_type_to_ocaml_fragment this "void" in
      let arguments =
        args |> Option.value ~default:[ { name = "dummy"; type_ = "void" } ]
        |> function
        | [] -> [ { name = "dummy"; type_ = "void" } ]
        | _ as args -> args
      in
      assemble_type
        (List.map ~f:(signal_argument_to_ocaml_fragment this) arguments)
        return_type

    let method_to_ocaml : string -> method_ -> ocaml =
     fun this meth ->
      let method_name = meth.name in
      let dc = meth.description |> PPrint.optional doc_comment in
      let return_type_opt =
        Option.map ~f:(fun x -> x.type_) meth.return_value
      in
      let method_type =
        mk_method_type this meth.arguments return_type_opt meth.is_static
          meth.is_vararg
      in
      let rhs name t =
        string "foreign_method \"" ^^ string this ^^ string "\" \"" ^^ name
        ^^ string "\" " ^^ t
      in
      dc ^/^ let_ method_name (rhs (var method_name) method_type)

    let constant_to_ocaml : constant -> ocaml =
     fun c ->
      let dc = c.description |> PPrint.optional doc_comment in
      dc ^/^ let_ c.name (OCaml.int c.value)

    let signal_to_ocaml : string -> signal -> ocaml =
     fun this s ->
      let dc = s.description |> PPrint.optional doc_comment in
      let signal_name = s.name in
      let signal_type = mk_signal_type this s.arguments in
      let rhs name t =
        string "foreign_signal \"" ^^ string this ^^ string "\" \"" ^^ name
        ^^ string "\"" ^/^ t
      in
      dc ^/^ let_ signal_name (rhs (var signal_name) signal_type)

    let property_to_ocaml : string -> property -> ocaml =
     fun this prop ->
      let dc = prop.description |> PPrint.optional doc_comment in
      let property_name = prop.name in
      let property_type = var prop.type_ in
      let rhs name t =
        string "foreign_property" ^/^ string "\"" ^^ string this ^^ string "\""
        ^/^ string "\"" ^^ name ^^ string "\"" ^/^ string "\""
        ^^ OCaml.option var prop.setter
        ^^ string "\"" ^/^ string "\"" ^^ var prop.getter ^^ string "\"" ^/^ t
      in
      dc ^/^ let_ property_name (rhs (var property_name) property_type)

    let t_to_ocaml : t -> ocaml =
     fun c ->
      let defs =
        List.concat
          [
            List.map ~f:enum_to_ocaml (c.enums |> Option.value ~default:[]);
            List.map ~f:constant_to_ocaml
              (c.constants |> Option.value ~default:[]);
            List.map ~f:(method_to_ocaml c.name)
              (c.methods |> Option.value ~default:[]);
            List.map ~f:(signal_to_ocaml c.name)
              (c.signals |> Option.value ~default:[]);
          ]
      in
      module_ c.name defs

    let t_list_to_ocaml : t list -> ocaml =
     fun cs -> cs |> List.map ~f:t_to_ocaml |> module_ "Class"
  end

  let gen_api_type type_name =
    string
      (sprintf
         {|
      module %s = struct
        type t
        let s : t structure typ = structure "%s_Dummy"
        let _ = field s "%s_dummy_do_not_touch" (array ClassSizes.%s uint8_t)
        let () = seal s
        let of_voidp = coerce (ptr void) (ptr s)
        let to_voidp = coerce (ptr s) (ptr void)
        let to_type_ptr = coerce (ptr s) type_ptr.plain
        let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
        let size = ClassSizes.%s
        let new_uninit () = allocate_n ~count:1 s
      end
      |}
         (mod_var_str type_name) (mod_var_str type_name) (var_str type_name)
         (var_str type_name) (var_str type_name))

  let gen_api_types : string list -> ocaml =
   fun type_names ->
    type_names |> List.map ~f:gen_api_type
    |> functor_ "ApiTypes" "ClassSizes" "CLASS_SIZES"

  let gen_class_sizes_module_type : string list -> ocaml =
   fun type_names ->
    string
      (* I know these aren't supposed to contain newlines, but w/e... *)
      (sprintf
         {|
        module type CLASS_SIZES = sig
          %s
        end
        |}
         (String.concat ~sep:"\n"
            (List.map type_names ~f:(fun tn ->
                 sprintf "val %s: int" (var_str tn)))))

  let gen_api_type_module_type : unit -> ocaml =
   fun () ->
    string
      {|
    module type SUB_API_TYPE = sig
      type t
    
      val s : t structure typ
      val of_voidp : unit ptr -> t structure ptr
      val to_voidp : t structure ptr -> unit ptr
      val typ : t structure ptr typ
      val size : int
      val new_uninit : unit -> t structure ptr
    end

    module type API_TYPE = sig
      include SUB_API_TYPE
      val to_type_ptr : t structure ptr -> type_ptr structure Godotcaml.TypedSuite.plain ptr
    end
    |}

  let gen_foreign_api_module_type : string list -> ocaml =
   fun type_names ->
    string
      (sprintf
         {|
    module type FOREIGN_API = sig
      %s

      val foreign_operator : int -> int option -> int -> PtrOperatorEvaluator.t
    end
    |}
         (String.concat ~sep:"\n"
            (List.map type_names ~f:(fun tn ->
                 if String.(tn <> "Variant") then
                   sprintf "module %s : API_TYPE" (mod_var_str tn)
                 else "module Variant : SUB_API_TYPE"))))
end

let () =
  let contents = In_channel.read_all "./extension_api.json" in
  let api_json = Yojson.Safe.from_string contents in
  let api = Api.t_of_yojson api_json in
  let open PPrint in
  [
    Gen.GlobalEnum.t_list_to_ocaml api.global_enums ^^ hardline ^^ hardline;
    Gen.BuiltinClassSize.t_list_to_ocaml api.builtin_class_sizes
    ^^ hardline ^^ hardline;
  ]
  |> PPrint.concat
  |> Gen.gen_file "bootstrap.ml";

  let type_names =
    List.map ~f:(fun x -> x.name) (List.hd_exn api.builtin_class_sizes).types
  in
  [
    string "open! Base" ^^ hardline;
    string "open Ctypes" ^^ hardline;
    string "module ClassSizes = Godotcaml.BuiltinClassSize.Double_64"
    ^^ hardline;
    string "open Godotcaml" ^^ hardline;
    string "open C" ^^ hardline ^^ hardline;
    Gen.gen_class_sizes_module_type type_names ^^ hardline ^^ hardline;
    Gen.gen_api_type_module_type () ^^ hardline;
    Gen.gen_foreign_api_module_type type_names ^^ hardline;
    Gen.gen_api_types type_names;
  ]
  |> PPrint.concat
  |> Gen.gen_file "api_types.ml";

  [
    string "open! Base" ^^ hardline;
    string "open Foreign_api" ^^ hardline;
    string "open Foreign_api.Godotcaml" ^^ hardline;
    string "open Ctypes" ^^ hardline;
    string "module M = Foreign_api.Make(Api_types.ClassSizes)" ^^ hardline;
    string "open M" ^^ hardline ^^ hardline;
    string "let funptr = Foreign.funptr" ^^ hardline;
    Gen.GlobalEnum.t_list_to_ocaml api.global_enums ^^ hardline ^^ hardline;
    Gen.UtilityFunction.t_list_to_ocaml api.utility_functions
    ^^ hardline ^^ hardline;
    Gen.BuiltinClass.t_list_to_ocaml api.builtin_classes ^^ hardline ^^ hardline;
    Gen.Class.t_list_to_ocaml api.classes ^^ hardline ^^ hardline;
  ]
  |> PPrint.concat |> Gen.gen_file "api.ml"
