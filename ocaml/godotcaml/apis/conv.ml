open Gg
open! Base
open Ctypes
open Foreign_base
open Foreign_api
open Api_types.ApiTypes

module type CONV = sig
  type godot_t
  type ocaml_t

  val to_ocaml : godot_t -> ocaml_t
  val of_ocaml : ocaml_t -> godot_t
end

module Nil = struct
  type godot_t = Nil.t structure ptr
  type ocaml_t = unit

  let to_ocaml : Nil.t structure ptr -> unit = fun _ -> ()
  let of_ocaml () = coerce_ptr (ptr Nil.s) null
end

module Bool = struct
  type godot_t = Bool.t structure ptr
  type ocaml_t = bool

  let to_ocaml : Bool.t structure ptr -> bool =
   fun x ->
    let open Unsigned.UInt8 in
    not (equal !@(coerce_ptr (ptr uint8_t) x) (of_int 0))

  let of_ocaml : bool -> Bool.t structure ptr =
   fun x ->
    let open Unsigned.UInt8 in
    let ret = gc_alloc ~count:1 Bool.s in
    let x' = if x then of_int 1 else of_int 0 in
    let () = coerce_ptr (ptr uint8_t) ret <-@ x' in
    ret
end

module Int = struct
  type godot_t = Int.t structure ptr
  type ocaml_t = int64

  let to_ocaml : Int.t structure ptr -> int64 =
   fun x -> !@(coerce_ptr (ptr int64_t) x)

  let of_ocaml : int64 -> Int.t structure ptr =
   fun x ->
    let ret = gc_alloc ~count:1 Int.s in
    let () = coerce_ptr (ptr int64_t) ret <-@ x in
    ret
end

module Float = struct
  type godot_t = Float.t structure ptr
  type ocaml_t = float

  let to_ocaml : Float.t structure ptr -> float =
   fun x -> !@(coerce_ptr (ptr double) x)

  let of_ocaml : float -> Float.t structure ptr =
   fun x ->
    let ret = gc_alloc ~count:1 Float.s in
    let () = coerce_ptr (ptr double) ret <-@ x in
    ret
end

module String = struct
  open Foreign_api.Make (Api_types.ClassSizes)
  open Godotcaml.C

  type godot_t = String.t structure ptr
  type ocaml_t = string

  let to_ocaml : String.t structure ptr -> string =
   fun str_ptr ->
    let const_str = coerce_ptr string_ptr.const str_ptr in
    let len =
      Int64.to_int_exn
      @@ string_to_utf8_chars const_str (coerce_ptr (ptr char) null) 0L
    in
    let char_buf = allocate_n ~count:(len + 1) char in
    let _ =
      string_to_utf8_chars const_str char_buf (Int64.of_int @@ (len + 1))
    in
    string_from_ptr char_buf ~length:len

  let of_ocaml : string -> String.t structure ptr =
   fun s ->
    let str_ptr = gc_alloc ~count:1 String.s in
    let () =
      string_new_with_utf8_chars (coerce_ptr string_ptr.uninit str_ptr) s
    in
    str_ptr
end

module Vector2 = struct
  type godot_t = Vector2.t structure ptr
  type ocaml_t = v2

  let to_ocaml : Vector2.t structure ptr -> v2 =
   fun x ->
    let float_ptr = coerce_ptr (ptr double) x in
    V2.v !@float_ptr !@(float_ptr +@ 1)

  let of_ocaml : v2 -> Vector2.t structure ptr =
   fun v ->
    let ret = gc_alloc ~count:1 Vector2.s in
    let float_ptr = coerce_ptr (ptr double) ret in
    let () = float_ptr <-@ V2.x v in
    let () = float_ptr +@ 1 <-@ V2.y v in
    ret
end

module Vector2i = struct
  type godot_t = Vector2i.t structure ptr
  type ocaml_t = int32 * int32

  let to_ocaml : Vector2i.t structure ptr -> int32 * int32 =
   fun x ->
    let int32_ptr = coerce_ptr (ptr int32_t) x in
    (!@int32_ptr, !@(int32_ptr +@ 1))

  let of_ocaml : int32 * int32 -> Vector2i.t structure ptr =
   fun (x, y) ->
    let ret = gc_alloc ~count:1 Vector2i.s in
    let int32_ptr = coerce_ptr (ptr int32_t) ret in
    let () = int32_ptr <-@ x in
    let () = int32_ptr +@ 1 <-@ y in
    ret
end

module Rect2 = struct
  type godot_t = Rect2.t structure ptr
  type ocaml_t = v2 * size2

  let to_ocaml : Rect2.t structure ptr -> v2 * size2 =
   fun x ->
    let float_ptr = coerce_ptr (ptr double) x in
    ( V2.v !@float_ptr !@(float_ptr +@ 1),
      Size2.v !@(float_ptr +@ 2) !@(float_ptr +@ 3) )

  let of_ocaml : v2 * size2 -> Rect2.t structure ptr =
   fun (v, s) ->
    let ret = gc_alloc ~count:1 Rect2.s in
    let float_ptr = coerce_ptr (ptr double) ret in
    let () = float_ptr <-@ V2.x v in
    let () = float_ptr +@ 1 <-@ V2.y v in
    let () = float_ptr +@ 2 <-@ V2.x s in
    let () = float_ptr +@ 3 <-@ V2.y s in
    ret
end

module Rect2i = struct
  type godot_t = Rect2i.t structure ptr
  type ocaml_t = (int32 * int32) * (int32 * int32)

  let to_ocaml : Rect2i.t structure ptr -> (int32 * int32) * (int32 * int32) =
   fun x ->
    let int32_ptr = coerce_ptr (ptr int32_t) x in
    ((!@int32_ptr, !@(int32_ptr +@ 1)), (!@(int32_ptr +@ 2), !@(int32_ptr +@ 3)))

  let of_ocaml : (int32 * int32) * (int32 * int32) -> Rect2i.t structure ptr =
   fun ((x, y), (sx, sy)) ->
    let ret = gc_alloc ~count:1 Rect2i.s in
    let int32_ptr = coerce_ptr (ptr int32_t) ret in
    let () = int32_ptr <-@ x in
    let () = int32_ptr +@ 1 <-@ y in
    let () = int32_ptr +@ 2 <-@ sx in
    let () = int32_ptr +@ 3 <-@ sy in
    ret
end

module Vector3 = struct
  type godot_t = Vector3.t structure ptr
  type ocaml_t = v3

  let to_ocaml : Vector3.t structure ptr -> v3 =
   fun x ->
    let float_ptr = coerce_ptr (ptr double) x in
    V3.v !@float_ptr !@(float_ptr +@ 1) !@(float_ptr +@ 2)

  let of_ocaml : v3 -> Vector3.t structure ptr =
   fun v ->
    let ret = gc_alloc ~count:1 Vector3.s in
    let float_ptr = coerce_ptr (ptr double) ret in
    let () = float_ptr <-@ V3.x v in
    let () = float_ptr +@ 1 <-@ V3.y v in
    let () = float_ptr +@ 2 <-@ V3.z v in
    ret
end

module Vector3i = struct
  type godot_t = Vector3i.t structure ptr
  type ocaml_t = int32 * int32 * int32

  let to_ocaml : Vector3i.t structure ptr -> int32 * int32 * int32 =
   fun x ->
    let int32_ptr = coerce_ptr (ptr int32_t) x in
    (!@int32_ptr, !@(int32_ptr +@ 1), !@(int32_ptr +@ 2))

  let of_ocaml : int32 * int32 * int32 -> Vector3i.t structure ptr =
   fun (x, y, z) ->
    let ret = gc_alloc ~count:1 Vector3i.s in
    let int32_ptr = coerce_ptr (ptr int32_t) ret in
    let () = int32_ptr <-@ x in
    let () = int32_ptr +@ 1 <-@ y in
    let () = int32_ptr +@ 2 <-@ z in
    ret
end

module Transform2D = struct
  type godot_t = Transform2D.t structure ptr
  type ocaml_t = m2 * v2

  let to_ocaml : Transform2D.t structure ptr -> ocaml_t =
   fun x ->
    let float_ptr = coerce_ptr (ptr double) x in
    ( M2.v !@float_ptr !@(float_ptr +@ 1) !@(float_ptr +@ 2) !@(float_ptr +@ 3),
      V2.v !@(float_ptr +@ 4) !@(float_ptr +@ 5) )

  let of_ocaml : ocaml_t -> Transform2D.t structure ptr =
   fun (m, o) ->
    let ret = gc_alloc ~count:1 Transform2D.s in
    let float_ptr = coerce_ptr (ptr double) ret in
    let () = float_ptr <-@ M2.e00 m in
    let () = float_ptr +@ 1 <-@ M2.e01 m in
    let () = float_ptr +@ 2 <-@ M2.e10 m in
    let () = float_ptr +@ 3 <-@ M2.e11 m in
    let () = float_ptr +@ 4 <-@ V2.x o in
    let () = float_ptr +@ 5 <-@ V2.y o in
    ret
end

module Vector4 = struct
  type godot_t = Vector4.t structure ptr
  type ocaml_t = v4

  let to_ocaml : Vector4.t structure ptr -> v4 =
   fun x ->
    let float_ptr = coerce_ptr (ptr double) x in
    V4.v !@float_ptr !@(float_ptr +@ 1) !@(float_ptr +@ 2) !@(float_ptr +@ 3)

  let of_ocaml : v4 -> Vector4.t structure ptr =
   fun v ->
    let ret = gc_alloc ~count:1 Vector4.s in
    let float_ptr = coerce_ptr (ptr double) ret in
    let () = float_ptr <-@ V4.x v in
    let () = float_ptr +@ 1 <-@ V4.y v in
    let () = float_ptr +@ 2 <-@ V4.z v in
    let () = float_ptr +@ 3 <-@ V4.w v in
    ret
end

module Vector4i = struct
  type godot_t = Vector4i.t structure ptr
  type ocaml_t = int32 * int32 * int32 * int32

  let to_ocaml : Vector4i.t structure ptr -> int32 * int32 * int32 * int32 =
   fun x ->
    let int32_ptr = coerce_ptr (ptr int32_t) x in
    (!@int32_ptr, !@(int32_ptr +@ 1), !@(int32_ptr +@ 2), !@(int32_ptr +@ 3))

  let of_ocaml : int32 * int32 * int32 * int32 -> Vector4i.t structure ptr =
   fun (x, y, z, w) ->
    let ret = gc_alloc ~count:1 Vector4i.s in
    let int32_ptr = coerce_ptr (ptr int32_t) ret in
    let () = int32_ptr <-@ x in
    let () = int32_ptr +@ 1 <-@ y in
    let () = int32_ptr +@ 2 <-@ z in
    let () = int32_ptr +@ 3 <-@ w in
    ret
end

module Plane = struct
  type godot_t = Plane.t structure ptr
  type ocaml_t = v3 * float

  let to_ocaml : Plane.t structure ptr -> v3 * float =
   fun x ->
    let float_ptr = coerce_ptr (ptr double) x in
    (V3.v !@float_ptr !@(float_ptr +@ 1) !@(float_ptr +@ 2), !@(float_ptr +@ 3))

  let of_ocaml : v3 * float -> Plane.t structure ptr =
   fun (v, d) ->
    let ret = gc_alloc ~count:1 Plane.s in
    let float_ptr = coerce_ptr (ptr double) ret in
    let () = float_ptr <-@ V3.x v in
    let () = float_ptr +@ 1 <-@ V3.y v in
    let () = float_ptr +@ 2 <-@ V3.z v in
    let () = float_ptr +@ 3 <-@ d in
    ret
end

module Quaternion = struct
  type godot_t = Quaternion.t structure ptr
  type ocaml_t = quat

  let to_ocaml : Quaternion.t structure ptr -> quat =
   fun x ->
    let float_ptr = coerce_ptr (ptr double) x in
    Quat.v !@float_ptr !@(float_ptr +@ 1) !@(float_ptr +@ 2) !@(float_ptr +@ 3)

  let of_ocaml : quat -> Quaternion.t structure ptr =
   fun q ->
    let ret = gc_alloc ~count:1 Quaternion.s in
    let float_ptr = coerce_ptr (ptr double) ret in
    let () = float_ptr <-@ V4.x q in
    let () = float_ptr +@ 1 <-@ V4.y q in
    let () = float_ptr +@ 2 <-@ V4.z q in
    let () = float_ptr +@ 3 <-@ V4.w q in
    ret
end

module AABB = struct
  type godot_t = AABB.t structure ptr
  type ocaml_t = v3 * size3

  let to_ocaml : AABB.t structure ptr -> v3 * size3 =
   fun x ->
    let float_ptr = coerce_ptr (ptr double) x in
    ( V3.v !@float_ptr !@(float_ptr +@ 1) !@(float_ptr +@ 2),
      Size3.v !@(float_ptr +@ 3) !@(float_ptr +@ 4) !@(float_ptr +@ 5) )

  let of_ocaml : v3 * size3 -> AABB.t structure ptr =
   fun (v, s) ->
    let ret = gc_alloc ~count:1 AABB.s in
    let float_ptr = coerce_ptr (ptr double) ret in
    let () = float_ptr <-@ V3.x v in
    let () = float_ptr +@ 1 <-@ V3.y v in
    let () = float_ptr +@ 2 <-@ V3.z v in
    let () = float_ptr +@ 3 <-@ V3.x s in
    let () = float_ptr +@ 4 <-@ V3.y s in
    let () = float_ptr +@ 5 <-@ V3.z s in
    ret
end

module Basis = struct
  type godot_t = Basis.t structure ptr
  type ocaml_t = m3

  let to_ocaml : Basis.t structure ptr -> m3 =
   fun x ->
    let float_ptr = coerce_ptr (ptr double) x in
    M3.v !@float_ptr
      !@(float_ptr +@ 1)
      !@(float_ptr +@ 2)
      !@(float_ptr +@ 3)
      !@(float_ptr +@ 4)
      !@(float_ptr +@ 5)
      !@(float_ptr +@ 6)
      !@(float_ptr +@ 7)
      !@(float_ptr +@ 8)

  let of_ocaml : m3 -> Basis.t structure ptr =
   fun m ->
    let ret = gc_alloc ~count:1 Basis.s in
    let float_ptr = coerce_ptr (ptr double) ret in
    let () = float_ptr <-@ M3.e00 m in
    let () = float_ptr +@ 1 <-@ M3.e01 m in
    let () = float_ptr +@ 2 <-@ M3.e02 m in
    let () = float_ptr +@ 3 <-@ M3.e10 m in
    let () = float_ptr +@ 4 <-@ M3.e11 m in
    let () = float_ptr +@ 5 <-@ M3.e12 m in
    let () = float_ptr +@ 6 <-@ M3.e20 m in
    let () = float_ptr +@ 7 <-@ M3.e21 m in
    let () = float_ptr +@ 8 <-@ M3.e22 m in
    ret
end

module Transform3D = struct
  type godot_t = Transform3D.t structure ptr
  type ocaml_t = m3 * v3

  let to_ocaml : Transform3D.t structure ptr -> m3 * v3 =
   fun x ->
    let float_ptr = coerce_ptr (ptr double) x in
    ( M3.v !@float_ptr
        !@(float_ptr +@ 1)
        !@(float_ptr +@ 2)
        !@(float_ptr +@ 3)
        !@(float_ptr +@ 4)
        !@(float_ptr +@ 5)
        !@(float_ptr +@ 6)
        !@(float_ptr +@ 7)
        !@(float_ptr +@ 8),
      V3.v !@(float_ptr +@ 9) !@(float_ptr +@ 10) !@(float_ptr +@ 11) )

  let of_ocaml : m3 * v3 -> Transform3D.t structure ptr =
   fun (m, o) ->
    let ret = gc_alloc ~count:1 Transform3D.s in
    let float_ptr = coerce_ptr (ptr double) ret in
    let () = float_ptr <-@ M3.e00 m in
    let () = float_ptr +@ 1 <-@ M3.e01 m in
    let () = float_ptr +@ 2 <-@ M3.e02 m in
    let () = float_ptr +@ 3 <-@ M3.e10 m in
    let () = float_ptr +@ 4 <-@ M3.e11 m in
    let () = float_ptr +@ 5 <-@ M3.e12 m in
    let () = float_ptr +@ 6 <-@ M3.e20 m in
    let () = float_ptr +@ 7 <-@ M3.e21 m in
    let () = float_ptr +@ 8 <-@ M3.e22 m in
    let () = float_ptr +@ 9 <-@ V3.x o in
    let () = float_ptr +@ 10 <-@ V3.y o in
    let () = float_ptr +@ 11 <-@ V3.z o in
    ret
end

module Projection = struct
  type godot_t = Projection.t structure ptr
  type ocaml_t = m4

  let to_ocaml : Projection.t structure ptr -> m4 =
   fun x ->
    let float_ptr = coerce_ptr (ptr double) x in
    M4.v !@float_ptr
      !@(float_ptr +@ 1)
      !@(float_ptr +@ 2)
      !@(float_ptr +@ 3)
      !@(float_ptr +@ 4)
      !@(float_ptr +@ 5)
      !@(float_ptr +@ 6)
      !@(float_ptr +@ 7)
      !@(float_ptr +@ 8)
      !@(float_ptr +@ 9)
      !@(float_ptr +@ 10)
      !@(float_ptr +@ 11)
      !@(float_ptr +@ 12)
      !@(float_ptr +@ 13)
      !@(float_ptr +@ 14)
      !@(float_ptr +@ 15)

  let of_ocaml : m4 -> Projection.t structure ptr =
   fun m ->
    let ret = gc_alloc ~count:1 Projection.s in
    let float_ptr = coerce_ptr (ptr double) ret in
    let () = float_ptr <-@ M4.e00 m in
    let () = float_ptr +@ 1 <-@ M4.e01 m in
    let () = float_ptr +@ 2 <-@ M4.e02 m in
    let () = float_ptr +@ 3 <-@ M4.e03 m in
    let () = float_ptr +@ 4 <-@ M4.e10 m in
    let () = float_ptr +@ 5 <-@ M4.e11 m in
    let () = float_ptr +@ 6 <-@ M4.e12 m in
    let () = float_ptr +@ 7 <-@ M4.e13 m in
    let () = float_ptr +@ 8 <-@ M4.e20 m in
    let () = float_ptr +@ 9 <-@ M4.e21 m in
    let () = float_ptr +@ 10 <-@ M4.e22 m in
    let () = float_ptr +@ 11 <-@ M4.e23 m in
    let () = float_ptr +@ 12 <-@ M4.e30 m in
    let () = float_ptr +@ 13 <-@ M4.e31 m in
    let () = float_ptr +@ 14 <-@ M4.e32 m in
    let () = float_ptr +@ 15 <-@ M4.e33 m in
    ret
end

module Color = struct
  type godot_t = Color.t structure ptr
  type ocaml_t = color

  let to_ocaml : Color.t structure ptr -> color =
   fun x ->
    let float_ptr = coerce_ptr (ptr float) x in
    V4.v !@float_ptr !@(float_ptr +@ 1) !@(float_ptr +@ 2) !@(float_ptr +@ 3)

  let of_ocaml : color -> Color.t structure ptr =
   fun c ->
    let ret = gc_alloc ~count:1 Color.s in
    let float_ptr = coerce_ptr (ptr float) ret in
    let () = float_ptr <-@ V4.x c in
    let () = float_ptr +@ 1 <-@ V4.y c in
    let () = float_ptr +@ 2 <-@ V4.z c in
    let () = float_ptr +@ 3 <-@ V4.w c in
    ret
end

module StringName = struct
  type godot_t = StringName.t structure ptr
  type ocaml_t = StringName.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t = x
  let of_ocaml (x : ocaml_t) : godot_t = x
end

module NodePath = struct
  type godot_t = NodePath.t structure ptr
  type ocaml_t = NodePath.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t = x
  let of_ocaml (x : ocaml_t) : godot_t = x
end

module RID = struct
  type godot_t = RID.t structure ptr
  type ocaml_t = RID.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t = x
  let of_ocaml (x : ocaml_t) : godot_t = x
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
  let _refcounted_class_tag () = classdb_get_class_tag (_refcounted_string_name ())

  let _reference_ocaml reference coerce_to_ref_counted
      (obj_ptr : Object.t structure ptr) =
    let maybe_refcount_obj =
      object_cast_to
        (coerce_ptr object_ptr.plain obj_ptr)
        (_refcounted_class_tag ())
    in
    let const_obj_ptr = coerce_ptr object_ptr.const obj_ptr in
    if
      (not (is_null maybe_refcount_obj))
      && not (is_referenced_by_ocaml const_obj_ptr)
    then
      let is_good = reference (coerce_to_ref_counted maybe_refcount_obj) in
      set_is_referenced_by_ocaml is_good const_obj_ptr

  let _unreference_ocaml unreference coerce_to_ref_counted
      (obj_ptr : Object.t structure ptr) =
    let maybe_refcount_obj =
      object_cast_to
        (coerce_ptr object_ptr.plain obj_ptr)
        (_refcounted_class_tag ())
    in
    let const_obj_ptr = coerce_ptr object_ptr.const obj_ptr in
    if
      (not (is_null maybe_refcount_obj)) && is_referenced_by_ocaml const_obj_ptr
    then
      let is_good = unreference (coerce_to_ref_counted maybe_refcount_obj) in
      set_is_referenced_by_ocaml (not is_good) const_obj_ptr

  let reference _x = false
  let unreference _x = true
  let coerce_to_ref_counted x = x
  let to_ocaml (x : godot_t) : ocaml_t = x
  let of_ocaml (x : ocaml_t) : godot_t = x
end

module Callable = struct
  type godot_t = Callable.t structure ptr
  type ocaml_t = Callable.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t = x
  let of_ocaml (x : ocaml_t) : godot_t = x
end

module Signal = struct
  type godot_t = Signal.t structure ptr
  type ocaml_t = Signal.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t = x
  let of_ocaml (x : ocaml_t) : godot_t = x
end

module Dictionary = struct
  type godot_t = Dictionary.t structure ptr
  type ocaml_t = Dictionary.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t = x
  let of_ocaml (x : ocaml_t) : godot_t = x
end

module Array = struct
  type godot_t = Array.t structure ptr
  type ocaml_t = Array.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t = x
  let of_ocaml (x : ocaml_t) : godot_t = x
end

module PackedByteArray = struct
  type godot_t = PackedByteArray.t structure ptr
  type ocaml_t = PackedByteArray.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t = x
  let of_ocaml (x : ocaml_t) : godot_t = x
end

module PackedInt32Array = struct
  type godot_t = PackedInt32Array.t structure ptr
  type ocaml_t = PackedInt32Array.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t = x
  let of_ocaml (x : ocaml_t) : godot_t = x
end

module PackedInt64Array = struct
  type godot_t = PackedInt64Array.t structure ptr
  type ocaml_t = PackedInt64Array.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t = x
  let of_ocaml (x : ocaml_t) : godot_t = x
end

module PackedFloat32Array = struct
  type godot_t = PackedFloat32Array.t structure ptr
  type ocaml_t = PackedFloat32Array.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t = x
  let of_ocaml (x : ocaml_t) : godot_t = x
end

module PackedFloat64Array = struct
  type godot_t = PackedFloat64Array.t structure ptr
  type ocaml_t = PackedFloat64Array.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t = x
  let of_ocaml (x : ocaml_t) : godot_t = x
end

module PackedStringArray = struct
  type godot_t = PackedStringArray.t structure ptr
  type ocaml_t = PackedStringArray.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t = x
  let of_ocaml (x : ocaml_t) : godot_t = x
end

module PackedVector2Array = struct
  type godot_t = PackedVector2Array.t structure ptr
  type ocaml_t = PackedVector2Array.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t = x
  let of_ocaml (x : ocaml_t) : godot_t = x
end

module PackedVector3Array = struct
  type godot_t = PackedVector3Array.t structure ptr
  type ocaml_t = PackedVector3Array.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t = x
  let of_ocaml (x : ocaml_t) : godot_t = x
end

module PackedColorArray = struct
  type godot_t = PackedColorArray.t structure ptr
  type ocaml_t = PackedColorArray.t structure ptr

  let to_ocaml (x : godot_t) : ocaml_t = x
  let of_ocaml (x : ocaml_t) : godot_t = x
end

module Variant = struct
  type godot_t = Variant.t structure ptr
  type ocaml_t = C.variant_ptr structure ptr

  let to_ocaml (x : godot_t) : ocaml_t = coerce_ptr C.variant_ptr.plain x
  let of_ocaml (x : ocaml_t) : godot_t = coerce_ptr (ptr Variant.s) x
end

module Void = struct
  type godot_t = unit
  type ocaml_t = unit

  let to_ocaml (x : godot_t) : ocaml_t = x
  let of_ocaml (x : ocaml_t) : godot_t = x
end
