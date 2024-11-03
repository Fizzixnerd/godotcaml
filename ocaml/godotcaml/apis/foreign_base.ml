open! Base
open Ctypes
open Godotcaml_base
open Godotcaml
open C
open Living
module Suite = TypedSuite
module Godotcaml = Godotcaml

let get_proc_address : (string -> InterfaceFunctionPtr.t) ref =
  ref (fun (_ : string) ->
      Stdio.print_endline "get_proc_address -> it does nothing!";
      assert false)

let library : class_library_ptr structure ptr ref =
  ref (coerce (ptr void) class_library_ptr.plain null)

let initialization = ref (coerce (ptr void) (ptr Initialization.s) null)

let coerce_ptr new_typ x =
  let voidp = to_voidp x in
  coerce (ptr void) new_typ voidp

let on_load : (unit -> unit) ref = ref (fun () -> ())

let static_alloc ?finalise ~count (typ : 'a typ) : 'a ptr =
  Root.get (Root.create (allocate_n ?finalise ~count typ))

let gc_alloc ?finalise ~count (typ : 'a typ) :
    'a ptr Living.Living_core.Default.t =
  Living.Living_ctypes.Default.allocate_n ?finalise ~count typ

let global_call_error = allocate_n CallError.s ~count:1

exception Invalid_method
exception Invalid_argument of int * int
exception Too_many_arguments of int * int
exception Too_few_arguments of int * int
exception Instance_is_null
exception Method_not_const
exception Unknown_call_error

let is_error : CallError.t structure ptr -> bool =
 fun err -> !@(err |-> CallError.error_f) <> 0

(* FIXME to use proper named enum values from CallError.t *)
let to_exn : CallError.t structure ptr -> exn =
 fun err ->
  match !@(err |-> CallError.error_f) with
  | 1 -> Invalid_method
  | 2 -> Invalid_argument (0, 0)
  | 3 -> Too_many_arguments (0, 0)
  | 4 -> Too_few_arguments (0, 0)
  | 5 -> Instance_is_null
  | 6 -> Method_not_const
  | _ -> Unknown_call_error

include Api_types.ApiTypes

module Void = struct
  type t = unit

  let s = void
  let typ = void
  let to_ocaml () = ()
  let of_ocaml () = ()

  let ocaml_to_variant : unit -> variant_ptr structure ptr =
   fun _ -> coerce_ptr variant_ptr.plain null

  let godot_to_variant : unit -> variant_ptr structure ptr =
   fun _ -> coerce_ptr variant_ptr.plain null

  let ocaml_of_variant : variant_ptr structure ptr -> unit = fun _ -> ()
  let godot_of_variant : variant_ptr structure ptr -> unit = fun _ -> ()
end

module Variadic = struct
  type t = type_ptr structure Suite.const ptr list

  let length = Base.List.length
  let of_list = Base.List.of_list
  let of_array = Base.List.of_array

  let typ =
    view
      ~read:(fun _ -> assert false) (* we never read from a Variadic.t. *)
      ~write:(fun variadic ->
        CArray.start (CArray.of_list type_ptr.const variadic))
      (ptr type_ptr.const)
end

module VariadicVariants = struct
  type t = variant_ptr structure Suite.const ptr list

  let length = Base.List.length
  let of_list = Base.List.of_list
  let of_array = Base.List.of_array

  let typ =
    view
      ~read:(fun _ -> assert false)
        (* we never read from a VariadicVariants.t. *)
      ~write:(fun variadic ->
        CArray.start (CArray.of_list variant_ptr.const variadic))
      (ptr variant_ptr.const)
end

let plain_to_uninit suite x =
  let open Suite in
  coerce suite.plain suite.uninit x

let plain_to_const suite x =
  let open Suite in
  coerce suite.plain suite.const x

let godot_function_table = Hashtbl.create (module Base.String)

let get_fun fun_name typ =
  let func =
    Hashtbl.find_or_add godot_function_table fun_name ~default:(fun () ->
        !get_proc_address fun_name)
  in
  coerce InterfaceFunctionPtr.t typ func

(* FIXME Use a hash table to memoize! *)
let string_new_with_utf8_chars str_ptr str =
  get_fun "string_new_with_utf8_chars" interface_string_new_with_utf8_chars.typ
    str_ptr str

let string_to_utf8_chars str_ptr char_ptr max_write_length =
  get_fun "string_to_utf8_chars" interface_string_to_utf8_chars.typ str_ptr
    char_ptr max_write_length

let string_name_new_with_utf8_chars str_name_ptr str =
  get_fun "string_name_new_with_utf8_chars"
    interface_string_name_new_with_utf8_chars.typ str_name_ptr str

module String_memo = Memo.Make (Base.String)

(** Call the destructor at some point! *)
let string_name_of_string =
  String_memo.memo @@ fun _ str ->
  let open Living_core.Default.Let_syntax in
  let* ptr = gc_alloc ~count:1 StringName.s in
  let string_name = coerce StringName.typ string_name_ptr.uninit ptr in
  let () = string_name_new_with_utf8_chars string_name str in
  Living_core.Default.named_return "string_name_of_string"
    (coerce string_name_ptr.uninit string_name_ptr.const string_name)

let variant_new_copy dest src =
  get_fun "variant_new_copy" interface_variant_new_copy.typ dest src

let variant_get_ptr_constructor variant_type constructor_index =
  get_fun "variant_get_ptr_constructor"
    interface_variant_get_ptr_constructor.typ variant_type constructor_index

let variant_get_ptr_destructor variant_type =
  get_fun "variant_get_ptr_destructor" interface_variant_get_ptr_destructor.typ
    variant_type

let variant_get_ptr_operator_evaluator operator_enum variant_type arg_type =
  get_fun "variant_get_ptr_operator_evaluator"
    interface_variant_get_ptr_operator_evaluator.typ operator_enum variant_type
    arg_type

let variant_get_ptr_builtin_method variant_type method_string_name_const
    method_hash =
  get_fun "variant_get_ptr_builtin_method"
    interface_variant_get_ptr_builtin_method.typ variant_type
    method_string_name_const method_hash

let variant_get_ptr_utility_function utility_function_name function_hash =
  let open Living_core.Default.Let_syntax in
  let* string_name = string_name_of_string utility_function_name in
  let ret =
    get_fun "variant_get_ptr_utility_function"
      interface_variant_get_ptr_utility_function.typ string_name function_hash
  in
  let () = () (* call destructor for string_name here. *) in
  Living_core.Default.named_return "variant_get_ptr_utility_function" ret

let variant_call () variant_ptr method_name args count ret call_error =
  get_fun "variant_call" variant_call.typ variant_ptr method_name args count ret
    call_error

let variant_call_static () variant_type method_name args count ret call_error =
  get_fun "variant_call_static" variant_call_static.typ variant_type method_name
    args count ret call_error

let get_variant_from_type_constructor variant_type =
  let getter =
    get_fun "get_variant_from_type_constructor" GetVariantFromTypeConstructor.t
  in
  coerce VariantFromTypeConstructorFunc.t variant_from_type_constructor_func.typ
    (coerce GetVariantFromTypeConstructor.t
       get_variant_from_type_constructor.typ getter variant_type)

let get_variant_to_type_constructor (variant_type : int) =
  let getter =
    get_fun "get_variant_to_type_constructor" GetVariantToTypeConstructor.t
  in
  coerce VariantToTypeConstructorFunc.t variant_to_type_constructor_func.typ
    (coerce GetVariantToTypeConstructor.t get_variant_to_type_constructor.typ
       getter variant_type)

let object_set_instance obj_ptr class_name instance =
  get_fun "object_set_instance" interface_object_set_instance.typ obj_ptr
    class_name instance

let object_set_instance_binding obj_ptr lib instance callbacks =
  get_fun "object_set_instance_binding"
    interface_object_set_instance_binding.typ obj_ptr lib instance callbacks

let object_cast_to obj_ptr class_tag =
  get_fun "object_cast_to" interface_object_cast_to.typ obj_ptr class_tag

let object_get_instance_id obj_ptr =
  get_fun "object_get_instance_id" interface_object_get_instance_id.typ obj_ptr

let object_method_bind_ptrcall mb_ptr obj_ptr args ret =
  get_fun "object_method_bind_ptrcall" interface_object_method_bind_ptrcall.typ
    mb_ptr obj_ptr args ret

let callable_custom_create callable_ptr callable_custom_info =
  get_fun "callable_custom_create" interface_callable_custom_create.typ
    callable_ptr callable_custom_info

let classdb_construct_object class_name =
  get_fun "classdb_construct_object" interface_classdb_construct_object.typ
    class_name

let classdb_register_extension_class2 library class_name parent_class_name
    extension_funcs =
  get_fun "classdb_register_extension_class2"
    interface_classdb_register_extension_class2.typ library class_name
    parent_class_name extension_funcs

let classdb_register_extension_class_method library class_name method_info =
  get_fun "classdb_register_extension_class_method"
    interface_classdb_register_extension_class_method.typ library class_name
    method_info

let classdb_register_extension_class_signal library class_name signal_name
    argument_infos argument_count =
  get_fun "classdb_register_extension_class_signal"
    interface_classdb_register_extension_class_signal.typ library class_name
    signal_name argument_infos argument_count

let classdb_get_class_tag class_name =
  get_fun "classdb_get_class_tag" interface_get_class_tag.typ class_name

let classdb_get_method_bind class_name method_name hash =
  get_fun "classdb_get_method_bind" interface_classdb_get_method_bind.typ
    class_name method_name hash

let foreign_builtin_operator2 variant_type arg_type_opt operator typ ret_typ
    lhs_of_ocaml rhs_of_ocaml ret_to_ocaml lhs rhs =
  let open Living_core.Default.Let_syntax in
  let op left right ret =
    coerce PtrOperatorEvaluator.t typ
      (variant_get_ptr_operator_evaluator operator variant_type
         (arg_type_opt |> Option.value ~default:variant_type))
      left right ret
  in
  let* ret = gc_alloc ~count:1 ret_typ in
  let () = op (lhs_of_ocaml lhs) (rhs_of_ocaml rhs) ret in
  Living_core.Default.named_return "foreign_builtin_operator2"
    (ret_to_ocaml ret)

(* FIXME *)
let foreign_builtin_operator1 variant_type arg_type_opt operator typ ret_typ lhs
    =
  let open Living_core.Default.Let_syntax in
  let op left ret =
    coerce PtrOperatorEvaluator.t typ
      (variant_get_ptr_operator_evaluator operator variant_type
         (arg_type_opt |> Option.value ~default:variant_type))
      left ret
  in
  let* ret = gc_alloc ~count:1 ret_typ in
  let () = op lhs ret in
  Living_core.Default.named_return "foreign_builtin_operator1" ret
