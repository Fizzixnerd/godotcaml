open! Base
open! Godotcaml_api.Api_helpers
open Godotcaml_api.Api_classes
open Ctypes

module%gclass MyClass = struct
  [%%ginherits Node]

  include Class.Node
  open Godotcaml_api.Api_builtins

  let%gfunc succ =
    [| ClassMethodFlags.default |]
      (module BuiltinClass0.Int)
      (module Class.Node)
      (module BuiltinClass0.Int)
      (fun i _self -> Int64.(i + 1L))

  let%gfunc add =
    [| ClassMethodFlags.default |]
      (module BuiltinClass0.Int)
      (module BuiltinClass0.Int)
      (module Class.Node)
      (module BuiltinClass0.Int)
      (fun i j _self -> Stdio.print_endline "Bark!"; Int64.(i + j))

  let%gfunc_void _process =
      [| ClassMethodFlags.virtual_ |]
      (module BuiltinClass0.Float)
      (module Class.Node)
      (module ApiTypes.Void)
      (fun _x _self -> Stdio.print_endline "Rawr!")

end

(* let () =
   Topeval.init ();
   ignore @@ Topeval.execute_phrase true Stdlib.Format.std_formatter (Parser.toplevel_phrase Lexer.token (Lexing.from_string "print_endline \"Hello from space!\"")) *)
