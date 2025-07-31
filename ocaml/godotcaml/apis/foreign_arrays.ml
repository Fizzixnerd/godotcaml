
open! Base
open Godotcaml_base.Godotcaml.C
open Living
open Living_ctypes.Default
open Foreign_base
      
let foreign_array0 =
  Living_core.Default.named_return "foreign_array0"
    (coerce_ptr (ptr type_ptr.const) null)

let foreign_arrayv xs =
  let xs = Base.Array.of_list xs in
  let count = Base.Array.length xs in
  let arr = allocate_n type_ptr.const ~count in
  for i = 0 to count - 1 do
    let ret = 
      let arri = arr |> Living_core.Default.bind (fun x -> x +@ i) in
      arri <-@ coerce_ptr type_ptr.const (Base.Array.get xs i)
    in Living_core.Default.unsafe_free ret
  done;
  arr

let foreign_variant_arrayv xs =
  let xs = Base.Array.of_list xs in
  let count = Base.Array.length xs in
  let arr = allocate_n variant_ptr.const ~count in
  for i = 0 to count - 1 do
    let ret = 
      let arri = arr |> Living_core.Default.bind (fun x -> x +@ i) in
      arri <-@ coerce_ptr variant_ptr.const (Base.Array.get xs i)
    in Living_core.Default.unsafe_free ret
  done;
  arr
    
let foreign_array1 x0 =
  let open Living_core.Default.Let_syntax in
  let count = 1 in
  let* arr = allocate_n ~count type_ptr.const in
  let loc0 = arr +@ 0 in

  let* () = loc0 <-@ coerce_ptr type_ptr.const x0 in

  Living_core.Default.named_return "foreign_array1" arr
    


let foreign_array2 x0 x1 =
  let open Living_core.Default.Let_syntax in
  let count = 2 in
  let* arr = allocate_n ~count type_ptr.const in
  let loc0 = arr +@ 0 in
 let loc1 = arr +@ 1 in

  let* () = loc0 <-@ coerce_ptr type_ptr.const x0 in
 let* () = loc1 <-@ coerce_ptr type_ptr.const x1 in

  Living_core.Default.named_return "foreign_array2" arr
    


let foreign_array3 x0 x1 x2 =
  let open Living_core.Default.Let_syntax in
  let count = 3 in
  let* arr = allocate_n ~count type_ptr.const in
  let loc0 = arr +@ 0 in
 let loc1 = arr +@ 1 in
 let loc2 = arr +@ 2 in

  let* () = loc0 <-@ coerce_ptr type_ptr.const x0 in
 let* () = loc1 <-@ coerce_ptr type_ptr.const x1 in
 let* () = loc2 <-@ coerce_ptr type_ptr.const x2 in

  Living_core.Default.named_return "foreign_array3" arr
    


let foreign_array4 x0 x1 x2 x3 =
  let open Living_core.Default.Let_syntax in
  let count = 4 in
  let* arr = allocate_n ~count type_ptr.const in
  let loc0 = arr +@ 0 in
 let loc1 = arr +@ 1 in
 let loc2 = arr +@ 2 in
 let loc3 = arr +@ 3 in

  let* () = loc0 <-@ coerce_ptr type_ptr.const x0 in
 let* () = loc1 <-@ coerce_ptr type_ptr.const x1 in
 let* () = loc2 <-@ coerce_ptr type_ptr.const x2 in
 let* () = loc3 <-@ coerce_ptr type_ptr.const x3 in

  Living_core.Default.named_return "foreign_array4" arr
    


let foreign_array5 x0 x1 x2 x3 x4 =
  let open Living_core.Default.Let_syntax in
  let count = 5 in
  let* arr = allocate_n ~count type_ptr.const in
  let loc0 = arr +@ 0 in
 let loc1 = arr +@ 1 in
 let loc2 = arr +@ 2 in
 let loc3 = arr +@ 3 in
 let loc4 = arr +@ 4 in

  let* () = loc0 <-@ coerce_ptr type_ptr.const x0 in
 let* () = loc1 <-@ coerce_ptr type_ptr.const x1 in
 let* () = loc2 <-@ coerce_ptr type_ptr.const x2 in
 let* () = loc3 <-@ coerce_ptr type_ptr.const x3 in
 let* () = loc4 <-@ coerce_ptr type_ptr.const x4 in

  Living_core.Default.named_return "foreign_array5" arr
    


let foreign_array6 x0 x1 x2 x3 x4 x5 =
  let open Living_core.Default.Let_syntax in
  let count = 6 in
  let* arr = allocate_n ~count type_ptr.const in
  let loc0 = arr +@ 0 in
 let loc1 = arr +@ 1 in
 let loc2 = arr +@ 2 in
 let loc3 = arr +@ 3 in
 let loc4 = arr +@ 4 in
 let loc5 = arr +@ 5 in

  let* () = loc0 <-@ coerce_ptr type_ptr.const x0 in
 let* () = loc1 <-@ coerce_ptr type_ptr.const x1 in
 let* () = loc2 <-@ coerce_ptr type_ptr.const x2 in
 let* () = loc3 <-@ coerce_ptr type_ptr.const x3 in
 let* () = loc4 <-@ coerce_ptr type_ptr.const x4 in
 let* () = loc5 <-@ coerce_ptr type_ptr.const x5 in

  Living_core.Default.named_return "foreign_array6" arr
    


let foreign_array7 x0 x1 x2 x3 x4 x5 x6 =
  let open Living_core.Default.Let_syntax in
  let count = 7 in
  let* arr = allocate_n ~count type_ptr.const in
  let loc0 = arr +@ 0 in
 let loc1 = arr +@ 1 in
 let loc2 = arr +@ 2 in
 let loc3 = arr +@ 3 in
 let loc4 = arr +@ 4 in
 let loc5 = arr +@ 5 in
 let loc6 = arr +@ 6 in

  let* () = loc0 <-@ coerce_ptr type_ptr.const x0 in
 let* () = loc1 <-@ coerce_ptr type_ptr.const x1 in
 let* () = loc2 <-@ coerce_ptr type_ptr.const x2 in
 let* () = loc3 <-@ coerce_ptr type_ptr.const x3 in
 let* () = loc4 <-@ coerce_ptr type_ptr.const x4 in
 let* () = loc5 <-@ coerce_ptr type_ptr.const x5 in
 let* () = loc6 <-@ coerce_ptr type_ptr.const x6 in

  Living_core.Default.named_return "foreign_array7" arr
    


let foreign_array8 x0 x1 x2 x3 x4 x5 x6 x7 =
  let open Living_core.Default.Let_syntax in
  let count = 8 in
  let* arr = allocate_n ~count type_ptr.const in
  let loc0 = arr +@ 0 in
 let loc1 = arr +@ 1 in
 let loc2 = arr +@ 2 in
 let loc3 = arr +@ 3 in
 let loc4 = arr +@ 4 in
 let loc5 = arr +@ 5 in
 let loc6 = arr +@ 6 in
 let loc7 = arr +@ 7 in

  let* () = loc0 <-@ coerce_ptr type_ptr.const x0 in
 let* () = loc1 <-@ coerce_ptr type_ptr.const x1 in
 let* () = loc2 <-@ coerce_ptr type_ptr.const x2 in
 let* () = loc3 <-@ coerce_ptr type_ptr.const x3 in
 let* () = loc4 <-@ coerce_ptr type_ptr.const x4 in
 let* () = loc5 <-@ coerce_ptr type_ptr.const x5 in
 let* () = loc6 <-@ coerce_ptr type_ptr.const x6 in
 let* () = loc7 <-@ coerce_ptr type_ptr.const x7 in

  Living_core.Default.named_return "foreign_array8" arr
    


let foreign_array9 x0 x1 x2 x3 x4 x5 x6 x7 x8 =
  let open Living_core.Default.Let_syntax in
  let count = 9 in
  let* arr = allocate_n ~count type_ptr.const in
  let loc0 = arr +@ 0 in
 let loc1 = arr +@ 1 in
 let loc2 = arr +@ 2 in
 let loc3 = arr +@ 3 in
 let loc4 = arr +@ 4 in
 let loc5 = arr +@ 5 in
 let loc6 = arr +@ 6 in
 let loc7 = arr +@ 7 in
 let loc8 = arr +@ 8 in

  let* () = loc0 <-@ coerce_ptr type_ptr.const x0 in
 let* () = loc1 <-@ coerce_ptr type_ptr.const x1 in
 let* () = loc2 <-@ coerce_ptr type_ptr.const x2 in
 let* () = loc3 <-@ coerce_ptr type_ptr.const x3 in
 let* () = loc4 <-@ coerce_ptr type_ptr.const x4 in
 let* () = loc5 <-@ coerce_ptr type_ptr.const x5 in
 let* () = loc6 <-@ coerce_ptr type_ptr.const x6 in
 let* () = loc7 <-@ coerce_ptr type_ptr.const x7 in
 let* () = loc8 <-@ coerce_ptr type_ptr.const x8 in

  Living_core.Default.named_return "foreign_array9" arr
    


let foreign_array10 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 =
  let open Living_core.Default.Let_syntax in
  let count = 10 in
  let* arr = allocate_n ~count type_ptr.const in
  let loc0 = arr +@ 0 in
 let loc1 = arr +@ 1 in
 let loc2 = arr +@ 2 in
 let loc3 = arr +@ 3 in
 let loc4 = arr +@ 4 in
 let loc5 = arr +@ 5 in
 let loc6 = arr +@ 6 in
 let loc7 = arr +@ 7 in
 let loc8 = arr +@ 8 in
 let loc9 = arr +@ 9 in

  let* () = loc0 <-@ coerce_ptr type_ptr.const x0 in
 let* () = loc1 <-@ coerce_ptr type_ptr.const x1 in
 let* () = loc2 <-@ coerce_ptr type_ptr.const x2 in
 let* () = loc3 <-@ coerce_ptr type_ptr.const x3 in
 let* () = loc4 <-@ coerce_ptr type_ptr.const x4 in
 let* () = loc5 <-@ coerce_ptr type_ptr.const x5 in
 let* () = loc6 <-@ coerce_ptr type_ptr.const x6 in
 let* () = loc7 <-@ coerce_ptr type_ptr.const x7 in
 let* () = loc8 <-@ coerce_ptr type_ptr.const x8 in
 let* () = loc9 <-@ coerce_ptr type_ptr.const x9 in

  Living_core.Default.named_return "foreign_array10" arr
    


let foreign_array11 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 =
  let open Living_core.Default.Let_syntax in
  let count = 11 in
  let* arr = allocate_n ~count type_ptr.const in
  let loc0 = arr +@ 0 in
 let loc1 = arr +@ 1 in
 let loc2 = arr +@ 2 in
 let loc3 = arr +@ 3 in
 let loc4 = arr +@ 4 in
 let loc5 = arr +@ 5 in
 let loc6 = arr +@ 6 in
 let loc7 = arr +@ 7 in
 let loc8 = arr +@ 8 in
 let loc9 = arr +@ 9 in
 let loc10 = arr +@ 10 in

  let* () = loc0 <-@ coerce_ptr type_ptr.const x0 in
 let* () = loc1 <-@ coerce_ptr type_ptr.const x1 in
 let* () = loc2 <-@ coerce_ptr type_ptr.const x2 in
 let* () = loc3 <-@ coerce_ptr type_ptr.const x3 in
 let* () = loc4 <-@ coerce_ptr type_ptr.const x4 in
 let* () = loc5 <-@ coerce_ptr type_ptr.const x5 in
 let* () = loc6 <-@ coerce_ptr type_ptr.const x6 in
 let* () = loc7 <-@ coerce_ptr type_ptr.const x7 in
 let* () = loc8 <-@ coerce_ptr type_ptr.const x8 in
 let* () = loc9 <-@ coerce_ptr type_ptr.const x9 in
 let* () = loc10 <-@ coerce_ptr type_ptr.const x10 in

  Living_core.Default.named_return "foreign_array11" arr
    


let foreign_array12 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 =
  let open Living_core.Default.Let_syntax in
  let count = 12 in
  let* arr = allocate_n ~count type_ptr.const in
  let loc0 = arr +@ 0 in
 let loc1 = arr +@ 1 in
 let loc2 = arr +@ 2 in
 let loc3 = arr +@ 3 in
 let loc4 = arr +@ 4 in
 let loc5 = arr +@ 5 in
 let loc6 = arr +@ 6 in
 let loc7 = arr +@ 7 in
 let loc8 = arr +@ 8 in
 let loc9 = arr +@ 9 in
 let loc10 = arr +@ 10 in
 let loc11 = arr +@ 11 in

  let* () = loc0 <-@ coerce_ptr type_ptr.const x0 in
 let* () = loc1 <-@ coerce_ptr type_ptr.const x1 in
 let* () = loc2 <-@ coerce_ptr type_ptr.const x2 in
 let* () = loc3 <-@ coerce_ptr type_ptr.const x3 in
 let* () = loc4 <-@ coerce_ptr type_ptr.const x4 in
 let* () = loc5 <-@ coerce_ptr type_ptr.const x5 in
 let* () = loc6 <-@ coerce_ptr type_ptr.const x6 in
 let* () = loc7 <-@ coerce_ptr type_ptr.const x7 in
 let* () = loc8 <-@ coerce_ptr type_ptr.const x8 in
 let* () = loc9 <-@ coerce_ptr type_ptr.const x9 in
 let* () = loc10 <-@ coerce_ptr type_ptr.const x10 in
 let* () = loc11 <-@ coerce_ptr type_ptr.const x11 in

  Living_core.Default.named_return "foreign_array12" arr
    


let foreign_array13 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 =
  let open Living_core.Default.Let_syntax in
  let count = 13 in
  let* arr = allocate_n ~count type_ptr.const in
  let loc0 = arr +@ 0 in
 let loc1 = arr +@ 1 in
 let loc2 = arr +@ 2 in
 let loc3 = arr +@ 3 in
 let loc4 = arr +@ 4 in
 let loc5 = arr +@ 5 in
 let loc6 = arr +@ 6 in
 let loc7 = arr +@ 7 in
 let loc8 = arr +@ 8 in
 let loc9 = arr +@ 9 in
 let loc10 = arr +@ 10 in
 let loc11 = arr +@ 11 in
 let loc12 = arr +@ 12 in

  let* () = loc0 <-@ coerce_ptr type_ptr.const x0 in
 let* () = loc1 <-@ coerce_ptr type_ptr.const x1 in
 let* () = loc2 <-@ coerce_ptr type_ptr.const x2 in
 let* () = loc3 <-@ coerce_ptr type_ptr.const x3 in
 let* () = loc4 <-@ coerce_ptr type_ptr.const x4 in
 let* () = loc5 <-@ coerce_ptr type_ptr.const x5 in
 let* () = loc6 <-@ coerce_ptr type_ptr.const x6 in
 let* () = loc7 <-@ coerce_ptr type_ptr.const x7 in
 let* () = loc8 <-@ coerce_ptr type_ptr.const x8 in
 let* () = loc9 <-@ coerce_ptr type_ptr.const x9 in
 let* () = loc10 <-@ coerce_ptr type_ptr.const x10 in
 let* () = loc11 <-@ coerce_ptr type_ptr.const x11 in
 let* () = loc12 <-@ coerce_ptr type_ptr.const x12 in

  Living_core.Default.named_return "foreign_array13" arr
    


let foreign_array14 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 =
  let open Living_core.Default.Let_syntax in
  let count = 14 in
  let* arr = allocate_n ~count type_ptr.const in
  let loc0 = arr +@ 0 in
 let loc1 = arr +@ 1 in
 let loc2 = arr +@ 2 in
 let loc3 = arr +@ 3 in
 let loc4 = arr +@ 4 in
 let loc5 = arr +@ 5 in
 let loc6 = arr +@ 6 in
 let loc7 = arr +@ 7 in
 let loc8 = arr +@ 8 in
 let loc9 = arr +@ 9 in
 let loc10 = arr +@ 10 in
 let loc11 = arr +@ 11 in
 let loc12 = arr +@ 12 in
 let loc13 = arr +@ 13 in

  let* () = loc0 <-@ coerce_ptr type_ptr.const x0 in
 let* () = loc1 <-@ coerce_ptr type_ptr.const x1 in
 let* () = loc2 <-@ coerce_ptr type_ptr.const x2 in
 let* () = loc3 <-@ coerce_ptr type_ptr.const x3 in
 let* () = loc4 <-@ coerce_ptr type_ptr.const x4 in
 let* () = loc5 <-@ coerce_ptr type_ptr.const x5 in
 let* () = loc6 <-@ coerce_ptr type_ptr.const x6 in
 let* () = loc7 <-@ coerce_ptr type_ptr.const x7 in
 let* () = loc8 <-@ coerce_ptr type_ptr.const x8 in
 let* () = loc9 <-@ coerce_ptr type_ptr.const x9 in
 let* () = loc10 <-@ coerce_ptr type_ptr.const x10 in
 let* () = loc11 <-@ coerce_ptr type_ptr.const x11 in
 let* () = loc12 <-@ coerce_ptr type_ptr.const x12 in
 let* () = loc13 <-@ coerce_ptr type_ptr.const x13 in

  Living_core.Default.named_return "foreign_array14" arr
    

