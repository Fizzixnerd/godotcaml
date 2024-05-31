open! Base
open Foreign_api
open Foreign_api.Godotcaml
open Ctypes
open Api_types
module M : FOREIGN_API = Foreign_api.Make (ClassSizes)

let funptr = Foreign.funptr

let hello_extension_entry (get_proc_address : nativeint) (_library : nativeint)
    (initialization : nativeint) =
  let open C in
  let initialization =
    coerce (ptr void) (ptr Initialization.s) (ptr_of_raw_address initialization)
  in
  let get_proc_address =
    coerce (ptr void) interface_get_proc_address.typ
      (ptr_of_raw_address get_proc_address)
  in

  Foreign_api.get_proc_address := get_proc_address;

  let () =
    Stdio.printf "var: %i op: %i"
      GlobalEnum.VariantType._TYPE_NIL
      Godotcaml.GlobalEnum.VariantOperator._OP_NOT
  in

  let not =
    coerce
    (funptr @@ type_ptr.const @-> type_ptr.const @-> type_ptr.plain @-> returning void)
    (funptr (M.Nil.typ @-> M.Nil.typ @-> M.Bool.typ @-> returning void))
    (M.foreign_operator
      GlobalEnum.VariantType._TYPE_NIL
      None
      Godotcaml.GlobalEnum.VariantOperator._OP_NOT)
  in

  let arg = M.Nil.new_uninit () in
  let dummy = arg in
  let ret = M.Bool.new_uninit () in

  not arg dummy ret;

  let ptr_uint8_t = coerce M.Bool.typ (ptr uint8_t) ret in

  let initialize (_userdata : unit ptr) (p_level : int) =
    Stdio.print_endline @@ "up: " ^ Base.Int.to_string p_level
  in

  let deinitialize (_userdata : unit ptr) (p_level : int) =
    Stdio.print_endline @@ "down: " ^ Base.Int.to_string p_level
  in

  Initialization.(initialization |-> initialize_f <-@ initialize);
  Initialization.(initialization |-> deinitialize_f <-@ deinitialize);

  Stdio.print_endline (Unsigned.UInt8.to_string !@ptr_uint8_t)

let () = Stdlib.Callback.register "hello_extension_entry" hello_extension_entry
