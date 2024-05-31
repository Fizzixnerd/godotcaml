open! Base
open Ctypes
open Godotcaml
module Suite = TypedSuite
module C = C (Suite)
open C
module Godotcaml = Godotcaml
open Api_types

let get_proc_address : (string -> unit -> unit) ref =
  ref (fun (_ : string) (_ : unit) ->
      Stdio.print_endline "get_proc_address -> it does nothing!")

module Make =
functor
  (ClassSizes : CLASS_SIZES)
  ->
  struct
    include Api_types.ApiTypes (ClassSizes)

    let plain_to_uninit suite x =
      let open Suite in
      coerce suite.plain suite.uninit x

    let plain_to_const suite x =
      let open Suite in
      coerce suite.plain suite.const x

    let [@inline] get_fun fun_name =
      !get_proc_address fun_name

    let string_name_new_with_utf8_chars str_name_ptr str =
      coerce interface_function_ptr.typ  interface_string_name_new_with_utf8_chars.typ (get_fun "string_name_new_with_utf8_chars") str_name_ptr str

(*     let variant_get_ptr_constructor variant_type constructor_index =
      get_fun "variant_get_ptr_constructor"
        interface_variant_get_ptr_constructor.typ variant_type constructor_index

    let variant_get_ptr_destructor variant_type =
      get_fun "variant_get_ptr_destructor"
        interface_variant_get_ptr_destructor.typ variant_type
 *)
    let [@inline] variant_get_ptr_operator_evaluator operator_enum variant_type arg_type =
    coerce interface_function_ptr.typ interface_variant_get_ptr_operator_evaluator.typ (get_fun "variant_get_ptr_operator_evaluator")
         operator_enum
        variant_type arg_type

    let [@inline] foreign_operator : int -> int option -> int -> _ =
     fun variant_type arg_type_opt operator ->
      Stdio.print_endline @@ "rawr: " ^ Base.Int.to_string variant_type;
        (variant_get_ptr_operator_evaluator operator variant_type
           (arg_type_opt |> Option.value ~default:variant_type))
  end
