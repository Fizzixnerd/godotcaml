open! Base

module GFunc = struct
  open Ctypes
  open! Godotcaml_base.Godotcaml.C
  open! Gdforeign

  type ('a, 'ret) t = { intf : 'a fn; impl : 'a; ret : 'ret typ }

  let gfunc intf ret impl = { impl; intf; ret }
  (* let to_call_func1 methods_loader (x0_mod : (module VARIANT))
       (self_mod : (module VARIANT)) (ret_mod : (module VARIANT)) =
     let open Godotcaml_base.Godotcaml.C in
     let call_func : ClassMethodCall.fn =
      fun _method_userdata instance args count ret _err ->
       (* FIXME: Make this set err appropriately! *)
       let (module X0) = x0_mod in
       let (module Self) = self_mod in
       let (module Ret) = ret_mod in
       let () = assert (Int64.(count = 1L)) in
       let args = coerce_ptr (ptr variant_ptr.plain) args in
       let x0 = X0.godot_of_variant !@args in
       let self = Self.to_ocaml (coerce_ptr Self.godot_typ instance) in
       ret <-@ !@(Ret.ocaml_to_variant (f x0 self))
     in

     let old_methods_loader = !methods_loader in
     let mkstrnamep s =
       coerce_ptr string_name_ptr.plain @@ string_name_of_string s
     in
     let new_methods_loader () =
       let () = old_methods_loader () in
       let arguments_info = gc_alloc ~count:1 PropertyInfo.s in
       let arguments_metadata = gc_alloc ~count:1 int in
       let () =
         arguments_info
         <-@ !@(PropertyInfo.make VariantType.int (mkstrnamep "x0")
                  (mkstrnamep "int") (Unsigned.UInt32.of_int 0)
                  (Unsigned.UInt32.of_int 6))
       in
       let () = arguments_metadata <-@ ClassMethodArgumentMetadata.none in
       let method_info =
         ClassMethodInfo.make
           (gc_alloc ~count:1 ?finalise:None)
           ~call_func gfunc_name true 1L arguments_info arguments_metadata 0
           (coerce_ptr variant_ptr.plain null)
       in
       classdb_register_extension_class_method !library
         (string_name_of_string _godot_class_name)
         method_info
     in
     methods_loader := new_methods_loader
  *)
  (* coerce_ptr variant_ptr.uninit (ret_to_variant (gc_alloc ret_typ ~count:1)) *)

  (* let to_calls1 :
        ('a -> 'b -> 'ret, 'ret) t ->
        'a typ ->
        (variant_ptr structure Suite.const ptr -> 'a) ->
        (variant_ptr structure ptr -> 'ret) ->
        ClassMethodCall.fn * ClassMethodPtrCall.fn =
     fun func x0_typ x0_of_var ->
      let call_func : ClassMethodCall.fn =
       fun _method_userdata instance args count ret _err ->
        (* FIXME: Make this set err appropriately! *)
        let () = assert (Int64.(count = 1L)) in
        let x0 = x0_of_var !@args in
        let coerced_func =
          coerce_fn func.intf
            (x0_typ @-> class_instance_ptr.plain @-> returning func.ret)
            func.impl
        in
        ret <-@ ret_of_variant (coerced_func x0 instance)
      in
      let ptrcall_func = assert false in
      (call_func, ptrcall_func)
  *)
end
