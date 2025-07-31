open! Base
open Godotcaml_apis.Api_classes
open Living
open Living_ctypes.Default
module LCore = Living_core.Default

(* module%gclass PlayerSpriteFrames = struct
  [%%ginherits SpriteFrames]

  include Class.SpriteFrames
  open Godotcaml_apis.Api_builtins

  let%goverride_void _ready =
    [| ClassMethodFlags.virtual_ |]
      (module Class.SpriteFrames)
      (module ApiTypes.Void)
      (fun self ->
        let default = BuiltinClass.StringName.of_string "derp" in
        LCore.unsafe_free @@
        let* img = Class.Image.load_from_file "res://icon.svg" in
        let* texture = Class.ImageTexture.create_from_image img in
        let* () = self |> Class.SpriteFrames.add_animation default in
        let* () = self |> set_frame default 0L texture 1.0 in
        LCore.return ())

  let init self = LCore.return self
end *)

(* module%gclass PlayerCapsuleShape = struct
  [%%ginherits CapsuleShape2D]

  include Class.CapsuleShape2D

  let init self =
    let* () = self |> set_height 400.0 in
    let* () = self |> set_radius 100.0 in
    LCore.return self
end

module%gclass PlayerCollisionShape = struct
  [%%ginherits CollisionShape2D]

  include Class.CollisionShape2D
  open Godotcaml_apis.Gdforeign

  let init self =
    let* shape =
      LCore.map
        (coerce_ptr Class.CapsuleShape2D.typ)
        (PlayerCapsuleShape.new_ ())
    in
    let* () = self |> set_shape shape in
    LCore.return self
end
 *)
(* module%gclass PlayerSprite = struct
     [%%ginherits AnimatedSprite2D]

     include Class.AnimatedSprite2D
     open Godotcaml_apis.Gdforeign

     let init self =
       let* player_sprite_frames = LCore.map (coerce_ptr Class.SpriteFrames.typ) (PlayerSpriteFrames.new_ ()) in
       let* () = self |> set_sprite_frames player_sprite_frames in
       LCore.return self
   end
*)

(* Example usage of the signal *)

module%gclass Player3 = struct
  [%%ginherits AnimatedSprite2D]

  include Class.AnimatedSprite2D
  open Godotcaml_apis.Api_builtins

  let speed = 200.0

  let init self =
    Stdio.prerr_endline "Player3 init called!";
    LCore.return self

  let%gsignal teleport_to =
    [||] (module BuiltinClass.Float) (module BuiltinClass.Float)

  let teleport_to_signal () =
    let open Living_core.Default.Let_syntax in
    let open Godotcaml_apis.Gsignal in
    let open Godotcaml_apis.Gdforeign in
    let open Godotcaml_base.Godotcaml.C in
    let* teleport_to_sn = BuiltinClass.StringName.of_string "teleport_to" in
    LCore.return
      {
        name = teleport_to_sn;
        marshal =
          (fun (x, y) ->
            [
              coerce_ptr variant_ptr.const (LCore.unsafe_free
                (BuiltinClass.Float.ocaml_to_variant x));
              coerce_ptr variant_ptr.const (LCore.unsafe_free
                (BuiltinClass.Float.ocaml_to_variant y));
            ]);
      }

  let unmarshal xs = 
      match xs with
      | [x; y] ->
      LCore.unsafe_free @@    
      let open Living_core.Default.Let_syntax in
      let open Godotcaml_apis.Gdforeign in
      let open Godotcaml_base.Godotcaml.C in
      let to_ : variant_ptr structure Suite.const ptr -> variant_ptr structure ptr = coerce_ptr variant_ptr.plain in
      let* x = BuiltinClass.Float.ocaml_of_variant (to_ x) in
      let* y = BuiltinClass.Float.ocaml_of_variant (to_ y) in
      LCore.return (x, y)
      | _ -> failwith "Invalid number of arguments for unmarshal"


  let on_teleport_to x y =
    Stdio.prerr_endline "printing";
    Stdio.prerr_endline (Printf.sprintf "Teleporting to (%f, %f)\n" x y)

  let%goverride_void _ready =
    [| ClassMethodFlags.virtual_ |]
      (module Class.AnimatedSprite2D)
      (module ApiTypes.Void)
      (fun self ->
        LCore.unsafe_free
        @@
        let open Living_core.Default.Let_syntax in
        let* default_animation = BuiltinClass.StringName.of_string "default" in
        (* Set the sprite frames *)
        let%gcallable_void on_teleport_to =
          [||]
          (module BuiltinClass.Float)
          (module BuiltinClass.Float)
          (module ApiTypes.Void)
          (fun x y -> on_teleport_to x y)
        in
        let* teleport_to_signal' = teleport_to_signal () in
        let* _ =
          teleport_to_signal'
          |> Godotcaml_apis.Gsignal.connect self on_teleport_to
        in
        LCore.return ())

  let%goverride_void _process =
    [| ClassMethodFlags.virtual_ |]
      (module BuiltinClass.Float)
      (module Class.Node)
      (module ApiTypes.Void)
      (fun delta self ->
        LCore.unsafe_free
        @@
        let open Godotcaml_apis.Gdforeign in
        let open Living_core.Default.Let_syntax in
        let* teleport_to_signal' = teleport_to_signal () in

        let* _ = teleport_to_signal' |> Godotcaml_apis.Gsignal.emit self (0.0, 0.0) in

        let roundtrip = (1.0, 2.0) |> teleport_to_signal'.marshal |> unmarshal in
        Stdio.prerr_endline (Printf.sprintf "Roundtripped with (%f, %f)\n" (fst roundtrip) (snd roundtrip));

        (* Get input singleton *)
        let* input_name = string_name_of_string "Input" in
        let input = godot_get_singleton input_name Class.Input.typ in

        (* Get current position *)
        let* position = self |> get_position in
        let* delta_val = delta in
        let move_amount = speed *. delta_val in

        (* Simple movement *)
        let* is_w_pressed =
          input
          |> Class.Input.is_key_pressed (Int64.of_int GlobalEnum.Key._KEY_W)
        in
        let* position =
          if is_w_pressed then
            LCore.return
              (Gg.V2.v (Gg.V2.x position) (Gg.V2.y position -. move_amount))
          else LCore.return position
        in

        let* is_s_pressed =
          input
          |> Class.Input.is_key_pressed (Int64.of_int GlobalEnum.Key._KEY_S)
        in
        let* position =
          if is_s_pressed then
            LCore.return
              (Gg.V2.v (Gg.V2.x position) (Gg.V2.y position +. move_amount))
          else LCore.return position
        in

        let* is_a_pressed =
          input
          |> Class.Input.is_key_pressed (Int64.of_int GlobalEnum.Key._KEY_A)
        in
        let* position =
          if is_a_pressed then
            LCore.return
              (Gg.V2.v (Gg.V2.x position -. move_amount) (Gg.V2.y position))
          else LCore.return position
        in

        let* is_d_pressed =
          input
          |> Class.Input.is_key_pressed (Int64.of_int GlobalEnum.Key._KEY_D)
        in
        let* position =
          if is_d_pressed then
            LCore.return
              (Gg.V2.v (Gg.V2.x position +. move_amount) (Gg.V2.y position))
          else LCore.return position
        in

        let clamped_position =
          Gg.V2.v
            (Gg.V2.x position |> Base.Float.clamp_exn ~min:0.0 ~max:800.0)
            (Gg.V2.y position |> Base.Float.clamp_exn ~min:0.0 ~max:600.0)
        in

        let* () = self |> set_position clamped_position in
        LCore.return ())
end
