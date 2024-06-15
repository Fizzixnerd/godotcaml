open! Base

module type TOPLEVEL = sig
  val main : unit -> unit
end

let toplevel = ref None

let get_toplevel () : (module TOPLEVEL) =
  match !toplevel with
  | None ->
      Stdio.print_endline "rawr0";
      assert false
  | Some t -> t
