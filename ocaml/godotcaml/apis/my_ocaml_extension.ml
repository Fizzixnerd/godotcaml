open! Base
open Ctypes
open Godotcaml_api
open Gdforeign
open Api_builtins
open! Uses_ppx_godot

let funptr = Foreign.funptr

let hello_extension_entry (get_proc_address : nativeint) (library : nativeint)
    (initialization : nativeint) =
  let open C in
  let initialization =
    coerce (ptr void) (ptr Initialization.s) (ptr_of_raw_address initialization)
  in

  let get_proc_address =
    coerce (ptr void) interface_get_proc_address.typ
      (ptr_of_raw_address get_proc_address)
  in

  let library =
    coerce (ptr void) class_library_ptr.plain (ptr_of_raw_address library)
  in

  Foreign_base.get_proc_address := get_proc_address;
  Foreign_base.library := library;

  let initialize (_userdata : unit ptr) (p_level : int) =
    Stdio.print_endline @@ "up: " ^ Base.Int.to_string p_level;
    let ture = BuiltinClass.Int.( + ) 2L 1L in
    Stdio.printf "ture = %Ld\n" ture;
    Stdio.Out_channel.flush Stdio.stdout;

    if p_level = 2 then !on_load ()
  in

  let deinitialize (_userdata : unit ptr) (p_level : int) =
    Stdio.print_endline @@ "down: " ^ Base.Int.to_string p_level
  in

  Initialization.(initialization |-> initialize_f <-@ initialize);
  Initialization.(initialization |-> deinitialize_f <-@ deinitialize);

  1

let () = Stdlib.Callback.register "hello_extension_entry" hello_extension_entry
