open! Base
open Ctypes
open Godotcaml_base
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

module ApiTypes = struct
  module Nil = struct
    type t

    let s : t structure typ = structure "Nil_Dummy"
    let _ = field s "_Nil_dummy_do_not_touch" (array ClassSizes._Nil uint8_t)
    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_NIL
    let type_name = "Nil"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Nil

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module Bool = struct
    type t

    let s : t structure typ = structure "Bool_Dummy"
    let _ = field s "bool_dummy_do_not_touch" (array ClassSizes.bool uint8_t)
    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_BOOL
    let type_name = "bool"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes.bool

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module Int = struct
    type t

    let s : t structure typ = structure "Int_Dummy"
    let _ = field s "int_dummy_do_not_touch" (array ClassSizes.int uint8_t)
    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_INT
    let type_name = "int"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes.int

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module Float = struct
    type t

    let s : t structure typ = structure "Float_Dummy"
    let _ = field s "float_dummy_do_not_touch" (array ClassSizes.float uint8_t)
    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_FLOAT
    let type_name = "float"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes.float

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module String = struct
    type t

    let s : t structure typ = structure "String_Dummy"

    let _ =
      field s "_String_dummy_do_not_touch" (array ClassSizes._String uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_STRING
    let type_name = "String"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._String

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module Vector2 = struct
    type t

    let s : t structure typ = structure "Vector2_Dummy"

    let _ =
      field s "_Vector2_dummy_do_not_touch" (array ClassSizes._Vector2 uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_VECTOR2
    let type_name = "Vector2"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Vector2

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module Vector2i = struct
    type t

    let s : t structure typ = structure "Vector2i_Dummy"

    let _ =
      field s "_Vector2i_dummy_do_not_touch"
        (array ClassSizes._Vector2i uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_VECTOR2I
    let type_name = "Vector2i"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Vector2i

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module Rect2 = struct
    type t

    let s : t structure typ = structure "Rect2_Dummy"

    let _ =
      field s "_Rect2_dummy_do_not_touch" (array ClassSizes._Rect2 uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_RECT2
    let type_name = "Rect2"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Rect2

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module Rect2i = struct
    type t

    let s : t structure typ = structure "Rect2i_Dummy"

    let _ =
      field s "_Rect2i_dummy_do_not_touch" (array ClassSizes._Rect2i uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_RECT2I
    let type_name = "Rect2i"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Rect2i

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module Vector3 = struct
    type t

    let s : t structure typ = structure "Vector3_Dummy"

    let _ =
      field s "_Vector3_dummy_do_not_touch" (array ClassSizes._Vector3 uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_VECTOR3
    let type_name = "Vector3"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Vector3

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module Vector3i = struct
    type t

    let s : t structure typ = structure "Vector3i_Dummy"

    let _ =
      field s "_Vector3i_dummy_do_not_touch"
        (array ClassSizes._Vector3i uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_VECTOR3I
    let type_name = "Vector3i"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Vector3i

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module Transform2D = struct
    type t

    let s : t structure typ = structure "Transform2D_Dummy"

    let _ =
      field s "_Transform2D_dummy_do_not_touch"
        (array ClassSizes._Transform2D uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_TRANSFORM2D
    let type_name = "Transform2D"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Transform2D

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module Vector4 = struct
    type t

    let s : t structure typ = structure "Vector4_Dummy"

    let _ =
      field s "_Vector4_dummy_do_not_touch" (array ClassSizes._Vector4 uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_VECTOR4
    let type_name = "Vector4"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Vector4

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module Vector4i = struct
    type t

    let s : t structure typ = structure "Vector4i_Dummy"

    let _ =
      field s "_Vector4i_dummy_do_not_touch"
        (array ClassSizes._Vector4i uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_VECTOR4I
    let type_name = "Vector4i"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Vector4i

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module Plane = struct
    type t

    let s : t structure typ = structure "Plane_Dummy"

    let _ =
      field s "_Plane_dummy_do_not_touch" (array ClassSizes._Plane uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_PLANE
    let type_name = "Plane"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Plane

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module Quaternion = struct
    type t

    let s : t structure typ = structure "Quaternion_Dummy"

    let _ =
      field s "_Quaternion_dummy_do_not_touch"
        (array ClassSizes._Quaternion uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_QUATERNION
    let type_name = "Quaternion"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Quaternion

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module AABB = struct
    type t

    let s : t structure typ = structure "AABB_Dummy"
    let _ = field s "_AABB_dummy_do_not_touch" (array ClassSizes._AABB uint8_t)
    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_AABB
    let type_name = "AABB"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._AABB

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module Basis = struct
    type t

    let s : t structure typ = structure "Basis_Dummy"

    let _ =
      field s "_Basis_dummy_do_not_touch" (array ClassSizes._Basis uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_BASIS
    let type_name = "Basis"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Basis

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module Transform3D = struct
    type t

    let s : t structure typ = structure "Transform3D_Dummy"

    let _ =
      field s "_Transform3D_dummy_do_not_touch"
        (array ClassSizes._Transform3D uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_TRANSFORM3D
    let type_name = "Transform3D"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Transform3D

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module Projection = struct
    type t

    let s : t structure typ = structure "Projection_Dummy"

    let _ =
      field s "_Projection_dummy_do_not_touch"
        (array ClassSizes._Projection uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_PROJECTION
    let type_name = "Projection"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Projection

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module Color = struct
    type t

    let s : t structure typ = structure "Color_Dummy"

    let _ =
      field s "_Color_dummy_do_not_touch" (array ClassSizes._Color uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_COLOR
    let type_name = "Color"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Color

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module StringName = struct
    type t

    let s : t structure typ = structure "StringName_Dummy"

    let _ =
      field s "_StringName_dummy_do_not_touch"
        (array ClassSizes._StringName uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_STRING_NAME
    let type_name = "StringName"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._StringName

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module NodePath = struct
    type t

    let s : t structure typ = structure "NodePath_Dummy"

    let _ =
      field s "_NodePath_dummy_do_not_touch"
        (array ClassSizes._NodePath uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_NODE_PATH
    let type_name = "NodePath"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._NodePath

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module RID = struct
    type t

    let s : t structure typ = structure "RID_Dummy"
    let _ = field s "_RID_dummy_do_not_touch" (array ClassSizes._RID uint8_t)
    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_RID
    let type_name = "RID"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._RID

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module Object = struct
    type t

    let s : t structure typ = structure "Object_Dummy"

    let _ =
      field s "_Object_dummy_do_not_touch" (array ClassSizes._Object uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_OBJECT
    let type_name = "Object"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Object

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module Callable = struct
    type t

    let s : t structure typ = structure "Callable_Dummy"

    let _ =
      field s "_Callable_dummy_do_not_touch"
        (array ClassSizes._Callable uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_CALLABLE
    let type_name = "Callable"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Callable

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module Signal = struct
    type t

    let s : t structure typ = structure "Signal_Dummy"

    let _ =
      field s "_Signal_dummy_do_not_touch" (array ClassSizes._Signal uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_SIGNAL
    let type_name = "Signal"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Signal

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module Dictionary = struct
    type t

    let s : t structure typ = structure "Dictionary_Dummy"

    let _ =
      field s "_Dictionary_dummy_do_not_touch"
        (array ClassSizes._Dictionary uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_DICTIONARY
    let type_name = "Dictionary"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Dictionary

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module Array = struct
    type t

    let s : t structure typ = structure "Array_Dummy"

    let _ =
      field s "_Array_dummy_do_not_touch" (array ClassSizes._Array uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_ARRAY
    let type_name = "Array"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Array

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module PackedByteArray = struct
    type t

    let s : t structure typ = structure "PackedByteArray_Dummy"

    let _ =
      field s "_PackedByteArray_dummy_do_not_touch"
        (array ClassSizes._PackedByteArray uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_PACKED_BYTE_ARRAY
    let type_name = "PackedByteArray"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._PackedByteArray

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module PackedInt32Array = struct
    type t

    let s : t structure typ = structure "PackedInt32Array_Dummy"

    let _ =
      field s "_PackedInt32Array_dummy_do_not_touch"
        (array ClassSizes._PackedInt32Array uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_PACKED_INT32_ARRAY
    let type_name = "PackedInt32Array"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._PackedInt32Array

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module PackedInt64Array = struct
    type t

    let s : t structure typ = structure "PackedInt64Array_Dummy"

    let _ =
      field s "_PackedInt64Array_dummy_do_not_touch"
        (array ClassSizes._PackedInt64Array uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_PACKED_INT64_ARRAY
    let type_name = "PackedInt64Array"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._PackedInt64Array

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module PackedFloat32Array = struct
    type t

    let s : t structure typ = structure "PackedFloat32Array_Dummy"

    let _ =
      field s "_PackedFloat32Array_dummy_do_not_touch"
        (array ClassSizes._PackedFloat32Array uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_PACKED_FLOAT32_ARRAY
    let type_name = "PackedFloat32Array"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._PackedFloat32Array

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module PackedFloat64Array = struct
    type t

    let s : t structure typ = structure "PackedFloat64Array_Dummy"

    let _ =
      field s "_PackedFloat64Array_dummy_do_not_touch"
        (array ClassSizes._PackedFloat64Array uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_PACKED_FLOAT64_ARRAY
    let type_name = "PackedFloat64Array"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._PackedFloat64Array

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module PackedStringArray = struct
    type t

    let s : t structure typ = structure "PackedStringArray_Dummy"

    let _ =
      field s "_PackedStringArray_dummy_do_not_touch"
        (array ClassSizes._PackedStringArray uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_PACKED_STRING_ARRAY
    let type_name = "PackedStringArray"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._PackedStringArray

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module PackedVector2Array = struct
    type t

    let s : t structure typ = structure "PackedVector2Array_Dummy"

    let _ =
      field s "_PackedVector2Array_dummy_do_not_touch"
        (array ClassSizes._PackedVector2Array uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_PACKED_VECTOR2_ARRAY
    let type_name = "PackedVector2Array"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._PackedVector2Array

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module PackedVector3Array = struct
    type t

    let s : t structure typ = structure "PackedVector3Array_Dummy"

    let _ =
      field s "_PackedVector3Array_dummy_do_not_touch"
        (array ClassSizes._PackedVector3Array uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_PACKED_VECTOR3_ARRAY
    let type_name = "PackedVector3Array"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._PackedVector3Array

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module PackedColorArray = struct
    type t

    let s : t structure typ = structure "PackedColorArray_Dummy"

    let _ =
      field s "_PackedColorArray_dummy_do_not_touch"
        (array ClassSizes._PackedColorArray uint8_t)

    let () = seal s
    let type_enum = GlobalEnum0.VariantType._TYPE_PACKED_COLOR_ARRAY
    let type_name = "PackedColorArray"
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._PackedColorArray

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end

  module Variant = struct
    type t

    let s : t structure typ = structure "Variant_Dummy"

    let _ =
      field s "_Variant_dummy_do_not_touch" (array ClassSizes._Variant uint8_t)

    let () = seal s
    let to_ocaml (x : t structure ptr) = x
    let of_ocaml (x : t structure ptr) = x
    let of_voidp = coerce (ptr void) (ptr s)
    let to_voidp = coerce (ptr s) (ptr void)
    let to_type_ptr = coerce (ptr s) type_ptr.plain
    let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
    let size = ClassSizes._Variant

    (** Change this to gc_alloc! (or just remove) *)
    let new_uninit () = allocate_n ~count:1 s
  end
end
