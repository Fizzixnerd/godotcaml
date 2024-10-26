open! Base
open! Godotcaml_apis.Api_helpers
open Godotcaml_apis.Api_classes
open Living
open Living_ctypes.Default
open Godotcaml_apis.Gsignal

let () =
  Stdio.print_endline "rawr-1!";
  Stdlib.Gc.compact ()

let succ_by y x =
  let z = Int64.(x + y) in
  z

module%gclass MyClass = struct
  [%%ginherits Node]

  include Class.Node
  open Godotcaml_apis.Api_builtins

  let%gfunc succ_by =
    [| ClassMethodFlags.default |]
      (module BuiltinClass0.Int)
      (module Class.Node)
      (module BuiltinClass0.Callable)
      (fun i _self ->
        let%gcallable succer =
          gcallable
            (module BuiltinClass0.Int)
            (module BuiltinClass0.Int)
            (succ_by i)
        in
        succer)

  let%gfunc_void _process =
    [| ClassMethodFlags.virtual_ |]
      (module BuiltinClass0.Float)
      (module Class.Node)
      (module ApiTypes.Void)
      (fun _x _self -> Stdio.print_endline "Rawr!")
end

let () =
  Stdio.print_endline "rawr2!";
  Stdlib.Gc.compact ()

(* let () =
   Topeval.init ();
   ignore @@ Topeval.execute_phrase true Stdlib.Format.std_formatter (Parser.toplevel_phrase Lexer.token (Lexing.from_string "print_endline \"Hello from space!\"")) *)
