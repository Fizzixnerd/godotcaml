open! Base
open Ctypes
open Godotcaml_base
open Godotcaml
open C
module Suite = TypedSuite
module Godotcaml = Godotcaml
module C = C
open Api_types
open Foreign_base

(* FIXME: Make this not a functor maybe! *)
module Make =
functor
  (ClassSizes : CLASS_SIZES)
  ->
  struct
    let foreign_utility_function0 name hash ret_typ ret_to_ocaml =
      let utility_function = variant_get_ptr_utility_function name hash in
      let count = 0 in
      fun () ->
        let ret =
          coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1)
        in
        let arr = foreign_arr0 in
        let () =
          coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function
            ret arr count
        in
        ret_to_ocaml (coerce type_ptr.plain (ptr ret_typ) ret)

    let foreign_utility_function0_void name hash ret_typ _ret_to_ocaml =
      let utility_function = variant_get_ptr_utility_function name hash in
      let count = 0 in
      fun () ->
        let ret = coerce (ptr ret_typ) type_ptr.plain null in
        let arr = foreign_arr0 in
        let () =
          coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function
            ret arr count
        in
        ()

    let foreign_utility_functionv :
        string ->
        int64 ->
        (Variadic.t -> 'r ptr) fn ->
        'r typ ->
        Variadic.t ->
        'r ptr =
     fun name hash _fn ret_typ ->
      let utility_function = variant_get_ptr_utility_function name hash in
      fun xs ->
        let count = Variadic.length xs in
        let ret =
          coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1)
        in
        let arr = foreign_arrv xs in
        let () =
          coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function
            ret arr count
        in
        coerce type_ptr.plain (ptr ret_typ) ret

    let foreign_utility_functionv_void :
        string -> int64 -> (Variadic.t -> unit) fn -> 'any -> Variadic.t -> unit
        =
     fun name hash _fn _ ->
      let utility_function = variant_get_ptr_utility_function name hash in
      fun xs ->
        let count = Variadic.length xs in
        let ret = coerce_ptr type_ptr.plain null in
        let arr = foreign_arrv xs in
        let () =
          coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function
            ret arr count
        in
        ()

    let foreign_builtin_method0 :
        int ->
        string ->
        int64 ->
        ('base ptr -> 'r ptr) fn ->
        'r typ ->
        'base ptr ->
        'r ptr =
     fun variant_type method_name method_hash _fn ret_typ ->
      let string_name = string_name_of_string method_name in
      let builtin_method =
        variant_get_ptr_builtin_method variant_type string_name method_hash
      in
      let () = (* call stringname destructor here *) () in
      let count = 0 in
      fun base ->
        let ret =
          coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1)
        in
        let arr = foreign_arr0 in
        let base = coerce_ptr type_ptr.plain base in
        let () =
          coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base
            arr ret count
        in
        coerce type_ptr.plain (ptr ret_typ) ret

    let foreign_builtin_method0_void :
        int ->
        string ->
        int64 ->
        ('base ptr -> unit) fn ->
        'any ->
        'base ptr ->
        unit =
     fun variant_type method_name method_hash _fn _ ->
      let string_name = string_name_of_string method_name in
      let builtin_method =
        variant_get_ptr_builtin_method variant_type string_name method_hash
      in
      let () = (* call stringname destructor here *) () in
      let count = 0 in
      fun base ->
        let ret = coerce_ptr type_ptr.plain null in
        let arr = foreign_arr0 in
        let base = coerce_ptr type_ptr.plain base in
        let () =
          coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base
            arr ret count
        in
        ()

    let foreign_builtin_method1 :
        int ->
        string ->
        int64 ->
        ('a -> 'base ptr -> 'r ptr) fn ->
        'r typ ->
        'a ->
        'base ptr ->
        'r ptr =
     fun variant_type method_name method_hash _fn ret_typ ->
      let string_name = string_name_of_string method_name in
      let builtin_method =
        variant_get_ptr_builtin_method variant_type string_name method_hash
      in
      let () = (* call stringname destructor here *) () in
      let count = 1 in
      fun x base ->
        let ret =
          coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1)
        in
        let arr = foreign_arr1 x in
        let base = coerce_ptr type_ptr.plain base in
        let () =
          coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base
            arr ret count
        in
        coerce type_ptr.plain (ptr ret_typ) ret

    let foreign_builtin_method1_static :
        int -> string -> int64 -> ('a -> 'r ptr) fn -> 'r typ -> 'a -> 'r ptr =
     fun variant_type method_name method_hash _fn ret_typ ->
      let string_name = string_name_of_string method_name in
      let builtin_method =
        variant_get_ptr_builtin_method variant_type string_name method_hash
      in
      let () = (* call stringname destructor here *) () in
      let count = 1 in
      fun x ->
        let ret =
          coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1)
        in
        let arr = foreign_arr1 x in
        let base = coerce_ptr type_ptr.plain null in
        let () =
          coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base
            arr ret count
        in
        coerce type_ptr.plain (ptr ret_typ) ret

    let foreign_builtin_method1_void :
        int ->
        string ->
        int64 ->
        ('a -> 'base ptr -> unit) fn ->
        'any ->
        'a ->
        'base ptr ->
        unit =
     fun variant_type method_name method_hash _fn _ ->
      let string_name = string_name_of_string method_name in
      let builtin_method =
        variant_get_ptr_builtin_method variant_type string_name method_hash
      in
      let () = (* call stringname destructor here *) () in
      let count = 1 in
      fun x base ->
        let ret = coerce_ptr type_ptr.plain null in
        let arr = foreign_arr1 x in
        let base = coerce_ptr type_ptr.plain base in
        let () =
          coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base
            arr ret count
        in
        ()

    let foreign_builtin_method2 :
        int ->
        string ->
        int64 ->
        ('a -> 'b -> 'base ptr -> 'r ptr) fn ->
        'r typ ->
        'a ->
        'b ->
        'base ptr ->
        'r ptr =
     fun variant_type method_name method_hash _fn ret_typ ->
      let string_name = string_name_of_string method_name in
      let builtin_method =
        variant_get_ptr_builtin_method variant_type string_name method_hash
      in
      let () = (* call stringname destructor here *) () in
      let count = 2 in
      fun x y base ->
        let ret =
          coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1)
        in
        let arr = foreign_arr2 x y in
        let base = coerce_ptr type_ptr.plain base in
        let () =
          coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base
            arr ret count
        in
        coerce type_ptr.plain (ptr ret_typ) ret

    let foreign_builtin_method2_static :
        int ->
        string ->
        int64 ->
        ('a -> 'b -> 'r ptr) fn ->
        'r typ ->
        'a ->
        'b ->
        'r ptr =
     fun variant_type method_name method_hash _fn ret_typ ->
      let string_name = string_name_of_string method_name in
      let builtin_method =
        variant_get_ptr_builtin_method variant_type string_name method_hash
      in
      let () = (* call stringname destructor here *) () in
      let count = 2 in
      fun x y ->
        let ret =
          coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1)
        in
        let arr = foreign_arr2 x y in
        let base = coerce_ptr type_ptr.plain null in
        let () =
          coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base
            arr ret count
        in
        coerce type_ptr.plain (ptr ret_typ) ret

    let foreign_builtin_method2_void :
        int ->
        string ->
        int64 ->
        ('a -> 'b -> 'base ptr -> unit) fn ->
        'any ->
        'a ->
        'b ->
        'base ptr ->
        unit =
     fun variant_type method_name method_hash _fn _ ->
      let string_name = string_name_of_string method_name in
      let builtin_method =
        variant_get_ptr_builtin_method variant_type string_name method_hash
      in
      let () = (* call stringname destructor here *) () in
      let count = 2 in
      fun x y base ->
        let ret = coerce_ptr type_ptr.plain null in
        let arr = foreign_arr2 x y in
        let base = coerce_ptr type_ptr.plain base in
        let () =
          coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base
            arr ret count
        in
        ()

    let foreign_builtin_method3 :
        int ->
        string ->
        int64 ->
        ('a -> 'b -> 'c -> 'base ptr -> 'r ptr) fn ->
        'r typ ->
        'a ->
        'b ->
        'c ->
        'base ptr ->
        'r ptr =
     fun variant_type method_name method_hash _fn ret_typ ->
      let string_name = string_name_of_string method_name in
      let builtin_method =
        variant_get_ptr_builtin_method variant_type string_name method_hash
      in
      let () = (* call stringname destructor here *) () in
      let count = 3 in
      fun x y z base ->
        let ret =
          coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1)
        in
        let arr = foreign_arr3 x y z in
        let base = coerce_ptr type_ptr.plain base in
        let () =
          coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base
            arr ret count
        in
        coerce type_ptr.plain (ptr ret_typ) ret

    let foreign_builtin_method3_static :
        int ->
        string ->
        int64 ->
        ('a -> 'b -> 'c -> 'r ptr) fn ->
        'r typ ->
        'a ->
        'b ->
        'c ->
        'r ptr =
     fun variant_type method_name method_hash _fn ret_typ ->
      let string_name = string_name_of_string method_name in
      let builtin_method =
        variant_get_ptr_builtin_method variant_type string_name method_hash
      in
      let () = (* call stringname destructor here *) () in
      let count = 3 in
      fun x y z ->
        let ret =
          coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1)
        in
        let arr = foreign_arr3 x y z in
        let base = coerce_ptr type_ptr.plain null in
        let () =
          coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base
            arr ret count
        in
        coerce type_ptr.plain (ptr ret_typ) ret

    let foreign_builtin_method4 :
        int ->
        string ->
        int64 ->
        ('a -> 'b -> 'c -> 'd -> 'base ptr -> 'r ptr) fn ->
        'r typ ->
        'a ->
        'b ->
        'c ->
        'd ->
        'base ptr ->
        'r ptr =
     fun variant_type method_name method_hash _fn ret_typ ->
      let string_name = string_name_of_string method_name in
      let builtin_method =
        variant_get_ptr_builtin_method variant_type string_name method_hash
      in
      let () = (* call stringname destructor here *) () in
      let count = 4 in
      fun x y z w base ->
        let ret =
          coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1)
        in
        let arr = foreign_arr4 x y z w in
        let base = coerce_ptr type_ptr.plain base in
        let () =
          coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base
            arr ret count
        in
        coerce type_ptr.plain (ptr ret_typ) ret

    let foreign_builtin_method4_static :
        int ->
        string ->
        int64 ->
        ('a -> 'b -> 'c -> 'd -> 'r ptr) fn ->
        'r typ ->
        'a ->
        'b ->
        'c ->
        'd ->
        'r ptr =
     fun variant_type method_name method_hash _fn ret_typ ->
      let string_name = string_name_of_string method_name in
      let builtin_method =
        variant_get_ptr_builtin_method variant_type string_name method_hash
      in
      let () = (* call stringname destructor here *) () in
      let count = 4 in
      fun x y z w ->
        let ret =
          coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1)
        in
        let arr = foreign_arr4 x y z w in
        let base = coerce_ptr type_ptr.plain null in
        let () =
          coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base
            arr ret count
        in
        coerce type_ptr.plain (ptr ret_typ) ret

    let foreign_builtin_method5_static :
        int ->
        string ->
        int64 ->
        ('a -> 'b -> 'c -> 'd -> 'e -> 'r ptr) fn ->
        'r typ ->
        'a ->
        'b ->
        'c ->
        'd ->
        'e ->
        'r ptr =
     fun variant_type method_name method_hash _fn ret_typ ->
      let string_name = string_name_of_string method_name in
      let builtin_method =
        variant_get_ptr_builtin_method variant_type string_name method_hash
      in
      let () = (* call stringname destructor here *) () in
      let count = 5 in
      fun x y z w r ->
        let ret =
          coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1)
        in
        let arr = foreign_arr5 x y z w r in
        let base = coerce_ptr type_ptr.plain null in
        let () =
          coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base
            arr ret count
        in
        coerce type_ptr.plain (ptr ret_typ) ret

    let foreign_builtin_method6_static :
        int ->
        string ->
        int64 ->
        ('a -> 'b -> 'c -> 'd -> 'e -> 'f -> 'r ptr) fn ->
        'r typ ->
        'a ->
        'b ->
        'c ->
        'd ->
        'e ->
        'f ->
        'r ptr =
     fun variant_type method_name method_hash _fn ret_typ ->
      let string_name = string_name_of_string method_name in
      let builtin_method =
        variant_get_ptr_builtin_method variant_type string_name method_hash
      in
      let () = (* call stringname destructor here *) () in
      let count = 6 in
      fun x y z w r s ->
        let ret =
          coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1)
        in
        let arr = foreign_arr6 x y z w r s in
        let base = coerce_ptr type_ptr.plain null in
        let () =
          coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base
            arr ret count
        in
        coerce type_ptr.plain (ptr ret_typ) ret

    let foreign_builtin_method7 :
        int ->
        string ->
        int64 ->
        ('a -> 'b -> 'c -> 'd -> 'e -> 'f -> 'g -> 'base ptr -> 'r ptr) fn ->
        'r typ ->
        'a ->
        'b ->
        'c ->
        'd ->
        'e ->
        'f ->
        'g ->
        'base ptr ->
        'r ptr =
     fun variant_type method_name method_hash _fn ret_typ ->
      let string_name = string_name_of_string method_name in
      let builtin_method =
        variant_get_ptr_builtin_method variant_type string_name method_hash
      in
      let () = (* call stringname destructor here *) () in
      let count = 7 in
      fun x y z w r s t base ->
        let ret =
          coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1)
        in
        let arr = foreign_arr7 x y z w r s t in
        let base = coerce_ptr type_ptr.plain base in
        let () =
          coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base
            arr ret count
        in
        coerce type_ptr.plain (ptr ret_typ) ret

    let foreign_builtin_method8_static :
        int ->
        string ->
        int64 ->
        ('a -> 'b -> 'c -> 'd -> 'e -> 'f -> 'g -> 'h -> 'r ptr) fn ->
        'r typ ->
        'a ->
        'b ->
        'c ->
        'd ->
        'e ->
        'f ->
        'g ->
        'h ->
        'r ptr =
     fun variant_type method_name method_hash _fn ret_typ ->
      let string_name = string_name_of_string method_name in
      let builtin_method =
        variant_get_ptr_builtin_method variant_type string_name method_hash
      in
      let () = (* call stringname destructor here *) () in
      let count = 8 in
      fun x y z w r s t u ->
        let ret =
          coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1)
        in
        let arr = foreign_arr8 x y z w r s t u in
        let base = coerce_ptr type_ptr.plain null in
        let () =
          coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base
            arr ret count
        in
        coerce type_ptr.plain (ptr ret_typ) ret

    let foreign_builtin_method0v :
        int ->
        string ->
        int64 ->
        (Variadic.t -> 'base ptr -> 'r ptr) fn ->
        'r typ ->
        Variadic.t ->
        'base ptr ->
        'r ptr =
     fun variant_type method_name method_hash _fn ret_typ ->
      let string_name = string_name_of_string method_name in
      let builtin_method =
        variant_get_ptr_builtin_method variant_type string_name method_hash
      in
      let () = (* call stringname destructor here *) () in
      fun xs base ->
        let count = Variadic.length xs in
        let ret =
          coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1)
        in
        let arr = foreign_arrv xs in
        let base = coerce_ptr type_ptr.plain base in
        let () =
          coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base
            arr ret count
        in
        coerce type_ptr.plain (ptr ret_typ) ret

    let foreign_builtin_method0v_void :
        int ->
        string ->
        int64 ->
        (Variadic.t -> 'base ptr -> unit) fn ->
        'any ->
        Variadic.t ->
        'base ptr ->
        unit =
     fun variant_type method_name method_hash _fn _ ->
      let string_name = string_name_of_string method_name in
      let builtin_method =
        variant_get_ptr_builtin_method variant_type string_name method_hash
      in
      let () = (* call stringname destructor here *) () in
      fun xs base ->
        let count = Variadic.length xs in
        let ret = coerce_ptr type_ptr.plain null in
        let arr = foreign_arrv xs in
        let base = coerce_ptr type_ptr.plain base in
        let () =
          coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base
            arr ret count
        in
        ()

    let foreign_builtin_method1v_void :
        int ->
        string ->
        int64 ->
        ('a -> Variadic.t -> 'base ptr -> unit) fn ->
        'any ->
        'a ->
        Variadic.t ->
        'base ptr ->
        unit =
     fun variant_type method_name method_hash _fn _ ->
      let string_name = string_name_of_string method_name in
      let builtin_method =
        variant_get_ptr_builtin_method variant_type string_name method_hash
      in
      let () = (* call stringname destructor here *) () in
      fun x xs base ->
        let count = Variadic.length xs + 1 in
        let ret = coerce_ptr type_ptr.plain null in
        let arr = foreign_arrv (coerce_ptr type_ptr.const x :: xs) in
        let base = coerce_ptr type_ptr.plain base in
        let () =
          coerce PtrBuiltinMethod.t ptr_builtin_method.typ builtin_method base
            arr ret count
        in
        ()

    let foreign_method0 method_name _fn ret_typ ret_to_variant ret_of_variant =
      (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
      let string_name = string_name_of_string method_name in
      (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
      let err = global_call_error in
      let count = Int64.of_int 0 in
      fun base ->
        let ret =
          coerce_ptr variant_ptr.uninit
            (ret_to_variant (gc_alloc ret_typ ~count:1))
        in
        let arr = coerce_ptr (ptr variant_ptr.const) foreign_arr0 in
        let base = coerce_ptr variant_ptr.plain (foreign_arr1 base) in
        let () = variant_call () base string_name arr count ret err in
        let ret = coerce_ptr variant_ptr.plain ret in
        if is_error err then raise (to_exn err) else ret_of_variant ret

    let foreign_method0_void_static method_name _fn _ret_typ _ret_to_variant
        _ret_of_variant =
      (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
      let string_name = string_name_of_string method_name in
      (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
      let err = global_call_error in
      let count = Int64.of_int 0 in
      fun () ->
        let ret = coerce_ptr variant_ptr.uninit null in
        let arr = coerce_ptr (ptr variant_ptr.const) foreign_arr0 in
        let () =
          variant_call_static () VariantType.object_ string_name arr count ret
            err
        in
        if is_error err then raise (to_exn err) else ()

    let foreign_method0v method_name _fn ret_typ ret_to_variant ret_of_variant =
      (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
      let string_name = string_name_of_string method_name in
      (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
      let err = global_call_error in
      fun vs base ->
        let count = Int64.of_int (List.length vs) in
        let ret =
          coerce_ptr variant_ptr.uninit
            (ret_to_variant (gc_alloc ret_typ ~count:1))
        in
        let arr = coerce_ptr (ptr variant_ptr.const) (foreign_arrv vs) in
        let base = coerce_ptr variant_ptr.plain (foreign_arr1 base) in
        let () = variant_call () base string_name arr count ret err in
        let ret = coerce_ptr variant_ptr.plain ret in
        if is_error err then raise (to_exn err) else ret_of_variant ret

    let foreign_method0_static method_name _fn ret_typ ret_to_variant
        ret_of_variant _x_to_variant =
      (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
      let string_name = string_name_of_string method_name in
      (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
      let err = global_call_error in
      let count = Int64.of_int 0 in
      fun () ->
        let ret =
          coerce_ptr variant_ptr.uninit
            (ret_to_variant (gc_alloc ret_typ ~count:1))
        in
        let arr = coerce_ptr (ptr variant_ptr.const) foreign_arr0 in
        let () =
          variant_call_static () VariantType.object_ string_name arr count ret
            err
        in
        let ret = coerce_ptr variant_ptr.plain ret in
        if is_error err then raise (to_exn err) else ret_of_variant ret

    let foreign_method0_void method_name _fn _ret_typ _ret_to_variant
        _ret_of_variant =
      (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
      let string_name = string_name_of_string method_name in
      (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
      let err = global_call_error in
      let count = Int64.of_int 0 in
      fun base ->
        let ret = coerce_ptr variant_ptr.uninit null in
        let arr = coerce_ptr (ptr variant_ptr.const) foreign_arr0 in
        let base = coerce_ptr variant_ptr.plain (foreign_arr1 base) in
        let () = variant_call () base string_name arr count ret err in
        if is_error err then raise (to_exn err) else ()

    let foreign_method1v_void method_name _fn _ret_typ _ret_to_variant
        _ret_of_variant x_to_variant =
      (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
      let string_name = string_name_of_string method_name in
      (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
      let err = global_call_error in
      fun x vs base ->
        let count = Int64.of_int (1 + VariadicVariants.length vs) in
        let ret = coerce_ptr variant_ptr.uninit null in
        let x' = x_to_variant x in
        let arr =
          coerce_ptr (ptr variant_ptr.const)
            (foreign_arrv (coerce_ptr variant_ptr.const x' :: vs))
        in
        let base = coerce_ptr variant_ptr.plain (foreign_arr1 base) in
        let () = variant_call () base string_name arr count ret err in
        if is_error err then raise (to_exn err) else ()

    let foreign_method1_void_static method_name _fn _ret_typ _ret_to_variant
        _ret_of_variant x_to_variant =
      (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
      let string_name = string_name_of_string method_name in
      (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
      let err = global_call_error in
      let count = Int64.of_int 1 in
      fun x ->
        let ret = coerce_ptr variant_ptr.uninit null in
        let x' = x_to_variant x in
        let arr = coerce_ptr (ptr variant_ptr.const) (foreign_arr1 x') in
        let () =
          variant_call_static () VariantType.object_ string_name arr count ret
            err
        in
        if is_error err then raise (to_exn err) else ()

    let foreign_method2_void_static method_name _fn _ret_typ _ret_to_variant
        _ret_of_variant x_to_variant y_to_variant =
      (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
      let string_name = string_name_of_string method_name in
      (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
      let err = global_call_error in
      let count = Int64.of_int 2 in
      fun x y ->
        let ret = coerce_ptr variant_ptr.uninit null in
        let x' = x_to_variant x in
        let y' = y_to_variant y in
        let arr = coerce_ptr (ptr variant_ptr.const) (foreign_arr2 x' y') in
        let () =
          variant_call_static () VariantType.object_ string_name arr count ret
            err
        in
        if is_error err then raise (to_exn err) else ()

    let foreign_method2v_void method_name _fn _ret_typ _ret_to_variant
        _ret_of_variant x_to_variant y_to_variant =
      (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
      let string_name = string_name_of_string method_name in
      (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
      let err = global_call_error in
      fun x y vs base ->
        let count = Int64.of_int (2 + VariadicVariants.length vs) in
        let ret = coerce_ptr variant_ptr.uninit null in
        let x' = x_to_variant x in
        let y' = y_to_variant y in
        let arr =
          coerce_ptr (ptr variant_ptr.const)
            (foreign_arrv
               (coerce_ptr variant_ptr.const x'
               :: coerce_ptr variant_ptr.const y'
               :: vs))
        in
        let base = coerce_ptr variant_ptr.plain (foreign_arr1 base) in
        let () = variant_call () base string_name arr count ret err in
        if is_error err then raise (to_exn err) else ()

    let foreign_method3v_void method_name _fn _ret_typ _ret_to_variant
        _ret_of_variant x_to_variant y_to_variant z_to_variant =
      (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
      let string_name = string_name_of_string method_name in
      (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
      let err = global_call_error in
      fun x y z vs base ->
        let count = Int64.of_int (3 + VariadicVariants.length vs) in
        let ret = coerce_ptr variant_ptr.uninit null in
        let x' = x_to_variant x in
        let y' = y_to_variant y in
        let z' = z_to_variant z in
        let arr =
          coerce_ptr (ptr variant_ptr.const)
            (foreign_arrv
               (coerce_ptr variant_ptr.const x'
               :: coerce_ptr variant_ptr.const y'
               :: coerce_ptr variant_ptr.const z'
               :: vs))
        in
        let base = coerce_ptr variant_ptr.plain (foreign_arr1 base) in
        let () = variant_call () base string_name arr count ret err in
        if is_error err then raise (to_exn err) else ()
  end
