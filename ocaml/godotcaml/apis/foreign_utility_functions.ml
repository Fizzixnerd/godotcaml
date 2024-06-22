open! Base
open Ctypes
open Godotcaml_base
open Godotcaml
open C
module Suite = TypedSuite
module Godotcaml = Godotcaml
open Foreign_base

let foreign_utility_function1 name hash ret_typ ret_to_ocaml x0_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 1 in
  fun x0 ->
    let ret = coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1) in
    let x0' = x0_of_ocaml x0 in
    (* let x0 = x0_of_ocaml x0 in *)
    let arr = foreign_arr1 x0' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_utility_function1_void name hash ret_typ _ret_to_ocaml x0_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 1 in
  fun x0 ->
    let ret = coerce (ptr ret_typ) type_ptr.plain null in
    let x0' = x0_of_ocaml x0 in
    (* let x0 = x0_of_ocaml x0 in *)
    let arr = foreign_arr1 x0' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ()

let foreign_utility_function2 name hash ret_typ ret_to_ocaml x0_of_ocaml
    x1_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 2 in
  fun x0 x1 ->
    let ret = coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1) in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    (* let x0 = x0_of_ocaml x0 in *)
    let arr = foreign_arr2 x0' x1' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_utility_function2_void name hash ret_typ _ret_to_ocaml x0_of_ocaml
    x1_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 2 in
  fun x0 x1 ->
    let ret = coerce (ptr ret_typ) type_ptr.plain null in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    (* let x0 = x0_of_ocaml x0 in *)
    let arr = foreign_arr2 x0' x1' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ()

let foreign_utility_function3 name hash ret_typ ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 3 in
  fun x0 x1 x2 ->
    let ret = coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1) in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    (* let x0 = x0_of_ocaml x0 in *)
    let arr = foreign_arr3 x0' x1' x2' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_utility_function3_void name hash ret_typ _ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 3 in
  fun x0 x1 x2 ->
    let ret = coerce (ptr ret_typ) type_ptr.plain null in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    (* let x0 = x0_of_ocaml x0 in *)
    let arr = foreign_arr3 x0' x1' x2' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ()

let foreign_utility_function4 name hash ret_typ ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 4 in
  fun x0 x1 x2 x3 ->
    let ret = coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1) in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    (* let x0 = x0_of_ocaml x0 in *)
    let arr = foreign_arr4 x0' x1' x2' x3' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_utility_function4_void name hash ret_typ _ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 4 in
  fun x0 x1 x2 x3 ->
    let ret = coerce (ptr ret_typ) type_ptr.plain null in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    (* let x0 = x0_of_ocaml x0 in *)
    let arr = foreign_arr4 x0' x1' x2' x3' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ()

let foreign_utility_function5 name hash ret_typ ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 5 in
  fun x0 x1 x2 x3 x4 ->
    let ret = coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1) in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    (* let x0 = x0_of_ocaml x0 in *)
    let arr = foreign_arr5 x0' x1' x2' x3' x4' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_utility_function5_void name hash ret_typ _ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 5 in
  fun x0 x1 x2 x3 x4 ->
    let ret = coerce (ptr ret_typ) type_ptr.plain null in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    (* let x0 = x0_of_ocaml x0 in *)
    let arr = foreign_arr5 x0' x1' x2' x3' x4' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ()

let foreign_utility_function6 name hash ret_typ ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 6 in
  fun x0 x1 x2 x3 x4 x5 ->
    let ret = coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1) in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    let x5' = x5_of_ocaml x5 in
    (* let x0 = x0_of_ocaml x0 in *)
    let arr = foreign_arr6 x0' x1' x2' x3' x4' x5' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_utility_function6_void name hash ret_typ _ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 6 in
  fun x0 x1 x2 x3 x4 x5 ->
    let ret = coerce (ptr ret_typ) type_ptr.plain null in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    let x5' = x5_of_ocaml x5 in
    (* let x0 = x0_of_ocaml x0 in *)
    let arr = foreign_arr6 x0' x1' x2' x3' x4' x5' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ()

let foreign_utility_function7 name hash ret_typ ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 7 in
  fun x0 x1 x2 x3 x4 x5 x6 ->
    let ret = coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1) in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    let x5' = x5_of_ocaml x5 in
    let x6' = x6_of_ocaml x6 in
    (* let x0 = x0_of_ocaml x0 in *)
    let arr = foreign_arr7 x0' x1' x2' x3' x4' x5' x6' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_utility_function7_void name hash ret_typ _ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 7 in
  fun x0 x1 x2 x3 x4 x5 x6 ->
    let ret = coerce (ptr ret_typ) type_ptr.plain null in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    let x5' = x5_of_ocaml x5 in
    let x6' = x6_of_ocaml x6 in
    (* let x0 = x0_of_ocaml x0 in *)
    let arr = foreign_arr7 x0' x1' x2' x3' x4' x5' x6' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ()

let foreign_utility_function8 name hash ret_typ ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 8 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 ->
    let ret = coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1) in
    let x0' = x0_of_ocaml x0 in
    let x1' = x1_of_ocaml x1 in
    let x2' = x2_of_ocaml x2 in
    let x3' = x3_of_ocaml x3 in
    let x4' = x4_of_ocaml x4 in
    let x5' = x5_of_ocaml x5 in
    let x6' = x6_of_ocaml x6 in
    let x7' = x7_of_ocaml x7 in
    (* let x0 = x0_of_ocaml x0 in *)
    let arr = foreign_arr8 x0' x1' x2' x3' x4' x5' x6' x7' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_utility_function8_void name hash ret_typ _ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 8 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 ->
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
    let arr = foreign_arr8 x0' x1' x2' x3' x4' x5' x6' x7' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ()

let foreign_utility_function9 name hash ret_typ ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 9 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 ->
    let ret = coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1) in
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
    let arr = foreign_arr9 x0' x1' x2' x3' x4' x5' x6' x7' x8' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_utility_function9_void name hash ret_typ _ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 9 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 ->
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
    let arr = foreign_arr9 x0' x1' x2' x3' x4' x5' x6' x7' x8' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ()

let foreign_utility_function10 name hash ret_typ ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml x9_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 10 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 ->
    let ret = coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1) in
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
    let arr = foreign_arr10 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_utility_function10_void name hash ret_typ _ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml x9_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 10 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 ->
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
    let arr = foreign_arr10 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ()

let foreign_utility_function11 name hash ret_typ ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml x9_of_ocaml x10_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 11 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 ->
    let ret = coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1) in
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
    let arr = foreign_arr11 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_utility_function11_void name hash ret_typ _ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml x9_of_ocaml x10_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 11 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 ->
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
    let arr = foreign_arr11 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ()

let foreign_utility_function12 name hash ret_typ ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml x9_of_ocaml x10_of_ocaml x11_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 12 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 ->
    let ret = coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1) in
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
    let arr = foreign_arr12 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_utility_function12_void name hash ret_typ _ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml x9_of_ocaml x10_of_ocaml x11_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 12 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 ->
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
    let arr = foreign_arr12 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11' in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ()

let foreign_utility_function13 name hash ret_typ ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml x9_of_ocaml x10_of_ocaml x11_of_ocaml x12_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 13 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 ->
    let ret = coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1) in
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
    let arr =
      foreign_arr13 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11' x12'
    in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_utility_function13_void name hash ret_typ _ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml x9_of_ocaml x10_of_ocaml x11_of_ocaml x12_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 13 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 ->
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
    let arr =
      foreign_arr13 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11' x12'
    in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ()

let foreign_utility_function14 name hash ret_typ ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml x9_of_ocaml x10_of_ocaml x11_of_ocaml x12_of_ocaml
    x13_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 14 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 ->
    let ret = coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1) in
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
    let arr =
      foreign_arr14 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11' x12' x13'
    in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_utility_function14_void name hash ret_typ _ret_to_ocaml x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml x9_of_ocaml x10_of_ocaml x11_of_ocaml x12_of_ocaml
    x13_of_ocaml =
  let utility_function = variant_get_ptr_utility_function name hash in
  let count = 14 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 ->
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
    let arr =
      foreign_arr14 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11' x12' x13'
    in
    let () =
      coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function ret
        arr count
    in
    ()
