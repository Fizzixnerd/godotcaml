open! Base
open Ctypes
open Godotcaml_api
open Gdforeign
open Api_builtins
open! Uses_ppx_godot

let funptr = Foreign.funptr

let hello_extension_entry (get_proc_address : nativeint) (library : nativeint)
    (initialization : nativeint) =
  let open C in
  let initialization =
    coerce (ptr void) (ptr Initialization.s) (ptr_of_raw_address initialization)
  in

  let get_proc_address =
    coerce (ptr void) interface_get_proc_address.typ
      (ptr_of_raw_address get_proc_address)
  in

  let library =
    coerce (ptr void) class_library_ptr.plain (ptr_of_raw_address library)
  in

  Foreign_base.get_proc_address := get_proc_address;
  Foreign_base.library := library;

  let initialize (_userdata : unit ptr) (p_level : int) =
    Stdio.print_endline @@ "up: " ^ Base.Int.to_string p_level;
    let ture = BuiltinClass.Int.( + ) 2L 1L in
    Stdio.printf "ture = %Ld\n" ture;
    Stdio.Out_channel.flush Stdio.stdout;

    if p_level = 2 then
      let get_virtual : ClassGetVirtual.fn option =
        Option.some (fun _ _name -> coerce_ptr ClassCallVirtual.t null)
      in
      let get_property_list : ClassGetPropertyList.fn option =
        Option.some (fun _inst count ->
            count <-@ Unsigned.UInt32.of_int 1;
            let arr = gc_alloc ~count:1 PropertyInfo.s in
            arr
            <-@ !@(PropertyInfo.make
                     (gc_alloc ~count:1 ?finalise:None)
                     VariantType.object_
                     (coerce_ptr string_name_ptr.plain
                        (string_name_of_string "GetOffMyLawn"))
                     (coerce_ptr string_name_ptr.plain
                        (string_name_of_string "Object"))
                     (Unsigned.UInt32.of_int 0) (Unsigned.UInt32.of_int 6));
            arr)
      in
      let free_property_list = Option.some (fun _ _ -> ()) in
      let notification = Option.some (fun _ _ _ -> ()) in
      let to_string : ClassToString.fn option =
        Option.some (fun _ is_valid out_str ->
            is_valid <-@ Unsigned.UInt8.of_int 0;
            coerce_ptr (ptr int64_t) out_str
            <-@ !@(coerce_ptr (ptr int64_t) (Conv.String.of_ocaml "")))
      in
      let reference = Option.some (fun _ -> ()) in
      let unreference = Option.some (fun _ -> ()) in
      let subclass_of = "Node" in
      let class_info =
        ClassCreationInfo2.make
          (gc_alloc ~count:1 ?finalise:None)
          ?get_property_list ?free_property_list ?notification ?to_string
          ?reference ?unreference ?get_virtual
          (fun _ ->
            coerce_ptr object_ptr.plain
            @@ classdb_construct_object (string_name_of_string subclass_of))
          (fun _ _ -> ())
      in
      let () =
        classdb_register_extension_class2 library
          (string_name_of_string "OcamlTestThing")
          (string_name_of_string subclass_of)
          class_info
      in
      !on_load ()
  in

  let deinitialize (_userdata : unit ptr) (p_level : int) =
    Stdio.print_endline @@ "down: " ^ Base.Int.to_string p_level
  in

  Initialization.(initialization |-> initialize_f <-@ initialize);
  Initialization.(initialization |-> deinitialize_f <-@ deinitialize);

  1

let () = Stdlib.Callback.register "hello_extension_entry" hello_extension_entry
