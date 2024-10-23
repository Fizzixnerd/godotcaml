open! Base
open Living
open Living_ctypes.Default
open Godotcaml_base
open Godotcaml
open C
module Suite = TypedSuite
module Godotcaml = Godotcaml
open Foreign_base
open Foreign_arrays

let foreign_method0 method_name _fn ret_typ ret_to_variant ret_of_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = Int64.of_int 0 in
  fun base ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce_ptr variant_ptr.uninit)
        (Living_core.Default.map ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        foreign_array0
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    Living_core.Default.named_return method_name
      (if is_error err then raise (to_exn err) else ret_of_variant ret)

let foreign_method0_void_static method_name _fn _ret_typ _ret_to_variant
    _ret_of_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = Int64.of_int 0 in
  fun () ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr variant_ptr.uninit null in
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        foreign_array0
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call_static () VariantType.object_ sn arr count ret err)
    in
    Living_core.Default.named_return method_name
      (if is_error err then raise (to_exn err) else ())

let foreign_method0v method_name _fn ret_typ ret_to_variant ret_of_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  fun vs base ->
    let open Living_core.Default.Let_syntax in
    let count = Int64.of_int (List.length vs) in
    let* ret =
      Living_core.Default.map
        (coerce_ptr variant_ptr.uninit)
        (Living_core.Default.map ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_arrayv vs)
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    Living_core.Default.named_return method_name
      (if is_error err then raise (to_exn err) else ret_of_variant ret)

let foreign_method0_static method_name _fn ret_typ ret_to_variant ret_of_variant
    _x_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = Int64.of_int 0 in
  fun () ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce_ptr variant_ptr.uninit)
        (Living_core.Default.map ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        foreign_array0
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call_static () VariantType.object_ sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    Living_core.Default.named_return method_name
      (if is_error err then raise (to_exn err) else ret_of_variant ret)

let foreign_method0_void method_name _fn _ret_typ _ret_to_variant
    _ret_of_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = Int64.of_int 0 in
  fun base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr variant_ptr.uninit null in
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        foreign_array0
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    Living_core.Default.named_return method_name
      (if is_error err then raise (to_exn err) else ())

let foreign_method1v_void method_name _fn _ret_typ _ret_to_variant
    _ret_of_variant x_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  fun x vs base ->
    let open Living_core.Default.Let_syntax in
    let count = Int64.of_int (1 + VariadicVariants.length vs) in
    let ret = coerce_ptr variant_ptr.uninit null in
    let x' = x_to_variant x in
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_arrayv (coerce_ptr variant_ptr.const x' :: vs))
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    Living_core.Default.named_return method_name
      (if is_error err then raise (to_exn err) else ())

let foreign_method1_void_static method_name _fn _ret_typ _ret_to_variant
    _ret_of_variant x_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = Int64.of_int 1 in
  fun x ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr variant_ptr.uninit null in
    let x' = x_to_variant x in
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array1 x')
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call_static () VariantType.object_ sn arr count ret err)
    in
    Living_core.Default.named_return method_name
      (if is_error err then raise (to_exn err) else ())

let foreign_method2_void_static method_name _fn _ret_typ _ret_to_variant
    _ret_of_variant x_to_variant y_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = Int64.of_int 2 in
  fun x y ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr variant_ptr.uninit null in
    let x' = x_to_variant x in
    let y' = y_to_variant y in
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array2 x' y')
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call_static () VariantType.object_ sn arr count ret err)
    in
    Living_core.Default.named_return method_name
      (if is_error err then raise (to_exn err) else ())

let foreign_method2v_void method_name _fn _ret_typ _ret_to_variant
    _ret_of_variant x_to_variant y_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  fun x y vs base ->
    let open Living_core.Default.Let_syntax in
    let count = Int64.of_int (2 + VariadicVariants.length vs) in
    let ret = coerce_ptr variant_ptr.uninit null in
    let x' = x_to_variant x in
    let y' = y_to_variant y in
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_arrayv
           (coerce_ptr variant_ptr.const x'
           :: coerce_ptr variant_ptr.const y'
           :: vs))
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    Living_core.Default.named_return method_name
      (if is_error err then raise (to_exn err) else ())

let foreign_method3v_void method_name _fn _ret_typ _ret_to_variant
    _ret_of_variant x_to_variant y_to_variant z_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  fun x y z vs base ->
    let open Living_core.Default.Let_syntax in
    let count = Int64.of_int (3 + VariadicVariants.length vs) in
    let ret = coerce_ptr variant_ptr.uninit null in
    let x' = x_to_variant x in
    let y' = y_to_variant y in
    let z' = z_to_variant z in
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_arrayv
           (coerce_ptr variant_ptr.const x'
           :: coerce_ptr variant_ptr.const y'
           :: coerce_ptr variant_ptr.const z'
           :: vs))
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    Living_core.Default.named_return method_name
      (if is_error err then raise (to_exn err) else ())

let foreign_method1 method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 1L in
  fun x0 base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let x0' = x0_to_variant x0 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array1 x0')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method1v method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  fun x0 vs base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let count = Int64.of_int (1 + VariadicVariants.length vs) in
    let x0' = coerce_ptr variant_ptr.const (x0_to_variant x0) in
    (* let x' = coerce_ptr variant_ptr.const (x_to_variant x) in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_arrayv (x0' :: vs))
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    Living_core.Default.named_return method_name
      (if is_error err then raise (to_exn err) else ret_of_variant ret)

let foreign_method1_static method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? (Make it thread local?) *)
  let err = global_call_error in
  let count = 1L in
  fun x0 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (fun r ->
             coerce_ptr variant_ptr.uninit (ret_to_variant r))
    in
    let x0' = x0_to_variant x0 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array1 x0')
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call_static () VariantType.object_ sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method1_void method_name _fn _ret_typ _ret_to_variant
    _ret_of_variant x0_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 1L in
  fun x0 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr variant_ptr.uninit null in
    let x0' = x0_to_variant x0 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array1 x0')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name ()

let foreign_method2 method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 2L in
  fun x0 x1 base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array2 x0' x1')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method2v method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  fun x0 x1 vs base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let count = Int64.of_int (2 + VariadicVariants.length vs) in
    let x0' = coerce_ptr variant_ptr.const (x0_to_variant x0) in
    let x1' = coerce_ptr variant_ptr.const (x1_to_variant x1) in
    (* let x' = coerce_ptr variant_ptr.const (x_to_variant x) in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_arrayv (x0' :: x1' :: vs))
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    Living_core.Default.named_return method_name
      (if is_error err then raise (to_exn err) else ret_of_variant ret)

let foreign_method2_static method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? (Make it thread local?) *)
  let err = global_call_error in
  let count = 2L in
  fun x0 x1 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (fun r ->
             coerce_ptr variant_ptr.uninit (ret_to_variant r))
    in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array2 x0' x1')
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call_static () VariantType.object_ sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method2_void method_name _fn _ret_typ _ret_to_variant
    _ret_of_variant x0_to_variant x1_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 2L in
  fun x0 x1 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr variant_ptr.uninit null in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array2 x0' x1')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name ()

let foreign_method3 method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 3L in
  fun x0 x1 x2 base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array3 x0' x1' x2')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method3v method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  fun x0 x1 x2 vs base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let count = Int64.of_int (3 + VariadicVariants.length vs) in
    let x0' = coerce_ptr variant_ptr.const (x0_to_variant x0) in
    let x1' = coerce_ptr variant_ptr.const (x1_to_variant x1) in
    let x2' = coerce_ptr variant_ptr.const (x2_to_variant x2) in
    (* let x' = coerce_ptr variant_ptr.const (x_to_variant x) in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_arrayv (x0' :: x1' :: x2' :: vs))
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    Living_core.Default.named_return method_name
      (if is_error err then raise (to_exn err) else ret_of_variant ret)

let foreign_method3_static method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? (Make it thread local?) *)
  let err = global_call_error in
  let count = 3L in
  fun x0 x1 x2 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (fun r ->
             coerce_ptr variant_ptr.uninit (ret_to_variant r))
    in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array3 x0' x1' x2')
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call_static () VariantType.object_ sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method3_void method_name _fn _ret_typ _ret_to_variant
    _ret_of_variant x0_to_variant x1_to_variant x2_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 3L in
  fun x0 x1 x2 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr variant_ptr.uninit null in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array3 x0' x1' x2')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name ()

let foreign_method4 method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 4L in
  fun x0 x1 x2 x3 base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array4 x0' x1' x2' x3')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method4v method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  fun x0 x1 x2 x3 vs base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let count = Int64.of_int (4 + VariadicVariants.length vs) in
    let x0' = coerce_ptr variant_ptr.const (x0_to_variant x0) in
    let x1' = coerce_ptr variant_ptr.const (x1_to_variant x1) in
    let x2' = coerce_ptr variant_ptr.const (x2_to_variant x2) in
    let x3' = coerce_ptr variant_ptr.const (x3_to_variant x3) in
    (* let x' = coerce_ptr variant_ptr.const (x_to_variant x) in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_arrayv (x0' :: x1' :: x2' :: x3' :: vs))
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    Living_core.Default.named_return method_name
      (if is_error err then raise (to_exn err) else ret_of_variant ret)

let foreign_method4_static method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? (Make it thread local?) *)
  let err = global_call_error in
  let count = 4L in
  fun x0 x1 x2 x3 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (fun r ->
             coerce_ptr variant_ptr.uninit (ret_to_variant r))
    in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array4 x0' x1' x2' x3')
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call_static () VariantType.object_ sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method4_void method_name _fn _ret_typ _ret_to_variant
    _ret_of_variant x0_to_variant x1_to_variant x2_to_variant x3_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 4L in
  fun x0 x1 x2 x3 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr variant_ptr.uninit null in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array4 x0' x1' x2' x3')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name ()

let foreign_method5 method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant x4_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 5L in
  fun x0 x1 x2 x3 x4 base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array5 x0' x1' x2' x3' x4')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method5v method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant x4_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  fun x0 x1 x2 x3 x4 vs base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let count = Int64.of_int (5 + VariadicVariants.length vs) in
    let x0' = coerce_ptr variant_ptr.const (x0_to_variant x0) in
    let x1' = coerce_ptr variant_ptr.const (x1_to_variant x1) in
    let x2' = coerce_ptr variant_ptr.const (x2_to_variant x2) in
    let x3' = coerce_ptr variant_ptr.const (x3_to_variant x3) in
    let x4' = coerce_ptr variant_ptr.const (x4_to_variant x4) in
    (* let x' = coerce_ptr variant_ptr.const (x_to_variant x) in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_arrayv (x0' :: x1' :: x2' :: x3' :: x4' :: vs))
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    Living_core.Default.named_return method_name
      (if is_error err then raise (to_exn err) else ret_of_variant ret)

let foreign_method5_static method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant x4_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? (Make it thread local?) *)
  let err = global_call_error in
  let count = 5L in
  fun x0 x1 x2 x3 x4 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (fun r ->
             coerce_ptr variant_ptr.uninit (ret_to_variant r))
    in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array5 x0' x1' x2' x3' x4')
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call_static () VariantType.object_ sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method5_void method_name _fn _ret_typ _ret_to_variant
    _ret_of_variant x0_to_variant x1_to_variant x2_to_variant x3_to_variant
    x4_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 5L in
  fun x0 x1 x2 x3 x4 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr variant_ptr.uninit null in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array5 x0' x1' x2' x3' x4')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name ()

let foreign_method6 method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant x4_to_variant
    x5_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 6L in
  fun x0 x1 x2 x3 x4 x5 base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array6 x0' x1' x2' x3' x4' x5')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method6v method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant x4_to_variant
    x5_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  fun x0 x1 x2 x3 x4 x5 vs base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let count = Int64.of_int (6 + VariadicVariants.length vs) in
    let x0' = coerce_ptr variant_ptr.const (x0_to_variant x0) in
    let x1' = coerce_ptr variant_ptr.const (x1_to_variant x1) in
    let x2' = coerce_ptr variant_ptr.const (x2_to_variant x2) in
    let x3' = coerce_ptr variant_ptr.const (x3_to_variant x3) in
    let x4' = coerce_ptr variant_ptr.const (x4_to_variant x4) in
    let x5' = coerce_ptr variant_ptr.const (x5_to_variant x5) in
    (* let x' = coerce_ptr variant_ptr.const (x_to_variant x) in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_arrayv (x0' :: x1' :: x2' :: x3' :: x4' :: x5' :: vs))
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    Living_core.Default.named_return method_name
      (if is_error err then raise (to_exn err) else ret_of_variant ret)

let foreign_method6_static method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant x4_to_variant
    x5_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? (Make it thread local?) *)
  let err = global_call_error in
  let count = 6L in
  fun x0 x1 x2 x3 x4 x5 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (fun r ->
             coerce_ptr variant_ptr.uninit (ret_to_variant r))
    in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array6 x0' x1' x2' x3' x4' x5')
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call_static () VariantType.object_ sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method6_void method_name _fn _ret_typ _ret_to_variant
    _ret_of_variant x0_to_variant x1_to_variant x2_to_variant x3_to_variant
    x4_to_variant x5_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 6L in
  fun x0 x1 x2 x3 x4 x5 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr variant_ptr.uninit null in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array6 x0' x1' x2' x3' x4' x5')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name ()

let foreign_method7 method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant x4_to_variant
    x5_to_variant x6_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 7L in
  fun x0 x1 x2 x3 x4 x5 x6 base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    let x6' = x6_to_variant x6 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array7 x0' x1' x2' x3' x4' x5' x6')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method7v method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant x4_to_variant
    x5_to_variant x6_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  fun x0 x1 x2 x3 x4 x5 x6 vs base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let count = Int64.of_int (7 + VariadicVariants.length vs) in
    let x0' = coerce_ptr variant_ptr.const (x0_to_variant x0) in
    let x1' = coerce_ptr variant_ptr.const (x1_to_variant x1) in
    let x2' = coerce_ptr variant_ptr.const (x2_to_variant x2) in
    let x3' = coerce_ptr variant_ptr.const (x3_to_variant x3) in
    let x4' = coerce_ptr variant_ptr.const (x4_to_variant x4) in
    let x5' = coerce_ptr variant_ptr.const (x5_to_variant x5) in
    let x6' = coerce_ptr variant_ptr.const (x6_to_variant x6) in
    (* let x' = coerce_ptr variant_ptr.const (x_to_variant x) in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_arrayv (x0' :: x1' :: x2' :: x3' :: x4' :: x5' :: x6' :: vs))
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    Living_core.Default.named_return method_name
      (if is_error err then raise (to_exn err) else ret_of_variant ret)

let foreign_method7_static method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant x4_to_variant
    x5_to_variant x6_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? (Make it thread local?) *)
  let err = global_call_error in
  let count = 7L in
  fun x0 x1 x2 x3 x4 x5 x6 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (fun r ->
             coerce_ptr variant_ptr.uninit (ret_to_variant r))
    in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    let x6' = x6_to_variant x6 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array7 x0' x1' x2' x3' x4' x5' x6')
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call_static () VariantType.object_ sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method7_void method_name _fn _ret_typ _ret_to_variant
    _ret_of_variant x0_to_variant x1_to_variant x2_to_variant x3_to_variant
    x4_to_variant x5_to_variant x6_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 7L in
  fun x0 x1 x2 x3 x4 x5 x6 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr variant_ptr.uninit null in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    let x6' = x6_to_variant x6 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array7 x0' x1' x2' x3' x4' x5' x6')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name ()

let foreign_method8 method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant x4_to_variant
    x5_to_variant x6_to_variant x7_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 8L in
  fun x0 x1 x2 x3 x4 x5 x6 x7 base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    let x6' = x6_to_variant x6 in
    let x7' = x7_to_variant x7 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array8 x0' x1' x2' x3' x4' x5' x6' x7')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method8v method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant x4_to_variant
    x5_to_variant x6_to_variant x7_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  fun x0 x1 x2 x3 x4 x5 x6 x7 vs base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let count = Int64.of_int (8 + VariadicVariants.length vs) in
    let x0' = coerce_ptr variant_ptr.const (x0_to_variant x0) in
    let x1' = coerce_ptr variant_ptr.const (x1_to_variant x1) in
    let x2' = coerce_ptr variant_ptr.const (x2_to_variant x2) in
    let x3' = coerce_ptr variant_ptr.const (x3_to_variant x3) in
    let x4' = coerce_ptr variant_ptr.const (x4_to_variant x4) in
    let x5' = coerce_ptr variant_ptr.const (x5_to_variant x5) in
    let x6' = coerce_ptr variant_ptr.const (x6_to_variant x6) in
    let x7' = coerce_ptr variant_ptr.const (x7_to_variant x7) in
    (* let x' = coerce_ptr variant_ptr.const (x_to_variant x) in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_arrayv
           (x0' :: x1' :: x2' :: x3' :: x4' :: x5' :: x6' :: x7' :: vs))
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    Living_core.Default.named_return method_name
      (if is_error err then raise (to_exn err) else ret_of_variant ret)

let foreign_method8_static method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant x4_to_variant
    x5_to_variant x6_to_variant x7_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? (Make it thread local?) *)
  let err = global_call_error in
  let count = 8L in
  fun x0 x1 x2 x3 x4 x5 x6 x7 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (fun r ->
             coerce_ptr variant_ptr.uninit (ret_to_variant r))
    in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    let x6' = x6_to_variant x6 in
    let x7' = x7_to_variant x7 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array8 x0' x1' x2' x3' x4' x5' x6' x7')
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call_static () VariantType.object_ sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method8_void method_name _fn _ret_typ _ret_to_variant
    _ret_of_variant x0_to_variant x1_to_variant x2_to_variant x3_to_variant
    x4_to_variant x5_to_variant x6_to_variant x7_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 8L in
  fun x0 x1 x2 x3 x4 x5 x6 x7 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr variant_ptr.uninit null in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    let x6' = x6_to_variant x6 in
    let x7' = x7_to_variant x7 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array8 x0' x1' x2' x3' x4' x5' x6' x7')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name ()

let foreign_method9 method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant x4_to_variant
    x5_to_variant x6_to_variant x7_to_variant x8_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 9L in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    let x6' = x6_to_variant x6 in
    let x7' = x7_to_variant x7 in
    let x8' = x8_to_variant x8 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array9 x0' x1' x2' x3' x4' x5' x6' x7' x8')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method9v method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant x4_to_variant
    x5_to_variant x6_to_variant x7_to_variant x8_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 vs base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let count = Int64.of_int (9 + VariadicVariants.length vs) in
    let x0' = coerce_ptr variant_ptr.const (x0_to_variant x0) in
    let x1' = coerce_ptr variant_ptr.const (x1_to_variant x1) in
    let x2' = coerce_ptr variant_ptr.const (x2_to_variant x2) in
    let x3' = coerce_ptr variant_ptr.const (x3_to_variant x3) in
    let x4' = coerce_ptr variant_ptr.const (x4_to_variant x4) in
    let x5' = coerce_ptr variant_ptr.const (x5_to_variant x5) in
    let x6' = coerce_ptr variant_ptr.const (x6_to_variant x6) in
    let x7' = coerce_ptr variant_ptr.const (x7_to_variant x7) in
    let x8' = coerce_ptr variant_ptr.const (x8_to_variant x8) in
    (* let x' = coerce_ptr variant_ptr.const (x_to_variant x) in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_arrayv
           (x0' :: x1' :: x2' :: x3' :: x4' :: x5' :: x6' :: x7' :: x8' :: vs))
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    Living_core.Default.named_return method_name
      (if is_error err then raise (to_exn err) else ret_of_variant ret)

let foreign_method9_static method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant x4_to_variant
    x5_to_variant x6_to_variant x7_to_variant x8_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? (Make it thread local?) *)
  let err = global_call_error in
  let count = 9L in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (fun r ->
             coerce_ptr variant_ptr.uninit (ret_to_variant r))
    in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    let x6' = x6_to_variant x6 in
    let x7' = x7_to_variant x7 in
    let x8' = x8_to_variant x8 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array9 x0' x1' x2' x3' x4' x5' x6' x7' x8')
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call_static () VariantType.object_ sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method9_void method_name _fn _ret_typ _ret_to_variant
    _ret_of_variant x0_to_variant x1_to_variant x2_to_variant x3_to_variant
    x4_to_variant x5_to_variant x6_to_variant x7_to_variant x8_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 9L in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr variant_ptr.uninit null in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    let x6' = x6_to_variant x6 in
    let x7' = x7_to_variant x7 in
    let x8' = x8_to_variant x8 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array9 x0' x1' x2' x3' x4' x5' x6' x7' x8')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name ()

let foreign_method10 method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant x4_to_variant
    x5_to_variant x6_to_variant x7_to_variant x8_to_variant x9_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 10L in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    let x6' = x6_to_variant x6 in
    let x7' = x7_to_variant x7 in
    let x8' = x8_to_variant x8 in
    let x9' = x9_to_variant x9 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array10 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method10v method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant x4_to_variant
    x5_to_variant x6_to_variant x7_to_variant x8_to_variant x9_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 vs base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let count = Int64.of_int (10 + VariadicVariants.length vs) in
    let x0' = coerce_ptr variant_ptr.const (x0_to_variant x0) in
    let x1' = coerce_ptr variant_ptr.const (x1_to_variant x1) in
    let x2' = coerce_ptr variant_ptr.const (x2_to_variant x2) in
    let x3' = coerce_ptr variant_ptr.const (x3_to_variant x3) in
    let x4' = coerce_ptr variant_ptr.const (x4_to_variant x4) in
    let x5' = coerce_ptr variant_ptr.const (x5_to_variant x5) in
    let x6' = coerce_ptr variant_ptr.const (x6_to_variant x6) in
    let x7' = coerce_ptr variant_ptr.const (x7_to_variant x7) in
    let x8' = coerce_ptr variant_ptr.const (x8_to_variant x8) in
    let x9' = coerce_ptr variant_ptr.const (x9_to_variant x9) in
    (* let x' = coerce_ptr variant_ptr.const (x_to_variant x) in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_arrayv
           (x0' :: x1' :: x2' :: x3' :: x4' :: x5' :: x6' :: x7' :: x8' :: x9'
          :: vs))
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    Living_core.Default.named_return method_name
      (if is_error err then raise (to_exn err) else ret_of_variant ret)

let foreign_method10_static method_name _fn ret_typ ret_to_variant
    ret_of_variant x0_to_variant x1_to_variant x2_to_variant x3_to_variant
    x4_to_variant x5_to_variant x6_to_variant x7_to_variant x8_to_variant
    x9_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? (Make it thread local?) *)
  let err = global_call_error in
  let count = 10L in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (fun r ->
             coerce_ptr variant_ptr.uninit (ret_to_variant r))
    in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    let x6' = x6_to_variant x6 in
    let x7' = x7_to_variant x7 in
    let x8' = x8_to_variant x8 in
    let x9' = x9_to_variant x9 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array10 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9')
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call_static () VariantType.object_ sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method10_void method_name _fn _ret_typ _ret_to_variant
    _ret_of_variant x0_to_variant x1_to_variant x2_to_variant x3_to_variant
    x4_to_variant x5_to_variant x6_to_variant x7_to_variant x8_to_variant
    x9_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 10L in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr variant_ptr.uninit null in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    let x6' = x6_to_variant x6 in
    let x7' = x7_to_variant x7 in
    let x8' = x8_to_variant x8 in
    let x9' = x9_to_variant x9 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array10 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name ()

let foreign_method11 method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant x4_to_variant
    x5_to_variant x6_to_variant x7_to_variant x8_to_variant x9_to_variant
    x10_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 11L in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    let x6' = x6_to_variant x6 in
    let x7' = x7_to_variant x7 in
    let x8' = x8_to_variant x8 in
    let x9' = x9_to_variant x9 in
    let x10' = x10_to_variant x10 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array11 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method11v method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant x4_to_variant
    x5_to_variant x6_to_variant x7_to_variant x8_to_variant x9_to_variant
    x10_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 vs base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let count = Int64.of_int (11 + VariadicVariants.length vs) in
    let x0' = coerce_ptr variant_ptr.const (x0_to_variant x0) in
    let x1' = coerce_ptr variant_ptr.const (x1_to_variant x1) in
    let x2' = coerce_ptr variant_ptr.const (x2_to_variant x2) in
    let x3' = coerce_ptr variant_ptr.const (x3_to_variant x3) in
    let x4' = coerce_ptr variant_ptr.const (x4_to_variant x4) in
    let x5' = coerce_ptr variant_ptr.const (x5_to_variant x5) in
    let x6' = coerce_ptr variant_ptr.const (x6_to_variant x6) in
    let x7' = coerce_ptr variant_ptr.const (x7_to_variant x7) in
    let x8' = coerce_ptr variant_ptr.const (x8_to_variant x8) in
    let x9' = coerce_ptr variant_ptr.const (x9_to_variant x9) in
    let x10' = coerce_ptr variant_ptr.const (x10_to_variant x10) in
    (* let x' = coerce_ptr variant_ptr.const (x_to_variant x) in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_arrayv
           (x0' :: x1' :: x2' :: x3' :: x4' :: x5' :: x6' :: x7' :: x8' :: x9'
          :: x10' :: vs))
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    Living_core.Default.named_return method_name
      (if is_error err then raise (to_exn err) else ret_of_variant ret)

let foreign_method11_static method_name _fn ret_typ ret_to_variant
    ret_of_variant x0_to_variant x1_to_variant x2_to_variant x3_to_variant
    x4_to_variant x5_to_variant x6_to_variant x7_to_variant x8_to_variant
    x9_to_variant x10_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? (Make it thread local?) *)
  let err = global_call_error in
  let count = 11L in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (fun r ->
             coerce_ptr variant_ptr.uninit (ret_to_variant r))
    in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    let x6' = x6_to_variant x6 in
    let x7' = x7_to_variant x7 in
    let x8' = x8_to_variant x8 in
    let x9' = x9_to_variant x9 in
    let x10' = x10_to_variant x10 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array11 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10')
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call_static () VariantType.object_ sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method11_void method_name _fn _ret_typ _ret_to_variant
    _ret_of_variant x0_to_variant x1_to_variant x2_to_variant x3_to_variant
    x4_to_variant x5_to_variant x6_to_variant x7_to_variant x8_to_variant
    x9_to_variant x10_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 11L in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr variant_ptr.uninit null in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    let x6' = x6_to_variant x6 in
    let x7' = x7_to_variant x7 in
    let x8' = x8_to_variant x8 in
    let x9' = x9_to_variant x9 in
    let x10' = x10_to_variant x10 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array11 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name ()

let foreign_method12 method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant x4_to_variant
    x5_to_variant x6_to_variant x7_to_variant x8_to_variant x9_to_variant
    x10_to_variant x11_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 12L in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    let x6' = x6_to_variant x6 in
    let x7' = x7_to_variant x7 in
    let x8' = x8_to_variant x8 in
    let x9' = x9_to_variant x9 in
    let x10' = x10_to_variant x10 in
    let x11' = x11_to_variant x11 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array12 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method12v method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant x4_to_variant
    x5_to_variant x6_to_variant x7_to_variant x8_to_variant x9_to_variant
    x10_to_variant x11_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 vs base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let count = Int64.of_int (12 + VariadicVariants.length vs) in
    let x0' = coerce_ptr variant_ptr.const (x0_to_variant x0) in
    let x1' = coerce_ptr variant_ptr.const (x1_to_variant x1) in
    let x2' = coerce_ptr variant_ptr.const (x2_to_variant x2) in
    let x3' = coerce_ptr variant_ptr.const (x3_to_variant x3) in
    let x4' = coerce_ptr variant_ptr.const (x4_to_variant x4) in
    let x5' = coerce_ptr variant_ptr.const (x5_to_variant x5) in
    let x6' = coerce_ptr variant_ptr.const (x6_to_variant x6) in
    let x7' = coerce_ptr variant_ptr.const (x7_to_variant x7) in
    let x8' = coerce_ptr variant_ptr.const (x8_to_variant x8) in
    let x9' = coerce_ptr variant_ptr.const (x9_to_variant x9) in
    let x10' = coerce_ptr variant_ptr.const (x10_to_variant x10) in
    let x11' = coerce_ptr variant_ptr.const (x11_to_variant x11) in
    (* let x' = coerce_ptr variant_ptr.const (x_to_variant x) in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_arrayv
           (x0' :: x1' :: x2' :: x3' :: x4' :: x5' :: x6' :: x7' :: x8' :: x9'
          :: x10' :: x11' :: vs))
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    Living_core.Default.named_return method_name
      (if is_error err then raise (to_exn err) else ret_of_variant ret)

let foreign_method12_static method_name _fn ret_typ ret_to_variant
    ret_of_variant x0_to_variant x1_to_variant x2_to_variant x3_to_variant
    x4_to_variant x5_to_variant x6_to_variant x7_to_variant x8_to_variant
    x9_to_variant x10_to_variant x11_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? (Make it thread local?) *)
  let err = global_call_error in
  let count = 12L in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (fun r ->
             coerce_ptr variant_ptr.uninit (ret_to_variant r))
    in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    let x6' = x6_to_variant x6 in
    let x7' = x7_to_variant x7 in
    let x8' = x8_to_variant x8 in
    let x9' = x9_to_variant x9 in
    let x10' = x10_to_variant x10 in
    let x11' = x11_to_variant x11 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array12 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11')
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call_static () VariantType.object_ sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method12_void method_name _fn _ret_typ _ret_to_variant
    _ret_of_variant x0_to_variant x1_to_variant x2_to_variant x3_to_variant
    x4_to_variant x5_to_variant x6_to_variant x7_to_variant x8_to_variant
    x9_to_variant x10_to_variant x11_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 12L in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr variant_ptr.uninit null in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    let x6' = x6_to_variant x6 in
    let x7' = x7_to_variant x7 in
    let x8' = x8_to_variant x8 in
    let x9' = x9_to_variant x9 in
    let x10' = x10_to_variant x10 in
    let x11' = x11_to_variant x11 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array12 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name ()

let foreign_method13 method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant x4_to_variant
    x5_to_variant x6_to_variant x7_to_variant x8_to_variant x9_to_variant
    x10_to_variant x11_to_variant x12_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 13L in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    let x6' = x6_to_variant x6 in
    let x7' = x7_to_variant x7 in
    let x8' = x8_to_variant x8 in
    let x9' = x9_to_variant x9 in
    let x10' = x10_to_variant x10 in
    let x11' = x11_to_variant x11 in
    let x12' = x12_to_variant x12 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array13 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11' x12')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method13v method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant x4_to_variant
    x5_to_variant x6_to_variant x7_to_variant x8_to_variant x9_to_variant
    x10_to_variant x11_to_variant x12_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 vs base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let count = Int64.of_int (13 + VariadicVariants.length vs) in
    let x0' = coerce_ptr variant_ptr.const (x0_to_variant x0) in
    let x1' = coerce_ptr variant_ptr.const (x1_to_variant x1) in
    let x2' = coerce_ptr variant_ptr.const (x2_to_variant x2) in
    let x3' = coerce_ptr variant_ptr.const (x3_to_variant x3) in
    let x4' = coerce_ptr variant_ptr.const (x4_to_variant x4) in
    let x5' = coerce_ptr variant_ptr.const (x5_to_variant x5) in
    let x6' = coerce_ptr variant_ptr.const (x6_to_variant x6) in
    let x7' = coerce_ptr variant_ptr.const (x7_to_variant x7) in
    let x8' = coerce_ptr variant_ptr.const (x8_to_variant x8) in
    let x9' = coerce_ptr variant_ptr.const (x9_to_variant x9) in
    let x10' = coerce_ptr variant_ptr.const (x10_to_variant x10) in
    let x11' = coerce_ptr variant_ptr.const (x11_to_variant x11) in
    let x12' = coerce_ptr variant_ptr.const (x12_to_variant x12) in
    (* let x' = coerce_ptr variant_ptr.const (x_to_variant x) in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_arrayv
           (x0' :: x1' :: x2' :: x3' :: x4' :: x5' :: x6' :: x7' :: x8' :: x9'
          :: x10' :: x11' :: x12' :: vs))
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    Living_core.Default.named_return method_name
      (if is_error err then raise (to_exn err) else ret_of_variant ret)

let foreign_method13_static method_name _fn ret_typ ret_to_variant
    ret_of_variant x0_to_variant x1_to_variant x2_to_variant x3_to_variant
    x4_to_variant x5_to_variant x6_to_variant x7_to_variant x8_to_variant
    x9_to_variant x10_to_variant x11_to_variant x12_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? (Make it thread local?) *)
  let err = global_call_error in
  let count = 13L in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (fun r ->
             coerce_ptr variant_ptr.uninit (ret_to_variant r))
    in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    let x6' = x6_to_variant x6 in
    let x7' = x7_to_variant x7 in
    let x8' = x8_to_variant x8 in
    let x9' = x9_to_variant x9 in
    let x10' = x10_to_variant x10 in
    let x11' = x11_to_variant x11 in
    let x12' = x12_to_variant x12 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array13 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11' x12')
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call_static () VariantType.object_ sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method13_void method_name _fn _ret_typ _ret_to_variant
    _ret_of_variant x0_to_variant x1_to_variant x2_to_variant x3_to_variant
    x4_to_variant x5_to_variant x6_to_variant x7_to_variant x8_to_variant
    x9_to_variant x10_to_variant x11_to_variant x12_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 13L in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr variant_ptr.uninit null in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    let x6' = x6_to_variant x6 in
    let x7' = x7_to_variant x7 in
    let x8' = x8_to_variant x8 in
    let x9' = x9_to_variant x9 in
    let x10' = x10_to_variant x10 in
    let x11' = x11_to_variant x11 in
    let x12' = x12_to_variant x12 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array13 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11' x12')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name ()

let foreign_method14 method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant x4_to_variant
    x5_to_variant x6_to_variant x7_to_variant x8_to_variant x9_to_variant
    x10_to_variant x11_to_variant x12_to_variant x13_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 14L in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    let x6' = x6_to_variant x6 in
    let x7' = x7_to_variant x7 in
    let x8' = x8_to_variant x8 in
    let x9' = x9_to_variant x9 in
    let x10' = x10_to_variant x10 in
    let x11' = x11_to_variant x11 in
    let x12' = x12_to_variant x12 in
    let x13' = x13_to_variant x13 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array14 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11' x12'
           x13')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method14v method_name _fn ret_typ ret_to_variant ret_of_variant
    x0_to_variant x1_to_variant x2_to_variant x3_to_variant x4_to_variant
    x5_to_variant x6_to_variant x7_to_variant x8_to_variant x9_to_variant
    x10_to_variant x11_to_variant x12_to_variant x13_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 vs base ->
    let open Living_core.Default.Let_syntax in
    let ret =
      coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1))
    in
    let count = Int64.of_int (14 + VariadicVariants.length vs) in
    let x0' = coerce_ptr variant_ptr.const (x0_to_variant x0) in
    let x1' = coerce_ptr variant_ptr.const (x1_to_variant x1) in
    let x2' = coerce_ptr variant_ptr.const (x2_to_variant x2) in
    let x3' = coerce_ptr variant_ptr.const (x3_to_variant x3) in
    let x4' = coerce_ptr variant_ptr.const (x4_to_variant x4) in
    let x5' = coerce_ptr variant_ptr.const (x5_to_variant x5) in
    let x6' = coerce_ptr variant_ptr.const (x6_to_variant x6) in
    let x7' = coerce_ptr variant_ptr.const (x7_to_variant x7) in
    let x8' = coerce_ptr variant_ptr.const (x8_to_variant x8) in
    let x9' = coerce_ptr variant_ptr.const (x9_to_variant x9) in
    let x10' = coerce_ptr variant_ptr.const (x10_to_variant x10) in
    let x11' = coerce_ptr variant_ptr.const (x11_to_variant x11) in
    let x12' = coerce_ptr variant_ptr.const (x12_to_variant x12) in
    let x13' = coerce_ptr variant_ptr.const (x13_to_variant x13) in
    (* let x' = coerce_ptr variant_ptr.const (x_to_variant x) in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_arrayv
           (x0' :: x1' :: x2' :: x3' :: x4' :: x5' :: x6' :: x7' :: x8' :: x9'
          :: x10' :: x11' :: x12' :: x13' :: vs))
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    Living_core.Default.named_return method_name
      (if is_error err then raise (to_exn err) else ret_of_variant ret)

let foreign_method14_static method_name _fn ret_typ ret_to_variant
    ret_of_variant x0_to_variant x1_to_variant x2_to_variant x3_to_variant
    x4_to_variant x5_to_variant x6_to_variant x7_to_variant x8_to_variant
    x9_to_variant x10_to_variant x11_to_variant x12_to_variant x13_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? (Make it thread local?) *)
  let err = global_call_error in
  let count = 14L in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (fun r ->
             coerce_ptr variant_ptr.uninit (ret_to_variant r))
    in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    let x6' = x6_to_variant x6 in
    let x7' = x7_to_variant x7 in
    let x8' = x8_to_variant x8 in
    let x9' = x9_to_variant x9 in
    let x10' = x10_to_variant x10 in
    let x11' = x11_to_variant x11 in
    let x12' = x12_to_variant x12 in
    let x13' = x13_to_variant x13 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array14 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11' x12'
           x13')
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call_static () VariantType.object_ sn arr count ret err)
    in
    let ret = coerce_ptr variant_ptr.plain ret in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name (ret_of_variant ret)

let foreign_method14_void method_name _fn _ret_typ _ret_to_variant
    _ret_of_variant x0_to_variant x1_to_variant x2_to_variant x3_to_variant
    x4_to_variant x5_to_variant x6_to_variant x7_to_variant x8_to_variant
    x9_to_variant x10_to_variant x11_to_variant x12_to_variant x13_to_variant =
  (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
  let string_name = string_name_of_string method_name in
  (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
  let err = global_call_error in
  let count = 14L in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr variant_ptr.uninit null in
    let x0' = x0_to_variant x0 in
    let x1' = x1_to_variant x1 in
    let x2' = x2_to_variant x2 in
    let x3' = x3_to_variant x3 in
    let x4' = x4_to_variant x4 in
    let x5' = x5_to_variant x5 in
    let x6' = x6_to_variant x6 in
    let x7' = x7_to_variant x7 in
    let x8' = x8_to_variant x8 in
    let x9' = x9_to_variant x9 in
    let x10' = x10_to_variant x10 in
    let x11' = x11_to_variant x11 in
    let x12' = x12_to_variant x12 in
    let x13' = x13_to_variant x13 in
    (* let x' = x_to_variant x in *)
    let* arr =
      Living_core.Default.map
        (coerce_ptr (ptr variant_ptr.const))
        (foreign_array14 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11' x12'
           x13')
    in
    let* base =
      Living_core.Default.map
        (coerce_ptr variant_ptr.plain)
        (foreign_array1 base)
    in
    let* () =
      string_name
      |> Living_core.Default.map (fun sn ->
             variant_call () base sn arr count ret err)
    in
    if is_error err then raise (to_exn err)
    else Living_core.Default.named_return method_name ()
