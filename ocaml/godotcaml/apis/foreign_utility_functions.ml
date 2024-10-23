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

let foreign_utility_function0 name hash ret_typ ret_to_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 0 in
  fun () ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let* arr = foreign_array0 in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name
      (ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret))

let foreign_utility_function0_void name hash ret_typ _ret_to_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 0 in
  fun () ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce (ptr ret_typ) type_ptr.plain null in
    let* arr = foreign_array0 in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name ()

let foreign_utility_functionv :
    string ->
    int64 ->
    (Variadic.t -> 'r ptr) fn ->
    'r typ ->
    ('r ptr -> 'b) ->
    Variadic.t ->
    'b Living_core.Default.t =
 fun name hash _fn ret_typ ret_to_ocaml ->
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  fun xs ->
    let open Living_core.Default.Let_syntax in
    let count = Variadic.length xs in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let* arr = foreign_arrayv xs in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name
      (ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret))

let foreign_utility_functionv_void :
    string ->
    int64 ->
    (Variadic.t -> unit) fn ->
    'any ->
    Variadic.t ->
    unit Living_core.Default.t =
 fun name hash _fn _ ->
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  fun xs ->
    let open Living_core.Default.Let_syntax in
    let count = Variadic.length xs in
    let ret = coerce_ptr type_ptr.plain null in
    let* arr = foreign_arrayv xs in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name ()

let foreign_utility_function1 name hash ret_typ ret_to_ocaml x0_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 1 in
  fun x0 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let x0' = x0_of_ocaml x0 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr = foreign_array1 x0' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name
      (ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret))

let foreign_utility_function1_void name hash ret_typ _ret_to_ocaml x0_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 1 in
  fun x0 ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce (ptr ret_typ) type_ptr.plain null in
    let x0' = x0_of_ocaml x0 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr = foreign_array1 x0' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name ()

let foreign_utility_function2 name hash ret_typ ret_to_ocaml x0_of_ocaml
    x1_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 2 in
  fun x0 x1 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr = foreign_array2 x0' x1' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name
      (ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret))

let foreign_utility_function2_void name hash ret_typ _ret_to_ocaml x0_of_ocaml
    x1_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 2 in
  fun x0 x1 ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce (ptr ret_typ) type_ptr.plain null in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr = foreign_array2 x0' x1' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name ()

let foreign_utility_function3 name hash ret_typ ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 3 in
  fun x0 x1 x2 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr = foreign_array3 x0' x1' x2' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name
      (ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret))

let foreign_utility_function3_void name hash ret_typ _ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 3 in
  fun x0 x1 x2 ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce (ptr ret_typ) type_ptr.plain null in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr = foreign_array3 x0' x1' x2' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name ()

let foreign_utility_function4 name hash ret_typ ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 4 in
  fun x0 x1 x2 x3 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr = foreign_array4 x0' x1' x2' x3' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name
      (ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret))

let foreign_utility_function4_void name hash ret_typ _ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 4 in
  fun x0 x1 x2 x3 ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce (ptr ret_typ) type_ptr.plain null in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr = foreign_array4 x0' x1' x2' x3' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name ()

let foreign_utility_function5 name hash ret_typ ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 5 in
  fun x0 x1 x2 x3 x4 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr = foreign_array5 x0' x1' x2' x3' x4' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name
      (ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret))

let foreign_utility_function5_void name hash ret_typ _ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 5 in
  fun x0 x1 x2 x3 x4 ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce (ptr ret_typ) type_ptr.plain null in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr = foreign_array5 x0' x1' x2' x3' x4' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name ()

let foreign_utility_function6 name hash ret_typ ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 6 in
  fun x0 x1 x2 x3 x4 x5 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    let x5' = x5_of_ocaml x5 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr = foreign_array6 x0' x1' x2' x3' x4' x5' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name
      (ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret))

let foreign_utility_function6_void name hash ret_typ _ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 6 in
  fun x0 x1 x2 x3 x4 x5 ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce (ptr ret_typ) type_ptr.plain null in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    let x5' = x5_of_ocaml x5 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr = foreign_array6 x0' x1' x2' x3' x4' x5' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name ()

let foreign_utility_function7 name hash ret_typ ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 7 in
  fun x0 x1 x2 x3 x4 x5 x6 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    let x5' = x5_of_ocaml x5 in
    let x6' = x6_of_ocaml x6 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr = foreign_array7 x0' x1' x2' x3' x4' x5' x6' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name
      (ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret))

let foreign_utility_function7_void name hash ret_typ _ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 7 in
  fun x0 x1 x2 x3 x4 x5 x6 ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce (ptr ret_typ) type_ptr.plain null in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    let x5' = x5_of_ocaml x5 in
    let x6' = x6_of_ocaml x6 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr = foreign_array7 x0' x1' x2' x3' x4' x5' x6' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name ()

let foreign_utility_function8 name hash ret_typ ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 8 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    let x5' = x5_of_ocaml x5 in
    let x6' = x6_of_ocaml x6 in
    let x7' = x7_of_ocaml x7 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr = foreign_array8 x0' x1' x2' x3' x4' x5' x6' x7' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name
      (ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret))

let foreign_utility_function8_void name hash ret_typ _ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 8 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce (ptr ret_typ) type_ptr.plain null in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    let x5' = x5_of_ocaml x5 in
    let x6' = x6_of_ocaml x6 in
    let x7' = x7_of_ocaml x7 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr = foreign_array8 x0' x1' x2' x3' x4' x5' x6' x7' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name ()

let foreign_utility_function9 name hash ret_typ ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 9 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    let x5' = x5_of_ocaml x5 in
    let x6' = x6_of_ocaml x6 in
    let x7' = x7_of_ocaml x7 in
    let x8' = x8_of_ocaml x8 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr = foreign_array9 x0' x1' x2' x3' x4' x5' x6' x7' x8' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name
      (ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret))

let foreign_utility_function9_void name hash ret_typ _ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 9 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce (ptr ret_typ) type_ptr.plain null in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    let x5' = x5_of_ocaml x5 in
    let x6' = x6_of_ocaml x6 in
    let x7' = x7_of_ocaml x7 in
    let x8' = x8_of_ocaml x8 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr = foreign_array9 x0' x1' x2' x3' x4' x5' x6' x7' x8' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name ()

let foreign_utility_function10 name hash ret_typ ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml x9_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 10 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    let x5' = x5_of_ocaml x5 in
    let x6' = x6_of_ocaml x6 in
    let x7' = x7_of_ocaml x7 in
    let x8' = x8_of_ocaml x8 in
    let x9' = x9_of_ocaml x9 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr = foreign_array10 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name
      (ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret))

let foreign_utility_function10_void name hash ret_typ _ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml x9_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 10 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce (ptr ret_typ) type_ptr.plain null in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    let x5' = x5_of_ocaml x5 in
    let x6' = x6_of_ocaml x6 in
    let x7' = x7_of_ocaml x7 in
    let x8' = x8_of_ocaml x8 in
    let x9' = x9_of_ocaml x9 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr = foreign_array10 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name ()

let foreign_utility_function11 name hash ret_typ ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml x9_of_ocaml x10_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 11 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    let x5' = x5_of_ocaml x5 in
    let x6' = x6_of_ocaml x6 in
    let x7' = x7_of_ocaml x7 in
    let x8' = x8_of_ocaml x8 in
    let x9' = x9_of_ocaml x9 in
    let x10' = x10_of_ocaml x10 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr = foreign_array11 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name
      (ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret))

let foreign_utility_function11_void name hash ret_typ _ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml x9_of_ocaml x10_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 11 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce (ptr ret_typ) type_ptr.plain null in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    let x5' = x5_of_ocaml x5 in
    let x6' = x6_of_ocaml x6 in
    let x7' = x7_of_ocaml x7 in
    let x8' = x8_of_ocaml x8 in
    let x9' = x9_of_ocaml x9 in
    let x10' = x10_of_ocaml x10 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr = foreign_array11 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name ()

let foreign_utility_function12 name hash ret_typ ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml x9_of_ocaml x10_of_ocaml x11_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 12 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    let x5' = x5_of_ocaml x5 in
    let x6' = x6_of_ocaml x6 in
    let x7' = x7_of_ocaml x7 in
    let x8' = x8_of_ocaml x8 in
    let x9' = x9_of_ocaml x9 in
    let x10' = x10_of_ocaml x10 in
    let x11' = x11_of_ocaml x11 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr =
      foreign_array12 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11'
    in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name
      (ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret))

let foreign_utility_function12_void name hash ret_typ _ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml x9_of_ocaml x10_of_ocaml x11_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 12 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce (ptr ret_typ) type_ptr.plain null in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    let x5' = x5_of_ocaml x5 in
    let x6' = x6_of_ocaml x6 in
    let x7' = x7_of_ocaml x7 in
    let x8' = x8_of_ocaml x8 in
    let x9' = x9_of_ocaml x9 in
    let x10' = x10_of_ocaml x10 in
    let x11' = x11_of_ocaml x11 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr =
      foreign_array12 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11'
    in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name ()

let foreign_utility_function13 name hash ret_typ ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml x9_of_ocaml x10_of_ocaml x11_of_ocaml x12_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 13 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    let x5' = x5_of_ocaml x5 in
    let x6' = x6_of_ocaml x6 in
    let x7' = x7_of_ocaml x7 in
    let x8' = x8_of_ocaml x8 in
    let x9' = x9_of_ocaml x9 in
    let x10' = x10_of_ocaml x10 in
    let x11' = x11_of_ocaml x11 in
    let x12' = x12_of_ocaml x12 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr =
      foreign_array13 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11' x12'
    in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name
      (ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret))

let foreign_utility_function13_void name hash ret_typ _ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml x9_of_ocaml x10_of_ocaml x11_of_ocaml x12_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 13 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce (ptr ret_typ) type_ptr.plain null in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    let x5' = x5_of_ocaml x5 in
    let x6' = x6_of_ocaml x6 in
    let x7' = x7_of_ocaml x7 in
    let x8' = x8_of_ocaml x8 in
    let x9' = x9_of_ocaml x9 in
    let x10' = x10_of_ocaml x10 in
    let x11' = x11_of_ocaml x11 in
    let x12' = x12_of_ocaml x12 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr =
      foreign_array13 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11' x12'
    in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name ()

let foreign_utility_function14 name hash ret_typ ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml x9_of_ocaml x10_of_ocaml x11_of_ocaml x12_of_ocaml
    x13_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 14 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    let x5' = x5_of_ocaml x5 in
    let x6' = x6_of_ocaml x6 in
    let x7' = x7_of_ocaml x7 in
    let x8' = x8_of_ocaml x8 in
    let x9' = x9_of_ocaml x9 in
    let x10' = x10_of_ocaml x10 in
    let x11' = x11_of_ocaml x11 in
    let x12' = x12_of_ocaml x12 in
    let x13' = x13_of_ocaml x13 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr =
      foreign_array14 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11' x12'
        x13'
    in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name
      (ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret))

let foreign_utility_function14_void name hash ret_typ _ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml x9_of_ocaml x10_of_ocaml x11_of_ocaml x12_of_ocaml
    x13_of_ocaml =
  let utility_function =
    Living_core.Default.unsafe_free (variant_get_ptr_utility_function name hash)
  in
  let count = 14 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce (ptr ret_typ) type_ptr.plain null in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    let x5' = x5_of_ocaml x5 in
    let x6' = x6_of_ocaml x6 in
    let x7' = x7_of_ocaml x7 in
    let x8' = x8_of_ocaml x8 in
    let x9' = x9_of_ocaml x9 in
    let x10' = x10_of_ocaml x10 in
    let x11' = x11_of_ocaml x11 in
    let x12' = x12_of_ocaml x12 in
    let x13' = x13_of_ocaml x13 in
    (* let x0 = x0_of_ocaml x0 in *)
    let* arr =
      foreign_array14 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11' x12'
        x13'
    in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    Living_core.Default.named_return name ()
