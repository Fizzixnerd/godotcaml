open! Base

module M : Toplevel.TOPLEVEL = struct
  let main () = Stdio.print_endline "rawr"
end

let () = Toplevel.toplevel := Some (module M : Toplevel.TOPLEVEL)
