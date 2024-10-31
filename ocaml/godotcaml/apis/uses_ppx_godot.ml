open! Base
open Godotcaml_apis.Api_classes
open Living
open Living_ctypes.Default
open Living_core.Default.Let_syntax
module Lcore = Living_core.Default

module%gclass PlayerSpriteFrames = struct
  [%%ginherits SpriteFrames]

  include Class.SpriteFrames
  open Godotcaml_apis.Api_builtins

  let init self =
    let* img = Class.Image.load_from_file "res://icon.svg" in
    let* texture = Class.ImageTexture.create_from_image img in
    let* default = BuiltinClass.StringName.of_string "default" in
    let* () = self |> set_frame default 0L texture 1.0 in
    Lcore.return self
end

module%gclass PlayerCapsuleShape = struct
  [%%ginherits CapsuleShape2D]

  include Class.CapsuleShape2D

  let init self =
    let* () = self |> set_height 400.0 in
    let* () = self |> set_radius 100.0 in
    Lcore.return self
end

module%gclass PlayerCollisionShape = struct
  [%%ginherits CollisionShape2D]

  include Class.CollisionShape2D
  open Godotcaml_apis.Gdforeign

  let init self =
    let* shape =
      Lcore.map
        (coerce_ptr Class.CapsuleShape2D.typ)
        (PlayerCapsuleShape.new_ ())
    in
    let* () = self |> set_shape shape in
    Lcore.return self
end

module%gclass PlayerSprite = struct
  [%%ginherits AnimatedSprite2D]

  include Class.AnimatedSprite2D
  open Godotcaml_apis.Api_builtins

  let init self =
    Stdio.print_endline "init!!";
    let _player_sprite_frames = PlayerSpriteFrames.new_ () in
    let () = () in
    Lcore.return self

  let%goverride_void _ready =
    [| ClassMethodFlags.virtual_ |]
      (module Class.AnimatedSprite2D)
      (module ApiTypes.Void)
      (fun _self -> Stdio.print_endline "_ready!")

  let%goverride_void _process =
    [| ClassMethodFlags.virtual_ |]
      (module BuiltinClass.Float)
      (module Class.AnimatedSprite2D)
      (module ApiTypes.Void)
      (fun _delta _self -> ())
end
