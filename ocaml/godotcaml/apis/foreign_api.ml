open! Base
open Ctypes
open Godotcaml
open C
module Suite = TypedSuite
module Godotcaml = Godotcaml
module C = C
open Api_types

let get_proc_address : (string -> InterfaceFunctionPtr.t) ref =
  ref (fun (_ : string) ->
      Stdio.print_endline "get_proc_address -> it does nothing!";
      assert false)

module Make =
functor
  (ClassSizes : CLASS_SIZES)
  ->
  struct
    include Api_types.ApiTypes (ClassSizes)

    module Void = struct
      type t = unit

      let typ = void
    end

    let plain_to_uninit suite x =
      let open Suite in
      coerce suite.plain suite.uninit x

    let plain_to_const suite x =
      let open Suite in
      coerce suite.plain suite.const x

    let get_fun fun_name typ =
      coerce InterfaceFunctionPtr.t typ (!get_proc_address fun_name)

    let string_name_new_with_utf8_chars str_name_ptr str =
      get_fun "string_name_new_with_utf8_chars"
        interface_string_name_new_with_utf8_chars.typ str_name_ptr str

    let variant_get_ptr_constructor variant_type constructor_index =
      get_fun "variant_get_ptr_constructor"
        interface_variant_get_ptr_constructor.typ variant_type constructor_index

    let variant_get_ptr_destructor variant_type =
      get_fun "variant_get_ptr_destructor"
        interface_variant_get_ptr_destructor.typ variant_type

    let variant_get_ptr_operator_evaluator operator_enum variant_type arg_type =
      get_fun "variant_get_ptr_operator_evaluator"
        interface_variant_get_ptr_operator_evaluator.typ operator_enum
        variant_type arg_type

    let variant_get_ptr_builtin_method variant_type method_string_name_const
        method_hash =
      get_fun "variant_get_ptr_builtin_method"
        interface_variant_get_ptr_builtin_method.typ variant_type
        method_string_name_const method_hash

    let foreign_builtin_operator : int -> int option -> int -> 'a typ -> 'a =
     fun variant_type arg_type_opt operator typ ->
      coerce PtrOperatorEvaluator.t typ
        (variant_get_ptr_operator_evaluator operator variant_type
           (arg_type_opt |> Option.value ~default:variant_type))

    let foreign_utility_function : string -> 'a fn -> 'a =
     fun name fn -> get_fun name (Foreign.funptr fn)

    let foreign_builtin_method : int -> string -> int64 -> 'a fn -> 'a =
     fun variant_type method_name method_hash fn ->
      let string_name =
        coerce StringName.typ string_name_ptr.uninit (StringName.new_uninit ())
      in
      let () = string_name_new_with_utf8_chars string_name method_name in
      let string_name =
        coerce string_name_ptr.uninit string_name_ptr.const string_name
      in
      let ret =
        coerce PtrBuiltinMethod.t (Foreign.funptr fn)
          (variant_get_ptr_builtin_method variant_type string_name method_hash)
      in
      let () = (* call stringname destructor here *) () in
      ret
  end
