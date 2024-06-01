open! Base
open Ctypes
module ClassSizes = Godotcaml.BuiltinClassSize.Double_64
open Godotcaml
open C

module type CLASS_SIZES = sig
  val _Nil : int
  val bool : int
  val int : int
  val float : int
  val _String : int
  val _Vector2 : int
  val _Vector2i : int
  val _Rect2 : int
  val _Rect2i : int
  val _Vector3 : int
  val _Vector3i : int
  val _Transform2D : int
  val _Vector4 : int
  val _Vector4i : int
  val _Plane : int
  val _Quaternion : int
  val _AABB : int
  val _Basis : int
  val _Transform3D : int
  val _Projection : int
  val _Color : int
  val _StringName : int
  val _NodePath : int
  val _RID : int
  val _Object : int
  val _Callable : int
  val _Signal : int
  val _Dictionary : int
  val _Array : int
  val _PackedByteArray : int
  val _PackedInt32Array : int
  val _PackedInt64Array : int
  val _PackedFloat32Array : int
  val _PackedFloat64Array : int
  val _PackedStringArray : int
  val _PackedVector2Array : int
  val _PackedVector3Array : int
  val _PackedColorArray : int
  val _Variant : int
end

module type SUB_API_TYPE = sig
  type t

  val s : t structure typ
  val of_voidp : unit ptr -> t structure ptr
  val to_voidp : t structure ptr -> unit ptr
  val typ : t structure ptr typ
  val size : int
  val new_uninit : unit -> t structure ptr
end

module type API_TYPE = sig
  include SUB_API_TYPE

  val to_type_ptr :
    t structure ptr -> type_ptr structure Godotcaml.TypedSuite.plain ptr
end

module type FOREIGN_API = sig
  module Nil : API_TYPE
  module Bool : API_TYPE
  module Int : API_TYPE
  module Float : API_TYPE
  module String : API_TYPE
  module Vector2 : API_TYPE
  module Vector2i : API_TYPE
  module Rect2 : API_TYPE
  module Rect2i : API_TYPE
  module Vector3 : API_TYPE
  module Vector3i : API_TYPE
  module Transform2D : API_TYPE
  module Vector4 : API_TYPE
  module Vector4i : API_TYPE
  module Plane : API_TYPE
  module Quaternion : API_TYPE
  module AABB : API_TYPE
  module Basis : API_TYPE
  module Transform3D : API_TYPE
  module Projection : API_TYPE
  module Color : API_TYPE
  module StringName : API_TYPE
  module NodePath : API_TYPE
  module RID : API_TYPE
  module Object : API_TYPE
  module Callable : API_TYPE
  module Signal : API_TYPE
  module Dictionary : API_TYPE
  module Array : API_TYPE
  module PackedByteArray : API_TYPE
  module PackedInt32Array : API_TYPE
  module PackedInt64Array : API_TYPE
  module PackedFloat32Array : API_TYPE
  module PackedFloat64Array : API_TYPE
  module PackedStringArray : API_TYPE
  module PackedVector2Array : API_TYPE
  module PackedVector3Array : API_TYPE
  module PackedColorArray : API_TYPE
  module Variant : SUB_API_TYPE

  val foreign_operator : int -> int option -> int -> PtrOperatorEvaluator.t
end

module ApiTypes (ClassSizes : CLASS_SIZES) = struct
  module Nil = struct
    type t

    let s : t structure typ = structure "Nil_Dummy"
    let _ = field s "_Nil_dummy_do_not_touch" (array ClassSizes._Nil uint8_t)
    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Nil
    let new_uninit () = allocate_n ~count:1 s
  end

  module Bool = struct
    type t

    let s : t structure typ = structure "Bool_Dummy"
    let _ = field s "bool_dummy_do_not_touch" (array ClassSizes.bool uint8_t)
    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes.bool
    let new_uninit () = allocate_n ~count:1 s
  end

  module Int = struct
    type t

    let s : t structure typ = structure "Int_Dummy"
    let _ = field s "int_dummy_do_not_touch" (array ClassSizes.int uint8_t)
    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes.int
    let new_uninit () = allocate_n ~count:1 s
  end

  module Float = struct
    type t

    let s : t structure typ = structure "Float_Dummy"
    let _ = field s "float_dummy_do_not_touch" (array ClassSizes.float uint8_t)
    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes.float
    let new_uninit () = allocate_n ~count:1 s
  end

  module String = struct
    type t

    let s : t structure typ = structure "String_Dummy"

    let _ =
      field s "_String_dummy_do_not_touch" (array ClassSizes._String uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._String
    let new_uninit () = allocate_n ~count:1 s
  end

  module Vector2 = struct
    type t

    let s : t structure typ = structure "Vector2_Dummy"

    let _ =
      field s "_Vector2_dummy_do_not_touch" (array ClassSizes._Vector2 uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Vector2
    let new_uninit () = allocate_n ~count:1 s
  end

  module Vector2i = struct
    type t

    let s : t structure typ = structure "Vector2i_Dummy"

    let _ =
      field s "_Vector2i_dummy_do_not_touch"
        (array ClassSizes._Vector2i uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Vector2i
    let new_uninit () = allocate_n ~count:1 s
  end

  module Rect2 = struct
    type t

    let s : t structure typ = structure "Rect2_Dummy"

    let _ =
      field s "_Rect2_dummy_do_not_touch" (array ClassSizes._Rect2 uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Rect2
    let new_uninit () = allocate_n ~count:1 s
  end

  module Rect2i = struct
    type t

    let s : t structure typ = structure "Rect2i_Dummy"

    let _ =
      field s "_Rect2i_dummy_do_not_touch" (array ClassSizes._Rect2i uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Rect2i
    let new_uninit () = allocate_n ~count:1 s
  end

  module Vector3 = struct
    type t

    let s : t structure typ = structure "Vector3_Dummy"

    let _ =
      field s "_Vector3_dummy_do_not_touch" (array ClassSizes._Vector3 uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Vector3
    let new_uninit () = allocate_n ~count:1 s
  end

  module Vector3i = struct
    type t

    let s : t structure typ = structure "Vector3i_Dummy"

    let _ =
      field s "_Vector3i_dummy_do_not_touch"
        (array ClassSizes._Vector3i uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Vector3i
    let new_uninit () = allocate_n ~count:1 s
  end

  module Transform2D = struct
    type t

    let s : t structure typ = structure "Transform2D_Dummy"

    let _ =
      field s "_Transform2D_dummy_do_not_touch"
        (array ClassSizes._Transform2D uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Transform2D
    let new_uninit () = allocate_n ~count:1 s
  end

  module Vector4 = struct
    type t

    let s : t structure typ = structure "Vector4_Dummy"

    let _ =
      field s "_Vector4_dummy_do_not_touch" (array ClassSizes._Vector4 uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Vector4
    let new_uninit () = allocate_n ~count:1 s
  end

  module Vector4i = struct
    type t

    let s : t structure typ = structure "Vector4i_Dummy"

    let _ =
      field s "_Vector4i_dummy_do_not_touch"
        (array ClassSizes._Vector4i uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Vector4i
    let new_uninit () = allocate_n ~count:1 s
  end

  module Plane = struct
    type t

    let s : t structure typ = structure "Plane_Dummy"

    let _ =
      field s "_Plane_dummy_do_not_touch" (array ClassSizes._Plane uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Plane
    let new_uninit () = allocate_n ~count:1 s
  end

  module Quaternion = struct
    type t

    let s : t structure typ = structure "Quaternion_Dummy"

    let _ =
      field s "_Quaternion_dummy_do_not_touch"
        (array ClassSizes._Quaternion uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Quaternion
    let new_uninit () = allocate_n ~count:1 s
  end

  module AABB = struct
    type t

    let s : t structure typ = structure "AABB_Dummy"
    let _ = field s "_AABB_dummy_do_not_touch" (array ClassSizes._AABB uint8_t)
    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._AABB
    let new_uninit () = allocate_n ~count:1 s
  end

  module Basis = struct
    type t

    let s : t structure typ = structure "Basis_Dummy"

    let _ =
      field s "_Basis_dummy_do_not_touch" (array ClassSizes._Basis uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Basis
    let new_uninit () = allocate_n ~count:1 s
  end

  module Transform3D = struct
    type t

    let s : t structure typ = structure "Transform3D_Dummy"

    let _ =
      field s "_Transform3D_dummy_do_not_touch"
        (array ClassSizes._Transform3D uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Transform3D
    let new_uninit () = allocate_n ~count:1 s
  end

  module Projection = struct
    type t

    let s : t structure typ = structure "Projection_Dummy"

    let _ =
      field s "_Projection_dummy_do_not_touch"
        (array ClassSizes._Projection uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Projection
    let new_uninit () = allocate_n ~count:1 s
  end

  module Color = struct
    type t

    let s : t structure typ = structure "Color_Dummy"

    let _ =
      field s "_Color_dummy_do_not_touch" (array ClassSizes._Color uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Color
    let new_uninit () = allocate_n ~count:1 s
  end

  module StringName = struct
    type t

    let s : t structure typ = structure "StringName_Dummy"

    let _ =
      field s "_StringName_dummy_do_not_touch"
        (array ClassSizes._StringName uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._StringName
    let new_uninit () = allocate_n ~count:1 s
  end

  module NodePath = struct
    type t

    let s : t structure typ = structure "NodePath_Dummy"

    let _ =
      field s "_NodePath_dummy_do_not_touch"
        (array ClassSizes._NodePath uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._NodePath
    let new_uninit () = allocate_n ~count:1 s
  end

  module RID = struct
    type t

    let s : t structure typ = structure "RID_Dummy"
    let _ = field s "_RID_dummy_do_not_touch" (array ClassSizes._RID uint8_t)
    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._RID
    let new_uninit () = allocate_n ~count:1 s
  end

  module Object = struct
    type t

    let s : t structure typ = structure "Object_Dummy"

    let _ =
      field s "_Object_dummy_do_not_touch" (array ClassSizes._Object uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Object
    let new_uninit () = allocate_n ~count:1 s
  end

  module Callable = struct
    type t

    let s : t structure typ = structure "Callable_Dummy"

    let _ =
      field s "_Callable_dummy_do_not_touch"
        (array ClassSizes._Callable uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Callable
    let new_uninit () = allocate_n ~count:1 s
  end

  module Signal = struct
    type t

    let s : t structure typ = structure "Signal_Dummy"

    let _ =
      field s "_Signal_dummy_do_not_touch" (array ClassSizes._Signal uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Signal
    let new_uninit () = allocate_n ~count:1 s
  end

  module Dictionary = struct
    type t

    let s : t structure typ = structure "Dictionary_Dummy"

    let _ =
      field s "_Dictionary_dummy_do_not_touch"
        (array ClassSizes._Dictionary uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Dictionary
    let new_uninit () = allocate_n ~count:1 s
  end

  module Array = struct
    type t

    let s : t structure typ = structure "Array_Dummy"

    let _ =
      field s "_Array_dummy_do_not_touch" (array ClassSizes._Array uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Array
    let new_uninit () = allocate_n ~count:1 s
  end

  module PackedByteArray = struct
    type t

    let s : t structure typ = structure "PackedByteArray_Dummy"

    let _ =
      field s "_PackedByteArray_dummy_do_not_touch"
        (array ClassSizes._PackedByteArray uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._PackedByteArray
    let new_uninit () = allocate_n ~count:1 s
  end

  module PackedInt32Array = struct
    type t

    let s : t structure typ = structure "PackedInt32Array_Dummy"

    let _ =
      field s "_PackedInt32Array_dummy_do_not_touch"
        (array ClassSizes._PackedInt32Array uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._PackedInt32Array
    let new_uninit () = allocate_n ~count:1 s
  end

  module PackedInt64Array = struct
    type t

    let s : t structure typ = structure "PackedInt64Array_Dummy"

    let _ =
      field s "_PackedInt64Array_dummy_do_not_touch"
        (array ClassSizes._PackedInt64Array uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._PackedInt64Array
    let new_uninit () = allocate_n ~count:1 s
  end

  module PackedFloat32Array = struct
    type t

    let s : t structure typ = structure "PackedFloat32Array_Dummy"

    let _ =
      field s "_PackedFloat32Array_dummy_do_not_touch"
        (array ClassSizes._PackedFloat32Array uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._PackedFloat32Array
    let new_uninit () = allocate_n ~count:1 s
  end

  module PackedFloat64Array = struct
    type t

    let s : t structure typ = structure "PackedFloat64Array_Dummy"

    let _ =
      field s "_PackedFloat64Array_dummy_do_not_touch"
        (array ClassSizes._PackedFloat64Array uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._PackedFloat64Array
    let new_uninit () = allocate_n ~count:1 s
  end

  module PackedStringArray = struct
    type t

    let s : t structure typ = structure "PackedStringArray_Dummy"

    let _ =
      field s "_PackedStringArray_dummy_do_not_touch"
        (array ClassSizes._PackedStringArray uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._PackedStringArray
    let new_uninit () = allocate_n ~count:1 s
  end

  module PackedVector2Array = struct
    type t

    let s : t structure typ = structure "PackedVector2Array_Dummy"

    let _ =
      field s "_PackedVector2Array_dummy_do_not_touch"
        (array ClassSizes._PackedVector2Array uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._PackedVector2Array
    let new_uninit () = allocate_n ~count:1 s
  end

  module PackedVector3Array = struct
    type t

    let s : t structure typ = structure "PackedVector3Array_Dummy"

    let _ =
      field s "_PackedVector3Array_dummy_do_not_touch"
        (array ClassSizes._PackedVector3Array uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._PackedVector3Array
    let new_uninit () = allocate_n ~count:1 s
  end

  module PackedColorArray = struct
    type t

    let s : t structure typ = structure "PackedColorArray_Dummy"

    let _ =
      field s "_PackedColorArray_dummy_do_not_touch"
        (array ClassSizes._PackedColorArray uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._PackedColorArray
    let new_uninit () = allocate_n ~count:1 s
  end

  module Variant = struct
    type t

    let s : t structure typ = structure "Variant_Dummy"

    let _ =
      field s "_Variant_dummy_do_not_touch" (array ClassSizes._Variant uint8_t)

    let () = seal s
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Variant
    let new_uninit () = allocate_n ~count:1 s
  end
end
