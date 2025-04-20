open! Base
open Godotcaml_apis.Api_classes
open Living
open Living_ctypes.Default
open Living_core.Default.Let_syntax
module Lcore = Living_core.Default

(* module%gclass PlayerSpriteFrames = struct
     [%%ginherits SpriteFrames]

     include Class.SpriteFrames
     open Godotcaml_apis.Api_builtins

     let init self =
       let* img = Class.Image.load_from_file "res://icon.svg" in
       let* texture = Class.ImageTexture.create_from_image img in
       let* default = BuiltinClass.StringName.of_string "derp" in
       let* () = self |> Class.SpriteFrames.add_animation default in
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
*)
(* module%gclass PlayerSprite = struct
     [%%ginherits AnimatedSprite2D]

     include Class.AnimatedSprite2D
     open Godotcaml_apis.Gdforeign

     let init self =
       let* player_sprite_frames = Lcore.map (coerce_ptr Class.SpriteFrames.typ) (PlayerSpriteFrames.new_ ()) in
       let* () = self |> set_sprite_frames player_sprite_frames in
       Lcore.return self
   end
*)
module%gclass Player = struct
  [%%ginherits Area2D]

  include Class.Area2D
  open Godotcaml_apis.Api_builtins

  let speed = 400.0

  (* (** Note: this stores one screen_rect, no matter how many players you instantiate! *)
     let screen_rect = ref ((Gg.V2.v 100.0 100.0), Gg.Size2.v 100.0 100.0)

     let store_screen_rect self =
       let* rect = self |> get_viewport_rect in
       Lcore.return (screen_rect := rect)
  *)
  let init self = Lcore.return self

  (* let* player_sprite =
       Lcore.map (coerce_ptr Class.AnimatedSprite2D.typ) (PlayerSprite.new_ ())
     in
     let* default = BuiltinClass.StringName.of_string "derp" in
     let* () = player_sprite |> Class.AnimatedSprite2D.play default 0.0 true in
     let* () = self |> add_child player_sprite false 0L in
     Lcore.return self
  *)
  (* let%goverride_void _ready =
     [| ClassMethodFlags.virtual_ |]
       (module Class.AnimatedSprite2D)
       (module ApiTypes.Void)
       (fun self -> Lcore.unsafe_free @@ hide self)
  *)
  let%goverride_void _process =
    [| ClassMethodFlags.virtual_ |]
      (module BuiltinClass.Float)
      (module Class.Area2D)
      (module ApiTypes.Void)
      (fun delta self ->
        let open Godotcaml_apis.Gdforeign in
        Lcore.unsafe_free
        @@

(*         let back_and_forth = BuiltinClass.String.of_string_name (BuiltinClass.StringName.of_string "Hello!") in
        Stdio.prerr_endline back_and_forth;
 *)
        let* input_name = string_name_of_string "Input" in
        let input = godot_get_singleton input_name Class.Input.typ in

        let vel = ref Gg.V2.zero in

        let* is_w_pressed =
          input
          |> Class.Input.is_key_pressed (Int64.of_int GlobalEnum.Key._KEY_W)
        in
        (if is_w_pressed then vel := Gg.V2.(!vel + v 0.0 (-1.0)));

        let* is_s_pressed =
          input
          |> Class.Input.is_key_pressed (Int64.of_int GlobalEnum.Key._KEY_S)
        in
        (if is_s_pressed then vel := Gg.V2.(!vel + v 0.0 1.0));

        let* is_a_pressed =
          input
          |> Class.Input.is_key_pressed (Int64.of_int GlobalEnum.Key._KEY_A)
        in
        (if is_a_pressed then vel := Gg.V2.(!vel + v (-1.0) 0.0));

        let* is_d_pressed =
          input
          |> Class.Input.is_key_pressed (Int64.of_int GlobalEnum.Key._KEY_D)
        in
        (if is_d_pressed then vel := Gg.V2.(!vel + v 1.0 0.0));

        (* finalize the velocity with the speed *)
        (vel := Gg.V2.(speed * !vel / (norm !vel +. 0.001)));

        let sprite_path = BuiltinClass.NodePath.of_string "PlayerSprite" in
        let* sprite = self |> get_node sprite_path in

        let animation_name = BuiltinClass.String.of_string_name (BuiltinClass.StringName.of_string "Rawr") in
        Stdio.prerr_endline animation_name;
        let animation_name = BuiltinClass.StringName.of_string animation_name in
        let* () =
          sprite |> Class.AnimatedSprite2D.set_animation animation_name
        in
        let* () =
          sprite |> Class.AnimatedSprite2D.play animation_name 1.0 false
        in

        let* position = self |> get_position in
        let position = Gg.V2.(position + (delta * !vel)) in
        let* () = self |> set_position position in

        Lcore.return ())
end
