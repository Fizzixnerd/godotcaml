open Base
open Ctypes
module C = Godotcaml.C(Godotcaml.TypedSuite)

let hello_extension_entry (get_proc_address: nativeint) (_library: nativeint) (initialization: nativeint) =
  let open C in
  
  let initialization = coerce (ptr void) (ptr Initialization.s) (ptr_of_raw_address initialization) in
  let get_proc_address = coerce (ptr void) interface_get_proc_address.typ (ptr_of_raw_address get_proc_address) in
  
  let variant_get_ptr_constructor = coerce interface_function_ptr.typ interface_variant_get_ptr_constructor.typ (get_proc_address "variant_get_ptr_constructor") in
  let variant_get_ptr_destructor = coerce interface_function_ptr.typ interface_variant_get_ptr_destructor.typ (get_proc_address "variant_get_ptr_destructor") in

  let string_name_new_with_utf8_chars = coerce interface_function_ptr.typ interface_string_name_new_with_utf8_chars.typ (get_proc_address "string_name_new_with_utf8_chars") in
  let destroy_string_name = variant_get_ptr_destructor VariantType.string_name in

  let str_name = ref (coerce (ptr (ptr void)) string_name_ptr.plain (allocate_n (ptr void) ~count:1)) in

  let initialize (_userdata : unit ptr) (p_level : int) =
    Stdio.print_endline @@ "up: " ^ Int.to_string p_level
(*     match p_level with
    |  _ when p_level = InitializationLevel.scene ->
      string_name_new_with_utf8_chars (coerce string_name_ptr.plain string_name_ptr.uninit !str_name) "hey there!"
    | _ -> Stdio.print_endline "Not doing anythin'"
 *)  in

  let deinitialize (_userdata: unit ptr) (p_level: int) =
    Stdio.print_endline @@ "down: " ^ Int.to_string p_level
(*     match p_level with
    | _ when p_level = InitializationLevel.scene ->
      destroy_string_name !str_name
    | _ -> Stdio.print_endline "Not doing anythin'"
 *)  in
  
  let () = initialization|->Initialization.initialize_f <-@ initialize in
  let () = initialization|->Initialization.deinitialize_f <-@ initialize in
  1

let () =
Stdlib.Callback.register "hello_extension_entry" hello_extension_entry
  