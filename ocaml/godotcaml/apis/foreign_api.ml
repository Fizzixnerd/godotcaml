open! Base
open Ctypes
open Godotcaml
open C
module Suite = TypedSuite
module Godotcaml = Godotcaml
module C = C
open Api_types

let get_proc_address : (string -> InterfaceFunctionPtr.t) ref =
  ref (fun (_ : string) ->
      Stdio.print_endline "get_proc_address -> it does nothing!";
      assert false)

let gc_alloc = allocate_n
let global_call_error = allocate_n CallError.s ~count:1

exception Invalid_method
exception Invalid_argument of int * int
exception Too_many_arguments of int * int
exception Too_few_arguments of int * int
exception Instance_is_null
exception Method_not_const
exception Unknown_call_error

let is_error : CallError.t structure ptr -> bool =
 fun err -> !@(err |-> CallError.error_f) <> 0

(* FIXME to use proper named enum values from CallError.t *)
let to_exn : CallError.t structure ptr -> exn =
 fun err ->
  match !@(err |-> CallError.error_f) with
  | 1 -> Invalid_method
  | 2 -> Invalid_argument (0, 0)
  | 3 -> Too_many_arguments (0, 0)
  | 4 -> Too_few_arguments (0, 0)
  | 5 -> Instance_is_null
  | 6 -> Method_not_const
  | _ -> Unknown_call_error

let coerce_ptr new_typ x =
  let voidp = to_voidp x in
  coerce (ptr void) new_typ voidp

module Make =
functor
  (ClassSizes : CLASS_SIZES)
  ->
  struct
    include Api_types.ApiTypes

    module Void = struct
      type t = unit

      let s = void
      let typ = void

      let to_variant : unit -> variant_ptr structure ptr =
       fun _ -> coerce_ptr variant_ptr.plain null

      let of_variant : variant_ptr structure ptr -> unit = fun _ -> ()
    end

    module Variadic = struct
      type t = type_ptr structure Suite.const ptr list

      let length = Base.List.length
      let of_list = Base.List.of_list
      let of_array = Base.List.of_array

      let typ =
        view
          ~read:(fun _ -> assert false) (* we never read from a Variadic.t. *)
          ~write:(fun variadic ->
            CArray.start (CArray.of_list type_ptr.const variadic))
          (ptr type_ptr.const)
    end

    let plain_to_uninit suite x =
      let open Suite in
      coerce suite.plain suite.uninit x

    let plain_to_const suite x =
      let open Suite in
      coerce suite.plain suite.const x

    let get_fun fun_name typ =
      coerce InterfaceFunctionPtr.t typ (!get_proc_address fun_name)

    let string_name_new_with_utf8_chars str_name_ptr str =
      get_fun "string_name_new_with_utf8_chars"
        interface_string_name_new_with_utf8_chars.typ str_name_ptr str

    (** Call the destructor at some point! *)
    let string_name_of_string str =
      let string_name =
        coerce StringName.typ string_name_ptr.uninit (StringName.new_uninit ())
      in
      let () = string_name_new_with_utf8_chars string_name str in
      let string_name =
        coerce string_name_ptr.uninit string_name_ptr.const string_name
      in
      string_name

    let variant_get_ptr_constructor variant_type constructor_index =
      get_fun "variant_get_ptr_constructor"
        interface_variant_get_ptr_constructor.typ variant_type constructor_index

    let variant_get_ptr_destructor variant_type =
      get_fun "variant_get_ptr_destructor"
        interface_variant_get_ptr_destructor.typ variant_type

    let variant_get_ptr_operator_evaluator operator_enum variant_type arg_type =
      get_fun "variant_get_ptr_operator_evaluator"
        interface_variant_get_ptr_operator_evaluator.typ operator_enum
        variant_type arg_type

    let variant_get_ptr_builtin_method variant_type method_string_name_const
        method_hash =
      get_fun "variant_get_ptr_builtin_method"
        interface_variant_get_ptr_builtin_method.typ variant_type
        method_string_name_const method_hash

    let variant_get_ptr_utility_function utility_function_name function_hash =
      let string_name = string_name_of_string utility_function_name in
      let ret =
        get_fun "get_ptr_utility_function"
          interface_variant_get_ptr_utility_function.typ string_name
          function_hash
      in
      let () = () (* call destructor for string_name here. *) in
      ret

    let variant_call = get_fun "variant_call" variant_call.typ

    let get_variant_from_type_constructor variant_type
        (variant_typ : 'a ptr typ) =
      let getter =
        get_fun "get_variant_from_type_constructor"
          GetVariantFromTypeConstructor.t
      in
      coerce VariantFromTypeConstructorFunc.t
        (variant_from_type_constructor_func variant_typ).typ
        (coerce GetVariantFromTypeConstructor.t
           get_variant_from_type_constructor.typ getter variant_type)

    let get_variant_to_type_constructor (variant_type : int)
        (variant_typ : 'a ptr typ) =
      let getter =
        get_fun "get_variant_to_type_constructor" GetVariantToTypeConstructor.t
      in
      coerce VariantToTypeConstructorFunc.t
        (variant_to_type_constructor_func variant_typ).typ
        (coerce GetVariantToTypeConstructor.t
           get_variant_to_type_constructor.typ getter variant_type)

    let foreign_builtin_operator : int -> int option -> int -> 'a typ -> 'a =
     fun variant_type arg_type_opt operator typ ->
      coerce PtrOperatorEvaluator.t typ
        (variant_get_ptr_operator_evaluator operator variant_type
           (arg_type_opt |> Option.value ~default:variant_type))

    let foreign_arr0 = coerce_ptr (ptr type_ptr.const) null

    (** Can be cast to any ptr-to-ptr!*)
    let foreign_arr1 x =
      let count = 1 in
      let arr = allocate_n type_ptr.const ~count in
      let () = arr <-@ coerce_ptr type_ptr.const x in
      arr

    let foreign_arr2 x y =
      let count = 2 in
      let arr = allocate_n type_ptr.const ~count in
      let () = arr <-@ coerce_ptr type_ptr.const x in
      let () = arr +@ 1 <-@ coerce_ptr type_ptr.const y in
      arr

    let foreign_arr3 x y z =
      let count = 3 in
      let arr = allocate_n type_ptr.const ~count in
      let () = arr <-@ coerce_ptr type_ptr.const x in
      let () = arr +@ 1 <-@ coerce_ptr type_ptr.const y in
      let () = arr +@ 2 <-@ coerce_ptr type_ptr.const z in
      arr

    let foreign_arr4 x y z w =
      let count = 4 in
      let arr = allocate_n type_ptr.const ~count in
      let () = arr <-@ coerce_ptr type_ptr.const x in
      let () = arr +@ 1 <-@ coerce_ptr type_ptr.const y in
      let () = arr +@ 2 <-@ coerce_ptr type_ptr.const z in
      let () = arr +@ 3 <-@ coerce_ptr type_ptr.const w in
      arr

    let foreign_arr5 x y z w s =
      let count = 5 in
      let arr = allocate_n type_ptr.const ~count in
      let () = arr <-@ coerce_ptr type_ptr.const x in
      let () = arr +@ 1 <-@ coerce_ptr type_ptr.const y in
      let () = arr +@ 2 <-@ coerce_ptr type_ptr.const z in
      let () = arr +@ 3 <-@ coerce_ptr type_ptr.const w in
      let () = arr +@ 4 <-@ coerce_ptr type_ptr.const s in
      arr

    let foreign_arr6 x y z w s t =
      let count = 6 in
      let arr = allocate_n type_ptr.const ~count in
      let () = arr <-@ coerce_ptr type_ptr.const x in
      let () = arr +@ 1 <-@ coerce_ptr type_ptr.const y in
      let () = arr +@ 2 <-@ coerce_ptr type_ptr.const z in
      let () = arr +@ 3 <-@ coerce_ptr type_ptr.const w in
      let () = arr +@ 4 <-@ coerce_ptr type_ptr.const s in
      let () = arr +@ 5 <-@ coerce_ptr type_ptr.const t in
      arr

    let foreign_arr7 x y z w s t u =
      let count = 7 in
      let arr = allocate_n type_ptr.const ~count in
      let () = arr <-@ coerce_ptr type_ptr.const x in
      let () = arr +@ 1 <-@ coerce_ptr type_ptr.const y in
      let () = arr +@ 2 <-@ coerce_ptr type_ptr.const z in
      let () = arr +@ 3 <-@ coerce_ptr type_ptr.const w in
      let () = arr +@ 4 <-@ coerce_ptr type_ptr.const s in
      let () = arr +@ 5 <-@ coerce_ptr type_ptr.const t in
      let () = arr +@ 6 <-@ coerce_ptr type_ptr.const u in
      arr

    let foreign_arr8 x y z w s t u v =
      let count = 8 in
      let arr = allocate_n type_ptr.const ~count in
      let () = arr <-@ coerce_ptr type_ptr.const x in
      let () = arr +@ 1 <-@ coerce_ptr type_ptr.const y in
      let () = arr +@ 2 <-@ coerce_ptr type_ptr.const z in
      let () = arr +@ 3 <-@ coerce_ptr type_ptr.const w in
      let () = arr +@ 4 <-@ coerce_ptr type_ptr.const s in
      let () = arr +@ 5 <-@ coerce_ptr type_ptr.const t in
      let () = arr +@ 6 <-@ coerce_ptr type_ptr.const u in
      let () = arr +@ 7 <-@ coerce_ptr type_ptr.const v in
      arr

    let foreign_arrv xs =
      let count = Variadic.length xs in
      let arr = allocate_n type_ptr.const ~count in
      for i = 0 to count do
        arr +@ i <-@ coerce_ptr type_ptr.const (Base.List.nth_exn xs i)
      done;
      arr

    let foreign_utility_function0 :
        string -> int64 -> (unit -> 'r ptr) fn -> 'r typ -> unit -> 'r ptr =
     fun name hash _fn ret_typ ->
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
        coerce type_ptr.plain (ptr ret_typ) ret

    let foreign_utility_function0_void :
        string -> int64 -> (unit -> unit) fn -> 'any -> unit -> unit =
     fun name hash _fn _ ->
      let utility_function = variant_get_ptr_utility_function name hash in
      let count = 0 in
      fun () ->
        let ret = coerce_ptr type_ptr.plain null in
        let arr = foreign_arr0 in
        let () =
          coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function
            ret arr count
        in
        ()

    let foreign_utility_function1_void :
        string -> int64 -> ('a -> unit) fn -> 'any -> 'a -> unit =
     fun name hash _fn _ ->
      let utility_function = variant_get_ptr_utility_function name hash in
      let count = 1 in
      fun x ->
        let arr = foreign_arr1 x in
        let ret = coerce_ptr type_ptr.plain null in
        let () =
          coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function
            ret arr count
        in
        ()

    let foreign_utility_function1 :
        string -> int64 -> ('a -> 'r ptr) fn -> 'r typ -> 'a -> 'r ptr =
     fun name hash _fn ret_typ ->
      let utility_function = variant_get_ptr_utility_function name hash in
      let count = 1 in
      fun x ->
        let ret =
          coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1)
        in
        let arr = foreign_arr1 x in
        let () =
          coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function
            ret arr count
        in
        coerce type_ptr.plain (ptr ret_typ) ret

    let foreign_utility_function2 :
        string ->
        int64 ->
        ('a -> 'b -> 'r ptr) fn ->
        'r typ ->
        'a ->
        'b ->
        'r ptr =
     fun name hash _fn ret_typ ->
      let utility_function = variant_get_ptr_utility_function name hash in
      let count = 2 in
      fun x y ->
        let ret =
          coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1)
        in
        let arr = foreign_arr2 x y in
        let () =
          coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function
            ret arr count
        in
        coerce type_ptr.plain (ptr ret_typ) ret

    let foreign_utility_function3 :
        string ->
        int64 ->
        ('a -> 'b -> 'c -> 'r ptr) fn ->
        'r typ ->
        'a ->
        'b ->
        'c ->
        'r ptr =
     fun name hash _fn ret_typ ->
      let utility_function = variant_get_ptr_utility_function name hash in
      let count = 3 in
      fun x y z ->
        let ret =
          coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1)
        in
        let arr = foreign_arr3 x y z in
        let () =
          coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function
            ret arr count
        in
        coerce type_ptr.plain (ptr ret_typ) ret

    let foreign_utility_function4 :
        string ->
        int64 ->
        ('a -> 'b -> 'c -> 'd -> 'r ptr) fn ->
        'r typ ->
        'a ->
        'b ->
        'c ->
        'd ->
        'r ptr =
     fun name hash _fn ret_typ ->
      let utility_function = variant_get_ptr_utility_function name hash in
      let count = 4 in
      fun x y z w ->
        let ret =
          coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1)
        in
        let arr = foreign_arr4 x y z w in
        let () =
          coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function
            ret arr count
        in
        coerce type_ptr.plain (ptr ret_typ) ret

    let foreign_utility_function5 :
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
     fun name hash _fn ret_typ ->
      let utility_function = variant_get_ptr_utility_function name hash in
      let count = 5 in
      fun x y z w s ->
        let ret =
          coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1)
        in
        let arr = foreign_arr5 x y z w s in
        let () =
          coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function
            ret arr count
        in
        coerce type_ptr.plain (ptr ret_typ) ret

    let foreign_utility_function6 :
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
     fun name hash _fn ret_typ ->
      let utility_function = variant_get_ptr_utility_function name hash in
      let count = 6 in
      fun x y z w s t ->
        let ret =
          coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1)
        in
        let arr = foreign_arr6 x y z w s t in
        let () =
          coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function
            ret arr count
        in
        coerce type_ptr.plain (ptr ret_typ) ret

    let foreign_utility_function7 :
        string ->
        int64 ->
        ('a -> 'b -> 'c -> 'd -> 'e -> 'f -> 'g -> 'r ptr) fn ->
        'r typ ->
        'a ->
        'b ->
        'c ->
        'd ->
        'e ->
        'f ->
        'g ->
        'r ptr =
     fun name hash _fn ret_typ ->
      let utility_function = variant_get_ptr_utility_function name hash in
      let count = 7 in
      fun x y z w s t u ->
        let ret =
          coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1)
        in
        let arr = foreign_arr7 x y z w s t u in
        let () =
          coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function
            ret arr count
        in
        coerce type_ptr.plain (ptr ret_typ) ret

    let foreign_utility_function8 :
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
     fun name hash _fn ret_typ ->
      let utility_function = variant_get_ptr_utility_function name hash in
      let count = 8 in
      fun x y z w s t u v ->
        let ret =
          coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1)
        in
        let arr = foreign_arr8 x y z w s t u v in
        let () =
          coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function
            ret arr count
        in
        coerce type_ptr.plain (ptr ret_typ) ret

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
          coerce PtrBuiltinMethod.t ptr_builtin_method builtin_method base arr
            ret count
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
          coerce PtrBuiltinMethod.t ptr_builtin_method builtin_method base arr
            ret count
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
          coerce PtrBuiltinMethod.t ptr_builtin_method builtin_method base arr
            ret count
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
          coerce PtrBuiltinMethod.t ptr_builtin_method builtin_method base arr
            ret count
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
          coerce PtrBuiltinMethod.t ptr_builtin_method builtin_method base arr
            ret count
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
          coerce PtrBuiltinMethod.t ptr_builtin_method builtin_method base arr
            ret count
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
          coerce PtrBuiltinMethod.t ptr_builtin_method builtin_method base arr
            ret count
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
          coerce PtrBuiltinMethod.t ptr_builtin_method builtin_method base arr
            ret count
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
          coerce PtrBuiltinMethod.t ptr_builtin_method builtin_method base arr
            ret count
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
          coerce PtrBuiltinMethod.t ptr_builtin_method builtin_method base arr
            ret count
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
          coerce PtrBuiltinMethod.t ptr_builtin_method builtin_method base arr
            ret count
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
          coerce PtrBuiltinMethod.t ptr_builtin_method builtin_method base arr
            ret count
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
          coerce PtrBuiltinMethod.t ptr_builtin_method builtin_method base arr
            ret count
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
          coerce PtrBuiltinMethod.t ptr_builtin_method builtin_method base arr
            ret count
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
          coerce PtrBuiltinMethod.t ptr_builtin_method builtin_method base arr
            ret count
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
          coerce PtrBuiltinMethod.t ptr_builtin_method builtin_method base arr
            ret count
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
          coerce PtrBuiltinMethod.t ptr_builtin_method builtin_method base arr
            ret count
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
          coerce PtrBuiltinMethod.t ptr_builtin_method builtin_method base arr
            ret count
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
          coerce PtrBuiltinMethod.t ptr_builtin_method builtin_method base arr
            ret count
        in
        ()

    let foreign_method0 :
        string ->
        ('base ptr -> 'r ptr) fn ->
        'r typ ->
        ('r ptr -> variant_ptr structure ptr) ->
        (variant_ptr structure ptr -> 'r ptr) ->
        'base ptr ->
        'r ptr =
     fun method_name _fn ret_typ ret_to_variant ret_of_variant ->
      (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
      let string_name = string_name_of_string method_name in
      (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
      let err = global_call_error in
      let count = Int64.of_int 1 in
      fun base ->
        let ret =
          coerce_ptr variant_ptr.uninit
            (ret_to_variant (gc_alloc ret_typ ~count:1))
        in
        let arr = coerce_ptr (ptr variant_ptr.const) foreign_arr0 in
        let base = coerce_ptr variant_ptr.plain (foreign_arr1 base) in
        let () = variant_call base string_name arr count ret err in
        let ret = coerce_ptr variant_ptr.plain ret in
        if is_error err then raise (to_exn err) else ret_of_variant ret

    let foreign_method0_void :
        string ->
        ('base ptr -> unit) fn ->
        unit typ ->
        (unit -> variant_ptr structure ptr) ->
        (variant_ptr structure ptr -> unit) ->
        'base ptr ->
        unit =
     fun method_name _fn _ret_typ _ret_to_variant _ret_of_variant ->
      (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
      let string_name = string_name_of_string method_name in
      (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
      let err = global_call_error in
      let count = Int64.of_int 1 in
      fun base ->
        let ret = coerce_ptr variant_ptr.uninit null in
        let arr = coerce_ptr (ptr variant_ptr.const) foreign_arr0 in
        let base = coerce_ptr variant_ptr.plain (foreign_arr1 base) in
        let () = variant_call base string_name arr count ret err in
        if is_error err then raise (to_exn err) else ()

    let foreign_method1 :
        string ->
        ('a -> 'base ptr -> 'r ptr) fn ->
        'r typ ->
        ('r ptr -> variant_ptr structure ptr) ->
        (variant_ptr structure ptr -> 'r ptr) ->
        ('a -> variant_ptr structure ptr) ->
        'a ->
        'base ptr ->
        'r ptr =
     fun method_name _fn ret_typ ret_to_variant ret_of_variant x_to_variant ->
      (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
      let string_name = string_name_of_string method_name in
      (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
      let err = global_call_error in
      let count = Int64.of_int 1 in
      fun x base ->
        let ret =
          coerce_ptr variant_ptr.uninit
            (ret_to_variant (gc_alloc ret_typ ~count:1))
        in
        let x' = x_to_variant x in
        let arr = coerce_ptr (ptr variant_ptr.const) (foreign_arr1 x') in
        let base = coerce_ptr variant_ptr.plain (foreign_arr1 base) in
        let () = variant_call base string_name arr count ret err in
        let ret = coerce_ptr variant_ptr.plain ret in
        if is_error err then raise (to_exn err) else ret_of_variant ret

    let foreign_method1_void :
        string ->
        ('a -> 'base ptr -> unit) fn ->
        unit typ ->
        (unit -> variant_ptr structure ptr) ->
        (variant_ptr structure ptr -> unit) ->
        ('a -> variant_ptr structure ptr) ->
        'a ->
        'base ptr ->
        unit =
     fun method_name _fn _ret_typ _ret_to_variant _ret_of_variant x_to_variant ->
      (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
      let string_name = string_name_of_string method_name in
      (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
      let err = global_call_error in
      let count = Int64.of_int 2 in
      fun x base ->
        let ret = coerce_ptr variant_ptr.uninit null in
        let x' = x_to_variant x in
        let arr = coerce_ptr (ptr variant_ptr.const) (foreign_arr1 x') in
        let base = coerce_ptr variant_ptr.plain (foreign_arr1 base) in
        let () = variant_call base string_name arr count ret err in
        if is_error err then raise (to_exn err) else ()

    let foreign_method2 :
        string ->
        ('a -> 'b -> 'base ptr -> 'r ptr) fn ->
        'r typ ->
        ('r ptr -> variant_ptr structure ptr) ->
        (variant_ptr structure ptr -> 'r ptr) ->
        ('a -> variant_ptr structure ptr) ->
        ('b -> variant_ptr structure ptr) ->
        'a ->
        'b ->
        'base ptr ->
        'r ptr =
     fun method_name _fn ret_typ ret_to_variant ret_of_variant x_to_variant
         y_to_variant ->
      (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
      let string_name = string_name_of_string method_name in
      (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
      let err = global_call_error in
      let count = Int64.of_int 2 in
      fun x y base ->
        let ret =
          coerce_ptr variant_ptr.uninit
            (ret_to_variant (gc_alloc ret_typ ~count:1))
        in
        let x' = x_to_variant x in
        let y' = y_to_variant y in
        let arr = coerce_ptr (ptr variant_ptr.const) (foreign_arr2 x' y') in
        let base = coerce_ptr variant_ptr.plain (foreign_arr1 base) in
        let () = variant_call base string_name arr count ret err in
        let ret = coerce_ptr variant_ptr.plain ret in
        if is_error err then raise (to_exn err) else ret_of_variant ret

    let foreign_method2_void :
        string ->
        ('a -> 'b -> 'base ptr -> unit) fn ->
        unit typ ->
        (unit -> variant_ptr structure ptr) ->
        (variant_ptr structure ptr -> unit) ->
        ('a -> variant_ptr structure ptr) ->
        ('b -> variant_ptr structure ptr) ->
        'a ->
        'b ->
        'base ptr ->
        unit =
     fun method_name _fn _ret_typ _ret_to_variant _ret_of_variant x_to_variant
         y_to_variant ->
      (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
      let string_name = string_name_of_string method_name in
      (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
      let err = global_call_error in
      let count = Int64.of_int 2 in
      fun x y base ->
        let ret = coerce_ptr variant_ptr.uninit null in
        let x' = x_to_variant x in
        let y' = y_to_variant y in
        let arr = coerce_ptr (ptr variant_ptr.const) (foreign_arr2 x' y') in
        let base = coerce_ptr variant_ptr.plain (foreign_arr1 base) in
        let () = variant_call base string_name arr count ret err in
        if is_error err then raise (to_exn err) else ()

    let foreign_method3 :
        string ->
        ('a -> 'b -> 'c -> 'base ptr -> 'r ptr) fn ->
        'r typ ->
        ('r ptr -> variant_ptr structure ptr) ->
        (variant_ptr structure ptr -> 'r ptr) ->
        ('a -> variant_ptr structure ptr) ->
        ('b -> variant_ptr structure ptr) ->
        ('c -> variant_ptr structure ptr) ->
        'a ->
        'b ->
        'c ->
        'base ptr ->
        'r ptr =
     fun method_name _fn ret_typ ret_to_variant ret_of_variant x_to_variant
         y_to_variant z_to_variant ->
      (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
      let string_name = string_name_of_string method_name in
      (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
      let err = global_call_error in
      let count = Int64.of_int 2 in
      fun x y z base ->
        let ret =
          coerce_ptr variant_ptr.uninit
            (ret_to_variant (gc_alloc ret_typ ~count:1))
        in
        let x' = x_to_variant x in
        let y' = y_to_variant y in
        let z' = z_to_variant z in
        let arr = coerce_ptr (ptr variant_ptr.const) (foreign_arr3 x' y' z') in
        let base = coerce_ptr variant_ptr.plain (foreign_arr1 base) in
        let () = variant_call base string_name arr count ret err in
        let ret = coerce_ptr variant_ptr.plain ret in
        if is_error err then raise (to_exn err) else ret_of_variant ret

    let foreign_method3_void :
        string ->
        ('a -> 'b -> 'c -> 'base ptr -> unit) fn ->
        unit typ ->
        (unit -> variant_ptr structure ptr) ->
        (variant_ptr structure ptr -> unit) ->
        ('a -> variant_ptr structure ptr) ->
        ('b -> variant_ptr structure ptr) ->
        ('c -> variant_ptr structure ptr) ->
        'a ->
        'b ->
        'c ->
        'base ptr ->
        unit =
     fun method_name _fn _ret_typ _ret_to_variant _ret_of_variant x_to_variant
         y_to_variant z_to_variant ->
      (* DO NOT FREE! CAPTURED BY THE BELOW LAMBDA! *)
      let string_name = string_name_of_string method_name in
      (* Is this evil?  Yes.  But I can fix it later... Maybe? *)
      let err = global_call_error in
      let count = Int64.of_int 2 in
      fun x y z base ->
        let ret = coerce_ptr variant_ptr.uninit null in
        let x' = x_to_variant x in
        let y' = y_to_variant y in
        let z' = z_to_variant z in
        let arr = coerce_ptr (ptr variant_ptr.const) (foreign_arr3 x' y' z') in
        let base = coerce_ptr variant_ptr.plain (foreign_arr1 base) in
        let () = variant_call base string_name arr count ret err in
        if is_error err then raise (to_exn err) else ()
  end
