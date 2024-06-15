open! Base
open Ctypes
open Foreign_api
open Api_types.ApiTypes

module Nil = struct
  let to_ocaml : Nil.t structure ptr -> unit = fun _ -> ()
  let of_ocaml () = coerce_ptr (ptr Nil.s) null
end

module Bool = struct
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
  let to_ocaml : Int.t structure ptr -> int64 =
   fun x -> !@(coerce_ptr (ptr int64_t) x)

  let of_ocaml : int64 -> Int.t structure ptr =
   fun x ->
    let ret = gc_alloc ~count:1 Int.s in
    let () = coerce_ptr (ptr int64_t) ret <-@ x in
    ret
end

module Float = struct
  let to_ocaml : Float.t structure ptr -> float =
   fun x -> !@(coerce_ptr (ptr double) x)

  let of_ocaml : float -> Float.t structure ptr =
   fun x ->
    let ret = gc_alloc ~count:1 Float.s in
    let () = coerce_ptr (ptr double) ret <-@ x in
    ret
end

(** FIXME! *)
module String = struct
  open Foreign_api.Make (Api_types.ClassSizes)
  open Godotcaml.C

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
  let to_ocaml : Vector2.t structure ptr -> float * float =
   fun x ->
    let float_ptr = coerce_ptr (ptr double) x in
    (!@float_ptr, !@(float_ptr +@ 1))

  let of_ocaml : float * float -> Vector2.t structure ptr =
   fun (x, y) ->
    let ret = gc_alloc ~count:1 Vector2.s in
    let float_ptr = coerce_ptr (ptr double) ret in
    let () = float_ptr <-@ x in
    let () = float_ptr +@ 1 <-@ y in
    ret
end

module Vector2i = struct
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
  let to_ocaml : Rect2.t structure ptr -> (float * float) * (float * float) =
   fun x ->
    let float_ptr = coerce_ptr (ptr double) x in
    ((!@float_ptr, !@(float_ptr +@ 1)), (!@(float_ptr +@ 2), !@(float_ptr +@ 3)))

  let of_ocaml : (float * float) * (float * float) -> Rect2.t structure ptr =
   fun ((x, y), (sx, sy)) ->
    let ret = gc_alloc ~count:1 Rect2.s in
    let float_ptr = coerce_ptr (ptr double) ret in
    let () = float_ptr <-@ x in
    let () = float_ptr +@ 1 <-@ y in
    let () = float_ptr +@ 2 <-@ sx in
    let () = float_ptr +@ 3 <-@ sy in
    ret
end

module Rect2i = struct
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
  let to_ocaml : Vector3.t structure ptr -> float * float * float =
   fun x ->
    let float_ptr = coerce_ptr (ptr double) x in
    (!@float_ptr, !@(float_ptr +@ 1), !@(float_ptr +@ 2))

  let of_ocaml : float * float * float -> Vector3.t structure ptr =
   fun (x, y, z) ->
    let ret = gc_alloc ~count:1 Vector3.s in
    let float_ptr = coerce_ptr (ptr double) ret in
    let () = float_ptr <-@ x in
    let () = float_ptr +@ 1 <-@ y in
    let () = float_ptr +@ 2 <-@ z in
    ret
end

module Vector3i = struct
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
  let to_ocaml :
      Transform2D.t structure ptr ->
      (float * float) * (float * float) * (float * float) =
   fun x ->
    let float_ptr = coerce_ptr (ptr double) x in
    ( (!@float_ptr, !@(float_ptr +@ 1)),
      (!@(float_ptr +@ 2), !@(float_ptr +@ 3)),
      (!@(float_ptr +@ 4), !@(float_ptr +@ 5)) )

  let of_ocaml :
      (float * float) * (float * float) * (float * float) ->
      Transform2D.t structure ptr =
   fun ((x1, x2), (y1, y2), (o1, o2)) ->
    let ret = gc_alloc ~count:1 Transform2D.s in
    let float_ptr = coerce_ptr (ptr double) ret in
    let () = float_ptr <-@ x1 in
    let () = float_ptr +@ 1 <-@ x2 in
    let () = float_ptr +@ 2 <-@ y1 in
    let () = float_ptr +@ 3 <-@ y2 in
    let () = float_ptr +@ 4 <-@ o1 in
    let () = float_ptr +@ 5 <-@ o2 in
    ret
end

module Vector4 = struct
  let to_ocaml : Vector4.t structure ptr -> float * float * float * float =
   fun x ->
    let float_ptr = coerce_ptr (ptr double) x in
    (!@float_ptr, !@(float_ptr +@ 1), !@(float_ptr +@ 2), !@(float_ptr +@ 3))

  let of_ocaml : float * float * float * float -> Vector4.t structure ptr =
   fun (x, y, z, w) ->
    let ret = gc_alloc ~count:1 Vector4.s in
    let float_ptr = coerce_ptr (ptr double) ret in
    let () = float_ptr <-@ x in
    let () = float_ptr +@ 1 <-@ y in
    let () = float_ptr +@ 2 <-@ z in
    let () = float_ptr +@ 3 <-@ w in
    ret
end

module Vector4i = struct
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
  let to_ocaml : Plane.t structure ptr -> (float * float * float) * float =
   fun x ->
    let float_ptr = coerce_ptr (ptr double) x in
    ((!@float_ptr, !@(float_ptr +@ 1), !@(float_ptr +@ 2)), !@(float_ptr +@ 3))

  let of_ocaml : (float * float * float) * float -> Plane.t structure ptr =
   fun ((x, y, z), d) ->
    let ret = gc_alloc ~count:1 Plane.s in
    let float_ptr = coerce_ptr (ptr double) ret in
    let () = float_ptr <-@ x in
    let () = float_ptr +@ 1 <-@ y in
    let () = float_ptr +@ 2 <-@ z in
    let () = float_ptr +@ 3 <-@ d in
    ret
end

module Quaternion = struct
  let to_ocaml : Quaternion.t structure ptr -> float * float * float * float =
   fun x ->
    let float_ptr = coerce_ptr (ptr double) x in
    (!@float_ptr, !@(float_ptr +@ 1), !@(float_ptr +@ 2), !@(float_ptr +@ 3))

  let of_ocaml : float * float * float * float -> Quaternion.t structure ptr =
   fun (x, y, z, w) ->
    let ret = gc_alloc ~count:1 Quaternion.s in
    let float_ptr = coerce_ptr (ptr double) ret in
    let () = float_ptr <-@ x in
    let () = float_ptr +@ 1 <-@ y in
    let () = float_ptr +@ 2 <-@ z in
    let () = float_ptr +@ 3 <-@ w in
    ret
end

module AABB = struct
  let to_ocaml :
      AABB.t structure ptr -> (float * float * float) * (float * float * float)
      =
   fun x ->
    let float_ptr = coerce_ptr (ptr double) x in
    ( (!@float_ptr, !@(float_ptr +@ 1), !@(float_ptr +@ 2)),
      (!@(float_ptr +@ 3), !@(float_ptr +@ 4), !@(float_ptr +@ 5)) )

  let of_ocaml :
      (float * float * float) * (float * float * float) -> AABB.t structure ptr
      =
   fun ((x, y, z), (sx, sy, sz)) ->
    let ret = gc_alloc ~count:1 AABB.s in
    let float_ptr = coerce_ptr (ptr double) ret in
    let () = float_ptr <-@ x in
    let () = float_ptr +@ 1 <-@ y in
    let () = float_ptr +@ 2 <-@ z in
    let () = float_ptr +@ 3 <-@ sx in
    let () = float_ptr +@ 4 <-@ sy in
    let () = float_ptr +@ 5 <-@ sz in
    ret
end

module Basis = struct
  let to_ocaml :
      Basis.t structure ptr ->
      (float * float * float)
      * (float * float * float)
      * (float * float * float) =
   fun x ->
    let float_ptr = coerce_ptr (ptr double) x in
    ( (!@float_ptr, !@(float_ptr +@ 1), !@(float_ptr +@ 2)),
      (!@(float_ptr +@ 3), !@(float_ptr +@ 4), !@(float_ptr +@ 5)),
      (!@(float_ptr +@ 6), !@(float_ptr +@ 7), !@(float_ptr +@ 8)) )

  let of_ocaml :
      (float * float * float)
      * (float * float * float)
      * (float * float * float) ->
      Basis.t structure ptr =
   fun ((x1, x2, x3), (y1, y2, y3), (z1, z2, z3)) ->
    let ret = gc_alloc ~count:1 Basis.s in
    let float_ptr = coerce_ptr (ptr double) ret in
    let () = float_ptr <-@ x1 in
    let () = float_ptr +@ 1 <-@ x2 in
    let () = float_ptr +@ 2 <-@ x3 in
    let () = float_ptr +@ 3 <-@ y1 in
    let () = float_ptr +@ 4 <-@ y2 in
    let () = float_ptr +@ 5 <-@ y3 in
    let () = float_ptr +@ 6 <-@ z1 in
    let () = float_ptr +@ 7 <-@ z2 in
    let () = float_ptr +@ 8 <-@ z3 in
    ret
end

module Transform3D = struct
  let to_ocaml :
      Transform3D.t structure ptr ->
      ((float * float * float)
      * (float * float * float)
      * (float * float * float))
      * (float * float * float) =
   fun x ->
    let float_ptr = coerce_ptr (ptr double) x in
    ( ( (!@float_ptr, !@(float_ptr +@ 1), !@(float_ptr +@ 2)),
        (!@(float_ptr +@ 3), !@(float_ptr +@ 4), !@(float_ptr +@ 5)),
        (!@(float_ptr +@ 6), !@(float_ptr +@ 7), !@(float_ptr +@ 8)) ),
      (!@(float_ptr +@ 9), !@(float_ptr +@ 10), !@(float_ptr +@ 11)) )

  let of_ocaml :
      ((float * float * float)
      * (float * float * float)
      * (float * float * float))
      * (float * float * float) ->
      Transform3D.t structure ptr =
   fun (((x1, x2, x3), (y1, y2, y3), (z1, z2, z3)), (o1, o2, o3)) ->
    let ret = gc_alloc ~count:1 Transform3D.s in
    let float_ptr = coerce_ptr (ptr double) ret in
    let () = float_ptr <-@ x1 in
    let () = float_ptr +@ 1 <-@ x2 in
    let () = float_ptr +@ 2 <-@ x3 in
    let () = float_ptr +@ 3 <-@ y1 in
    let () = float_ptr +@ 4 <-@ y2 in
    let () = float_ptr +@ 5 <-@ y3 in
    let () = float_ptr +@ 6 <-@ z1 in
    let () = float_ptr +@ 7 <-@ z2 in
    let () = float_ptr +@ 8 <-@ z3 in
    let () = float_ptr +@ 9 <-@ o1 in
    let () = float_ptr +@ 10 <-@ o2 in
    let () = float_ptr +@ 11 <-@ o3 in
    ret
end

module Projection = struct
  let to_ocaml :
      Projection.t structure ptr ->
      (float * float * float * float)
      * (float * float * float * float)
      * (float * float * float * float)
      * (float * float * float * float) =
   fun x ->
    let float_ptr = coerce_ptr (ptr double) x in
    ( (!@float_ptr, !@(float_ptr +@ 1), !@(float_ptr +@ 2), !@(float_ptr +@ 3)),
      ( !@(float_ptr +@ 4),
        !@(float_ptr +@ 5),
        !@(float_ptr +@ 6),
        !@(float_ptr +@ 7) ),
      ( !@(float_ptr +@ 8),
        !@(float_ptr +@ 9),
        !@(float_ptr +@ 10),
        !@(float_ptr +@ 11) ),
      ( !@(float_ptr +@ 12),
        !@(float_ptr +@ 13),
        !@(float_ptr +@ 14),
        !@(float_ptr +@ 15) ) )

  let of_ocaml :
      (float * float * float * float)
      * (float * float * float * float)
      * (float * float * float * float)
      * (float * float * float * float) ->
      Projection.t structure ptr =
   fun ((x1, x2, x3, x4), (y1, y2, y3, y4), (z1, z2, z3, z4), (w1, w2, w3, w4)) ->
    let ret = gc_alloc ~count:1 Projection.s in
    let float_ptr = coerce_ptr (ptr double) ret in
    let () = float_ptr <-@ x1 in
    let () = float_ptr +@ 1 <-@ x2 in
    let () = float_ptr +@ 2 <-@ x3 in
    let () = float_ptr +@ 3 <-@ x4 in
    let () = float_ptr +@ 4 <-@ y1 in
    let () = float_ptr +@ 5 <-@ y2 in
    let () = float_ptr +@ 6 <-@ y3 in
    let () = float_ptr +@ 7 <-@ y4 in
    let () = float_ptr +@ 8 <-@ z1 in
    let () = float_ptr +@ 9 <-@ z2 in
    let () = float_ptr +@ 10 <-@ z3 in
    let () = float_ptr +@ 11 <-@ z4 in
    let () = float_ptr +@ 12 <-@ w1 in
    let () = float_ptr +@ 13 <-@ w2 in
    let () = float_ptr +@ 14 <-@ w3 in
    let () = float_ptr +@ 15 <-@ w4 in
    ret
end

module Color = struct
  let to_ocaml : Color.t structure ptr -> float * float * float * float =
   fun x ->
    let float_ptr = coerce_ptr (ptr float) x in
    (!@float_ptr, !@(float_ptr +@ 1), !@(float_ptr +@ 2), !@(float_ptr +@ 3))

  let of_ocaml : float * float * float * float -> Color.t structure ptr =
   fun (r, g, b, a) ->
    let ret = gc_alloc ~count:1 Color.s in
    let float_ptr = coerce_ptr (ptr float) ret in
    let () = float_ptr <-@ r in
    let () = float_ptr +@ 1 <-@ g in
    let () = float_ptr +@ 2 <-@ b in
    let () = float_ptr +@ 3 <-@ a in
    ret
end

module StringName = struct end
module NodePath = struct end
module RID = struct end
module Object = struct end
module Callable = struct end
module Signal = struct end
module Dictionary = struct end
module Array = struct end
module PackedByteArray = struct end
module PackedInt32Array = struct end
module PackedInt64Array = struct end
module PackedFloat32Array = struct end
module PackedFloat64Array = struct end
module PackedStringArray = struct end
module PackedVector2Array = struct end
module PackedVector3Array = struct end
module PackedColorArray = struct end
module Variant = struct end
