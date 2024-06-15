open! Base
open Foreign_api.Godotcaml
open Ctypes
open Api_types
open Foreign_api.Make (ClassSizes)

let funptr = Foreign.funptr
let _ = Utop_loader.M.main

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

    if p_level = 3 then
      let () = Stdio.print_endline "before" in
      let () =
        match
          Dynlink.loadfile
            "/home/fizzixnerd/.opam/5.0.0+options/lib/utop/uTop.cma"
        with
        | () -> ()
        | exception (Dynlink.Error err as e) ->
            Stdio.print_endline (Dynlink.error_message err);
            Exn.reraise e "FUCKED"
      in
      let () = Stdio.print_endline "after" in
      let module Top = (val Toplevel.get_toplevel () : Toplevel.TOPLEVEL) in
      Top.main ()
  in

  let deinitialize (_userdata : unit ptr) (p_level : int) =
    Stdio.print_endline @@ "down: " ^ Base.Int.to_string p_level
  in

  Initialization.(initialization |-> initialize_f <-@ initialize);
  Initialization.(initialization |-> deinitialize_f <-@ deinitialize);

  1

let () =
  Stdlib.Callback.register "hello_extension_entry" hello_extension_entry;
  Dynlink.loadfile "/home/fizzixnerd/.opam/5.0.0+options/lib/utop/uTop.cma"
