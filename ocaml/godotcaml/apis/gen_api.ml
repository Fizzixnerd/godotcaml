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
      hash : int64;
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
    [@@deriving yojson, sexp, hash, equal, compare]

    type enum = {
      name : string;
      is_bitfield : bool option; [@yojson.option]
      values : enum_value list;
    }
    [@@deriving yojson, sexp, hash, equal, compare]

    type return_value = {
      type_ : string; [@key "type"]
      meta : string option; [@yojson.option]
    }
    [@@deriving yojson, sexp, hash, equal, compare]

    type method_argument = {
      name : string;
      type_ : string; [@key "type"]
      meta : string option; [@yojson.option]
      default_value : string option; [@yojson.option]
    }
    [@@deriving yojson, sexp, hash, equal, compare]

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
    [@@deriving yojson, sexp, hash, equal, compare]

    type constant = {
      name : string;
      value : int;
      description : string option; [@yojson.option]
    }
    [@@deriving yojson, sexp, hash, equal, compare]

    type signal_argument = { name : string; type_ : string [@key "type"] }
    [@@deriving yojson, sexp, hash, equal, compare]

    type signal = {
      name : string;
      arguments : signal_argument list option; [@yojson.option]
      description : string option; [@yojson.option]
    }
    [@@deriving yojson, sexp, hash, equal, compare]

    type property = {
      name : string;
      type_ : string; [@key "type"]
      index : int option; [@yojson.option]
      setter : string option; [@yojson.option]
      getter : string;
      description : string option; [@yojson.option]
    }
    [@@deriving yojson, sexp, hash, equal, compare]

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
    [@@deriving yojson, sexp, hash, equal, compare]
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
        ("in", "mem");
      ]

  let doc_comment contents =
    let escape c =
      match c with '\"' -> "\"\"" | '*' -> " * " | _ as c -> String.of_char c
    in
    string "(** "
    ^^ string (String.concat_map ~f:escape contents)
    ^^ string " *)"

  module NamesSet = Set.Make (String)

  let bic_names =
    [
      "Nil";
      "bool";
      "int";
      "float";
      "String";
      "Vector2";
      "Vector2i";
      "Rect2";
      "Rect2i";
      "Vector3";
      "Vector3i";
      "Transform2D";
      "Vector4";
      "Vector4i";
      "Plane";
      "Quaternion";
      "AABB";
      "Basis";
      "Transform3D";
      "Projection";
      "Color";
      "StringName";
      "NodePath";
      "RID";
      "Object";
      "Callable";
      "Signal";
      "Dictionary";
      "Array";
      "PackedByteArray";
      "PackedInt32Array";
      "PackedInt64Array";
      "PackedFloat32Array";
      "PackedFloat64Array";
      "PackedStringArray";
      "PackedVector2Array";
      "PackedVector3Array";
      "PackedColorArray";
      "Variant";
    ]
    |> NamesSet.of_list

  let rec mod_var_str = function
    | _ as name when String.is_empty name -> ""
    | _ as name when (not (String.is_empty name)) && Char.(name.[0] = '_') ->
        mod_var_str (String.slice name 1 (String.length name))
    | _ as name when String.(capitalize name = name) -> name
    | _ as name -> String.capitalize name

  let mod_var s = string (mod_var_str s)
  let ptr_to s = s ^^ string " ptr"

  let ge_names =
    NamesSet.of_list
      [
        "Side";
        "Corner";
        "Orientation";
        "ClockDirection";
        "HorizontalAlignment";
        "VerticalAlignment";
        "InlineAlignment";
        "EulerOrder";
        "Key";
        "KeyModifierMask";
        "MouseButton";
        "MouseButtonMask";
        "JoyButton";
        "JoyAxis";
        "MIDIMessage";
        "Error";
        "PropertyHint";
        "PropertyUsageFlags";
        "MethodFlags";
      ]

  let qualify_nicely _this s' =
    s' |> String.split ~on:'.'
    |> (function
         | x :: xs
           when String.(
                  x = "Variadic" || x = "VariadicVariants" || x = "Void"
                  || x = "void") ->
             x :: xs
         | x :: y :: zs when String.(x = "Variant") ->
             "GlobalEnum" :: (x ^ y) :: zs
         | x :: xs when x |> Set.mem ge_names -> "GlobalEnum" :: x :: xs
         | x :: xs when x |> Set.mem bic_names ->
             "BuiltinClass0" :: mod_var_str x :: xs
         | x :: xs -> "Class0" :: mod_var_str x :: xs
         | ys -> ys)
    |> String.concat ~sep:"."

  (** Some explanation: This removes the weird `enum::` prefix and replaces it with either "GlobalEnum" if it is unqualified, or leaves it as the qualified enum it is...
      Also, does the same stuff for `typedarray::` and `bitfield::`... *)
  let remove_prefix this s =
    (if String.is_prefix ~prefix:"enum::" s then
       let s' = String.drop_prefix s 6 in
       s'
     else if String.is_prefix ~prefix:"typedarray::" s then
       let s' = String.drop_prefix s 12 in
       s'
     else if String.is_prefix ~prefix:"bitfield::" s then
       let s' = String.drop_prefix s 10 in
       s'
     else s)
    |> qualify_nicely this

  let remove_dots s =
    String.concat_map ~f:(function '.' -> "" | _ as c -> String.of_char c) s

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
    string "let " ^^ var name ^^ string " = " ^/^ nest 2 value

  let let_fun n name value =
    let args =
      List.range 0 n |> List.map ~f:(fun k -> string (sprintf " x%i " k))
    in
    string "let " ^^ var name ^^ PPrint.concat args ^^ string " = "
    ^/^ nest 2 value ^^ PPrint.concat args

  let val_ name type_ =
    string "val " ^^ var name ^^ string " : " ^/^ nest 2 type_

  let module_ module_name defs =
    string "module " ^^ mod_var module_name ^^ string " = struct"
    ^^ nest 2 (break 1 ^^ separate (hardline ^^ hardline) defs ^^ break 1)
    ^^ string "end"

  let module_rec module_name defs =
    string "module rec " ^^ mod_var module_name ^^ string " : "
    ^^ string (String.uppercase module_name)
    ^^ string " = struct"
    ^^ nest 2 (break 1 ^^ separate (hardline ^^ hardline) defs ^^ break 1)
    ^^ string "end"

  let module_type module_type_name decls =
    string "module type " ^^ mod_var module_type_name ^^ string " = sig"
    ^^ nest 2 (break 1 ^^ separate (hardline ^^ hardline) decls ^^ break 1)
    ^^ string "end"

  let module_and module_name defs =
    string "and " ^^ mod_var module_name ^^ string " : "
    ^^ string (String.uppercase module_name)
    ^^ string " = struct"
    ^^ nest 2 (break 1 ^^ separate (hardline ^^ hardline) defs ^^ break 1)
    ^^ string "end"

  let module_type_and module_type_name decls =
    string "and " ^^ mod_var module_type_name ^^ string " = sig"
    ^^ nest 2 (break 1 ^^ separate (hardline ^^ hardline) decls ^^ break 1)
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

  let binary_op_val_type : string -> string -> string -> ocaml =
   fun t1 t2 rty ->
    string
      (sprintf
         "(%s.t structure ptr -> %s.t structure ptr -> %s.t structure ptr)"
         (mod_var_str t1) (mod_var_str t2) (mod_var_str rty))

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
    let type_str =
      (* To anyone reading this: I'm sorry! It seemed like the quickest way at the time... *)
      if type_str |> String.is_suffix ~suffix:"R_I_D" then
        String.drop_suffix type_str 5 ^ "RID"
      else if type_str |> String.is_suffix ~suffix:"_D" then
        String.drop_suffix type_str 2 ^ "D"
      else if type_str |> String.is_suffix ~suffix:"A_A_B_B" then
        String.drop_suffix type_str 7 ^ "AABB"
      else type_str
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
      let defs =
        let_ "is_bitfield" is_bitfield :: string "type t = int" :: defs
      in
      module_ module_name defs

    let t_list_to_ocaml : t list -> ocaml =
     fun ges ->
      let module_name = "GlobalEnum0" in
      let defs = ges |> List.map ~f:t_to_ocaml in
      module_ module_name defs
  end

  (** Qualify a name as (roughly) <name>.t`. *)
  let qualified_t _this name =
    if String.(name <> "") then mod_var name ^^ string ".t" else string "t"

  let qualified_typ _this name =
    if String.(name <> "") then mod_var name ^^ string ".typ" else string "typ"

  let qualified_s _this name =
    if String.(name <> "") then mod_var name ^^ string ".s" else string "s"

  let qualified_st _this name =
    if String.(name <> "") then mod_var name ^^ string ".t structure"
    else string "t structure"

  let unqualified_st _this name =
    if String.(name <> "") then mod_var name ^^ string ".t structure"
    else string "t structure"

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
      let ty_frags, is_void =
        match ty_frags with
        | [] -> ([ string "void @-> " ], true)
        | _ as ty_frags -> (ty_frags, false)
      in
      let ret_ty = uf.return_type |> Option.value ~default:"void" in
      let ret_ty_frag = ret_ty |> return_type_to_ocaml_fragment in
      let c_type = assemble_type ty_frags ret_ty_frag in
      let rhs name t =
        string "foreign_utility_function"
        ^^ (if is_void then string "0" else OCaml.int (List.length ty_frags))
        ^^ (if String.(ret_ty = "void") then string "_void" else string "")
        ^/^ string "\"" ^^ name ^^ string "\""
        ^/^ parens
              (string "Base.Int64.of_string \""
              ^^ OCaml.int64 uf.hash ^^ string "\"")
        ^/^ t ^/^ qualified_s "@NONE" ret_ty
      in
      let fun_name = var uf.name in
      let dc = uf.description |> PPrint.optional doc_comment in
      dc ^/^ let_fun (List.length ty_frags) uf.name (rhs fun_name c_type)

    let t_list_to_ocaml : t list -> ocaml =
     fun ufs -> module_ "UtilityFunction" (List.map ~f:t_to_ocaml ufs)
  end

  module BuiltinClass = struct
    open Api.BuiltinClass

    let argument_to_ocaml_fragment : string -> argument -> ocaml =
     fun this arg ->
      let ty = qualified_typ this arg.type_ in
      ty ^^ string " @-> "

    let argument_to_mli_fragment : string -> argument -> ocaml =
     fun this arg ->
      let ty =
        if String.(arg.type_ = "void") then string "unit"
        else ptr_to @@ qualified_st this (remove_prefix this arg.type_)
      in
      ty ^^ string " -> "

    let return_type_to_ocaml_fragment : string -> string -> ocaml =
     fun this return_type ->
      string "returning " ^^ qualified_typ this return_type

    let return_type_to_mli_fragment : string -> string -> ocaml =
     fun this return_type ->
      if String.(return_type = "void") then string "unit"
      else ptr_to @@ qualified_st this (remove_prefix this return_type)

    let assemble_type : ocaml list -> ocaml -> ocaml =
     fun ty_frags return_ty ->
      PPrint.parens (PPrint.concat ty_frags ^^ return_ty)

    let mktype' f g this args return_type is_static is_vararg =
      let primary_arguments = args |> Option.value ~default:[] in
      let var_arg =
        [
          {
            name = "variadic_args";
            type_ = "Variadic";
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
      let return_type = return_type |> Option.value ~default:"void" |> g this in
      let method_type =
        assemble_type (List.map ~f:(f this) arguments) return_type
      in
      method_type

    let mktype =
      mktype' argument_to_ocaml_fragment return_type_to_ocaml_fragment

    let mkvaltype = mktype' argument_to_mli_fragment return_type_to_mli_fragment

    let method_to_ocaml : string -> method_ -> ocaml =
     fun this meth ->
      let method_name = meth.name in
      let dc = meth.description |> PPrint.optional doc_comment in
      let count = meth.arguments |> Option.value ~default:[] |> List.length in
      let ret_type = meth.return_type |> Option.value ~default:"void" in
      let is_void_ret = ret_type |> function "void" -> true | _ -> false in
      let method_type =
        mktype this meth.arguments meth.return_type meth.is_static
          meth.is_vararg
      in
      let rhs name t =
        string "foreign_builtin_method"
        ^^ OCaml.int count
        ^^ (if meth.is_vararg then string "v" else string "")
        ^^ (if is_void_ret then string "_void" else string "")
        ^^ (if meth.is_static then string "_static" else string "")
        ^/^ string "GlobalEnum.VariantType."
        ^^ string (to_type_enum this)
        ^/^ string "\"" ^^ name ^^ string "\""
        ^/^ parens
              (string "Base.Int64.of_string \""
              ^^ OCaml.int64 meth.hash ^^ string "\"")
        ^/^ t ^/^ qualified_s this ret_type
      in
      dc
      ^/^ let_fun
            (count + if meth.is_static then 0 else 1)
            method_name
            (rhs (var method_name) method_type)

    let method_to_mli : string -> method_ -> ocaml =
     fun this meth ->
      let method_name = meth.name in
      let dc = meth.description |> PPrint.optional doc_comment in
      let method_type =
        mkvaltype this meth.arguments meth.return_type meth.is_static
          meth.is_vararg
      in
      dc ^/^ val_ method_name method_type

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
                    (string "funptr " ^^ binary_op_type this t op.return_type)
              ^/^ qualified_s this op.return_type)
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
              ^/^ qualified_s this op.return_type)
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
                    (string "funptr " ^^ binary_op_type this t op.return_type)
              ^/^ qualified_s this op.return_type)
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
      |> Option.map ~f:(fun the_rhs -> dc ^/^ let_fun 2 lhs the_rhs)
      |> Option.value ~default:(string "")

    let operator_to_mli : string -> operator -> ocaml =
     fun this op ->
      let type_ : ocaml option =
        match (op.name, op.right_type) with
        | ( "in",
            Some
              (( "Dictionary" | "Array" | "Object" | "PackedByteArray"
               | "PackedStringArray" | "PackedInt32Array" | "PackedInt64Array"
               | "PackedFloat32Array" | "PackedFloat64Array" | "String"
               | "StringName" | "PackedVector2Array" | "PackedVector3Array"
               | "PackedVector4Array" | "PackedColorArray" ) as t) ) ->
            Some (binary_op_val_type this t op.return_type)
        | "in", _ ->
            (* Should have covered all the cases; fail otherwise for my sake. *)
            assert false
        | _op_name, None ->
            (* Unary operators. *)
            Some (binary_op_val_type this this op.return_type)
        | _op_name, Some t when String.(t = this) ->
            (* Normal path: binary operator. *)
            Some (binary_op_val_type this t op.return_type)
        | _ ->
            (* We don't care about the forest of pointless operators.
               We will provide Variant-polymorphic ones if you need them. *)
            None
      in
      let lhs = Map.find_exn op_ocaml_names op.name in
      let lhs =
        if String.(lhs = "mem") then "mem_" ^ Option.value_exn op.right_type
        else lhs
      in
      let dc = op.description |> PPrint.optional doc_comment in
      type_
      |> Option.map ~f:(fun the_type -> dc ^/^ val_ lhs the_type)
      |> Option.value ~default:(string "")

    let enum_value_to_ocaml : enum_value -> ocaml =
     fun value ->
      let dc = optional doc_comment value.description in
      let int_value = value.value in
      dc ^/^ let_ value.name (OCaml.int int_value)

    let enum_value_to_mli : enum_value -> ocaml =
     fun value ->
      let dc = optional doc_comment value.description in
      dc ^/^ val_ value.name (string "int")

    let enum_to_ocaml : enum -> ocaml =
     fun e ->
      let module_name = remove_dots e.name in
      let defs = e.values |> List.map ~f:enum_value_to_ocaml in
      let enum_t_def = string "type t = Int.t" in
      let enum_typ_def = let_ "typ" (string "Int.typ") in
      module_ module_name (enum_t_def :: enum_typ_def :: defs)

    let enum_to_mli : enum -> ocaml =
     fun e ->
      let module_name = String.uppercase (remove_dots e.name) in
      let decls = e.values |> List.map ~f:enum_value_to_mli in
      let enum_t_def = string "type t" in
      let enum_typ_def = val_ "typ" (string "Int.t structure ptr typ") in
      string "module " ^^ string module_name ^^ string " : sig "
      ^^ PPrint.concat_map
           (fun x -> x ^^ hardline ^^ hardline)
           (enum_t_def :: enum_typ_def :: decls)
      ^^ string "end"

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
            (* List.map ~f:constant_to_ocaml
               (bic.constants |> Option.value ~default:[]); *)
          ]
      in
      module_ bic.name
        (string (sprintf "include M.%s\n" (mod_var_str bic.name)) :: defs)

    let t_to_mli : t -> ocaml =
     fun bic ->
      let decls =
        List.concat
          [
            [
              string "type t" ^^ hardline;
              string "include Api_types.API_TYPE with type t := t"
              ^^ hardline ^^ hardline;
            ];
            List.map ~f:(method_to_mli bic.name)
              (bic.methods |> Option.value ~default:[]);
            List.map ~f:(operator_to_mli bic.name)
              (bic.operators |> Option.value ~default:[]);
            List.map ~f:enum_to_mli (bic.enums |> Option.value ~default:[]);
            (* List.map ~f:constant_to_ocaml
               (bic.constants |> Option.value ~default:[]); *)
          ]
      in
      module_type (String.uppercase bic.name) decls

    let t_list_to_ocaml : t list -> ocaml =
     fun bics ->
      let mli = bics |> List.map ~f:t_to_mli in
      let ml = bics |> List.map ~f:t_to_ocaml in
      mli @ ml |> module_ "BuiltinClass"
  end

  module Class = struct
    open Api.Class

    let enum_value_to_ocaml : enum_value -> ocaml =
     fun value ->
      let dc = optional doc_comment value.description in
      let int_value = value.value in
      dc ^/^ let_ value.name (OCaml.int int_value)

    let enum_value_to_mli : enum_value -> ocaml =
     fun value ->
      let dc = optional doc_comment value.description in
      dc ^/^ val_ value.name (string "int")

    let enum_to_ocaml : enum -> ocaml =
     fun e ->
      let module_name = remove_dots e.name in
      let defs = e.values |> List.map ~f:enum_value_to_ocaml in
      let include_int = string "include ApiTypes.Int" in
      module_ module_name (include_int :: defs)

    let enum_to_mli : enum -> ocaml =
     fun e ->
      let module_name = String.uppercase (remove_dots e.name) in
      let defs = e.values |> List.map ~f:enum_value_to_mli in
      let include_int = string "include ApiTypes.INT" in
      module_type module_name (include_int :: defs)

    let method_argument_to_ocaml_fragment : string -> method_argument -> ocaml =
     fun this arg ->
      let ty = qualified_typ this (remove_prefix this arg.type_) in
      ty ^^ string " @-> "

    let method_argument_to_mli_fragment : string -> method_argument -> ocaml =
     fun this arg ->
      let ty =
        if String.(arg.type_ = "void") then string "unit"
        else ptr_to @@ unqualified_st this (remove_prefix this arg.type_)
      in
      ty ^^ string " -> "

    let signal_argument_to_ocaml_fragment : string -> signal_argument -> ocaml =
     fun this arg ->
      let ty = qualified_typ this (remove_prefix this arg.type_) in
      ty ^^ string " @-> "

    let signal_argument_to_mli_fragment : string -> signal_argument -> ocaml =
     fun this arg ->
      let ty =
        if String.(arg.type_ = "void") then string "unit"
        else ptr_to @@ unqualified_st this (remove_prefix this arg.type_)
      in
      ty ^^ string " -> "

    let return_type_to_ocaml_fragment : string -> string -> ocaml =
     fun this return_type ->
      string "returning " ^^ qualified_typ this (remove_prefix this return_type)

    let return_type_to_mli_fragment : string -> string -> ocaml =
     fun this return_type ->
      if String.(return_type = "void") then string "unit"
      else ptr_to @@ unqualified_st this (remove_prefix this return_type)

    let assemble_type : ocaml list -> ocaml -> ocaml =
     fun ty_frags return_ty ->
      PPrint.parens (PPrint.concat ty_frags ^^ return_ty)

    let mk_method_type' f g this args return_type is_static is_vararg =
      let primary_arguments = args |> Option.value ~default:[] in
      let var_arg =
        [
          {
            name = "variadic_args";
            type_ = "VariadicVariants";
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
      let return_type = return_type |> Option.value ~default:"void" |> g this in
      let method_type =
        assemble_type (List.map ~f:(f this) arguments) return_type
      in
      method_type

    let mk_method_type =
      mk_method_type' method_argument_to_ocaml_fragment
        return_type_to_ocaml_fragment

    let mk_method_val_type =
      mk_method_type' method_argument_to_mli_fragment
        return_type_to_mli_fragment

    let mk_signal_type' f g this args =
      let return_type = g this "void" in
      let arguments =
        args |> Option.value ~default:[ { name = "dummy"; type_ = "void" } ]
        |> function
        | [] -> [ { name = "dummy"; type_ = "void" } ]
        | _ as args -> args
      in
      assemble_type (List.map ~f:(f this) arguments) return_type

    let mk_signal_type =
      mk_signal_type' signal_argument_to_ocaml_fragment
        return_type_to_ocaml_fragment

    let mk_signal_val_type =
      mk_signal_type' signal_argument_to_mli_fragment
        return_type_to_mli_fragment

    let method_to_ocaml : string -> method_ -> ocaml =
     fun this meth ->
      let method_name = meth.name in
      let dc = meth.description |> PPrint.optional doc_comment in
      let count = meth.arguments |> Option.value ~default:[] |> List.length in
      let return_type_opt =
        Option.map ~f:(fun x -> x.type_) meth.return_value
      in
      let ret_type =
        return_type_opt |> Option.value ~default:"void" |> remove_prefix this
      in
      let is_void_ret = ret_type |> function "void" -> true | _ -> false in
      let method_type =
        mk_method_type this meth.arguments return_type_opt meth.is_static
          meth.is_vararg
      in
      let ret_to_variant = mod_var ret_type ^^ string ".to_variant" in
      let variant_to_ret = mod_var ret_type ^^ string ".of_variant" in
      let args = Option.value ~default:[] meth.arguments in
      let args_to_variants : ocaml =
        List.fold_left ~init:(string "")
          ~f:(fun acc x ->
            acc ^/^ mod_var (remove_prefix this x.type_) ^^ string ".to_variant")
          args
      in
      let rhs name t =
        string "foreign_method" ^^ OCaml.int count
        ^^ (if meth.is_vararg then string "v" else string "")
        ^^ (if is_void_ret then string "_void" else string "")
        ^^ (if meth.is_static then string "_static" else string "")
        ^/^ string "\"" ^^ string name ^^ string "\"" ^/^ t
        ^/^ qualified_s this ret_type ^/^ ret_to_variant ^/^ variant_to_ret
        ^/^ args_to_variants
      in
      dc
      ^/^ let_fun
            (count + if meth.is_static then 0 else 1)
            (var_str method_name)
            (rhs method_name method_type)

    let method_to_mli : string -> method_ -> ocaml =
     fun this meth ->
      let return_type_opt =
        Option.map ~f:(fun x -> x.type_) meth.return_value
      in
      let method_val_type =
        mk_method_val_type this meth.arguments return_type_opt meth.is_static
          meth.is_vararg
      in
      val_ (var_str meth.name) method_val_type

    let constant_to_ocaml : constant -> ocaml =
     fun c ->
      let dc = c.description |> PPrint.optional doc_comment in
      dc ^/^ let_ c.name (OCaml.int c.value)

    let constant_to_mli : constant -> ocaml =
     fun c ->
      let dc = c.description |> PPrint.optional doc_comment in
      dc ^/^ val_ c.name (string "int")

    let signal_to_ocaml : string -> signal -> ocaml =
     fun this s ->
      let dc = s.description |> PPrint.optional doc_comment in
      let signal_name = s.name in
      let signal_type = mk_signal_type this s.arguments in
      let rhs name t =
        string "foreign_signal \"" ^^ string this ^^ string "\" \""
        ^^ string name ^^ string "\"" ^/^ t
      in
      dc ^/^ let_ (var_str signal_name) (rhs signal_name signal_type)

    let signal_to_mli : string -> signal -> ocaml =
     fun this s ->
      let dc = s.description |> PPrint.optional doc_comment in
      let signal_name = s.name in
      let signal_type = mk_signal_val_type this s.arguments in
      dc ^/^ val_ (var_str signal_name) (signal_type ^^ string " signal_t")

    let property_to_ocaml : string -> property -> ocaml =
     fun this prop ->
      let dc = prop.description |> PPrint.optional doc_comment in
      let property_name = prop.name in
      let property_type = var prop.type_ in
      let rhs name t =
        string "foreign_property" ^/^ string "\"" ^^ string this ^^ string "\""
        ^/^ string "\"" ^^ string name ^^ string "\"" ^/^ string "\""
        ^^ OCaml.option var prop.setter
        ^^ string "\"" ^/^ string "\"" ^^ var prop.getter ^^ string "\"" ^/^ t
      in
      dc ^/^ let_ (var_str property_name) (rhs property_name property_type)

    let t_to_ocaml : int -> t -> ocaml =
     fun _n c ->
      let defs =
        List.concat
          [
            [ string "open! ApiTypes"; string "include ApiTypes.Object" ];
            c.inherits |> Option.to_list
            |> List.map ~f:(fun x ->
                   string (sprintf "include %s" (mod_var_str x)));
            List.map ~f:enum_to_ocaml (c.enums |> Option.value ~default:[]);
            List.map ~f:constant_to_ocaml
              (c.constants |> Option.value ~default:[]);
            List.map ~f:(method_to_ocaml c.name)
              (c.methods |> Option.value ~default:[]);
            (* List.map ~f:(signal_to_ocaml c.name)
               (c.signals |> Option.value ~default:[]); *)
          ]
      in
      module_ c.name defs

    let t_to_mli : int -> t -> ocaml =
     fun _n c ->
      let decls =
        List.concat
          [
            [ string "open! ApiTypes"; string "include ApiTypes.OBJECT" ];
            c.inherits |> Option.to_list
            |> List.map ~f:(fun x ->
                   string
                     (sprintf "include %s" (String.uppercase @@ mod_var_str x)));
            (* List.map ~f:enum_to_mli (c.enums |> Option.value ~default:[]); *)
            List.map ~f:constant_to_mli (c.constants |> Option.value ~default:[]);
            List.map ~f:(method_to_mli c.name)
              (c.methods |> Option.value ~default:[]);
            (* List.map ~f:(signal_to_mli c.name)
               (c.signals |> Option.value ~default:[]); *)
          ]
      in
      module_type (String.uppercase c.name) decls

    let t_list_to_ocaml : t list -> ocaml list * ocaml list =
     fun cs ->
      let blacklist_regex =
        [ "OpenXR"; "Audio"; "Movie"; "TextServer" ]
        |> List.map ~f:Re.str |> Re.alt
        |> fun x ->
        Re.seq [ x; Re.any ] |> fun x ->
        Re.alt [ x; Re.seq [ Re.any; Re.str "Extension" ] ] |> Re.compile
      in
      let cs =
        cs
        |> List.filter ~f:(fun c ->
               c.name |> Re.exec_opt blacklist_regex |> Option.is_none)
      in
      let ml = cs |> List.mapi ~f:t_to_ocaml in
      let mli = cs |> List.mapi ~f:t_to_mli in
      (mli, ml)
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
        %s
        let of_voidp = coerce (ptr void) (ptr s)
        let to_voidp = coerce (ptr s) (ptr void)
        let to_type_ptr = coerce (ptr s) type_ptr.plain
        let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
        let size = ClassSizes.%s

        (** Change this to gc_alloc! (or just remove) *)
        let new_uninit () = allocate_n ~count:1 s
      end
      |}
         (mod_var_str type_name) (mod_var_str type_name) (var_str type_name)
         (var_str type_name)
         (if String.(type_name <> "Variant") then
            sprintf "let type_enum = GlobalEnum0.VariantType.%s"
              (to_type_enum type_name)
          else "")
         (var_str type_name))

  let gen_final_api_type type_name =
    if String.(type_name = "Variant") then
      module_type
        (String.uppercase type_name)
        (List.map ~f:string
           [
             "include Api_types.SUB_API_TYPE";
             "val to_variant : t structure ptr -> C.variant_ptr structure ptr";
             "val of_variant : C.variant_ptr structure ptr -> t structure ptr";
           ])
      ^/^ string
            {|
      module Variant = struct
        include Variant

        let to_variant : t structure ptr -> C.variant_ptr structure ptr = coerce_ptr C.variant_ptr.plain
        let of_variant : C.variant_ptr structure ptr -> t structure ptr = coerce_ptr (ptr s)
      end
      |}
    else
      module_type
        (String.uppercase type_name)
        (List.map ~f:string [ "include Api_types.API_TYPE" ]
        @ [
            val_ "to_variant"
              (string "t structure ptr -> C.variant_ptr structure ptr");
            val_ "of_variant"
              (string "C.variant_ptr structure ptr-> t structure ptr");
          ])
      ^/^ string
            (sprintf
               {|
    module %s = struct
      include %s
      include Conv.%s

      let to_variant : t structure ptr -> C.variant_ptr structure ptr = fun x ->
        let new_variant_ptr = coerce_ptr C.variant_ptr.uninit (gc_alloc Variant.s ~count:1) in
        let () = get_variant_from_type_constructor type_enum typ new_variant_ptr (coerce_ptr typ x) in
        let inited_variant_ptr = coerce_ptr C.variant_ptr.plain new_variant_ptr in
        inited_variant_ptr

      let of_variant : C.variant_ptr structure ptr -> t structure ptr = fun x ->
        let new_type_ptr = gc_alloc s ~count:1 in
        let () = get_variant_to_type_constructor type_enum typ (coerce_ptr typ new_type_ptr) x in
        let inited_type_ptr = coerce_ptr (ptr s) new_type_ptr in
        inited_type_ptr

    end
    |}
               (mod_var_str type_name) (mod_var_str type_name)
               (mod_var_str type_name))

  let gen_api_types : string list -> ocaml =
   fun type_names ->
    type_names |> List.map ~f:gen_api_type |> module_ "ApiTypes"

  let gen_final_api_types : string list -> ocaml =
   fun type_names ->
    string "module Void = struct include M.Void end"
    :: (type_names |> List.map ~f:gen_final_api_type)
    |> module_ "ApiTypes"

  let gen_final_global_enums : Api.GlobalEnum.t list -> ocaml =
   fun xs ->
    let name_to_final_global_enum : string -> ocaml =
     fun name ->
      string
        (sprintf
           {|
      module %s = struct
        include GlobalEnum0.%s

        let to_ocaml = Conv.Int.to_ocaml
        let of_ocaml = Conv.Int.of_ocaml
        let to_variant = ApiTypes.Int.to_variant
        let of_variant = ApiTypes.Int.of_variant

        type t = ApiTypes.Int.t structure ptr
        let s = ApiTypes.Int.s
        let typ = ApiTypes.Int.typ
      end
      |}
           (mod_var_str (remove_dots name))
           (mod_var_str (remove_dots name)))
    in
    let final_global_enums =
      List.map ~f:(fun x -> name_to_final_global_enum x.name) xs
    in
    module_ "GlobalEnum" final_global_enums

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

  (* let gen_foreign_api_module_type : string list -> ocaml =
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
  *)
  let gen_pre_class_type_defs (cs : Api.Class.t list) : ocaml =
    cs
    |> List.map ~f:(fun c ->
           [
             string "include ApiTypes.Object";
             c.enums |> Option.value ~default:[]
             |> List.map ~f:(fun e ->
                    [ string "include ApiTypes.Int" ]
                    |> module_ (mod_var_str e.name)
                    |> fun x -> x ^^ hardline)
             |> PPrint.concat;
           ]
           |> module_ (mod_var_str c.name)
           |> fun x -> x ^^ hardline)
    |> module_ "Class0"

  let gen_pre_builtin_class_type_defs (bics : Api.BuiltinClass.t list) : ocaml =
    let variant =
      Api.BuiltinClass.
        {
          name = "Variant";
          indexing_return_type = None;
          is_keyed = false;
          members = None;
          constants = None;
          enums = None;
          methods = None;
          operators = None;
          constructors = None;
          has_destructor = false;
          brief_description = None;
          description = None;
        }
    in
    let object_ =
      Api.BuiltinClass.
        {
          name = "Object";
          indexing_return_type = None;
          is_keyed = false;
          members = None;
          constants = None;
          enums = None;
          methods = None;
          operators = None;
          constructors = None;
          has_destructor = false;
          brief_description = None;
          description = None;
        }
    in
    object_ :: variant :: bics
    |> List.map ~f:(fun c ->
           [
             string ("include ApiTypes." ^ mod_var_str c.name);
             c.enums |> Option.value ~default:[]
             |> List.map ~f:(fun e ->
                    [ string "include ApiTypes.Int" ]
                    |> module_ (mod_var_str e.name)
                    |> fun x -> x ^^ hardline)
             |> PPrint.concat;
           ]
           |> module_ (mod_var_str c.name)
           |> fun x -> x ^^ hardline)
    |> module_ "BuiltinClass0"
end

module DepSort = struct
  open Topological_sort
  module ClassMap = Map.Make (String)

  let get_edges : Api.Class.t ClassMap.t -> Api.Class.t Edge.t list =
   fun classes ->
    classes |> Map.to_alist
    |> List.filter_map ~f:(fun (_name, c) ->
           c.inherits
           |> Option.map ~f:(fun inherit_ ->
                  let from = Map.find_exn classes inherit_ in
                  let to_ = c in
                  { Edge.from; to_ })
           |> Option.value
                ~default:{ from = Map.find_exn classes "Object"; to_ = c }
           |> fun x ->
           Option.some_if String.(x.Edge.to_.Api.Class.name <> x.from.name) x)

  let get_nodes : Api.Class.t ClassMap.t -> Api.Class.t list =
   fun classes -> classes |> Map.to_alist |> List.map ~f:snd

  let sort class_map =
    Topological_sort.sort
      (module Api.Class)
      ~what:What.Nodes ~nodes:(get_nodes class_map) ~edges:(get_edges class_map)
end

let () =
  let open PPrint in
  let contents = In_channel.read_all "./extension_api.json" in
  let api_json = Yojson.Safe.from_string contents in
  let api = Api.t_of_yojson api_json in
  let class_map =
    api.classes
    |> List.map ~f:(fun c -> (c.name, c))
    |> DepSort.ClassMap.of_alist_exn
  in
  let classes_topsorted = DepSort.sort class_map |> Or_error.ok_exn in
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
    (* Gen.gen_foreign_api_module_type type_names ^^ hardline; *)
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
    Gen.gen_final_api_types type_names ^^ hardline ^^ hardline;
    Gen.GlobalEnum.t_list_to_ocaml api.global_enums ^^ hardline ^^ hardline;
    Gen.gen_final_global_enums api.global_enums ^^ hardline ^^ hardline;
    Gen.UtilityFunction.t_list_to_ocaml api.utility_functions
    ^^ hardline ^^ hardline;
    Gen.gen_pre_builtin_class_type_defs api.builtin_classes
    ^^ hardline ^^ hardline;
    Gen.BuiltinClass.t_list_to_ocaml api.builtin_classes ^^ hardline ^^ hardline;
  ]
  |> PPrint.concat
  |> Gen.gen_file "api_builtins.ml";

  let mli, ml = Gen.Class.t_list_to_ocaml classes_topsorted in
  [
    string "open! Base" ^^ hardline;
    string "open Ctypes" ^^ hardline;
    string "module M = Foreign_api.Make(Api_types.ClassSizes)" ^^ hardline;
    string "open M" ^^ hardline ^^ hardline;
    string "let funptr = Foreign.funptr" ^^ hardline;
    string "open Api_builtins" ^^ hardline;
    Gen.gen_pre_class_type_defs classes_topsorted ^^ hardline ^^ hardline;
    mli |> Gen.module_ "Class";
  ]
  |> PPrint.concat
  |> Gen.gen_file "api_classes_intf.ml";

  [
    string "open! Base" ^^ hardline;
    string "open Ctypes" ^^ hardline;
    string "module M = Foreign_api.Make(Api_types.ClassSizes)" ^^ hardline;
    string "open M" ^^ hardline ^^ hardline;
    string "let funptr = Foreign.funptr" ^^ hardline;
    string "open Api_builtins" ^^ hardline;
    string "open Api_classes_intf" ^^ hardline;
    ml |> Gen.module_ "Class";
  ]
  |> PPrint.concat
  |> Gen.gen_file "api_classes.ml";

  ()

(* form the bicnames list *)
(* for x = 0 to List.length api.global_enums - 1 do
     printf "%s\n"
       ( api.global_enums |> List.map ~f:(fun x -> x.name) |> fun y ->
         List.nth_exn y x )
   done
*)
