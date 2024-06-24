open! Base
open! Godotcaml_api.Api_helpers
open Godotcaml_api.Api_classes
open Ctypes

module%gclass MyClass = struct
  [%%ginherits Node]

  include Class.Node
  open Godotcaml_api.Api_builtins

  let%gfunc f = gfunc1 (module BuiltinClass0.Int) (module Class.Node) (module BuiltinClass0.Int) (fun i _self -> Stdio.print_endline "rawr"; Stdio.Out_channel.flush Stdio.stdout; Int64.(i + 1L))

end

let () =
  Stdio.printf "%s\n" MyClass._godot_inherits;
  Stdio.printf "%s\n" MyClass._godot_class_name
