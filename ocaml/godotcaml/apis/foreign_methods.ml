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

let foreign_method0_void_static class_name method_name hash _fn _ret_typ
    _ret_to_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun () ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let* args =
      Living_core.Default.map (coerce_ptr (ptr type_ptr.const)) foreign_array0
    in
    let self = coerce_ptr object_ptr.plain null in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name ()

let foreign_method1v_void class_name method_name hash _fn _ret_typ _ret_to_ocaml
    x0_typ x0_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 vs self ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_arrayv (x0' :: vs))
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name ()

let foreign_method1_void_static class_name method_name hash _fn _ret_typ
    _ret_to_ocaml x0_typ x0_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array1 x0')
    in
    let self = coerce_ptr object_ptr.plain null in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name ()

let foreign_method2_void_static class_name method_name hash _fn _ret_typ
    _ret_to_ocaml x0_typ x1_typ x0_of_ocaml x1_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array2 x0' x1')
    in
    let self = coerce_ptr object_ptr.plain null in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name ()

let foreign_method2v_void class_name method_name hash _fn _ret_typ _ret_to_ocaml
    x0_typ x1_typ x0_of_ocaml x1_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 vs self ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_arrayv (x0' :: x1' :: vs))
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name ()

let foreign_method3v_void class_name method_name hash _fn _ret_typ _ret_to_ocaml
    x0_typ x1_typ x2_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 vs self ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_arrayv (x0' :: x1' :: x2' :: vs))
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name ()

let foreign_method0 class_name method_name hash _fn ret_typ ret_to_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in

    let* args =
      Living_core.Default.map (coerce_ptr (ptr type_ptr.const)) foreign_array0
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method0v class_name method_name hash _fn ret_typ ret_to_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun vs self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in

    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_arrayv vs)
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method0_static class_name method_name hash _fn ret_typ ret_to_ocaml
    =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun () ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in

    let* args =
      Living_core.Default.map (coerce_ptr (ptr type_ptr.const)) foreign_array0
    in
    let self = coerce_ptr object_ptr.plain null in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method0_void class_name method_name hash _fn _ret_typ _ret_to_ocaml
    =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun self ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in

    let* args =
      Living_core.Default.map (coerce_ptr (ptr type_ptr.const)) foreign_array0
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name ()

let foreign_method1 class_name method_name hash _fn ret_typ ret_to_ocaml x0_typ
    x0_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array1 x0')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method1v class_name method_name hash _fn ret_typ ret_to_ocaml x0_typ
    x0_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 vs self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_arrayv (x0' :: vs))
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method1_static class_name method_name hash _fn ret_typ ret_to_ocaml
    x0_typ x0_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array1 x0')
    in
    let self = coerce_ptr object_ptr.plain null in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method1_void class_name method_name hash _fn _ret_typ _ret_to_ocaml
    x0_typ x0_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 self ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array1 x0')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name ()

let foreign_method2 class_name method_name hash _fn ret_typ ret_to_ocaml x0_typ
    x1_typ x0_of_ocaml x1_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array2 x0' x1')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method2v class_name method_name hash _fn ret_typ ret_to_ocaml x0_typ
    x1_typ x0_of_ocaml x1_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 vs self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_arrayv (x0' :: x1' :: vs))
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method2_static class_name method_name hash _fn ret_typ ret_to_ocaml
    x0_typ x1_typ x0_of_ocaml x1_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array2 x0' x1')
    in
    let self = coerce_ptr object_ptr.plain null in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method2_void class_name method_name hash _fn _ret_typ _ret_to_ocaml
    x0_typ x1_typ x0_of_ocaml x1_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 self ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array2 x0' x1')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name ()

let foreign_method3 class_name method_name hash _fn ret_typ ret_to_ocaml x0_typ
    x1_typ x2_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array3 x0' x1' x2')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method3v class_name method_name hash _fn ret_typ ret_to_ocaml x0_typ
    x1_typ x2_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 vs self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_arrayv (x0' :: x1' :: x2' :: vs))
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method3_static class_name method_name hash _fn ret_typ ret_to_ocaml
    x0_typ x1_typ x2_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array3 x0' x1' x2')
    in
    let self = coerce_ptr object_ptr.plain null in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method3_void class_name method_name hash _fn _ret_typ _ret_to_ocaml
    x0_typ x1_typ x2_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 self ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array3 x0' x1' x2')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name ()

let foreign_method4 class_name method_name hash _fn ret_typ ret_to_ocaml x0_typ
    x1_typ x2_typ x3_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml x3_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array4 x0' x1' x2' x3')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method4v class_name method_name hash _fn ret_typ ret_to_ocaml x0_typ
    x1_typ x2_typ x3_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml x3_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 vs self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_arrayv (x0' :: x1' :: x2' :: x3' :: vs))
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method4_static class_name method_name hash _fn ret_typ ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml x3_of_ocaml
    =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array4 x0' x1' x2' x3')
    in
    let self = coerce_ptr object_ptr.plain null in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method4_void class_name method_name hash _fn _ret_typ _ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml x3_of_ocaml
    =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 self ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array4 x0' x1' x2' x3')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name ()

let foreign_method5 class_name method_name hash _fn ret_typ ret_to_ocaml x0_typ
    x1_typ x2_typ x3_typ x4_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml x3_of_ocaml
    x4_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array5 x0' x1' x2' x3' x4')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method5v class_name method_name hash _fn ret_typ ret_to_ocaml x0_typ
    x1_typ x2_typ x3_typ x4_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml x3_of_ocaml
    x4_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 vs self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_arrayv (x0' :: x1' :: x2' :: x3' :: x4' :: vs))
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method5_static class_name method_name hash _fn ret_typ ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x4_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml
    x3_of_ocaml x4_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array5 x0' x1' x2' x3' x4')
    in
    let self = coerce_ptr object_ptr.plain null in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method5_void class_name method_name hash _fn _ret_typ _ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x4_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml
    x3_of_ocaml x4_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 self ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array5 x0' x1' x2' x3' x4')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name ()

let foreign_method6 class_name method_name hash _fn ret_typ ret_to_ocaml x0_typ
    x1_typ x2_typ x3_typ x4_typ x5_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml
    x3_of_ocaml x4_of_ocaml x5_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array6 x0' x1' x2' x3' x4' x5')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method6v class_name method_name hash _fn ret_typ ret_to_ocaml x0_typ
    x1_typ x2_typ x3_typ x4_typ x5_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml
    x3_of_ocaml x4_of_ocaml x5_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 vs self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_arrayv (x0' :: x1' :: x2' :: x3' :: x4' :: x5' :: vs))
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method6_static class_name method_name hash _fn ret_typ ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x4_typ x5_typ x0_of_ocaml x1_of_ocaml
    x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array6 x0' x1' x2' x3' x4' x5')
    in
    let self = coerce_ptr object_ptr.plain null in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method6_void class_name method_name hash _fn _ret_typ _ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x4_typ x5_typ x0_of_ocaml x1_of_ocaml
    x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 self ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array6 x0' x1' x2' x3' x4' x5')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name ()

let foreign_method7 class_name method_name hash _fn ret_typ ret_to_ocaml x0_typ
    x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x0_of_ocaml x1_of_ocaml
    x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array7 x0' x1' x2' x3' x4' x5' x6')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method7v class_name method_name hash _fn ret_typ ret_to_ocaml x0_typ
    x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x0_of_ocaml x1_of_ocaml
    x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 vs self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_arrayv (x0' :: x1' :: x2' :: x3' :: x4' :: x5' :: x6' :: vs))
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method7_static class_name method_name hash _fn ret_typ ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x0_of_ocaml x1_of_ocaml
    x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array7 x0' x1' x2' x3' x4' x5' x6')
    in
    let self = coerce_ptr object_ptr.plain null in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method7_void class_name method_name hash _fn _ret_typ _ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x0_of_ocaml x1_of_ocaml
    x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 self ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array7 x0' x1' x2' x3' x4' x5' x6')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name ()

let foreign_method8 class_name method_name hash _fn ret_typ ret_to_ocaml x0_typ
    x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x0_of_ocaml x1_of_ocaml
    x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml x7_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array8 x0' x1' x2' x3' x4' x5' x6' x7')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method8v class_name method_name hash _fn ret_typ ret_to_ocaml x0_typ
    x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x0_of_ocaml x1_of_ocaml
    x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml x7_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 vs self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_arrayv
           (x0' :: x1' :: x2' :: x3' :: x4' :: x5' :: x6' :: x7' :: vs))
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method8_static class_name method_name hash _fn ret_typ ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array8 x0' x1' x2' x3' x4' x5' x6' x7')
    in
    let self = coerce_ptr object_ptr.plain null in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method8_void class_name method_name hash _fn _ret_typ _ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 self ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array8 x0' x1' x2' x3' x4' x5' x6' x7')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name ()

let foreign_method9 class_name method_name hash _fn ret_typ ret_to_ocaml x0_typ
    x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x8_typ x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let x8' = coerce x8_typ type_ptr.const (x8_of_ocaml x8) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array9 x0' x1' x2' x3' x4' x5' x6' x7' x8')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method9v class_name method_name hash _fn ret_typ ret_to_ocaml x0_typ
    x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x8_typ x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 vs self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let x8' = coerce x8_typ type_ptr.const (x8_of_ocaml x8) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_arrayv
           (x0' :: x1' :: x2' :: x3' :: x4' :: x5' :: x6' :: x7' :: x8' :: vs))
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method9_static class_name method_name hash _fn ret_typ ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x8_typ x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let x8' = coerce x8_typ type_ptr.const (x8_of_ocaml x8) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array9 x0' x1' x2' x3' x4' x5' x6' x7' x8')
    in
    let self = coerce_ptr object_ptr.plain null in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method9_void class_name method_name hash _fn _ret_typ _ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x8_typ x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 self ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let x8' = coerce x8_typ type_ptr.const (x8_of_ocaml x8) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array9 x0' x1' x2' x3' x4' x5' x6' x7' x8')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name ()

let foreign_method10 class_name method_name hash _fn ret_typ ret_to_ocaml x0_typ
    x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x8_typ x9_typ x0_of_ocaml
    x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml
    x7_of_ocaml x8_of_ocaml x9_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let x8' = coerce x8_typ type_ptr.const (x8_of_ocaml x8) in
    let x9' = coerce x9_typ type_ptr.const (x9_of_ocaml x9) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array10 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method10v class_name method_name hash _fn ret_typ ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x8_typ x9_typ
    x0_of_ocaml x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml
    x6_of_ocaml x7_of_ocaml x8_of_ocaml x9_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 vs self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let x8' = coerce x8_typ type_ptr.const (x8_of_ocaml x8) in
    let x9' = coerce x9_typ type_ptr.const (x9_of_ocaml x9) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_arrayv
           (x0' :: x1' :: x2' :: x3' :: x4' :: x5' :: x6' :: x7' :: x8' :: x9'
          :: vs))
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method10_static class_name method_name hash _fn ret_typ ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x8_typ x9_typ
    x0_of_ocaml x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml
    x6_of_ocaml x7_of_ocaml x8_of_ocaml x9_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let x8' = coerce x8_typ type_ptr.const (x8_of_ocaml x8) in
    let x9' = coerce x9_typ type_ptr.const (x9_of_ocaml x9) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array10 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9')
    in
    let self = coerce_ptr object_ptr.plain null in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method10_void class_name method_name hash _fn _ret_typ _ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x8_typ x9_typ
    x0_of_ocaml x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml
    x6_of_ocaml x7_of_ocaml x8_of_ocaml x9_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 self ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let x8' = coerce x8_typ type_ptr.const (x8_of_ocaml x8) in
    let x9' = coerce x9_typ type_ptr.const (x9_of_ocaml x9) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array10 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name ()

let foreign_method11 class_name method_name hash _fn ret_typ ret_to_ocaml x0_typ
    x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x8_typ x9_typ x10_typ
    x0_of_ocaml x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml x5_of_ocaml
    x6_of_ocaml x7_of_ocaml x8_of_ocaml x9_of_ocaml x10_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let x8' = coerce x8_typ type_ptr.const (x8_of_ocaml x8) in
    let x9' = coerce x9_typ type_ptr.const (x9_of_ocaml x9) in
    let x10' = coerce x10_typ type_ptr.const (x10_of_ocaml x10) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array11 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method11v class_name method_name hash _fn ret_typ ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x8_typ x9_typ
    x10_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml
    x5_of_ocaml x6_of_ocaml x7_of_ocaml x8_of_ocaml x9_of_ocaml x10_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 vs self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let x8' = coerce x8_typ type_ptr.const (x8_of_ocaml x8) in
    let x9' = coerce x9_typ type_ptr.const (x9_of_ocaml x9) in
    let x10' = coerce x10_typ type_ptr.const (x10_of_ocaml x10) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_arrayv
           (x0' :: x1' :: x2' :: x3' :: x4' :: x5' :: x6' :: x7' :: x8' :: x9'
          :: x10' :: vs))
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method11_static class_name method_name hash _fn ret_typ ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x8_typ x9_typ
    x10_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml
    x5_of_ocaml x6_of_ocaml x7_of_ocaml x8_of_ocaml x9_of_ocaml x10_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let x8' = coerce x8_typ type_ptr.const (x8_of_ocaml x8) in
    let x9' = coerce x9_typ type_ptr.const (x9_of_ocaml x9) in
    let x10' = coerce x10_typ type_ptr.const (x10_of_ocaml x10) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array11 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10')
    in
    let self = coerce_ptr object_ptr.plain null in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method11_void class_name method_name hash _fn _ret_typ _ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x8_typ x9_typ
    x10_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml
    x5_of_ocaml x6_of_ocaml x7_of_ocaml x8_of_ocaml x9_of_ocaml x10_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 self ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let x8' = coerce x8_typ type_ptr.const (x8_of_ocaml x8) in
    let x9' = coerce x9_typ type_ptr.const (x9_of_ocaml x9) in
    let x10' = coerce x10_typ type_ptr.const (x10_of_ocaml x10) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array11 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name ()

let foreign_method12 class_name method_name hash _fn ret_typ ret_to_ocaml x0_typ
    x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x8_typ x9_typ x10_typ
    x11_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml
    x5_of_ocaml x6_of_ocaml x7_of_ocaml x8_of_ocaml x9_of_ocaml x10_of_ocaml
    x11_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let x8' = coerce x8_typ type_ptr.const (x8_of_ocaml x8) in
    let x9' = coerce x9_typ type_ptr.const (x9_of_ocaml x9) in
    let x10' = coerce x10_typ type_ptr.const (x10_of_ocaml x10) in
    let x11' = coerce x11_typ type_ptr.const (x11_of_ocaml x11) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array12 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method12v class_name method_name hash _fn ret_typ ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x8_typ x9_typ
    x10_typ x11_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml
    x5_of_ocaml x6_of_ocaml x7_of_ocaml x8_of_ocaml x9_of_ocaml x10_of_ocaml
    x11_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 vs self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let x8' = coerce x8_typ type_ptr.const (x8_of_ocaml x8) in
    let x9' = coerce x9_typ type_ptr.const (x9_of_ocaml x9) in
    let x10' = coerce x10_typ type_ptr.const (x10_of_ocaml x10) in
    let x11' = coerce x11_typ type_ptr.const (x11_of_ocaml x11) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_arrayv
           (x0' :: x1' :: x2' :: x3' :: x4' :: x5' :: x6' :: x7' :: x8' :: x9'
          :: x10' :: x11' :: vs))
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method12_static class_name method_name hash _fn ret_typ ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x8_typ x9_typ
    x10_typ x11_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml
    x5_of_ocaml x6_of_ocaml x7_of_ocaml x8_of_ocaml x9_of_ocaml x10_of_ocaml
    x11_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let x8' = coerce x8_typ type_ptr.const (x8_of_ocaml x8) in
    let x9' = coerce x9_typ type_ptr.const (x9_of_ocaml x9) in
    let x10' = coerce x10_typ type_ptr.const (x10_of_ocaml x10) in
    let x11' = coerce x11_typ type_ptr.const (x11_of_ocaml x11) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array12 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11')
    in
    let self = coerce_ptr object_ptr.plain null in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method12_void class_name method_name hash _fn _ret_typ _ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x8_typ x9_typ
    x10_typ x11_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml
    x5_of_ocaml x6_of_ocaml x7_of_ocaml x8_of_ocaml x9_of_ocaml x10_of_ocaml
    x11_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 self ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let x8' = coerce x8_typ type_ptr.const (x8_of_ocaml x8) in
    let x9' = coerce x9_typ type_ptr.const (x9_of_ocaml x9) in
    let x10' = coerce x10_typ type_ptr.const (x10_of_ocaml x10) in
    let x11' = coerce x11_typ type_ptr.const (x11_of_ocaml x11) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array12 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name ()

let foreign_method13 class_name method_name hash _fn ret_typ ret_to_ocaml x0_typ
    x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x8_typ x9_typ x10_typ
    x11_typ x12_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml x3_of_ocaml x4_of_ocaml
    x5_of_ocaml x6_of_ocaml x7_of_ocaml x8_of_ocaml x9_of_ocaml x10_of_ocaml
    x11_of_ocaml x12_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let x8' = coerce x8_typ type_ptr.const (x8_of_ocaml x8) in
    let x9' = coerce x9_typ type_ptr.const (x9_of_ocaml x9) in
    let x10' = coerce x10_typ type_ptr.const (x10_of_ocaml x10) in
    let x11' = coerce x11_typ type_ptr.const (x11_of_ocaml x11) in
    let x12' = coerce x12_typ type_ptr.const (x12_of_ocaml x12) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array13 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11' x12')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method13v class_name method_name hash _fn ret_typ ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x8_typ x9_typ
    x10_typ x11_typ x12_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml x3_of_ocaml
    x4_of_ocaml x5_of_ocaml x6_of_ocaml x7_of_ocaml x8_of_ocaml x9_of_ocaml
    x10_of_ocaml x11_of_ocaml x12_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 vs self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let x8' = coerce x8_typ type_ptr.const (x8_of_ocaml x8) in
    let x9' = coerce x9_typ type_ptr.const (x9_of_ocaml x9) in
    let x10' = coerce x10_typ type_ptr.const (x10_of_ocaml x10) in
    let x11' = coerce x11_typ type_ptr.const (x11_of_ocaml x11) in
    let x12' = coerce x12_typ type_ptr.const (x12_of_ocaml x12) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_arrayv
           (x0' :: x1' :: x2' :: x3' :: x4' :: x5' :: x6' :: x7' :: x8' :: x9'
          :: x10' :: x11' :: x12' :: vs))
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method13_static class_name method_name hash _fn ret_typ ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x8_typ x9_typ
    x10_typ x11_typ x12_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml x3_of_ocaml
    x4_of_ocaml x5_of_ocaml x6_of_ocaml x7_of_ocaml x8_of_ocaml x9_of_ocaml
    x10_of_ocaml x11_of_ocaml x12_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let x8' = coerce x8_typ type_ptr.const (x8_of_ocaml x8) in
    let x9' = coerce x9_typ type_ptr.const (x9_of_ocaml x9) in
    let x10' = coerce x10_typ type_ptr.const (x10_of_ocaml x10) in
    let x11' = coerce x11_typ type_ptr.const (x11_of_ocaml x11) in
    let x12' = coerce x12_typ type_ptr.const (x12_of_ocaml x12) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array13 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11' x12')
    in
    let self = coerce_ptr object_ptr.plain null in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method13_void class_name method_name hash _fn _ret_typ _ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x8_typ x9_typ
    x10_typ x11_typ x12_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml x3_of_ocaml
    x4_of_ocaml x5_of_ocaml x6_of_ocaml x7_of_ocaml x8_of_ocaml x9_of_ocaml
    x10_of_ocaml x11_of_ocaml x12_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 self ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let x8' = coerce x8_typ type_ptr.const (x8_of_ocaml x8) in
    let x9' = coerce x9_typ type_ptr.const (x9_of_ocaml x9) in
    let x10' = coerce x10_typ type_ptr.const (x10_of_ocaml x10) in
    let x11' = coerce x11_typ type_ptr.const (x11_of_ocaml x11) in
    let x12' = coerce x12_typ type_ptr.const (x12_of_ocaml x12) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array13 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11' x12')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name ()

let foreign_method14 class_name method_name hash _fn ret_typ ret_to_ocaml x0_typ
    x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x8_typ x9_typ x10_typ
    x11_typ x12_typ x13_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml x3_of_ocaml
    x4_of_ocaml x5_of_ocaml x6_of_ocaml x7_of_ocaml x8_of_ocaml x9_of_ocaml
    x10_of_ocaml x11_of_ocaml x12_of_ocaml x13_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let x8' = coerce x8_typ type_ptr.const (x8_of_ocaml x8) in
    let x9' = coerce x9_typ type_ptr.const (x9_of_ocaml x9) in
    let x10' = coerce x10_typ type_ptr.const (x10_of_ocaml x10) in
    let x11' = coerce x11_typ type_ptr.const (x11_of_ocaml x11) in
    let x12' = coerce x12_typ type_ptr.const (x12_of_ocaml x12) in
    let x13' = coerce x13_typ type_ptr.const (x13_of_ocaml x13) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array14 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11' x12'
           x13')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method14v class_name method_name hash _fn ret_typ ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x8_typ x9_typ
    x10_typ x11_typ x12_typ x13_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml
    x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml x7_of_ocaml x8_of_ocaml
    x9_of_ocaml x10_of_ocaml x11_of_ocaml x12_of_ocaml x13_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 vs self ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let x8' = coerce x8_typ type_ptr.const (x8_of_ocaml x8) in
    let x9' = coerce x9_typ type_ptr.const (x9_of_ocaml x9) in
    let x10' = coerce x10_typ type_ptr.const (x10_of_ocaml x10) in
    let x11' = coerce x11_typ type_ptr.const (x11_of_ocaml x11) in
    let x12' = coerce x12_typ type_ptr.const (x12_of_ocaml x12) in
    let x13' = coerce x13_typ type_ptr.const (x13_of_ocaml x13) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_arrayv
           (x0' :: x1' :: x2' :: x3' :: x4' :: x5' :: x6' :: x7' :: x8' :: x9'
          :: x10' :: x11' :: x12' :: x13' :: vs))
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method14_static class_name method_name hash _fn ret_typ ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x8_typ x9_typ
    x10_typ x11_typ x12_typ x13_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml
    x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml x7_of_ocaml x8_of_ocaml
    x9_of_ocaml x10_of_ocaml x11_of_ocaml x12_of_ocaml x13_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 ->
    let open Living_core.Default.Let_syntax in
    let* ret =
      gc_alloc ret_typ ~count:1
      |> Living_core.Default.map (coerce_ptr type_ptr.plain)
    in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let x8' = coerce x8_typ type_ptr.const (x8_of_ocaml x8) in
    let x9' = coerce x9_typ type_ptr.const (x9_of_ocaml x9) in
    let x10' = coerce x10_typ type_ptr.const (x10_of_ocaml x10) in
    let x11' = coerce x11_typ type_ptr.const (x11_of_ocaml x11) in
    let x12' = coerce x12_typ type_ptr.const (x12_of_ocaml x12) in
    let x13' = coerce x13_typ type_ptr.const (x13_of_ocaml x13) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array14 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11' x12'
           x13')
    in
    let self = coerce_ptr object_ptr.plain null in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name
      (ret_to_ocaml (coerce_ptr (ptr ret_typ) ret))

let foreign_method14_void class_name method_name hash _fn _ret_typ _ret_to_ocaml
    x0_typ x1_typ x2_typ x3_typ x4_typ x5_typ x6_typ x7_typ x8_typ x9_typ
    x10_typ x11_typ x12_typ x13_typ x0_of_ocaml x1_of_ocaml x2_of_ocaml
    x3_of_ocaml x4_of_ocaml x5_of_ocaml x6_of_ocaml x7_of_ocaml x8_of_ocaml
    x9_of_ocaml x10_of_ocaml x11_of_ocaml x12_of_ocaml x13_of_ocaml =
  let method_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string method_name
  in
  let class_string_name =
    Living_core.Default.unsafe_free @@ string_name_of_string class_name
  in
  let method_bind =
    classdb_get_method_bind class_string_name method_string_name hash
  in
  fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 self ->
    let open Living_core.Default.Let_syntax in
    let ret = coerce_ptr type_ptr.plain null in
    let x0' = coerce x0_typ type_ptr.const (x0_of_ocaml x0) in
    let x1' = coerce x1_typ type_ptr.const (x1_of_ocaml x1) in
    let x2' = coerce x2_typ type_ptr.const (x2_of_ocaml x2) in
    let x3' = coerce x3_typ type_ptr.const (x3_of_ocaml x3) in
    let x4' = coerce x4_typ type_ptr.const (x4_of_ocaml x4) in
    let x5' = coerce x5_typ type_ptr.const (x5_of_ocaml x5) in
    let x6' = coerce x6_typ type_ptr.const (x6_of_ocaml x6) in
    let x7' = coerce x7_typ type_ptr.const (x7_of_ocaml x7) in
    let x8' = coerce x8_typ type_ptr.const (x8_of_ocaml x8) in
    let x9' = coerce x9_typ type_ptr.const (x9_of_ocaml x9) in
    let x10' = coerce x10_typ type_ptr.const (x10_of_ocaml x10) in
    let x11' = coerce x11_typ type_ptr.const (x11_of_ocaml x11) in
    let x12' = coerce x12_typ type_ptr.const (x12_of_ocaml x12) in
    let x13' = coerce x13_typ type_ptr.const (x13_of_ocaml x13) in
    let* args =
      Living_core.Default.map
        (coerce_ptr (ptr type_ptr.const))
        (foreign_array14 x0' x1' x2' x3' x4' x5' x6' x7' x8' x9' x10' x11' x12'
           x13')
    in
    let self = coerce_ptr object_ptr.plain self in
    let () = object_method_bind_ptrcall method_bind self args ret in
    Living_core.Default.named_return method_name ()
