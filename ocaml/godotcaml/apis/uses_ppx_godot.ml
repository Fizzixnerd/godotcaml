open! Base
open Godotcaml_api.Api_classes.Class

module%gclass MyClass = struct
  [%%ginherits Node]

  include Node
end

let () =
  Stdio.printf "%s\n" MyClass._godot_inherits;
  Stdio.printf "%s\n" MyClass._godot_class_name
