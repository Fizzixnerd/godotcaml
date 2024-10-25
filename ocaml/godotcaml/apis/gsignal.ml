open! Base
open Gdforeign
open Api_builtins
open Ctypes
open Living

type nonrec 'a t = {
  raw : BuiltinClass.Signal.t structure ptr;
  fn : ('a -> unit) fn;
  marshal : 'a -> Variadic.t;
}

(* FIXME: Add documentation from original. *)

let is_null s = BuiltinClass.Signal.is_null s.raw
let get_object s = BuiltinClass.Signal.get_object s
let get_object_id s = BuiltinClass.Signal.get_object_id s
let get_name s = BuiltinClass.Signal.get_name s

let connect ?connect_flags callable signal =
  let open Living_core.Default.Let_syntax in
  let* result =
    BuiltinClass.Signal.connect callable
      (connect_flags |> Option.value ~default:0L |> Conv.Int.of_ocaml)
      signal.raw
  in
  Living_core.Default.named_return "connect"
    (Result.ok_if_true Int64.(Conv.Int.to_ocaml result = 0L) ~error:result)

let emit : 'a -> 'a t -> unit Living_core.Default.t =
 fun args signal -> BuiltinClass.Signal.emit (signal.marshal args) signal.raw

let emit2 : 'a0 -> 'a1 -> ('a0 * 'a1) t -> unit Living_core.Default.t =
 fun x0 x1 signal ->
  BuiltinClass.Signal.emit (signal.marshal (x0, x1)) signal.raw

let emit3 :
    'a0 -> 'a1 -> 'a2 -> ('a0 * 'a1 * 'a2) t -> unit Living_core.Default.t =
 fun x0 x1 x2 signal ->
  BuiltinClass.Signal.emit (signal.marshal (x0, x1, x2)) signal.raw

let emit4 :
    'a0 ->
    'a1 ->
    'a2 ->
    'a3 ->
    ('a0 * 'a1 * 'a2 * 'a3) t ->
    unit Living_core.Default.t =
 fun x0 x1 x2 x3 signal ->
  BuiltinClass.Signal.emit (signal.marshal (x0, x1, x2, x3)) signal.raw

let emit5 :
    'a0 ->
    'a1 ->
    'a2 ->
    'a3 ->
    'a4 ->
    ('a0 * 'a1 * 'a2 * 'a3 * 'a4) t ->
    unit Living_core.Default.t =
 fun x0 x1 x2 x3 x4 signal ->
  BuiltinClass.Signal.emit (signal.marshal (x0, x1, x2, x3, x4)) signal.raw
