open! Base
open Godotcaml_apis.Api_classes
open Living
open Living_ctypes.Default

module%gclass PlayerSprite = struct
  [%%ginherits AnimatedSprite2D]

  include Class.AnimatedSprite2D
  open Godotcaml_apis.Api_builtins

  let init x =
    Stdio.print_endline "init!!";
    x

  let%goverride_void _ready =
    [| ClassMethodFlags.virtual_ |]
      (module Class.AnimatedSprite2D)
      (module ApiTypes.Void)
      (fun _self -> Stdio.print_endline "_ready!")

  let%goverride_void _process =
    [| ClassMethodFlags.virtual_ |]
      (module BuiltinClass0.Float)
      (module Class.AnimatedSprite2D)
      (module ApiTypes.Void)
      (fun _delta _self -> ())
end
