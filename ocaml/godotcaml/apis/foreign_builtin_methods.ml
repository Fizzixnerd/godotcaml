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

let foreign_builtin_method0 variant_type method_name method_hash _fn ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 0 in
  fun base ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let* arr = foreign_array0 in
    let base = coerce_ptr type_ptr.plain base in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name
      (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_builtin_method0_void variant_type method_name method_hash _fn _ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 0 in
  fun base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let* arr = foreign_array0 in
    let base = coerce_ptr type_ptr.plain base in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name ()

let foreign_builtin_method0v variant_type method_name method_hash _fn ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  fun xs base ->
    let open Living_core.Default.Let_syntax in
    let count = Variadic.length xs in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let* arr = foreign_arrayv xs in
    let base = coerce_ptr type_ptr.plain base in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name
      (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_builtin_method0v_void variant_type method_name method_hash _fn _ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  fun xs base ->
    let open Living_core.Default.Let_syntax in
    let count = Variadic.length xs in
    let ret = coerce_ptr type_ptr.plain null in
    let* arr = foreign_arrayv xs in
    let base = coerce_ptr type_ptr.plain base in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name ()

let foreign_builtin_method1v_void variant_type method_name method_hash _fn _ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  fun x xs base ->
    let open Living_core.Default.Let_syntax in
    let count = Variadic.length xs + 1 in
    let ret = coerce_ptr type_ptr.plain null in
    let* arr = foreign_arrayv (coerce_ptr type_ptr.const x :: xs) in
    let base = coerce_ptr type_ptr.plain base in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name ()

let foreign_builtin_method1 variant_type method_name method_hash
    (_fn : ('x0 -> 'base ptr -> 'ret) fn) ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 1 in
  (fun x0 base ->
     let open Living_core.Default.Let_syntax in
     let* ret =
       Living_core.Default.map
         (coerce (ptr ret_typ) type_ptr.plain)
         (gc_alloc ret_typ ~count:1)
     in
     let* arr = foreign_array1 x0 in
     let base = coerce_ptr type_ptr.plain base in
     let () =
       coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
         ret count
     in
     Living_core.Default.named_return method_name
       (coerce type_ptr.plain (ptr ret_typ) ret)
    : 'x0 -> 'base ptr -> 'ret Living_core.Default.t)

let foreign_builtin_method1_void variant_type method_name method_hash _fn _ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 1 in
  fun x0 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let* arr = foreign_array1 x0 in
    let base = coerce_ptr type_ptr.plain base in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name ()

let foreign_builtin_method1_static variant_type method_name method_hash _fn
    ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 1 in
  fun x0 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let* arr = foreign_array1 x0 in
    let base = coerce_ptr type_ptr.plain null in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name
      (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_builtin_method2 variant_type method_name method_hash
    (_fn : ('x0 -> 'x1 -> 'base ptr -> 'ret) fn) ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 2 in
  (fun x0 x1 base ->
     let open Living_core.Default.Let_syntax in
     let* ret =
       Living_core.Default.map
         (coerce (ptr ret_typ) type_ptr.plain)
         (gc_alloc ret_typ ~count:1)
     in
     let* arr = foreign_array2 x0 x1 in
     let base = coerce_ptr type_ptr.plain base in
     let () =
       coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
         ret count
     in
     Living_core.Default.named_return method_name
       (coerce type_ptr.plain (ptr ret_typ) ret)
    : 'x0 -> 'x1 -> 'base ptr -> 'ret Living_core.Default.t)

let foreign_builtin_method2_void variant_type method_name method_hash _fn _ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 2 in
  fun x0 x1 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let* arr = foreign_array2 x0 x1 in
    let base = coerce_ptr type_ptr.plain base in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name ()

let foreign_builtin_method2_static variant_type method_name method_hash _fn
    ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 2 in
  fun x0 x1 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let* arr = foreign_array2 x0 x1 in
    let base = coerce_ptr type_ptr.plain null in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name
      (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_builtin_method3 variant_type method_name method_hash
    (_fn : ('x0 -> 'x1 -> 'x2 -> 'base ptr -> 'ret) fn) ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 3 in
  (fun x0 x1 x2 base ->
     let open Living_core.Default.Let_syntax in
     let* ret =
       Living_core.Default.map
         (coerce (ptr ret_typ) type_ptr.plain)
         (gc_alloc ret_typ ~count:1)
     in
     let* arr = foreign_array3 x0 x1 x2 in
     let base = coerce_ptr type_ptr.plain base in
     let () =
       coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
         ret count
     in
     Living_core.Default.named_return method_name
       (coerce type_ptr.plain (ptr ret_typ) ret)
    : 'x0 -> 'x1 -> 'x2 -> 'base ptr -> 'ret Living_core.Default.t)

let foreign_builtin_method3_void variant_type method_name method_hash _fn _ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 3 in
  fun x0 x1 x2 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let* arr = foreign_array3 x0 x1 x2 in
    let base = coerce_ptr type_ptr.plain base in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name ()

let foreign_builtin_method3_static variant_type method_name method_hash _fn
    ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 3 in
  fun x0 x1 x2 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let* arr = foreign_array3 x0 x1 x2 in
    let base = coerce_ptr type_ptr.plain null in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name
      (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_builtin_method4 variant_type method_name method_hash
    (_fn : ('x0 -> 'x1 -> 'x2 -> 'x3 -> 'base ptr -> 'ret) fn) ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 4 in
  (fun x0 x1 x2 x3 base ->
     let open Living_core.Default.Let_syntax in
     let* ret =
       Living_core.Default.map
         (coerce (ptr ret_typ) type_ptr.plain)
         (gc_alloc ret_typ ~count:1)
     in
     let* arr = foreign_array4 x0 x1 x2 x3 in
     let base = coerce_ptr type_ptr.plain base in
     let () =
       coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
         ret count
     in
     Living_core.Default.named_return method_name
       (coerce type_ptr.plain (ptr ret_typ) ret)
    : 'x0 -> 'x1 -> 'x2 -> 'x3 -> 'base ptr -> 'ret Living_core.Default.t)

let foreign_builtin_method4_void variant_type method_name method_hash _fn _ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 4 in
  fun x0 x1 x2 x3 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let* arr = foreign_array4 x0 x1 x2 x3 in
    let base = coerce_ptr type_ptr.plain base in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name ()

let foreign_builtin_method4_static variant_type method_name method_hash _fn
    ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 4 in
  fun x0 x1 x2 x3 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let* arr = foreign_array4 x0 x1 x2 x3 in
    let base = coerce_ptr type_ptr.plain null in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name
      (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_builtin_method5 variant_type method_name method_hash
    (_fn : ('x0 -> 'x1 -> 'x2 -> 'x3 -> 'x4 -> 'base ptr -> 'ret) fn) ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 5 in
  (fun x0 x1 x2 x3 x4 base ->
     let open Living_core.Default.Let_syntax in
     let* ret =
       Living_core.Default.map
         (coerce (ptr ret_typ) type_ptr.plain)
         (gc_alloc ret_typ ~count:1)
     in
     let* arr = foreign_array5 x0 x1 x2 x3 x4 in
     let base = coerce_ptr type_ptr.plain base in
     let () =
       coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
         ret count
     in
     Living_core.Default.named_return method_name
       (coerce type_ptr.plain (ptr ret_typ) ret)
    : 'x0 -> 'x1 -> 'x2 -> 'x3 -> 'x4 -> 'base ptr -> 'ret Living_core.Default.t)

let foreign_builtin_method5_void variant_type method_name method_hash _fn _ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 5 in
  fun x0 x1 x2 x3 x4 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let* arr = foreign_array5 x0 x1 x2 x3 x4 in
    let base = coerce_ptr type_ptr.plain base in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name ()

let foreign_builtin_method5_static variant_type method_name method_hash _fn
    ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 5 in
  fun x0 x1 x2 x3 x4 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let* arr = foreign_array5 x0 x1 x2 x3 x4 in
    let base = coerce_ptr type_ptr.plain null in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name
      (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_builtin_method6 variant_type method_name method_hash
    (_fn : ('x0 -> 'x1 -> 'x2 -> 'x3 -> 'x4 -> 'x5 -> 'base ptr -> 'ret) fn)
    ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 6 in
  (fun x0 x1 x2 x3 x4 x5 base ->
     let open Living_core.Default.Let_syntax in
     let* ret =
       Living_core.Default.map
         (coerce (ptr ret_typ) type_ptr.plain)
         (gc_alloc ret_typ ~count:1)
     in
     let* arr = foreign_array6 x0 x1 x2 x3 x4 x5 in
     let base = coerce_ptr type_ptr.plain base in
     let () =
       coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
         ret count
     in
     Living_core.Default.named_return method_name
       (coerce type_ptr.plain (ptr ret_typ) ret)
    : 'x0 ->
      'x1 ->
      'x2 ->
      'x3 ->
      'x4 ->
      'x5 ->
      'base ptr ->
      'ret Living_core.Default.t)

let foreign_builtin_method6_void variant_type method_name method_hash _fn _ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 6 in
  fun x0 x1 x2 x3 x4 x5 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let* arr = foreign_array6 x0 x1 x2 x3 x4 x5 in
    let base = coerce_ptr type_ptr.plain base in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name ()

let foreign_builtin_method6_static variant_type method_name method_hash _fn
    ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 6 in
  fun x0 x1 x2 x3 x4 x5 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let* arr = foreign_array6 x0 x1 x2 x3 x4 x5 in
    let base = coerce_ptr type_ptr.plain null in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name
      (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_builtin_method7 variant_type method_name method_hash
    (_fn :
      ('x0 -> 'x1 -> 'x2 -> 'x3 -> 'x4 -> 'x5 -> 'x6 -> 'base ptr -> 'ret) fn)
    ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 7 in
  (fun x0 x1 x2 x3 x4 x5 x6 base ->
     let open Living_core.Default.Let_syntax in
     let* ret =
       Living_core.Default.map
         (coerce (ptr ret_typ) type_ptr.plain)
         (gc_alloc ret_typ ~count:1)
     in
     let* arr = foreign_array7 x0 x1 x2 x3 x4 x5 x6 in
     let base = coerce_ptr type_ptr.plain base in
     let () =
       coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
         ret count
     in
     Living_core.Default.named_return method_name
       (coerce type_ptr.plain (ptr ret_typ) ret)
    : 'x0 ->
      'x1 ->
      'x2 ->
      'x3 ->
      'x4 ->
      'x5 ->
      'x6 ->
      'base ptr ->
      'ret Living_core.Default.t)

let foreign_builtin_method7_void variant_type method_name method_hash _fn _ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 7 in
  fun x0 x1 x2 x3 x4 x5 x6 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let* arr = foreign_array7 x0 x1 x2 x3 x4 x5 x6 in
    let base = coerce_ptr type_ptr.plain base in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name ()

let foreign_builtin_method7_static variant_type method_name method_hash _fn
    ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 7 in
  fun x0 x1 x2 x3 x4 x5 x6 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let* arr = foreign_array7 x0 x1 x2 x3 x4 x5 x6 in
    let base = coerce_ptr type_ptr.plain null in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name
      (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_builtin_method8 variant_type method_name method_hash
    (_fn :
      ('x0 ->
      'x1 ->
      'x2 ->
      'x3 ->
      'x4 ->
      'x5 ->
      'x6 ->
      'x7 ->
      'base ptr ->
      'ret)
      fn) ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 8 in
  (fun x0 x1 x2 x3 x4 x5 x6 x7 base ->
     let open Living_core.Default.Let_syntax in
     let* ret =
       Living_core.Default.map
         (coerce (ptr ret_typ) type_ptr.plain)
         (gc_alloc ret_typ ~count:1)
     in
     let* arr = foreign_array8 x0 x1 x2 x3 x4 x5 x6 x7 in
     let base = coerce_ptr type_ptr.plain base in
     let () =
       coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
         ret count
     in
     Living_core.Default.named_return method_name
       (coerce type_ptr.plain (ptr ret_typ) ret)
    : 'x0 ->
      'x1 ->
      'x2 ->
      'x3 ->
      'x4 ->
      'x5 ->
      'x6 ->
      'x7 ->
      'base ptr ->
      'ret Living_core.Default.t)

let foreign_builtin_method8_void variant_type method_name method_hash _fn _ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 8 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let* arr = foreign_array8 x0 x1 x2 x3 x4 x5 x6 x7 in
    let base = coerce_ptr type_ptr.plain base in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name ()

let foreign_builtin_method8_static variant_type method_name method_hash _fn
    ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 8 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let* arr = foreign_array8 x0 x1 x2 x3 x4 x5 x6 x7 in
    let base = coerce_ptr type_ptr.plain null in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name
      (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_builtin_method9 variant_type method_name method_hash
    (_fn :
      ('x0 ->
      'x1 ->
      'x2 ->
      'x3 ->
      'x4 ->
      'x5 ->
      'x6 ->
      'x7 ->
      'x8 ->
      'base ptr ->
      'ret)
      fn) ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 9 in
  (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 base ->
     let open Living_core.Default.Let_syntax in
     let* ret =
       Living_core.Default.map
         (coerce (ptr ret_typ) type_ptr.plain)
         (gc_alloc ret_typ ~count:1)
     in
     let* arr = foreign_array9 x0 x1 x2 x3 x4 x5 x6 x7 x8 in
     let base = coerce_ptr type_ptr.plain base in
     let () =
       coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
         ret count
     in
     Living_core.Default.named_return method_name
       (coerce type_ptr.plain (ptr ret_typ) ret)
    : 'x0 ->
      'x1 ->
      'x2 ->
      'x3 ->
      'x4 ->
      'x5 ->
      'x6 ->
      'x7 ->
      'x8 ->
      'base ptr ->
      'ret Living_core.Default.t)

let foreign_builtin_method9_void variant_type method_name method_hash _fn _ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 9 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let* arr = foreign_array9 x0 x1 x2 x3 x4 x5 x6 x7 x8 in
    let base = coerce_ptr type_ptr.plain base in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name ()

let foreign_builtin_method9_static variant_type method_name method_hash _fn
    ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 9 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let* arr = foreign_array9 x0 x1 x2 x3 x4 x5 x6 x7 x8 in
    let base = coerce_ptr type_ptr.plain null in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name
      (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_builtin_method10 variant_type method_name method_hash
    (_fn :
      ('x0 ->
      'x1 ->
      'x2 ->
      'x3 ->
      'x4 ->
      'x5 ->
      'x6 ->
      'x7 ->
      'x8 ->
      'x9 ->
      'base ptr ->
      'ret)
      fn) ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 10 in
  (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 base ->
     let open Living_core.Default.Let_syntax in
     let* ret =
       Living_core.Default.map
         (coerce (ptr ret_typ) type_ptr.plain)
         (gc_alloc ret_typ ~count:1)
     in
     let* arr = foreign_array10 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 in
     let base = coerce_ptr type_ptr.plain base in
     let () =
       coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
         ret count
     in
     Living_core.Default.named_return method_name
       (coerce type_ptr.plain (ptr ret_typ) ret)
    : 'x0 ->
      'x1 ->
      'x2 ->
      'x3 ->
      'x4 ->
      'x5 ->
      'x6 ->
      'x7 ->
      'x8 ->
      'x9 ->
      'base ptr ->
      'ret Living_core.Default.t)

let foreign_builtin_method10_void variant_type method_name method_hash _fn _ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 10 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let* arr = foreign_array10 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 in
    let base = coerce_ptr type_ptr.plain base in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name ()

let foreign_builtin_method10_static variant_type method_name method_hash _fn
    ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 10 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let* arr = foreign_array10 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 in
    let base = coerce_ptr type_ptr.plain null in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name
      (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_builtin_method11 variant_type method_name method_hash
    (_fn :
      ('x0 ->
      'x1 ->
      'x2 ->
      'x3 ->
      'x4 ->
      'x5 ->
      'x6 ->
      'x7 ->
      'x8 ->
      'x9 ->
      'x10 ->
      'base ptr ->
      'ret)
      fn) ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 11 in
  (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 base ->
     let open Living_core.Default.Let_syntax in
     let* ret =
       Living_core.Default.map
         (coerce (ptr ret_typ) type_ptr.plain)
         (gc_alloc ret_typ ~count:1)
     in
     let* arr = foreign_array11 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 in
     let base = coerce_ptr type_ptr.plain base in
     let () =
       coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
         ret count
     in
     Living_core.Default.named_return method_name
       (coerce type_ptr.plain (ptr ret_typ) ret)
    : 'x0 ->
      'x1 ->
      'x2 ->
      'x3 ->
      'x4 ->
      'x5 ->
      'x6 ->
      'x7 ->
      'x8 ->
      'x9 ->
      'x10 ->
      'base ptr ->
      'ret Living_core.Default.t)

let foreign_builtin_method11_void variant_type method_name method_hash _fn _ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 11 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let* arr = foreign_array11 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 in
    let base = coerce_ptr type_ptr.plain base in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name ()

let foreign_builtin_method11_static variant_type method_name method_hash _fn
    ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 11 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let* arr = foreign_array11 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 in
    let base = coerce_ptr type_ptr.plain null in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name
      (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_builtin_method12 variant_type method_name method_hash
    (_fn :
      ('x0 ->
      'x1 ->
      'x2 ->
      'x3 ->
      'x4 ->
      'x5 ->
      'x6 ->
      'x7 ->
      'x8 ->
      'x9 ->
      'x10 ->
      'x11 ->
      'base ptr ->
      'ret)
      fn) ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 12 in
  (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 base ->
     let open Living_core.Default.Let_syntax in
     let* ret =
       Living_core.Default.map
         (coerce (ptr ret_typ) type_ptr.plain)
         (gc_alloc ret_typ ~count:1)
     in
     let* arr = foreign_array12 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 in
     let base = coerce_ptr type_ptr.plain base in
     let () =
       coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
         ret count
     in
     Living_core.Default.named_return method_name
       (coerce type_ptr.plain (ptr ret_typ) ret)
    : 'x0 ->
      'x1 ->
      'x2 ->
      'x3 ->
      'x4 ->
      'x5 ->
      'x6 ->
      'x7 ->
      'x8 ->
      'x9 ->
      'x10 ->
      'x11 ->
      'base ptr ->
      'ret Living_core.Default.t)

let foreign_builtin_method12_void variant_type method_name method_hash _fn _ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 12 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let* arr = foreign_array12 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 in
    let base = coerce_ptr type_ptr.plain base in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name ()

let foreign_builtin_method12_static variant_type method_name method_hash _fn
    ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 12 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let* arr = foreign_array12 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 in
    let base = coerce_ptr type_ptr.plain null in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name
      (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_builtin_method13 variant_type method_name method_hash
    (_fn :
      ('x0 ->
      'x1 ->
      'x2 ->
      'x3 ->
      'x4 ->
      'x5 ->
      'x6 ->
      'x7 ->
      'x8 ->
      'x9 ->
      'x10 ->
      'x11 ->
      'x12 ->
      'base ptr ->
      'ret)
      fn) ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 13 in
  (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 base ->
     let open Living_core.Default.Let_syntax in
     let* ret =
       Living_core.Default.map
         (coerce (ptr ret_typ) type_ptr.plain)
         (gc_alloc ret_typ ~count:1)
     in
     let* arr = foreign_array13 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 in
     let base = coerce_ptr type_ptr.plain base in
     let () =
       coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
         ret count
     in
     Living_core.Default.named_return method_name
       (coerce type_ptr.plain (ptr ret_typ) ret)
    : 'x0 ->
      'x1 ->
      'x2 ->
      'x3 ->
      'x4 ->
      'x5 ->
      'x6 ->
      'x7 ->
      'x8 ->
      'x9 ->
      'x10 ->
      'x11 ->
      'x12 ->
      'base ptr ->
      'ret Living_core.Default.t)

let foreign_builtin_method13_void variant_type method_name method_hash _fn _ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 13 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let* arr = foreign_array13 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 in
    let base = coerce_ptr type_ptr.plain base in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name ()

let foreign_builtin_method13_static variant_type method_name method_hash _fn
    ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 13 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let* arr = foreign_array13 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 in
    let base = coerce_ptr type_ptr.plain null in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name
      (coerce type_ptr.plain (ptr ret_typ) ret)

let foreign_builtin_method14 variant_type method_name method_hash
    (_fn :
      ('x0 ->
      'x1 ->
      'x2 ->
      'x3 ->
      'x4 ->
      'x5 ->
      'x6 ->
      'x7 ->
      'x8 ->
      'x9 ->
      'x10 ->
      'x11 ->
      'x12 ->
      'x13 ->
      'base ptr ->
      'ret)
      fn) ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 14 in
  (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 base ->
     let open Living_core.Default.Let_syntax in
     let* ret =
       Living_core.Default.map
         (coerce (ptr ret_typ) type_ptr.plain)
         (gc_alloc ret_typ ~count:1)
     in
     let* arr = foreign_array14 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 in
     let base = coerce_ptr type_ptr.plain base in
     let () =
       coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
         ret count
     in
     Living_core.Default.named_return method_name
       (coerce type_ptr.plain (ptr ret_typ) ret)
    : 'x0 ->
      'x1 ->
      'x2 ->
      'x3 ->
      'x4 ->
      'x5 ->
      'x6 ->
      'x7 ->
      'x8 ->
      'x9 ->
      'x10 ->
      'x11 ->
      'x12 ->
      'x13 ->
      'base ptr ->
      'ret Living_core.Default.t)

let foreign_builtin_method14_void variant_type method_name method_hash _fn _ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 14 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 base ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let* arr = foreign_array14 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 in
    let base = coerce_ptr type_ptr.plain base in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name ()

let foreign_builtin_method14_static variant_type method_name method_hash _fn
    ret_typ =
  let string_name =
    Living_core.Default.unsafe_free (string_name_of_string method_name)
  in
  let builtin_method =
    variant_get_ptr_builtin_method variant_type string_name method_hash
  in
  let () = (* call stringname destructor here *) () in
  let count = 14 in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      Living_core.Default.map
        (coerce (ptr ret_typ) type_ptr.plain)
        (gc_alloc ret_typ ~count:1)
    in
    let* arr = foreign_array14 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 in
    let base = coerce_ptr type_ptr.plain null in
    let () =
      coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base arr
        ret count
    in
    Living_core.Default.named_return method_name
      (coerce type_ptr.plain (ptr ret_typ) ret)
