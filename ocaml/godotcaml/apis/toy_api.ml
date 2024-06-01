open! Base
open Foreign_api
open Foreign_api.Godotcaml
open Ctypes
open Api_types
open Foreign_api.Make (ClassSizes)

let funptr = Foreign.funptr ~thread_registration:true

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
    Stdio.printf "var: %i op: %i\n" GlobalEnum.VariantType._TYPE_NIL
      Godotcaml.GlobalEnum.VariantOperator._OP_NOT;
    Stdio.Out_channel.flush Stdio.stdout
  in

  let not =
    foreign_builtin_operator GlobalEnum.VariantType._TYPE_NIL None
      Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (Nil.typ @-> Nil.typ @-> Bool.typ @-> returning void))
  in

  let arg = Nil.new_uninit () in
  let dummy = arg in
  let ret = Bool.new_uninit () in

  not arg dummy ret;

  let ptr_uint8_t = coerce Bool.typ (ptr uint8_t) ret in

  let initialize (_userdata : unit ptr) (p_level : int) =
    Stdio.print_endline @@ "up: " ^ Base.Int.to_string p_level
  in

  let deinitialize (_userdata : unit ptr) (p_level : int) =
    Stdio.print_endline @@ "down: " ^ Base.Int.to_string p_level
  in

  Initialization.(initialization |-> initialize_f <-@ initialize);
  Initialization.(initialization |-> deinitialize_f <-@ deinitialize);

  Stdio.print_endline ("blarg: " ^ Unsigned.UInt8.to_string !@ptr_uint8_t);
  1

let () = Stdlib.Callback.register "hello_extension_entry" hello_extension_entry
