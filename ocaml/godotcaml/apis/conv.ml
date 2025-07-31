open Gg
open! Base
open Living
module LCore = Living_core.Default
open Living_ctypes.Default
open Living_core.Default.Let_syntax
open Foreign_base
open Api_types.ApiTypes

module type CONV = sig
  type godot_t
  type ocaml_t

  val to_ocaml : godot_t -> ocaml_t LCore.t
  val of_ocaml : ocaml_t -> godot_t LCore.t
end

module Nil = struct
  type godot_t = Nil.t structure ptr
  type ocaml_t = unit

  let to_ocaml : Nil.t structure ptr -> unit LCore.t = fun _ -> LCore.return ()
  let of_ocaml () = LCore.return (coerce_ptr (ptr Nil.s) null)
end

module Bool = struct
  type godot_t = Bool.t structure ptr
  type ocaml_t = bool

  let to_ocaml : Bool.t structure ptr -> bool LCore.t =
   fun x ->
    let open Unsigned.UInt8 in
    let ret =
      let* p = !@(coerce_ptr (ptr uint8_t) x) in
      LCore.return (not (equal p (of_int 0)))
    in
    ret

  let of_ocaml : bool -> Bool.t structure ptr LCore.t =
   fun x ->
    let open Unsigned.UInt8 in
    let ret =
      let ret = gc_alloc ~count:1 Bool.s in
      let x' = if x then of_int 1 else of_int 0 in
      let* () = LCore.map (coerce_ptr (ptr uint8_t)) ret <-@ x' in
      ret
    in
    ret
end

module Int = struct
  type godot_t = Int.t structure ptr
  type ocaml_t = int64

  let to_ocaml : Int.t structure ptr -> int64 LCore.t =
   fun x -> !@(coerce_ptr (ptr int64_t) x)

  let of_ocaml : int64 -> Int.t structure ptr LCore.t =
   fun x ->
    let ret =
      let ret = gc_alloc ~count:1 Int.s in
      let* () = LCore.map (coerce_ptr (ptr int64_t)) ret <-@ x in
      ret
    in
    ret
end

module Float = struct
  type godot_t = Float.t structure ptr
  type ocaml_t = float

  let to_ocaml : Float.t structure ptr -> float LCore.t =
   fun x -> !@(coerce_ptr (ptr double) x)

  let of_ocaml : float -> Float.t structure ptr LCore.t =
   fun x ->
    let ret =
      let ret = gc_alloc ~count:1 Float.s in
      let* () = LCore.map (coerce_ptr (ptr double)) ret <-@ x in
      ret
    in
    ret
end

module String = struct
  open Godotcaml.C

  type godot_t = String.t structure ptr
  type ocaml_t = string

  let _of_string_name_constructor =
    lazy
      (coerce Godotcaml.C.PtrConstructor.t Godotcaml.C.ptr_constructor.typ
         (variant_get_ptr_constructor String.type_enum 2l))

  let _of_node_path_constructor =
    lazy
      (coerce Godotcaml.C.PtrConstructor.t Godotcaml.C.ptr_constructor.typ
         (variant_get_ptr_constructor String.type_enum 3l))

  let to_ocaml : String.t structure ptr -> string LCore.t =
   fun str_ptr ->
    let const_str = coerce_ptr string_ptr.const str_ptr in
    let len64 =
      string_to_utf8_chars const_str (coerce_ptr (ptr char) null) 0L
    in
    let len = Int64.to_int_exn len64 in
    let* char_buf = gc_alloc ~count:(len + 1) char in
    let _ = string_to_utf8_chars const_str char_buf len64 in
    let* _ = char_buf +@ len <-@ '\000' in

    LCore.named_return "String.to_ocaml" (string_from_ptr ~length:len char_buf)

  let of_ocaml : string -> String.t structure ptr LCore.t =
   fun s ->
    let* str_ptr = gc_alloc ~count:1 String.s in
    string_new_with_utf8_chars (coerce_ptr string_ptr.uninit str_ptr) s;
    LCore.named_return "String.of_ocaml" str_ptr

  let _of_constructor c ptr =
    let open Godotcaml_base.Godotcaml.C in
    let* s =
      Living_core.Default.map
        (coerce_ptr type_ptr.uninit)
        (gc_alloc ~count:1 String.s)
    in
    let* args = Gdforeign.foreign_array1 ptr in
    let () = Lazy.force c s args in
    to_ocaml (coerce_ptr String.typ s)

  let of_string_name : StringName.t structure ptr -> string LCore.t =
    _of_constructor _of_string_name_constructor

  let of_node_path : NodePath.t structure ptr -> string LCore.t =
    _of_constructor _of_node_path_constructor
end

module Vector2 = struct
  type godot_t = Vector2.t structure ptr
  type ocaml_t = v2

  let to_ocaml : Vector2.t structure ptr -> v2 LCore.t =
   fun x ->
    let float_ptr = coerce_ptr (ptr float) x in
    let pv1 = float_ptr in
    let* pv2 = float_ptr +@ 1 in
    let* v1 = !@pv1 in
    let* v2 = !@pv2 in
    LCore.return (V2.v v1 v2)

  let of_ocaml : v2 -> Vector2.t structure ptr LCore.t =
   fun v ->
    let ret = gc_alloc ~count:1 Vector2.s in
    let float_ptr = LCore.map (coerce_ptr (ptr float)) ret in
    let pv1 = float_ptr in
    let pv2 = float_ptr |> LCore.bind (fun x -> x +@ 1) in
    let* () = pv1 <-@ V2.x v in
    let* () = pv2 <-@ V2.y v in
    ret
end

module Vector2i = struct
  type godot_t = Vector2i.t structure ptr
  type ocaml_t = int32 * int32

  let to_ocaml : Vector2i.t structure ptr -> (int32 * int32) LCore.t =
   fun x ->
    let ret =
      let int32_ptr = coerce_ptr (ptr int32_t) x in
      let* v1 = !@int32_ptr in
      let* v2 = int32_ptr +@ 1 |> LCore.bind ( !@ ) in
      LCore.return (v1, v2)
    in
    ret

  let of_ocaml : int32 * int32 -> Vector2i.t structure ptr LCore.t =
   fun (x, y) ->
    let ret =
      let ret = gc_alloc ~count:1 Vector2i.s in
      let int32_ptr = LCore.map (coerce_ptr (ptr int32_t)) ret in
      let* () = int32_ptr <-@ x in
      let* pv2 = LCore.map (fun x -> x +@ 1) int32_ptr in
      let* () = pv2 <-@ y in
      ret
    in
    ret
end

module Rect2 = struct
  type godot_t = Rect2.t structure ptr
  type ocaml_t = v2 * size2

  let to_ocaml : Rect2.t structure ptr -> (v2 * size2) LCore.t =
   fun x ->
    let ret =
      let float_ptr = coerce_ptr (ptr double) x in
      let* v1 = !@float_ptr in
      let* v2 = float_ptr +@ 1 |> LCore.bind ( !@ ) in
      let* s1 = float_ptr +@ 2 |> LCore.bind ( !@ ) in
      let* s2 = float_ptr +@ 3 |> LCore.bind ( !@ ) in
      LCore.return (V2.v v1 v2, Size2.v s1 s2)
    in
    ret

  let of_ocaml : v2 * size2 -> Rect2.t structure ptr LCore.t =
   fun (v, s) ->
    let ret =
      let ret = gc_alloc ~count:1 Rect2.s in
      let float_ptr = LCore.map (coerce_ptr (ptr double)) ret in
      let* () = float_ptr <-@ V2.x v in
      let pv2 = float_ptr |> LCore.bind (fun x -> x +@ 1) in
      let* () = pv2 <-@ V2.y v in
      let ps1 = float_ptr |> LCore.bind (fun x -> x +@ 2) in
      let* () = ps1 <-@ V2.x s in
      let ps2 = float_ptr |> LCore.bind (fun x -> x +@ 3) in
      let* () = ps2 <-@ V2.y s in
      ret
    in
    ret
end

module Rect2i = struct
  type godot_t = Rect2i.t structure ptr
  type ocaml_t = (int32 * int32) * (int32 * int32)

  let to_ocaml :
      Rect2i.t structure ptr -> ((int32 * int32) * (int32 * int32)) LCore.t =
   fun x ->
    let ret =
      let int32_ptr = coerce_ptr (ptr int32_t) x in
      let* v1 = !@int32_ptr in
      let* v2 = int32_ptr +@ 1 |> LCore.bind ( !@ ) in
      let* s1 = int32_ptr +@ 2 |> LCore.bind ( !@ ) in
      let* s2 = int32_ptr +@ 3 |> LCore.bind ( !@ ) in
      LCore.return ((v1, v2), (s1, s2))
    in
    ret

  let of_ocaml :
      (int32 * int32) * (int32 * int32) -> Rect2i.t structure ptr LCore.t =
   fun ((x, y), (sx, sy)) ->
    let ret =
      let ret = gc_alloc ~count:1 Rect2i.s in
      let int32_ptr = LCore.map (coerce_ptr (ptr int32_t)) ret in
      let pv1 = int32_ptr in
      let pv2 = int32_ptr |> LCore.bind (fun x -> x +@ 1) in
      let ps1 = int32_ptr |> LCore.bind (fun x -> x +@ 2) in
      let ps2 = int32_ptr |> LCore.bind (fun x -> x +@ 3) in
      let* () = pv1 <-@ x in
      let* () = pv2 <-@ y in
      let* () = ps1 <-@ sx in
      let* () = ps2 <-@ sy in
      ret
    in
    ret
end

module Vector3 = struct
  type godot_t = Vector3.t structure ptr
  type ocaml_t = v3

  let to_ocaml : Vector3.t structure ptr -> v3 LCore.t =
   fun x ->
    let ret =
      let float_ptr = coerce_ptr (ptr double) x in
      let* v1 = !@float_ptr in
      let* v2 = float_ptr +@ 1 |> LCore.bind ( !@ ) in
      let* v3 = float_ptr +@ 2 |> LCore.bind ( !@ ) in
      LCore.return (V3.v v1 v2 v3)
    in
    ret

  let of_ocaml : v3 -> Vector3.t structure ptr LCore.t =
   fun v ->
    let ret =
      let ret = gc_alloc ~count:1 Vector3.s in
      let float_ptr = LCore.map (coerce_ptr (ptr double)) ret in
      let pv2 = float_ptr |> LCore.bind (fun x -> x +@ 1) in
      let pv3 = float_ptr |> LCore.bind (fun x -> x +@ 2) in
      let* () = float_ptr <-@ V3.x v in
      let* () = pv2 <-@ V3.y v in
      let* () = pv3 <-@ V3.z v in
      ret
    in
    ret
end

module Vector3i = struct
  type godot_t = Vector3i.t structure ptr
  type ocaml_t = int32 * int32 * int32

  let to_ocaml : Vector3i.t structure ptr -> (int32 * int32 * int32) LCore.t =
   fun x ->
    let ret =
      let int32_ptr = coerce_ptr (ptr int32_t) x in
      let* v1 = !@int32_ptr in
      let* v2 = int32_ptr +@ 1 |> LCore.bind ( !@ ) in
      let* v3 = int32_ptr +@ 2 |> LCore.bind ( !@ ) in
      LCore.return (v1, v2, v3)
    in
    ret

  let of_ocaml : int32 * int32 * int32 -> Vector3i.t structure ptr LCore.t =
   fun (x, y, z) ->
    let ret =
      let ret = gc_alloc ~count:1 Vector3i.s in
      let int32_ptr = LCore.map (coerce_ptr (ptr int32_t)) ret in
      let pv2 = int32_ptr |> LCore.bind (fun x -> x +@ 1) in
      let pv3 = int32_ptr |> LCore.bind (fun x -> x +@ 2) in
      let* () = int32_ptr <-@ x in
      let* () = pv2 <-@ y in
      let* () = pv3 <-@ z in
      ret
    in
    ret
end

module Transform2D = struct
  type godot_t = Transform2D.t structure ptr
  type ocaml_t = m2 * v2

  let to_ocaml : Transform2D.t structure ptr -> ocaml_t LCore.t =
   fun x ->
    let ret =
      let float_ptr = coerce_ptr (ptr double) x in
      let* m1 = !@float_ptr in
      let* m2 = float_ptr +@ 1 |> LCore.bind ( !@ ) in
      let* m3 = float_ptr +@ 2 |> LCore.bind ( !@ ) in
      let* m4 = float_ptr +@ 3 |> LCore.bind ( !@ ) in
      let* v1 = float_ptr +@ 4 |> LCore.bind ( !@ ) in
      let* v2 = float_ptr +@ 5 |> LCore.bind ( !@ ) in
      LCore.return (M2.v m1 m2 m3 m4, V2.v v1 v2)
    in
    ret

  let of_ocaml : ocaml_t -> Transform2D.t structure ptr LCore.t =
   fun (m, o) ->
    let ret =
      let ret = gc_alloc ~count:1 Transform2D.s in
      let float_ptr = LCore.map (coerce_ptr (ptr double)) ret in
      let pm2 = float_ptr |> LCore.bind (fun x -> x +@ 1) in
      let pm3 = float_ptr |> LCore.bind (fun x -> x +@ 2) in
      let pm4 = float_ptr |> LCore.bind (fun x -> x +@ 3) in
      let pv1 = float_ptr |> LCore.bind (fun x -> x +@ 4) in
      let pv2 = float_ptr |> LCore.bind (fun x -> x +@ 5) in
      let* () = float_ptr <-@ M2.e00 m in
      let* () = pm2 <-@ M2.e01 m in
      let* () = pm3 <-@ M2.e10 m in
      let* () = pm4 <-@ M2.e11 m in
      let* () = pv1 <-@ V2.x o in
      let* () = pv2 <-@ V2.y o in
      ret
    in
    ret
end

module Vector4 = struct
  type godot_t = Vector4.t structure ptr
  type ocaml_t = v4

  let to_ocaml : Vector4.t structure ptr -> v4 LCore.t =
   fun x ->
    let ret =
      let float_ptr = coerce_ptr (ptr double) x in
      let* v1 = !@float_ptr in
      let* v2 = float_ptr +@ 1 |> LCore.bind ( !@ ) in
      let* v3 = float_ptr +@ 2 |> LCore.bind ( !@ ) in
      let* v4 = float_ptr +@ 3 |> LCore.bind ( !@ ) in
      LCore.return (V4.v v1 v2 v3 v4)
    in
    ret

  let of_ocaml : v4 -> Vector4.t structure ptr LCore.t =
   fun v ->
    let ret =
      let ret = gc_alloc ~count:1 Vector4.s in
      let float_ptr = LCore.map (coerce_ptr (ptr double)) ret in
      let pv2 = float_ptr |> LCore.bind (fun x -> x +@ 1) in
      let pv3 = float_ptr |> LCore.bind (fun x -> x +@ 2) in
      let pv4 = float_ptr |> LCore.bind (fun x -> x +@ 3) in
      let* () = float_ptr <-@ V4.x v in
      let* () = pv2 <-@ V4.y v in
      let* () = pv3 <-@ V4.z v in
      let* () = pv4 <-@ V4.w v in
      ret
    in
    ret
end

module Vector4i = struct
  type godot_t = Vector4i.t structure ptr
  type ocaml_t = int32 * int32 * int32 * int32

  let to_ocaml :
      Vector4i.t structure ptr -> (int32 * int32 * int32 * int32) LCore.t =
   fun x ->
    let ret =
      let int32_ptr = coerce_ptr (ptr int32_t) x in
      let* v1 = !@int32_ptr in
      let* v2 = int32_ptr +@ 1 |> LCore.bind ( !@ ) in
      let* v3 = int32_ptr +@ 2 |> LCore.bind ( !@ ) in
      let* v4 = int32_ptr +@ 3 |> LCore.bind ( !@ ) in
      LCore.return (v1, v2, v3, v4)
    in
    ret

  let of_ocaml :
      int32 * int32 * int32 * int32 -> Vector4i.t structure ptr LCore.t =
   fun (x, y, z, w) ->
    let ret =
      let ret = gc_alloc ~count:1 Vector4i.s in
      let int32_ptr = LCore.map (coerce_ptr (ptr int32_t)) ret in
      let pv2 = int32_ptr |> LCore.bind (fun x -> x +@ 1) in
      let pv3 = int32_ptr |> LCore.bind (fun x -> x +@ 2) in
      let pv4 = int32_ptr |> LCore.bind (fun x -> x +@ 3) in

      let* () = int32_ptr <-@ x in
      let* () = pv2 <-@ y in
      let* () = pv3 <-@ z in
      let* () = pv4 <-@ w in
      ret
    in
    ret
end

module Plane = struct
  type godot_t = Plane.t structure ptr
  type ocaml_t = v3 * float

  let to_ocaml : Plane.t structure ptr -> (v3 * float) LCore.t =
   fun x ->
    let ret =
      let float_ptr = coerce_ptr (ptr double) x in
      let* v1 = !@float_ptr in
      let* v2 = float_ptr +@ 1 |> LCore.bind ( !@ ) in
      let* v3 = float_ptr +@ 2 |> LCore.bind ( !@ ) in
      let* d = float_ptr +@ 3 |> LCore.bind ( !@ ) in
      LCore.return (V3.v v1 v2 v3, d)
    in
    ret

  let of_ocaml : v3 * float -> Plane.t structure ptr LCore.t =
   fun (v, d) ->
    let ret =
      let ret = gc_alloc ~count:1 Plane.s in
      let float_ptr = LCore.map (coerce_ptr (ptr double)) ret in
      let pv2 = float_ptr |> LCore.bind (fun x -> x +@ 1) in
      let pv3 = float_ptr |> LCore.bind (fun x -> x +@ 2) in
      let pd = float_ptr |> LCore.bind (fun x -> x +@ 3) in
      let* () = float_ptr <-@ V3.x v in
      let* () = pv2 <-@ V3.y v in
      let* () = pv3 <-@ V3.z v in
      let* () = pd <-@ d in
      ret
    in
    ret
end

module Quaternion = struct
  type godot_t = Quaternion.t structure ptr
  type ocaml_t = quat

  let to_ocaml : Quaternion.t structure ptr -> quat LCore.t =
   fun x ->
    let ret =
      let float_ptr = coerce_ptr (ptr double) x in
      let* v1 = !@float_ptr in
      let* v2 = float_ptr +@ 1 |> LCore.bind ( !@ ) in
      let* v3 = float_ptr +@ 2 |> LCore.bind ( !@ ) in
      let* v4 = float_ptr +@ 3 |> LCore.bind ( !@ ) in
      LCore.return (Quat.v v1 v2 v3 v4)
    in
    ret

  let of_ocaml : quat -> Quaternion.t structure ptr LCore.t =
   fun q ->
    let ret =
      let ret = gc_alloc ~count:1 Quaternion.s in
      let float_ptr = LCore.map (coerce_ptr (ptr double)) ret in
      let pv2 = float_ptr |> LCore.bind (fun x -> x +@ 1) in
      let pv3 = float_ptr |> LCore.bind (fun x -> x +@ 2) in
      let pv4 = float_ptr |> LCore.bind (fun x -> x +@ 3) in
      let* () = float_ptr <-@ V4.x q in
      let* () = pv2 <-@ V4.y q in
      let* () = pv3 <-@ V4.z q in
      let* () = pv4 <-@ V4.w q in
      ret
    in
    ret
end

module AABB = struct
  type godot_t = AABB.t structure ptr
  type ocaml_t = v3 * size3

  let to_ocaml : AABB.t structure ptr -> (v3 * size3) LCore.t =
   fun x ->
    let ret =
      let float_ptr = coerce_ptr (ptr double) x in
      let* v1 = !@float_ptr in
      let* v2 = float_ptr +@ 1 |> LCore.bind ( !@ ) in
      let* v3 = float_ptr +@ 2 |> LCore.bind ( !@ ) in
      let* s1 = float_ptr +@ 3 |> LCore.bind ( !@ ) in
      let* s2 = float_ptr +@ 4 |> LCore.bind ( !@ ) in
      let* s3 = float_ptr +@ 5 |> LCore.bind ( !@ ) in
      LCore.return (V3.v v1 v2 v3, Size3.v s1 s2 s3)
    in
    ret

  let of_ocaml : v3 * size3 -> AABB.t structure ptr LCore.t =
   fun (v, s) ->
    let ret =
      let ret = gc_alloc ~count:1 AABB.s in
      let float_ptr = LCore.map (coerce_ptr (ptr double)) ret in
      let pv2 = float_ptr |> LCore.bind (fun x -> x +@ 1) in
      let pv3 = float_ptr |> LCore.bind (fun x -> x +@ 2) in
      let ps1 = float_ptr |> LCore.bind (fun x -> x +@ 3) in
      let ps2 = float_ptr |> LCore.bind (fun x -> x +@ 4) in
      let ps3 = float_ptr |> LCore.bind (fun x -> x +@ 5) in
      let* () = float_ptr <-@ V3.x v in
      let* () = pv2 <-@ V3.y v in
      let* () = pv3 <-@ V3.z v in
      let* () = ps1 <-@ V3.x s in
      let* () = ps2 <-@ V3.y s in
      let* () = ps3 <-@ V3.z s in
      ret
    in
    ret
end

module Basis = struct
  type godot_t = Basis.t structure ptr
  type ocaml_t = m3

  let to_ocaml : Basis.t structure ptr -> m3 LCore.t =
   fun x ->
    let ret =
      let float_ptr = coerce_ptr (ptr double) x in
      let* m1 = !@float_ptr in
      let* m2 = float_ptr +@ 1 |> LCore.bind ( !@ ) in
      let* m3 = float_ptr +@ 2 |> LCore.bind ( !@ ) in
      let* m4 = float_ptr +@ 3 |> LCore.bind ( !@ ) in
      let* m5 = float_ptr +@ 4 |> LCore.bind ( !@ ) in
      let* m6 = float_ptr +@ 5 |> LCore.bind ( !@ ) in
      let* m7 = float_ptr +@ 6 |> LCore.bind ( !@ ) in
      let* m8 = float_ptr +@ 7 |> LCore.bind ( !@ ) in
      let* m9 = float_ptr +@ 8 |> LCore.bind ( !@ ) in
      LCore.return (M3.v m1 m2 m3 m4 m5 m6 m7 m8 m9)
    in
    ret

  let of_ocaml : m3 -> Basis.t structure ptr LCore.t =
   fun m ->
    let ret =
      let ret = gc_alloc ~count:1 Basis.s in
      let float_ptr = LCore.map (coerce_ptr (ptr double)) ret in
      let pm2 = float_ptr |> LCore.bind (fun x -> x +@ 1) in
      let pm3 = float_ptr |> LCore.bind (fun x -> x +@ 2) in
      let pm4 = float_ptr |> LCore.bind (fun x -> x +@ 3) in
      let pm5 = float_ptr |> LCore.bind (fun x -> x +@ 4) in
      let pm6 = float_ptr |> LCore.bind (fun x -> x +@ 5) in
      let pm7 = float_ptr |> LCore.bind (fun x -> x +@ 6) in
      let pm8 = float_ptr |> LCore.bind (fun x -> x +@ 7) in
      let pm9 = float_ptr |> LCore.bind (fun x -> x +@ 8) in
      let* () = float_ptr <-@ M3.e00 m in
      let* () = pm2 <-@ M3.e01 m in
      let* () = pm3 <-@ M3.e02 m in
      let* () = pm4 <-@ M3.e10 m in
      let* () = pm5 <-@ M3.e11 m in
      let* () = pm6 <-@ M3.e12 m in
      let* () = pm7 <-@ M3.e20 m in
      let* () = pm8 <-@ M3.e21 m in
      let* () = pm9 <-@ M3.e22 m in
      ret
    in
    ret
end

module Transform3D = struct
  type godot_t = Transform3D.t structure ptr
  type ocaml_t = m3 * v3

  let to_ocaml : Transform3D.t structure ptr -> (m3 * v3) LCore.t =
   fun x ->
    let ret =
      let float_ptr = coerce_ptr (ptr double) x in
      let* m1 = !@float_ptr in
      let* m2 = float_ptr +@ 1 |> LCore.bind ( !@ ) in
      let* m3 = float_ptr +@ 2 |> LCore.bind ( !@ ) in
      let* m4 = float_ptr +@ 3 |> LCore.bind ( !@ ) in
      let* m5 = float_ptr +@ 4 |> LCore.bind ( !@ ) in
      let* m6 = float_ptr +@ 5 |> LCore.bind ( !@ ) in
      let* m7 = float_ptr +@ 6 |> LCore.bind ( !@ ) in
      let* m8 = float_ptr +@ 7 |> LCore.bind ( !@ ) in
      let* m9 = float_ptr +@ 8 |> LCore.bind ( !@ ) in
      let* v1 = float_ptr +@ 9 |> LCore.bind ( !@ ) in
      let* v2 = float_ptr +@ 10 |> LCore.bind ( !@ ) in
      let* v3 = float_ptr +@ 11 |> LCore.bind ( !@ ) in
      LCore.return (M3.v m1 m2 m3 m4 m5 m6 m7 m8 m9, V3.v v1 v2 v3)
    in
    ret

  let of_ocaml : m3 * v3 -> Transform3D.t structure ptr LCore.t =
   fun (m, o) ->
    let ret =
      let ret = gc_alloc ~count:1 Transform3D.s in
      let float_ptr = LCore.map (coerce_ptr (ptr double)) ret in
      let pm2 = float_ptr |> LCore.bind (fun x -> x +@ 1) in
      let pm3 = float_ptr |> LCore.bind (fun x -> x +@ 2) in
      let pm4 = float_ptr |> LCore.bind (fun x -> x +@ 3) in
      let pm5 = float_ptr |> LCore.bind (fun x -> x +@ 4) in
      let pm6 = float_ptr |> LCore.bind (fun x -> x +@ 5) in
      let pm7 = float_ptr |> LCore.bind (fun x -> x +@ 6) in
      let pm8 = float_ptr |> LCore.bind (fun x -> x +@ 7) in
      let pm9 = float_ptr |> LCore.bind (fun x -> x +@ 8) in
      let pv1 = float_ptr |> LCore.bind (fun x -> x +@ 9) in
      let pv2 = float_ptr |> LCore.bind (fun x -> x +@ 10) in
      let pv3 = float_ptr |> LCore.bind (fun x -> x +@ 11) in
      let* () = float_ptr <-@ M3.e00 m in
      let* () = pm2 <-@ M3.e01 m in
      let* () = pm3 <-@ M3.e02 m in
      let* () = pm4 <-@ M3.e10 m in
      let* () = pm5 <-@ M3.e11 m in
      let* () = pm6 <-@ M3.e12 m in
      let* () = pm7 <-@ M3.e20 m in
      let* () = pm8 <-@ M3.e21 m in
      let* () = pm9 <-@ M3.e22 m in
      let* () = pv1 <-@ V3.x o in
      let* () = pv2 <-@ V3.y o in
      let* () = pv3 <-@ V3.z o in
      ret
    in
    ret
end

module Projection = struct
  type godot_t = Projection.t structure ptr
  type ocaml_t = m4

  let to_ocaml : Projection.t structure ptr -> m4 LCore.t =
   fun x ->
    let ret =
      let float_ptr = coerce_ptr (ptr double) x in
      let* m1 = !@float_ptr in
      let* m2 = float_ptr +@ 1 |> LCore.bind ( !@ ) in
      let* m3 = float_ptr +@ 2 |> LCore.bind ( !@ ) in
      let* m4 = float_ptr +@ 3 |> LCore.bind ( !@ ) in
      let* m5 = float_ptr +@ 4 |> LCore.bind ( !@ ) in
      let* m6 = float_ptr +@ 5 |> LCore.bind ( !@ ) in
      let* m7 = float_ptr +@ 6 |> LCore.bind ( !@ ) in
      let* m8 = float_ptr +@ 7 |> LCore.bind ( !@ ) in
      let* m9 = float_ptr +@ 8 |> LCore.bind ( !@ ) in
      let* m10 = float_ptr +@ 9 |> LCore.bind ( !@ ) in
      let* m11 = float_ptr +@ 10 |> LCore.bind ( !@ ) in
      let* m12 = float_ptr +@ 11 |> LCore.bind ( !@ ) in
      let* m13 = float_ptr +@ 12 |> LCore.bind ( !@ ) in
      let* m14 = float_ptr +@ 13 |> LCore.bind ( !@ ) in
      let* m15 = float_ptr +@ 14 |> LCore.bind ( !@ ) in
      let* m16 = float_ptr +@ 15 |> LCore.bind ( !@ ) in
      LCore.return (M4.v m1 m2 m3 m4 m5 m6 m7 m8 m9 m10 m11 m12 m13 m14 m15 m16)
    in
    ret

  let of_ocaml : m4 -> Projection.t structure ptr LCore.t =
   fun m ->
    let ret =
      let ret = gc_alloc ~count:1 Projection.s in
      let float_ptr = LCore.map (coerce_ptr (ptr double)) ret in
      let pm2 = float_ptr |> LCore.bind (fun x -> x +@ 1) in
      let pm3 = float_ptr |> LCore.bind (fun x -> x +@ 2) in
      let pm4 = float_ptr |> LCore.bind (fun x -> x +@ 3) in
      let pm5 = float_ptr |> LCore.bind (fun x -> x +@ 4) in
      let pm6 = float_ptr |> LCore.bind (fun x -> x +@ 5) in
      let pm7 = float_ptr |> LCore.bind (fun x -> x +@ 6) in
      let pm8 = float_ptr |> LCore.bind (fun x -> x +@ 7) in
      let pm9 = float_ptr |> LCore.bind (fun x -> x +@ 8) in
      let pm10 = float_ptr |> LCore.bind (fun x -> x +@ 9) in
      let pm11 = float_ptr |> LCore.bind (fun x -> x +@ 10) in
      let pm12 = float_ptr |> LCore.bind (fun x -> x +@ 11) in
      let pm13 = float_ptr |> LCore.bind (fun x -> x +@ 12) in
      let pm14 = float_ptr |> LCore.bind (fun x -> x +@ 13) in
      let pm15 = float_ptr |> LCore.bind (fun x -> x +@ 14) in
      let pm16 = float_ptr |> LCore.bind (fun x -> x +@ 15) in
      let* () = float_ptr <-@ M4.e00 m in
      let* () = pm2 <-@ M4.e01 m in
      let* () = pm3 <-@ M4.e02 m in
      let* () = pm4 <-@ M4.e03 m in
      let* () = pm5 <-@ M4.e10 m in
      let* () = pm6 <-@ M4.e11 m in
      let* () = pm7 <-@ M4.e12 m in
      let* () = pm8 <-@ M4.e13 m in
      let* () = pm9 <-@ M4.e20 m in
      let* () = pm10 <-@ M4.e21 m in
      let* () = pm11 <-@ M4.e22 m in
      let* () = pm12 <-@ M4.e23 m in
      let* () = pm13 <-@ M4.e30 m in
      let* () = pm14 <-@ M4.e31 m in
      let* () = pm15 <-@ M4.e32 m in
      let* () = pm16 <-@ M4.e33 m in
      ret
    in
    ret
end

module Color = struct
  type godot_t = Color.t structure ptr
  type ocaml_t = color

  let to_ocaml : Color.t structure ptr -> color LCore.t =
   fun x ->
    let ret =
      let float_ptr = coerce_ptr (ptr float) x in
      let* c1 = !@float_ptr in
      let* c2 = float_ptr +@ 1 |> LCore.bind ( !@ ) in
      let* c3 = float_ptr +@ 2 |> LCore.bind ( !@ ) in
      let* c4 = float_ptr +@ 3 |> LCore.bind ( !@ ) in
      LCore.return (V4.v c1 c2 c3 c4)
    in
    ret

  let of_ocaml : color -> Color.t structure ptr LCore.t =
   fun c ->
    let ret =
      let ret = gc_alloc ~count:1 Color.s in
      let float_ptr = LCore.map (coerce_ptr (ptr float)) ret in
      let pc2 = float_ptr |> LCore.bind (fun x -> x +@ 1) in
      let pc3 = float_ptr |> LCore.bind (fun x -> x +@ 2) in
      let pc4 = float_ptr |> LCore.bind (fun x -> x +@ 3) in

      let* () = float_ptr <-@ V4.x c in
      let* () = pc2 <-@ V4.y c in
      let* () = pc3 <-@ V4.z c in
      let* () = pc4 <-@ V4.w c in
      ret
    in
    ret
end

module StringName = struct
  type godot_t = StringName.t structure ptr
  type ocaml_t = StringName.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t LCore.t = LCore.return x
  let of_ocaml (x : ocaml_t) : godot_t LCore.t = LCore.return x

  let _of_string_constructor =
    lazy
      (coerce Godotcaml.C.PtrConstructor.t Godotcaml.C.ptr_constructor.typ
         (variant_get_ptr_constructor StringName.type_enum 2l))

  let of_string =
   fun x ->
    let open Godotcaml_base.Godotcaml.C in
    let* sn =
      Living_core.Default.map
        (coerce_ptr type_ptr.uninit)
        (gc_alloc ~count:1 StringName.s)
    in
    let* str = String.of_ocaml x in
    let* args = Gdforeign.foreign_array1 str in
    let () = Lazy.force _of_string_constructor sn args in
    to_ocaml (coerce_ptr StringName.typ sn)
end

module NodePath = struct
  type godot_t = NodePath.t structure ptr
  type ocaml_t = NodePath.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t LCore.t = LCore.return x
  let of_ocaml (x : ocaml_t) : godot_t LCore.t = LCore.return x

  let _of_string_constructor =
    lazy
      (coerce Godotcaml.C.PtrConstructor.t Godotcaml.C.ptr_constructor.typ
         (variant_get_ptr_constructor NodePath.type_enum 2l))

  let of_string =
   fun x ->
    let open Godotcaml_base.Godotcaml.C in
    let* np =
      Living_core.Default.map
        (coerce_ptr type_ptr.uninit)
        (gc_alloc ~count:1 NodePath.s)
    in
    let* str = String.of_ocaml x in
    let* args = Gdforeign.foreign_array1 str in
    let () = Lazy.force _of_string_constructor np args in
    to_ocaml (coerce_ptr NodePath.typ np)
end

module RID = struct
  type godot_t = RID.t structure ptr
  type ocaml_t = RID.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t LCore.t = LCore.return x
  let of_ocaml (x : ocaml_t) : godot_t LCore.t = LCore.return x
end

module Object = struct
  open Godotcaml.C

  type godot_t = Object.t structure ptr
  type ocaml_t = Object.t structure ptr

  (* FIXME: This should set a property on the object probably. *)
  let _ocaml_referenced_objects = Hash_set.create (module Int64)

  let is_referenced_by_ocaml obj_ptr =
    let instance_id =
      Unsigned.UInt64.to_int64 (object_get_instance_id obj_ptr)
    in
    Hash_set.mem _ocaml_referenced_objects instance_id

  let set_is_referenced_by_ocaml is_reffed obj_ptr =
    let instance_id =
      Unsigned.UInt64.to_int64 (object_get_instance_id obj_ptr)
    in
    if is_reffed then Hash_set.add _ocaml_referenced_objects instance_id
    else Hash_set.remove _ocaml_referenced_objects instance_id

  let _refcounted_string_name () = string_name_of_string "RefCounted"

  let _refcounted_class_tag () =
    LCore.map classdb_get_class_tag (_refcounted_string_name ())

  let _reference_ocaml reference coerce_to_ref_counted
      (obj_ptr : Object.t structure ptr) =
    let ret =
      let* maybe_refcount_obj =
        LCore.map
          (fun tag -> object_cast_to (coerce_ptr object_ptr.plain obj_ptr) tag)
          (_refcounted_class_tag ())
      in
      let const_obj_ptr = coerce_ptr object_ptr.const obj_ptr in
      LCore.named_return "_reference_ocaml"
        (if
           (not (is_null maybe_refcount_obj))
           && not (is_referenced_by_ocaml const_obj_ptr)
         then
           let is_good = reference (coerce_to_ref_counted maybe_refcount_obj) in
           set_is_referenced_by_ocaml is_good const_obj_ptr)
    in
    LCore.unsafe_free ret

  let _unreference_ocaml unreference coerce_to_ref_counted
      (obj_ptr : Object.t structure ptr) =
    let ret =
      let* maybe_refcount_obj =
        LCore.map
          (fun tag -> object_cast_to (coerce_ptr object_ptr.plain obj_ptr) tag)
          (_refcounted_class_tag ())
      in
      let const_obj_ptr = coerce_ptr object_ptr.const obj_ptr in
      LCore.return
        (if
           (not (is_null maybe_refcount_obj))
           && is_referenced_by_ocaml const_obj_ptr
         then
           let is_good =
             unreference (coerce_to_ref_counted maybe_refcount_obj)
           in
           set_is_referenced_by_ocaml (not is_good) const_obj_ptr)
    in
    LCore.unsafe_free ret

  let reference _x = LCore.return false
  let unreference _x = LCore.return true
  let coerce_to_ref_counted x = x
  let to_ocaml (x : godot_t) : ocaml_t LCore.t = LCore.return x
  let of_ocaml (x : ocaml_t) : godot_t LCore.t = LCore.return x
end

module Callable = struct
  type godot_t = Callable.t structure ptr
  type ocaml_t = Callable.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t LCore.t = LCore.return x
  let of_ocaml (x : ocaml_t) : godot_t LCore.t = LCore.return x
end

module Signal = struct
  type godot_t = Signal.t structure ptr
  type ocaml_t = Signal.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t LCore.t = LCore.return x
  let of_ocaml (x : ocaml_t) : godot_t LCore.t = LCore.return x
end

module Dictionary = struct
  type godot_t = Dictionary.t structure ptr
  type ocaml_t = Dictionary.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t LCore.t = LCore.return x
  let of_ocaml (x : ocaml_t) : godot_t LCore.t = LCore.return x
end

module Array = struct
  type godot_t = Array.t structure ptr
  type ocaml_t = Array.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t LCore.t = LCore.return x
  let of_ocaml (x : ocaml_t) : godot_t LCore.t = LCore.return x
end

module PackedByteArray = struct
  type godot_t = PackedByteArray.t structure ptr
  type ocaml_t = PackedByteArray.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t LCore.t = LCore.return x
  let of_ocaml (x : ocaml_t) : godot_t LCore.t = LCore.return x
end

module PackedInt32Array = struct
  type godot_t = PackedInt32Array.t structure ptr
  type ocaml_t = PackedInt32Array.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t LCore.t = LCore.return x
  let of_ocaml (x : ocaml_t) : godot_t LCore.t = LCore.return x
end

module PackedInt64Array = struct
  type godot_t = PackedInt64Array.t structure ptr
  type ocaml_t = PackedInt64Array.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t LCore.t = LCore.return x
  let of_ocaml (x : ocaml_t) : godot_t LCore.t = LCore.return x
end

module PackedFloat32Array = struct
  type godot_t = PackedFloat32Array.t structure ptr
  type ocaml_t = PackedFloat32Array.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t LCore.t = LCore.return x
  let of_ocaml (x : ocaml_t) : godot_t LCore.t = LCore.return x
end

module PackedFloat64Array = struct
  type godot_t = PackedFloat64Array.t structure ptr
  type ocaml_t = PackedFloat64Array.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t LCore.t = LCore.return x
  let of_ocaml (x : ocaml_t) : godot_t LCore.t = LCore.return x
end

module PackedStringArray = struct
  type godot_t = PackedStringArray.t structure ptr
  type ocaml_t = PackedStringArray.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t LCore.t = LCore.return x
  let of_ocaml (x : ocaml_t) : godot_t LCore.t = LCore.return x
end

module PackedVector2Array = struct
  type godot_t = PackedVector2Array.t structure ptr
  type ocaml_t = PackedVector2Array.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t LCore.t = LCore.return x
  let of_ocaml (x : ocaml_t) : godot_t LCore.t = LCore.return x
end

module PackedVector3Array = struct
  type godot_t = PackedVector3Array.t structure ptr
  type ocaml_t = PackedVector3Array.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t LCore.t = LCore.return x
  let of_ocaml (x : ocaml_t) : godot_t LCore.t = LCore.return x
end

module PackedColorArray = struct
  type godot_t = PackedColorArray.t structure ptr
  type ocaml_t = PackedColorArray.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t LCore.t = LCore.return x
  let of_ocaml (x : ocaml_t) : godot_t LCore.t = LCore.return x
end

module PackedVector4Array = struct
  type godot_t = PackedVector4Array.t structure ptr
  type ocaml_t = PackedVector4Array.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t LCore.t = LCore.return x
  let of_ocaml (x : ocaml_t) : godot_t LCore.t = LCore.return x
end

module Variant = struct
  type godot_t = Variant.t structure ptr
  type ocaml_t = Godotcaml.C.variant_ptr structure ptr

  let to_ocaml (x : godot_t) : ocaml_t LCore.t =
    LCore.return (coerce_ptr Godotcaml.C.variant_ptr.plain x)

  let of_ocaml (x : ocaml_t) : godot_t LCore.t =
    LCore.return (coerce_ptr (ptr Variant.s) x)
end

module Void = struct
  type godot_t = unit
  type ocaml_t = unit

  let to_ocaml (x : godot_t) : ocaml_t LCore.t = LCore.return x
  let of_ocaml (x : ocaml_t) : godot_t LCore.t = LCore.return x
end
