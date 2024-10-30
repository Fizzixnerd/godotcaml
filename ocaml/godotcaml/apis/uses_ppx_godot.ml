open! Base
open Godotcaml_apis.Api_classes
open Living
open Living_ctypes.Default

let succ_by y x =
  let z = Int64.(x + y) in
  z

module%gclass MyClass = struct
  [%%ginherits Node]

  include Class.Node
  open Godotcaml_apis.Api_builtins

  let%gsignal my_signal = [||] (module BuiltinClass0.Int)

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

  let%goverride_void _process =
    [| ClassMethodFlags.virtual_ |]
      (module BuiltinClass0.Float)
      (module Class.Node)
      (module ApiTypes.Void)
      (fun _delta _self -> Stdio.print_endline "RAWR!!")
end
