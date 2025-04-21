open! Base
open! Core
open Living
open Living_core.Default.Let_syntax
include Bootstrap

module type SUITE = sig
  open Living_ctypes.Default

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

module TypedSuite = struct
  open Living_ctypes.Default

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
  open Living_ctypes.Default
  open! PosixTypes
  open! Foreign
  module M = TypedSuite

  let enum = int
  let variant_type = typedef enum (M.typedef_name "VariantType")

  module VariantType = struct
    type t = int

    let typ = int
    let nil = 0
    let bool = 1
    let int = 2
    let float = 3
    let string = 4
    let vector2 = 5
    let vector2i = 6
    let rect2 = 7
    let rect2i = 8
    let vector3 = 9
    let vector3i = 10
    let transform2d = 11
    let vector4 = 12
    let vector4i = 13
    let plane = 14
    let quaternion = 15
    let aabb = 16
    let basis = 17
    let transform3d = 18
    let projection = 19
    let color = 20
    let string_name = 21
    let node_path = 22
    let rid = 23
    let object_ = 24
    let callable = 25
    let signal = 26
    let dictionary = 27
    let array = 28
    let packed_byte_array = 29
    let packed_int32_array = 30
    let packed_int64_array = 31
    let packed_float32_array = 32
    let packed_float64_array = 33
    let packed_string_array = 34
    let packed_vector2_array = 35
    let packed_vector3_array = 36
    let packed_color_array = 37
    let packed_color_array = 38
    let packed_vector4_array = 39
    let max = 40
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

    let call_ok =
      let ret =
        let* p = allocate_n ~count:1 s in
        let erf = p |-> error_f in
        let* () = erf <-@ 0 in
        let arf = p |-> argument_f in
        let* () = arf <-@ 0l in
        let exf = p |-> expected_f in
        let* () = exf <-@ 0l in
        Living_core.Default.return p
      in
      Living_core.Default.unsafe_free ret
  end

  type 'a fn_suite = {
    fn : 'a fn;
    typ : 'a typ;
    dyn : (module Funptr with type fn = 'a);
  }

  let fn_suite name fn =
    let typ = typedef (funptr fn) name in
    let dyn = dynamic_funptr fn in
    { fn; typ; dyn }

  let variant_from_type_constructor_func =
    fn_suite
      (M.typedef_name "VariantFromTypeConstructorFunc")
      (variant_ptr.uninit @-> type_ptr.plain @-> returning void)

  module VariantFromTypeConstructorFunc =
    (val variant_from_type_constructor_func.dyn)

  let get_variant_from_type_constructor =
    fn_suite
      (M.typedef_name "GetVariantFromTypeConstructor")
      (variant_type @-> returning VariantFromTypeConstructorFunc.t)

  module GetVariantFromTypeConstructor =
    (val get_variant_from_type_constructor.dyn)

  let variant_to_type_constructor_func =
    fn_suite
      (M.typedef_name "VariantToTypeConstructorFunc")
      (type_ptr.uninit @-> variant_ptr.plain @-> returning void)

  module VariantToTypeConstructorFunc =
    (val variant_to_type_constructor_func.dyn)

  let get_variant_to_type_constructor =
    fn_suite
      (M.typedef_name "GetVariantToTypeConstructor")
      (variant_type @-> returning VariantToTypeConstructorFunc.t)

  module GetVariantToTypeConstructor = (val get_variant_to_type_constructor.dyn)

  let variant_get_internal_ptr_func =
    fn_suite
      (M.typedef_name "VariantGetInternalPtrFunc")
      (variant_ptr.plain @-> returning (ptr void))

  module VariantGetInternalPtrFunc = (val variant_get_internal_ptr_func.dyn)

  let ptr_operator_evaluator =
    fn_suite ""
      (type_ptr.const @-> type_ptr.const @-> type_ptr.plain @-> returning void)

  module PtrOperatorEvaluator = (val ptr_operator_evaluator.dyn)

  let ptr_builtin_method =
    fn_suite ""
      (type_ptr.plain @-> ptr type_ptr.const @-> type_ptr.plain @-> int
     @-> returning void)

  module PtrBuiltinMethod = (val ptr_builtin_method.dyn)

  let ptr_constructor =
    fn_suite
      (M.typedef_name "PtrConstructor")
      (type_ptr.uninit @-> ptr type_ptr.const @-> returning void)

  module PtrConstructor = (val ptr_constructor.dyn)

  let ptr_destructor =
    fn_suite (M.typedef_name "PtrDestructor") (type_ptr.plain @-> returning void)

  module PtrDestructor = (val ptr_destructor.dyn)

  let ptr_setter =
    fn_suite
      (M.typedef_name "PtrSetter")
      (type_ptr.plain @-> type_ptr.const @-> returning void)

  module PtrSetter = (val ptr_setter.dyn)

  let ptr_getter =
    fn_suite
      (M.typedef_name "PtrGetter")
      (type_ptr.const @-> type_ptr.plain @-> returning void)

  module PtrGetter = (val ptr_getter.dyn)

  let ptr_indexed_setter =
    fn_suite
      (M.typedef_name "PtrIndexedSetter")
      (type_ptr.plain @-> gint @-> type_ptr.const @-> returning void)

  module PtrIndexedSetter = (val ptr_indexed_setter.dyn)

  let ptr_indexed_getter =
    fn_suite
      (M.typedef_name "PtrIndexedGetter")
      (type_ptr.const @-> gint @-> type_ptr.plain @-> returning void)

  module PtrIndexedGetter = (val ptr_indexed_getter.dyn)

  let ptr_keyed_setter =
    fn_suite
      (M.typedef_name "PtrKeyedSetter")
      (type_ptr.plain @-> type_ptr.const @-> type_ptr.const @-> returning void)

  module PtrKeyedSetter = (val ptr_keyed_setter.dyn)

  let ptr_keyed_getter =
    fn_suite
      (M.typedef_name "PtrKeyedGetter")
      (type_ptr.const @-> type_ptr.const @-> type_ptr.plain @-> returning void)

  module PtrKeyedGetter = (val ptr_keyed_getter.dyn)

  let ptr_keyed_checker =
    fn_suite
      (M.typedef_name "PtrKeyedChecker")
      (variant_ptr.const @-> variant_ptr.const @-> returning uint32_t)

  module PtrKeyedChecker = (val ptr_keyed_checker.dyn)

  let ptr_utility_function =
    fn_suite
      (M.typedef_name "PtrUtilityFunction")
      (type_ptr.plain @-> ptr type_ptr.const @-> int @-> returning void)

  module PtrUtilityFunction = (val ptr_utility_function.dyn)

  let variant_call =
    fn_suite
      (M.typedef_name "VariantCall")
      (variant_ptr.plain @-> string_name_ptr.const @-> ptr variant_ptr.const
     @-> gint @-> variant_ptr.uninit @-> ptr CallError.s @-> returning void)

  module VariantCall = (val variant_call.dyn)

  let variant_call_static =
    fn_suite
      (M.typedef_name "VariantCallStatic")
      (variant_type @-> string_name_ptr.const @-> ptr variant_ptr.const @-> gint
     @-> variant_ptr.uninit @-> ptr CallError.s @-> returning void)

  module VariantCallStatic = (val variant_call_static.dyn)

  let class_constructor =
    fn_suite
      (M.typedef_name "ClassConstructor")
      (void @-> returning object_ptr.plain)

  let instance_binding_create_callback =
    fn_suite
      (M.typedef_name "InstanceBindingCreateCallback")
      (ptr void @-> ptr void @-> returning (ptr void))

  module InstanceBindingCreateCallback =
    (val instance_binding_create_callback.dyn)

  let instance_binding_free_callback =
    fn_suite
      (M.typedef_name "InstanceBindingFreeCallback")
      (ptr void @-> ptr void @-> ptr void @-> returning void)

  module InstanceBindingFreeCallback = (val instance_binding_free_callback.dyn)

  let instance_binding_reference_callback =
    fn_suite
      (M.typedef_name "InstanceBindingReferenceCallback")
      (ptr void @-> ptr void @-> gbool @-> returning gbool)

  module InstanceBindingReferenceCallback =
    (val instance_binding_reference_callback.dyn)

  module InstanceBindingCallbacks = struct
    type t

    let instance_binding_callbacks_struct : t structure typ =
      structure (M.typedef_name "InstanceBindingCallbacks")

    let create_callback_f =
      field instance_binding_callbacks_struct "create_callback"
        InstanceBindingCreateCallback.t

    let free_callback_f =
      field instance_binding_callbacks_struct "free_callback"
        InstanceBindingFreeCallback.t

    let reference_callback_f =
      field instance_binding_callbacks_struct "reference_callback"
        InstanceBindingReferenceCallback.t

    let () = seal instance_binding_callbacks_struct

    let s =
      typedef instance_binding_callbacks_struct
        (M.typedef_name "InstanceBindingCallbacks")

    let default_create_callback =
      InstanceBindingCreateCallback.of_fun (fun _ _ -> null)

    let default_free_callback =
      InstanceBindingFreeCallback.of_fun (fun _ _ _ -> ())

    let default_reference_callback =
      InstanceBindingReferenceCallback.of_fun (fun _ _ _ ->
          Unsigned.UInt8.of_int 1)

    let make ?create_callback ?free_callback ?reference_callback allocator =
      let* ret = allocator s in
      let* () =
        ret |-> create_callback_f
        <-@ (create_callback |> Option.value ~default:default_create_callback)
      in
      let* () =
        ret |-> free_callback_f
        <-@ (free_callback |> Option.value ~default:default_free_callback)
      in
      let* () =
        ret |-> reference_callback_f
        <-@ (reference_callback
            |> Option.value ~default:default_reference_callback)
      in
      Living_core.Default.named_return "InstanceBindingCallbacks.make" ret
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

  module ClassSet = (val class_set.dyn)

  let class_get =
    fn_suite
      (M.typedef_name "ClassGet")
      (class_instance_ptr.plain @-> string_name_ptr.const @-> variant_ptr.plain
     @-> returning gbool)

  module ClassGet = (val class_get.dyn)

  let class_get_rid =
    fn_suite
      (M.typedef_name "ClassGetRID")
      (class_instance_ptr.plain @-> returning uint64_t)

  module ClassGetRID = (val class_get_rid.dyn)

  module PropertyInfo = struct
    open Living_ctypes.Default

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

    let make allocator type_ name class_name hint hint_string usage =
      let open Living_core.Default.Let_syntax in
      let* ret = allocator s in
      let* () = ret |-> type_f <-@ type_ in
      let* () = ret |-> name_f <-@ name in
      let* () = ret |-> class_name_f <-@ class_name in
      let* () = ret |-> hint_f <-@ hint in
      let* () = ret |-> hint_string_f <-@ hint_string in
      let* () = ret |-> usage_f <-@ usage in
      Living_core.Default.return ret
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

  module ClassGetPropertyList = (val class_get_property_list.dyn)

  let class_free_property_list =
    fn_suite
      (M.typedef_name "ClassFreePropertyList")
      (class_instance_ptr.plain @-> property_info_ptr.const @-> returning void)

  module ClassFreePropertyList = (val class_free_property_list.dyn)

  let class_free_property_list2 =
    fn_suite
      (M.typedef_name "ClassFreePropertyList2")
      (class_instance_ptr.plain @-> property_info_ptr.const @-> uint32_t
     @-> returning void)

  module ClassFreePropertyList2 = (val class_free_property_list2.dyn)

  let class_property_can_revert =
    fn_suite
      (M.typedef_name "ClassFreePropertyCanRevert")
      (class_instance_ptr.plain @-> string_name_ptr.const @-> returning gbool)

  module ClassPropertyCanRevert = (val class_property_can_revert.dyn)

  let class_property_get_revert =
    fn_suite
      (M.typedef_name "ClassFreePropertyGetRevert")
      (class_instance_ptr.plain @-> string_name_ptr.const @-> variant_ptr.plain
     @-> returning gbool)

  module ClassPropertyGetRevert = (val class_property_get_revert.dyn)

  let class_validate_property =
    fn_suite
      (M.typedef_name "ClassValidateProperty")
      (class_instance_ptr.plain @-> property_info_ptr.plain @-> returning gbool)

  module ClassValidateProperty = (val class_validate_property.dyn)

  (* deprecated function was here *)

  let class_notification2 =
    fn_suite
      (M.typedef_name "ClassNotification2")
      (class_instance_ptr.plain @-> int32_t @-> gbool @-> returning void)

  module ClassNotification2 = (val class_notification2.dyn)

  let class_to_string =
    fn_suite
      (M.typedef_name "ClassToString")
      (class_instance_ptr.plain
      @-> ptr gbool (* return value *)
      @-> string_ptr.plain (* also return value? *) @-> returning void)

  module ClassToString = (val class_to_string.dyn)

  let class_reference = fn_suite "" (class_instance_ptr.plain @-> returning void)

  module ClassReference = (val class_reference.dyn)

  let class_unreference =
    fn_suite "" (class_instance_ptr.plain @-> returning void)

  module ClassUnreference = (val class_unreference.dyn)

  let class_call_virtual =
    fn_suite ""
      (class_instance_ptr.plain @-> ptr type_ptr.const @-> type_ptr.plain
     @-> returning void)

  module ClassCallVirtual = (val class_call_virtual.dyn)

  let class_create_instance =
    fn_suite "" (ptr void @-> returning object_ptr.plain)

  module ClassCreateInstance = (val class_create_instance.dyn)

  let class_create_instance2 =
    fn_suite "" (ptr void @-> gbool @-> returning object_ptr.plain)

  module ClassCreateInstance2 = (val class_create_instance2.dyn)

  let class_free_instance =
    fn_suite "" (ptr void @-> class_instance_ptr.plain @-> returning void)

  module ClassFreeInstance = (val class_free_instance.dyn)

  let class_recreate_instance =
    fn_suite ""
      (ptr void @-> object_ptr.plain @-> returning class_instance_ptr.plain)

  module ClassRecreateInstance = (val class_recreate_instance.dyn)

  let class_get_virtual =
    fn_suite ""
      (ptr void @-> string_name_ptr.const @-> returning ClassCallVirtual.t)

  module ClassGetVirtual = (val class_get_virtual.dyn)

  let class_get_virtual2 =
    fn_suite ""
      (ptr void @-> string_name_ptr.const @-> uint32_t
      @-> returning ClassCallVirtual.t)

  module ClassGetVirtual2 = (val class_get_virtual2.dyn)

  let class_get_virtual_call_data =
    fn_suite "" (ptr void @-> string_name_ptr.const @-> returning (ptr void))

  module ClassGetVirtualCallData = (val class_get_virtual_call_data.dyn)

  let class_get_virtual_call_data2 =
    fn_suite ""
      (ptr void @-> string_name_ptr.const @-> uint32_t @-> returning (ptr void))

  module ClassGetVirtualCallData2 = (val class_get_virtual_call_data2.dyn)

  let class_call_virtual_with_data =
    fn_suite ""
      (class_instance_ptr.plain @-> string_name_ptr.const @-> ptr void
     @-> ptr type_ptr.const @-> returning type_ptr.plain)

  module ClassCallVirtualWithData = (val class_call_virtual_with_data.dyn)

  module ClassCreationInfo4 = struct
    open Living_ctypes.Default

    type t

    let class_creation_info2_struct : t structure typ =
      structure (M.typedef_name "ClassCreationInfo2")

    let is_virtual_f = field class_creation_info2_struct "is_virtual" gbool
    let is_abstract_f = field class_creation_info2_struct "is_abstract" gbool
    let is_exposed_f = field class_creation_info2_struct "is_exposed" gbool
    let is_runtime_f = field class_creation_info2_struct "is_runtime" gbool

    let icon_path_f =
      field class_creation_info2_struct "icon_path" string_ptr.const

    let set_func_f = field class_creation_info2_struct "set_func" ClassSet.t_opt
    let get_func_f = field class_creation_info2_struct "get_func" ClassGet.t_opt

    let get_property_list_func_f =
      field class_creation_info2_struct "get_property_list_func"
        ClassGetPropertyList.t_opt

    let free_property_list_func_f =
      field class_creation_info2_struct "free_property_list_func"
        ClassFreePropertyList2.t_opt

    let property_can_revert_func_f =
      field class_creation_info2_struct "property_can_revert_func"
        ClassPropertyCanRevert.t_opt

    let property_get_revert_func_f =
      field class_creation_info2_struct "property_get_revert_func"
        ClassPropertyGetRevert.t_opt

    let validate_property_func_f =
      field class_creation_info2_struct "validate_property_func"
        ClassValidateProperty.t_opt

    let notification_func_f =
      field class_creation_info2_struct "notification_func"
        ClassNotification2.t_opt

    let to_string_func_f =
      field class_creation_info2_struct "to_string_func" ClassToString.t_opt

    let reference_func_f =
      field class_creation_info2_struct "reference_func" ClassReference.t_opt

    let unreference_func_f =
      field class_creation_info2_struct "unreference_func"
        ClassUnreference.t_opt

    let create_instance_func_f =
      field class_creation_info2_struct "create_instance_func"
        ClassCreateInstance2.t

    let free_instance_func_f =
      field class_creation_info2_struct "free_instance_func" ClassFreeInstance.t

    let recreate_instance_func_f =
      field class_creation_info2_struct "recreate_instance_func"
        ClassRecreateInstance.t_opt

    let get_virtual_func_f =
      field class_creation_info2_struct "get_virtual_func"
        ClassGetVirtual2.t_opt

    let get_virtual_call_data_func_f =
      field class_creation_info2_struct "get_virtual_call_data_func"
        ClassGetVirtualCallData2.t_opt

    let call_virtual_with_data_func_f =
      field class_creation_info2_struct "call_virtual_with_data_func"
        ClassCallVirtualWithData.t_opt

    let get_rid_func_f =
      field class_creation_info2_struct "get_rid_func" ClassGetRID.t_opt

    let class_userdata_f =
      field class_creation_info2_struct "class_userdata" (ptr void)

    let () = seal class_creation_info2_struct

    let s =
      typedef class_creation_info2_struct (M.typedef_name "ClassCreationInfo2")

    let make allocator ?is_virtual ?is_abstract ?is_exposed ?is_runtime
        ?icon_path ?get ?set ?get_property_list ?free_property_list
        ?property_can_revert ?property_get_revert ?validate_property
        ?notification ?to_string ?reference ?unreference ?recreate_instance
        ?get_virtual ?get_virtual_call_data ?call_virtual_with_data ?get_rid
        ?class_userdata create_instance free_instance :
        t structure ptr Living_core.Default.t =
      let open Living_core.Default.Let_syntax in
      let debooleanize : bool -> Unsigned.UInt8.t =
       fun x -> Unsigned.UInt8.of_int (if x then 1 else 0)
      in
      let* ret = allocator s in
      let* () =
        ret |-> is_virtual_f
        <-@ (is_virtual |> Option.value ~default:false |> debooleanize)
      in
      let* () =
        ret |-> is_abstract_f
        <-@ (is_abstract |> Option.value ~default:false |> debooleanize)
      in
      let* () =
        ret |-> is_exposed_f
        <-@ (is_exposed |> Option.value ~default:true |> debooleanize)
      in
      let* () =
        ret |-> is_exposed_f
        <-@ (is_runtime |> Option.value ~default:true |> debooleanize)
      in
      let* () =
        ret |-> icon_path_f
        <-@ (icon_path
            |> Option.value ~default:(coerce (ptr void) string_ptr.const null))
      in
      let* () = ret |-> get_func_f <-@ get in
      let* () = ret |-> set_func_f <-@ set in
      let* () = ret |-> get_property_list_func_f <-@ get_property_list in
      let* () = ret |-> free_property_list_func_f <-@ free_property_list in
      let* () = ret |-> property_can_revert_func_f <-@ property_can_revert in
      let* () = ret |-> property_get_revert_func_f <-@ property_get_revert in
      let* () = ret |-> validate_property_func_f <-@ validate_property in
      let* () = ret |-> notification_func_f <-@ notification in
      let* () = ret |-> to_string_func_f <-@ to_string in
      let* () = ret |-> reference_func_f <-@ reference in
      let* () = ret |-> unreference_func_f <-@ unreference in
      let* () = ret |-> create_instance_func_f <-@ create_instance in
      let* () = ret |-> free_instance_func_f <-@ free_instance in
      let* () = ret |-> recreate_instance_func_f <-@ recreate_instance in
      let* () = ret |-> get_virtual_func_f <-@ get_virtual in
      let* () =
        ret |-> get_virtual_call_data_func_f <-@ get_virtual_call_data
      in
      let* () =
        ret |-> call_virtual_with_data_func_f <-@ call_virtual_with_data
      in
      let* () = ret |-> get_rid_func_f <-@ get_rid in
      let* () =
        ret |-> class_userdata_f
        <-@ (class_userdata |> Option.value ~default:null)
      in
      Living_core.Default.return ret
  end

  type class_library_ptr

  let class_library_ptr : class_library_ptr M.ptr_suite =
    M.ptr_suite "Variant" (structure "gdoclasslib")

  (* METHOD *)

  module ClassMethodFlags = struct
    type t = Unsigned.UInt32.t

    let typ = uint32_t
    let normal = Unsigned.UInt32.of_int 1
    let editor = Unsigned.UInt32.of_int 2
    let const = Unsigned.UInt32.of_int 4
    let virtual_ = Unsigned.UInt32.of_int 8
    let vararg = Unsigned.UInt32.of_int 16
    let static = Unsigned.UInt32.of_int 32
    let default = normal
  end

  module ClassMethodArgumentMetadata = struct
    type t = int

    let typ = int
    let none = 0
    let int_is_int8 = 1
    let int_is_int16 = 2
    let int_is_int32 = 3
    let int_is_int64 = 4
    let int_is_uint8 = 5
    let int_is_uint16 = 6
    let int_is_uint32 = 7
    let int_is_uint64 = 8
    let real_is_float = 9
    let real_is_double = 10
    let int_is_char16 = 11
    let int_is_char32 = 12
  end

  let class_method_call =
    fn_suite ""
      (ptr void @-> class_instance_ptr.plain @-> ptr variant_ptr.const @-> gint
     @-> variant_ptr.plain @-> ptr CallError.s @-> returning void)

  module ClassMethodCall = (val class_method_call.dyn)

  let class_method_validated_call =
    fn_suite ""
      (ptr void @-> class_instance_ptr.plain @-> ptr variant_ptr.const
     @-> variant_ptr.plain @-> returning void)

  module ClassMethodValidatedCall = (val class_method_validated_call.dyn)

  let class_method_ptr_call =
    fn_suite ""
      (ptr void @-> class_instance_ptr.plain @-> ptr variant_ptr.const
     @-> type_ptr.plain @-> returning void)

  module ClassMethodPtrCall = (val class_method_ptr_call.dyn)

  module ClassMethodInfo = struct
    open Living_ctypes.Default

    type t

    let s : t structure typ = structure "gdoclassmethodinfo"
    let name_f = field s "name" string_name_ptr.plain
    let method_userdata_f = field s "method_userdata" (ptr void)
    let call_func_f = field s "call_func" ClassMethodCall.t
    let ptrcall_func_f = field s "ptrcall_func" ClassMethodPtrCall.t
    let method_flags_f = field s "method_flags" uint32_t
    let has_return_value_f = field s "has_return_value" gbool

    let return_value_info_f =
      field s "return_value_info" property_info_ptr.plain

    let return_value_metadata_f = field s "return_value_metadata" int
    let argument_count_f = field s "argument_count" uint32_t
    let arguments_info_f = field s "arguments_info" property_info_ptr.plain

    let arguments_metadata_f =
      field s "arguments_metadata" (ptr ClassMethodArgumentMetadata.typ)

    let default_argument_count_f = field s "default_argument_count" uint32_t

    let default_arguments_f =
      field s "default_arguments" (ptr variant_ptr.plain)

    let () = seal s

    let make ?method_userdata ?method_flags ?return_value_info
        ?return_value_metadata ?default_argument_count ?default_arguments
        allocator name has_return_value argument_count arguments_info
        arguments_metadata call_func ptrcall_func =
      let open Living_core.Default.Let_syntax in
      let debooleanize : bool -> Unsigned.UInt8.t =
       fun x -> Unsigned.UInt8.of_int (if x then 1 else 0)
      in
      let* ret = allocator s in
      let* () = ret |-> name_f <-@ name in
      let* () =
        ret |-> method_userdata_f
        <-@ (method_userdata |> Option.value ~default:null)
      in
      let* () = ret |-> call_func_f <-@ call_func in
      let* () = ret |-> ptrcall_func_f <-@ ptrcall_func in
      let* () =
        ret |-> method_flags_f
        <-@ (method_flags |> Option.value ~default:ClassMethodFlags.default)
      in
      let* () = ret |-> has_return_value_f <-@ debooleanize has_return_value in
      let* () =
        ret |-> return_value_info_f
        <-@ (return_value_info
            |> Option.value
                 ~default:(coerce (ptr void) property_info_ptr.plain null))
      in
      let* () =
        ret |-> return_value_metadata_f
        <-@ (return_value_metadata
            |> Option.value ~default:ClassMethodArgumentMetadata.none)
      in
      let* () = ret |-> argument_count_f <-@ argument_count in
      let* () = ret |-> arguments_info_f <-@ arguments_info in
      let* () = ret |-> arguments_metadata_f <-@ arguments_metadata in
      let* () =
        ret |-> default_argument_count_f
        <-@ (default_argument_count
            |> Option.value ~default:(Unsigned.UInt32.of_int 0))
      in
      let* () =
        ret |-> default_arguments_f
        <-@ (default_arguments
            |> Option.value
                 ~default:(coerce (ptr void) (ptr variant_ptr.plain) null))
      in
      Living_core.Default.return ret
  end

  module ClassVirtualMethodInfo = struct
    type t

    let s : t structure typ = structure "gdoclassvirtualmethodinfo"
    let name_f = field s "name" string_name_ptr.plain
    let method_flags_f = field s "method_flags" uint32_t
    let return_value_f = field s "return_value" PropertyInfo.s

    let return_value_metadata_f =
      field s "return_value_metadata" ClassMethodArgumentMetadata.typ

    let argument_count_f = field s "argument_count" uint32_t
    let arguments_f = field s "arguments" (ptr PropertyInfo.s)

    let arguments_metadata_f =
      field s "arguments_metadata" (ptr ClassMethodArgumentMetadata.typ)

    let () = seal s

    let make ?method_flags ?return_value_metadata allocator name return_value
        argument_count arguments arguments_metadata =
      let open Living_core.Default.Let_syntax in
      let* ret = allocator s in
      let* () = ret |-> name_f <-@ name in
      let* () =
        ret |-> method_flags_f
        <-@ Option.value ~default:ClassMethodFlags.default method_flags
      in
      let* () = ret |-> return_value_f <-@ return_value in
      let* () =
        ret |-> return_value_metadata_f
        <-@ Option.value ~default:ClassMethodArgumentMetadata.none
              return_value_metadata
      in
      let* () = ret |-> argument_count_f <-@ argument_count in
      let* () = ret |-> arguments_f <-@ arguments in
      let* () = ret |-> arguments_metadata_f <-@ arguments_metadata in
      Living_core.Default.return ret
  end

  (* CALLABLE *)

  let callable_custom_call =
    fn_suite ""
      (ptr void @-> ptr variant_ptr.const @-> gint @-> variant_ptr.plain
     @-> ptr CallError.s @-> returning void)

  module CallableCustomCall = (val callable_custom_call.dyn)

  let callable_custom_is_valid = fn_suite "" (ptr void @-> returning gbool)

  module CallablCustomIsValid = (val callable_custom_is_valid.dyn)

  let callable_custom_free = fn_suite "" (ptr void @-> returning void)

  module CallableCustomFree = (val callable_custom_free.dyn)

  let callable_custom_hash = fn_suite "" (ptr void @-> returning uint32_t)

  module CallableCustomHash = (val callable_custom_hash.dyn)

  let callable_custom_equal =
    fn_suite "" (ptr void @-> ptr void @-> returning gbool)

  module CallableCustomEqual = (val callable_custom_equal.dyn)

  let callable_custom_less_than =
    fn_suite "" (ptr void @-> ptr void @-> returning gbool)

  module CallableCustomLessThan = (val callable_custom_less_than.dyn)

  let callable_custom_to_string =
    fn_suite "" (ptr void @-> ptr gbool @-> string_ptr.plain @-> returning void)

  module CallableCustomToString = (val callable_custom_to_string.dyn)

  let callable_custom_get_argument_count =
    fn_suite "" (ptr void @-> returning int)

  module CallableCustomGetArgumentCount =
    (val callable_custom_get_argument_count.dyn)

  module CallableInfoStruct2 = struct
    open Living_ctypes.Default

    type t

    let s : t structure typ = structure "gdocallableinfostruct2"
    let callable_userdata_f = field s "callable_userdata" (ptr void)
    let token_f = field s "token" class_library_ptr.plain
    let object_id_f = field s "object_id" instance_id
    let call_func_f = field s "call_func" CallableCustomCall.t
    let is_valid_func_f = field s "is_valid_func" CallablCustomIsValid.t_opt
    let free_func_f = field s "free_func" CallableCustomFree.t_opt
    let hash_func_f = field s "hash_func" CallableCustomHash.t_opt
    let equal_func_f = field s "equal_func" CallableCustomEqual.t_opt
    let less_than_func_f = field s "less_than_func" CallableCustomLessThan.t_opt
    let to_string_func_f = field s "to_string_func" CallableCustomToString.t_opt

    let get_argument_count_func_f =
      field s "get_argument_count_func" CallableCustomGetArgumentCount.t_opt

    let () = seal s

    let make ?callable_userdata ?object_id ?is_valid_func ?free_func ?hash_func
        ?equal_func ?less_than_func ?to_string_func ?get_argument_count_func
        allocator token call_func : t structure ptr Living_core.Default.t =
      let open Living_core.Default.Let_syntax in
      let* ret = allocator s in
      let* () =
        ret |-> callable_userdata_f
        <-@ (callable_userdata |> Option.value ~default:null)
      in
      let* () = ret |-> token_f <-@ token in
      let* () =
        ret |-> object_id_f
        <-@ (object_id |> Option.value ~default:(Unsigned.UInt64.of_int64 0L))
      in
      let* () = ret |-> call_func_f <-@ call_func in
      let* () = ret |-> is_valid_func_f <-@ is_valid_func in
      let* () = ret |-> free_func_f <-@ free_func in
      let* () = ret |-> hash_func_f <-@ hash_func in
      let* () = ret |-> equal_func_f <-@ equal_func in
      let* () = ret |-> less_than_func_f <-@ less_than_func in
      let* () = ret |-> to_string_func_f <-@ to_string_func in
      let* () = ret |-> get_argument_count_func_f <-@ get_argument_count_func in
      Living_core.Default.return ret
  end

  (* snip! *)

  let initialization_level = typedef enum (M.typedef_name "InitializationLevel")

  module InitializationLevel = struct
    type t = int

    let typ = int
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

    module InitFunc = (val init_func.dyn)

    let minimum_initialization_level_f =
      field initialization_struct "minimum_initialization_level"
        initialization_level

    let userdata_f = field initialization_struct "userdata" (ptr void)
    let initialize_f = field initialization_struct "initialize" InitFunc.t
    let deinitialize_f = field initialization_struct "deinitialize" InitFunc.t
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

  let interface_string_new_with_utf8_chars =
    fn_suite
      (M.typedef_name "InterfaceStringNewWithUtf8Chars")
      (string_ptr.uninit @-> string @-> returning void)

  let interface_string_to_utf8_chars =
    fn_suite
      (M.typedef_name "InterfaceStringToUtf8Chars")
      (string_ptr.const @-> ptr char @-> gint @-> returning gint)

  let interface_variant_new_copy =
    fn_suite (M.typedef_name "")
      (variant_ptr.uninit @-> variant_ptr.const @-> returning void)

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

  let interface_classdb_construct_object =
    fn_suite "" (string_name_ptr.const @-> returning object_ptr.plain)

  module ClassDBConstructObject = (val interface_classdb_construct_object.dyn)

  let interface_global_get_singleton =
    fn_suite "" (string_name_ptr.const @-> returning object_ptr.plain)

  let interface_object_set_instance =
    fn_suite ""
      (object_ptr.plain @-> string_name_ptr.const @-> class_instance_ptr.plain
     @-> returning void)

  let interface_object_set_instance_binding =
    fn_suite ""
      (object_ptr.plain @-> ptr void @-> ptr void
      @-> ptr InstanceBindingCallbacks.s
      @-> returning void)

  let interface_object_cast_to =
    fn_suite ""
      (object_ptr.plain @-> ptr void @-> returning class_instance_ptr.plain)

  let interface_object_get_instance_id =
    fn_suite "" (object_ptr.const @-> returning instance_id)

  let interface_object_method_bind_ptrcall =
    fn_suite ""
      (method_bind_ptr.const @-> object_ptr.plain @-> ptr type_ptr.const
     @-> type_ptr.plain @-> returning void)

  let interface_classdb_get_method_bind =
    fn_suite ""
      (string_name_ptr.const @-> string_name_ptr.const @-> gint (* hash *)
      @-> returning method_bind_ptr.const)

  let interface_get_class_tag =
    fn_suite "" (string_name_ptr.const @-> returning (ptr void))

  let interface_callable_custom_create2 =
    fn_suite ""
      (type_ptr.uninit @-> ptr CallableInfoStruct2.s @-> returning void)

  let interface_classdb_register_extension_class4 =
    fn_suite ""
      (class_library_ptr.plain @-> string_name_ptr.const
     @-> string_name_ptr.const @-> ptr ClassCreationInfo4.s @-> returning void)

  let interface_classdb_register_extension_class_method =
    fn_suite ""
      (class_library_ptr.plain @-> string_name_ptr.const
     @-> ptr ClassMethodInfo.s @-> returning void)

  let interface_classdb_register_extension_class_property =
    fn_suite ""
      (class_library_ptr.plain @-> string_name_ptr.const @-> ptr PropertyInfo.s
     @-> string_name_ptr.const @-> string_name_ptr.const @-> returning void)

  let interface_classdb_register_extension_class_signal =
    fn_suite ""
      (class_library_ptr.plain @-> string_name_ptr.const
     @-> string_name_ptr.const @-> ptr PropertyInfo.s @-> gint
     @-> returning void)
end
