open! Base
open Gdforeign
open Api_builtins
open Api_classes
open Ctypes
open Living

module New = struct
  type nonrec 'a t = {
    raw : BuiltinClass.Signal.t structure ptr;
    fn : ('a -> unit) fn;
    marshal : 'a -> VariadicVariants.t;
  }

  (* FIXME: Add documentation from original. *)

  let is_null s = BuiltinClass.Signal.is_null s.raw
  let get_object s = BuiltinClass.Signal.get_object s.raw
  let get_object_id s = BuiltinClass.Signal.get_object_id s.raw
  let get_name s = BuiltinClass.Signal.get_name s.raw

  let connect ?connect_flags callable signal =
    let open Living_core.Default.Let_syntax in
    let* result =
      BuiltinClass.Signal.connect callable
        (connect_flags |> Option.value ~default:0L |> Conv.Int.of_ocaml
       |> Living_core.Default.unsafe_free)
        signal.raw
    in
    Living_core.Default.named_return "Gsignal.New.connect"
      (Result.ok_if_true
         Int64.(Living_core.Default.unsafe_free (Conv.Int.to_ocaml result) = 0L)
         ~error:result)

  let emit : 'a -> 'a t -> unit Living_core.Default.t =
   fun args signal -> BuiltinClass.Signal.emit (signal.marshal args) signal.raw
end

type nonrec 'a t = {
  name : BuiltinClass.StringName.ocaml_t;
  marshal : 'a -> VariadicVariants.t;
}

let connect ?connect_flags obj callable signal =
  let open Living_core.Default.Let_syntax in
  let* result =
    obj
    |> Class.Object.connect signal.name callable
         (connect_flags |> Option.value ~default:0L)
  in
  Living_core.Default.named_return "Gsignal.connect"
    (Result.ok_if_true Int64.(result = 0L) ~error:result)

let emit obj args signal =
  let open Living_core.Default.Let_syntax in
  let* result =
    obj |> Class.Object.emit_signal signal.name (signal.marshal args)
  in
  Living_core.Default.named_return "Gsignal.emit"
    (Result.ok_if_true Int64.(result = 0L) ~error:result)
