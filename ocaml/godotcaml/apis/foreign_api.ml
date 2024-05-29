open! Base
open Ctypes
open Godotcaml
module C = C(TypedSuite)
open C

let get_proc_address : (string -> unit -> unit) ref = ref (fun (_:string) (_:unit) -> ())

module type NEWTYPE = sig
  type t
  val s : t structure typ
  val of_voidp : unit ptr -> t structure ptr
  val to_voidp : t structure ptr -> unit ptr
  val typ : t structure ptr typ
end

module Newtype () = struct
  type t
  let s : t structure typ = structure "_Dummy"
  let () = seal s
  let of_voidp = coerce (ptr void) (ptr s)
  let to_voidp = coerce (ptr s) (ptr void)
  let typ = view ~read:of_voidp ~write:to_voidp (ptr void)
end

module Nil = struct
  include Newtype ()
end

module Bool = struct
  include Newtype ()
end

module Dictionary = struct
  include Newtype ()
end

module Array = struct
  include Newtype ()
end

let get_fun fun_name fun_typ =
  coerce interface_function_ptr.typ fun_typ (!get_proc_address fun_name)

let string_name_new () = get_fun "string_new_name_with_utf8_chars" interface_string_name_new_with_utf8_chars.typ

let foreign_operator = fun class_name operator_enum operator_typ ->

module type FOREIGN_API = sig
  module Nil : NEWTYPE
  module Bool : NEWTYPE
  module Dictionary : NEWTYPE

  val foreign_operator : string -> int -> 'a typ -> 'a
end