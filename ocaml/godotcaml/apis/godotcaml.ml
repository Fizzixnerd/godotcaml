open! Base
open! Core
include Bootstrap

module type SUITE = sig
  open Ctypes

  type 'a plain
  type 'a const
  type 'a uninit

  type 'a ptr_suite = {
    plain : 'a structure ptr typ;
    const : 'a structure const ptr typ;
    uninit : 'a structure uninit ptr typ;
  }

  val ptr_suite : string -> 'a structure typ -> 'a ptr_suite
  val typedef_name : ?prefix:string -> ?postfix:string -> string -> string
end

module TypedSuite : SUITE = struct
  open Ctypes

  type 'a plain = 'a
  type 'a const

  let const : 'a typ -> 'a const typ =
   fun t ->
    let to_const : 'a -> 'a const = Stdlib.Obj.magic in
    let of_const : 'a const -> 'a = Stdlib.Obj.magic in
    view ~read:to_const ~write:of_const t

  type 'a uninit

  let uninit : 'a typ -> 'a uninit typ =
   fun t ->
    let to_uninit : 'a -> 'a uninit = Stdlib.Obj.magic in
    let of_uninit : 'a uninit -> 'a = Stdlib.Obj.magic in
    view ~read:to_uninit ~write:of_uninit t

  type 'a ptr_suite = {
    plain : 'a structure ptr typ;
    const : 'a structure const ptr typ;
    uninit : 'a structure uninit ptr typ;
  }

  let typedef_name ?prefix ?postfix name =
    sprintf "GDExtension%s%s%s"
      (prefix |> Option.value ~default:"")
      name
      (postfix |> Option.value ~default:"")

  let ptr_suite name (t : 'a structure typ) =
    let def ptr_ty name t =
      typedef t (typedef_name ~prefix:ptr_ty ~postfix:"Ptr" name)
    in

    let plain_ptr = def "" name (ptr t) in
    let plain_read x = coerce (ptr void) plain_ptr x in
    let plain_write x = to_voidp x in
    let plain = view ~read:plain_read ~write:plain_write (ptr void) in

    let const_ptr = def "Const" name (ptr (const t)) in
    let const_read x = coerce (ptr void) const_ptr x in
    let const_write x = to_voidp x in
    let const = view ~read:const_read ~write:const_write (ptr void) in

    let uninit_ptr = def "Uninitialized" name (ptr (uninit t)) in
    let uninit_read x = coerce (ptr void) uninit_ptr x in
    let uninit_write x = to_voidp x in
    let uninit = view ~read:uninit_read ~write:uninit_write (ptr void) in

    { plain; const; uninit }
end

module C = struct
  open Ctypes
  open! PosixTypes
  open! Foreign
  module M = TypedSuite

  let enum = int
  let variant_type = typedef enum (M.typedef_name "VariantType")

  module VariantType = struct
    let nil = 0
    let bool = 1
    let int = 2
    let float = 3
    let string = 4
    let object_ = 14
    let string_name = 21
  end

  let variant_operator = typedef enum (M.typedef_name "VariantOperator")

  type variant_ptr

  let variant_ptr : variant_ptr M.ptr_suite =
    M.ptr_suite "Variant" (structure "gdovariant")

  type string_name_ptr

  let string_name_ptr : string_name_ptr M.ptr_suite =
    M.ptr_suite "StringName" (structure "gdostring_name")

  type string_ptr

  let string_ptr : string_ptr M.ptr_suite =
    M.ptr_suite "String" (structure "gdostring")

  type object_ptr

  let object_ptr : object_ptr M.ptr_suite =
    M.ptr_suite "Object" (structure "gdoobject")

  type type_ptr

  let type_ptr : type_ptr M.ptr_suite = M.ptr_suite "Type" (structure "gdotype")

  type method_bind_ptr

  let method_bind_ptr : method_bind_ptr M.ptr_suite =
    M.ptr_suite "MethodBind" (structure "gdomethod_bind")

  let gint = typedef int64_t (M.typedef_name "Int")
  let gbool = typedef uint8_t (M.typedef_name "Bool")
  let instance_id = typedef uint64_t "GDObjectInstanceId"

  type ref_ptr

  let ref_ptr : ref_ptr M.ptr_suite = M.ptr_suite "Ref" (structure "gdoref")

  (* VARIANT DATA I/O *)

  module CallError = struct
    type t

    let call_error_type = typedef enum "GDExtensionCallErrorType"
    let call_error_struct : t structure typ = structure "GDExtensionCallError"
    let error_f = field call_error_struct "error" call_error_type
    let argument_f = field call_error_struct "argument" int32_t
    let expected_f = field call_error_struct "expected" int32_t
    let () = seal call_error_struct
    let s = typedef call_error_struct "GDExtensionCallError"
  end

  type 'a fn_suite = { fn : 'a fn; typ : 'a typ }

  let fn_suite name fn =
    let typ = typedef (funptr fn) name in
    { fn; typ }

  let variant_from_type_constructor_func =
    dynamic_funptr (variant_ptr.uninit @-> type_ptr.plain @-> returning void)

  module VariantFromTypeConstructorFunc =
    (val variant_from_type_constructor_func)

  let variant_from_type_constructor_func typ =
    fn_suite
      (M.typedef_name "VariantFromTypeConstructorFunc")
      (variant_ptr.uninit @-> typ @-> returning void)

  let get_variant_from_type_constructor =
    dynamic_funptr (variant_type @-> returning VariantFromTypeConstructorFunc.t)

  module GetVariantFromTypeConstructor = (val get_variant_from_type_constructor)

  let get_variant_from_type_constructor =
    fn_suite
      (M.typedef_name "GetVariantFromTypeConstructor")
      (variant_type @-> returning VariantFromTypeConstructorFunc.t)

  let variant_to_type_constructor_func =
    dynamic_funptr (type_ptr.uninit @-> variant_ptr.plain @-> returning void)

  module VariantToTypeConstructorFunc = (val variant_to_type_constructor_func)

  let variant_to_type_constructor_func typ =
    fn_suite
      (M.typedef_name "VariantToTypeConstructorFunc")
      (typ @-> variant_ptr.plain @-> returning void)

  let get_variant_to_type_constructor =
    dynamic_funptr (variant_type @-> returning VariantToTypeConstructorFunc.t)

  module GetVariantToTypeConstructor = (val get_variant_to_type_constructor)

  let get_variant_to_type_constructor =
    fn_suite
      (M.typedef_name "GetVariantToTypeConstructor")
      (variant_type @-> returning VariantToTypeConstructorFunc.t)

  let ptr_operator_evaluator =
    dynamic_funptr
      (type_ptr.const @-> type_ptr.const @-> type_ptr.plain @-> returning void)

  module PtrOperatorEvaluator = (val ptr_operator_evaluator)

  let ptr_builtin_method =
    dynamic_funptr
      (type_ptr.plain @-> ptr type_ptr.const @-> type_ptr.plain @-> int
     @-> returning void)

  module PtrBuiltinMethod = (val ptr_builtin_method)

  let ptr_builtin_method =
    Foreign.funptr
      (type_ptr.plain @-> ptr type_ptr.const @-> type_ptr.plain @-> int
     @-> returning void)

  let ptr_constructor =
    fn_suite
      (M.typedef_name "PtrConstructor")
      (type_ptr.uninit @-> ptr type_ptr.const @-> returning void)

  let ptr_destructor =
    fn_suite (M.typedef_name "PtrDestructor") (type_ptr.plain @-> returning void)

  let ptr_setter =
    fn_suite
      (M.typedef_name "PtrSetter")
      (type_ptr.plain @-> type_ptr.const @-> returning void)

  let ptr_getter =
    fn_suite
      (M.typedef_name "PtrGetter")
      (type_ptr.const @-> type_ptr.plain @-> returning void)

  let ptr_indexed_setter =
    fn_suite
      (M.typedef_name "PtrIndexedSetter")
      (type_ptr.plain @-> gint @-> type_ptr.const @-> returning void)

  let ptr_indexed_getter =
    fn_suite
      (M.typedef_name "PtrIndexedGetter")
      (type_ptr.const @-> gint @-> type_ptr.plain @-> returning void)

  let ptr_keyed_setter =
    fn_suite
      (M.typedef_name "PtrKeyedSetter")
      (type_ptr.plain @-> type_ptr.const @-> type_ptr.const @-> returning void)

  let ptr_keyed_getter =
    fn_suite
      (M.typedef_name "PtrKeyedGetter")
      (type_ptr.const @-> type_ptr.const @-> type_ptr.plain @-> returning void)

  let ptr_keyed_checker =
    fn_suite
      (M.typedef_name "PtrKeyedChecker")
      (variant_ptr.const @-> variant_ptr.const @-> returning uint32_t)

  let ptr_utility_function =
    dynamic_funptr
      (type_ptr.plain @-> ptr type_ptr.const @-> int @-> returning void)

  module PtrUtilityFunction = (val ptr_utility_function)

  let ptr_utility_function =
    fn_suite
      (M.typedef_name "PtrUtilityFunction")
      (type_ptr.plain @-> ptr type_ptr.const @-> int @-> returning void)

  let variant_call =
    dynamic_funptr
      (variant_ptr.plain @-> string_name_ptr.const @-> ptr variant_ptr.const
     @-> gint @-> variant_ptr.uninit @-> ptr CallError.s @-> returning void)

  module VariantCall = (val variant_call)

  let variant_call =
    fn_suite
      (M.typedef_name "VariantCall")
      (variant_ptr.plain @-> string_name_ptr.const @-> ptr variant_ptr.const
     @-> gint @-> variant_ptr.uninit @-> ptr CallError.s @-> returning void)

  let variant_call_static =
    dynamic_funptr
      (variant_type @-> string_name_ptr.const @-> ptr variant_ptr.const @-> gint
     @-> variant_ptr.uninit @-> ptr CallError.s @-> returning void)

  module VariantCallStatic = (val variant_call_static)

  let variant_call_static =
    fn_suite
      (M.typedef_name "VariantCallStatic")
      (variant_type @-> string_name_ptr.const @-> ptr variant_ptr.const @-> gint
     @-> variant_ptr.uninit @-> ptr CallError.s @-> returning void)

  let class_constructor =
    fn_suite
      (M.typedef_name "ClassConstructor")
      (void @-> returning object_ptr.plain)

  let instance_binding_create_callback =
    fn_suite
      (M.typedef_name "InstanceBindingCreateCallback")
      (ptr void @-> ptr void @-> returning (ptr void))

  let instance_binding_free_callback =
    fn_suite
      (M.typedef_name "InstanceBindingFreeCallback")
      (ptr void @-> ptr void @-> ptr void @-> returning void)

  let instance_binding_reference_callback =
    fn_suite
      (M.typedef_name "InstanceBindingReferenceCallback")
      (ptr void @-> ptr void @-> gbool @-> returning gbool)

  module InstanceBindingCallbacks = struct
    type t

    let instance_binding_callbacks_struct : t structure typ =
      structure (M.typedef_name "InstanceBindingCallbacks")

    let create_callback_f =
      field instance_binding_callbacks_struct "create_callback"
        instance_binding_create_callback.typ

    let free_callback_f =
      field instance_binding_callbacks_struct "free_callback"
        instance_binding_free_callback.typ

    let reference_callback_f =
      field instance_binding_callbacks_struct "reference_callback"
        instance_binding_reference_callback.typ

    let () = seal instance_binding_callbacks_struct

    let s =
      typedef instance_binding_callbacks_struct
        (M.typedef_name "InstanceBindingCallbacks")
  end

  (* EXTENSION CLASSES *)

  type class_instance_ptr

  let class_instance_ptr : class_instance_ptr M.ptr_suite =
    M.ptr_suite "ClassInstance" (structure "gdoclass_instance_pointer")

  let class_set =
    fn_suite
      (M.typedef_name "ClassSet")
      (class_instance_ptr.plain @-> string_name_ptr.const @-> variant_ptr.const
     @-> returning gbool)

  let class_get =
    fn_suite
      (M.typedef_name "ClassGet")
      (class_instance_ptr.plain @-> string_name_ptr.const @-> variant_ptr.plain
     @-> returning gbool)

  let class_get_rid =
    fn_suite
      (M.typedef_name "ClassGetRID")
      (class_instance_ptr.plain @-> returning uint64_t)

  module PropertyInfo = struct
    type t

    let property_info_struct : t structure typ =
      structure (M.typedef_name "PropertyInfo")

    let type_f = field property_info_struct "type" variant_type
    let name_f = field property_info_struct "name" string_name_ptr.plain

    let class_name_f =
      field property_info_struct "class_name" string_name_ptr.plain

    let hint_f = field property_info_struct "hint" uint32_t

    let hint_string_f =
      field property_info_struct "hint_string" string_ptr.plain

    let usage_f = field property_info_struct "usage" uint32_t
    let () = seal property_info_struct
    let s = typedef property_info_struct (M.typedef_name "PropertyInfo")
  end

  let property_info_ptr = M.ptr_suite "PropertyInfo" PropertyInfo.s

  module MethodInfo = struct
    type t

    let method_info_struct : t structure typ =
      structure (M.typedef_name "MethodInfo")

    let name_f = field method_info_struct "name" string_name_ptr.plain
    let return_value_f = field method_info_struct "return_value" PropertyInfo.s
    let flags_f = field method_info_struct "flags" uint32_t
    let id_f = field method_info_struct "id" int32_t
    let argument_count_f = field method_info_struct "argument_count" uint32_t
    let arguments_f = field method_info_struct "arguments" (ptr PropertyInfo.s)

    let default_argument_count_f =
      field method_info_struct "default_argument_count" uint32_t

    let default_arguments_f =
      field method_info_struct "default_arguments" variant_ptr.plain

    let () = seal method_info_struct
    let s = typedef method_info_struct (M.typedef_name "MethodInfo")
  end

  let class_get_property_list =
    fn_suite
      (M.typedef_name "ClassGetPropertyList")
      (class_instance_ptr.plain @-> ptr uint32_t
      @-> returning property_info_ptr.plain)

  let class_free_property_list =
    fn_suite
      (M.typedef_name "ClassFreePropertyList")
      (class_instance_ptr.plain @-> property_info_ptr.const @-> returning void)

  let class_property_can_revert =
    fn_suite
      (M.typedef_name "ClassFreePropertyCanRevert")
      (class_instance_ptr.plain @-> string_name_ptr.const @-> returning gbool)

  let class_property_get_revert =
    fn_suite
      (M.typedef_name "ClassFreePropertyGetRevert")
      (class_instance_ptr.plain @-> string_name_ptr.const @-> variant_ptr.plain
     @-> returning gbool)

  let class_property_validate_property =
    fn_suite
      (M.typedef_name "ClassFreePropertyValidateProperty")
      (class_instance_ptr.plain @-> property_info_ptr.plain @-> returning gbool)

  (* deprecated function was here *)
  let class_notification_2 =
    fn_suite
      (M.typedef_name "ClassNotification2")
      (class_instance_ptr.plain @-> int32_t @-> gbool @-> returning void)

  let class_to_string =
    fn_suite
      (M.typedef_name "ClassToString")
      (class_instance_ptr.plain @-> ptr gbool
      (* return value *) @-> returning string_ptr.plain (* also return value? *)
      )

  (* snip! *)

  let initialization_level = typedef enum (M.typedef_name "InitializationLevel")

  module InitializationLevel = struct
    let core = 0
    let servers = 1
    let scene = 2
    let editor = 3
    let max = 4
  end

  module Initialization = struct
    type t

    let initialization_struct : t structure typ =
      structure (M.typedef_name "Initialization")

    let init_func =
      fn_suite "InitFunc" (ptr void @-> initialization_level @-> returning void)

    let minimum_initialization_level_f =
      field initialization_struct "minimum_initialization_level"
        initialization_level

    let userdata_f = field initialization_struct "userdata" (ptr void)
    let initialize_f = field initialization_struct "initialize" init_func.typ

    let deinitialize_f =
      field initialization_struct "deinitialize" init_func.typ

    let () = seal initialization_struct
    let s = typedef initialization_struct (M.typedef_name "Initialization")
  end

  let interface_function_ptr = dynamic_funptr (void @-> returning void)

  module InterfaceFunctionPtr = (val interface_function_ptr)

  let interface_get_proc_address =
    fn_suite
      (M.typedef_name "InterfaceGetProcAddress")
      (string @-> returning InterfaceFunctionPtr.t)

  (* snip! *)

  let interface_string_name_new_with_utf8_chars =
    fn_suite
      (M.typedef_name "InterfaceStringNameNewWithUtf8Chars")
      (string_name_ptr.uninit @-> string @-> returning void)

  let interface_variant_get_ptr_constructor =
    fn_suite
      (M.typedef_name "InterfaceVariantGetPtrConstructor")
      (variant_type @-> int32_t @-> returning ptr_constructor.typ)

  let interface_variant_get_ptr_destructor =
    fn_suite
      (M.typedef_name "InterfaceVariantGetPtrDestructor")
      (variant_type @-> returning ptr_destructor.typ)

  (* turbo snip *)

  let interface_variant_get_ptr_operator_evaluator =
    fn_suite
      (M.typedef_name "InterfaceVariantGetPtrOperatorEvaluator")
      (variant_operator @-> variant_type @-> variant_type
      @-> returning PtrOperatorEvaluator.t)

  let interface_variant_get_ptr_utility_function =
    fn_suite
      (M.typedef_name "InterfaceVariantGetPtrUtilityFunction")
      (string_name_ptr.const @-> gint @-> returning PtrUtilityFunction.t)

  let interface_variant_get_ptr_builtin_method =
    fn_suite
      (M.typedef_name "InterfaceVariantGetPtrBuiltinMethod")
      (variant_type @-> string_name_ptr.const @-> gint
      @-> returning PtrBuiltinMethod.t)
end
