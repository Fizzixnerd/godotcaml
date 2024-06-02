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

let coerce_ptr new_typ x =
  let voidp = to_voidp x in
  coerce (ptr void) new_typ voidp

module Make =
functor
  (ClassSizes : CLASS_SIZES)
  ->
  struct
    include Api_types.ApiTypes (ClassSizes)

    module Void = struct
      type t = unit

      let s = void
      let typ = void
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

    let foreign_builtin_operator : int -> int option -> int -> 'a typ -> 'a =
     fun variant_type arg_type_opt operator typ ->
      coerce PtrOperatorEvaluator.t typ
        (variant_get_ptr_operator_evaluator operator variant_type
           (arg_type_opt |> Option.value ~default:variant_type))

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

    let foreign_utility_function0 :
        string -> int64 -> (unit -> 'r ptr) fn -> 'r typ -> unit -> 'r ptr =
     fun name hash _fn ret_typ ->
      let utility_function = variant_get_ptr_utility_function name hash in
      let count = 1 in
      fun () ->
        let ret =
          coerce (ptr ret_typ) type_ptr.plain (gc_alloc ret_typ ~count:1)
        in
        let arr = coerce_ptr (ptr type_ptr.const) null in
        let () =
          coerce PtrUtilityFunction.t ptr_utility_function.typ utility_function
            ret arr count
        in
        coerce type_ptr.plain (ptr ret_typ) ret

    let foreign_utility_function0_void :
        string -> int64 -> (unit -> unit) fn -> 'any -> unit -> unit =
     fun name hash _fn _ ->
      let utility_function = variant_get_ptr_utility_function name hash in
      let count = 1 in
      fun () ->
        let ret = coerce_ptr type_ptr.plain null in
        let arr = coerce_ptr (ptr type_ptr.const) null in
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


    let foreign_builtin_method : int -> string -> int64 -> 'a fn -> 'a =
     fun variant_type method_name method_hash fn ->
      let string_name = string_name_of_string method_name in
      let ret =
        coerce PtrBuiltinMethod.t (Foreign.funptr fn)
          (variant_get_ptr_builtin_method variant_type string_name method_hash)
      in
      let () = (* call stringname destructor here *) () in
      ret
  end
