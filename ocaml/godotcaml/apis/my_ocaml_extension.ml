open! Base
open Foreign_api.Godotcaml
open Ctypes
open Api_types
open Foreign_api.Make (ClassSizes)
open Api_builtins

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

  let initialize (_userdata : unit ptr) (p_level : int) =
    Stdio.print_endline @@ "up: " ^ Base.Int.to_string p_level;

    let new_int = Conv.Int.of_ocaml 5L in
    let other_int = Conv.Int.of_ocaml 8L in
    if
      Conv.Bool.to_ocaml
        BuiltinClass.Int.(
          UtilityFunction.randi () * new_int
          < UtilityFunction.randi () / other_int)
    then Stdio.printf "Roar!"
  in

  let deinitialize (_userdata : unit ptr) (p_level : int) =
    Stdio.print_endline @@ "down: " ^ Base.Int.to_string p_level
  in

  Initialization.(initialization |-> initialize_f <-@ initialize);
  Initialization.(initialization |-> deinitialize_f <-@ deinitialize);

  1

let () = Stdlib.Callback.register "hello_extension_entry" hello_extension_entry
