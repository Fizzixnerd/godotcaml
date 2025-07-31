[@@@ocaml.ppx.context
  {
    tool_name = "ppx_driver";
    include_dirs = [];
    hidden_include_dirs = [];
    load_path = ([], []);
    open_modules = [];
    for_package = None;
    debug = false;
    use_threads = false;
    use_vmthreads = false;
    recursive_types = false;
    principal = false;
    transparent_modules = false;
    unboxed_types = false;
    unsafe_string = false;
    cookies = []
  }]
open! Base
open Godotcaml_apis.Api_classes
open Living
open Living_ctypes.Default
module LCore = Living_core.Default
module Player3 =
  struct
    let _godot_class_name : string = "Player3"
    let _godot_methods_loader = ref (fun () -> ())
    let _godot_signals_loader = ref (fun () -> ())
    let _godot_vars_loader = ref (fun () -> ())
    let _godot_virtual_function_table = Hashtbl.create (module String)
    let _godot_finalizer _ _ = ()
    let _godot_virtual_function_add function_name
      (f : Godotcaml_base.Godotcaml.C.ClassCallVirtual.t) =
      Hashtbl.add _godot_virtual_function_table ~key:function_name ~data:f
    let _godot_virtual_function_lookup
      (function_stringname :
        Godotcaml_base.Godotcaml.C.string_name_ptr structure
          Godotcaml_apis.Gdforeign.Suite.const ptr)
      =
      let open Godotcaml_apis.Api_builtins in
        let open Godotcaml_apis.Gdforeign in
          let open Living in
            let open Living_core.Default.Let_syntax in
              Living_core.Default.unsafe_free @@
                (let* s =
                   BuiltinClass.String.of_string_name
                     (coerce_ptr BuiltinClass.StringName.typ
                        function_stringname)
                  in
                 Living_core.Default.return
                   (Hashtbl.find _godot_virtual_function_table s))
    let _godot_inherits : string = "RefCounted"
    let _godot_inherits : string = "AnimatedSprite2D"
    include Class.AnimatedSprite2D
    open Godotcaml_apis.Api_builtins
    let speed = 200.0
    let init self =
      Stdio.prerr_endline "Player3 init called!"; LCore.return self
    module Gsignal_teleport_to =
      struct
        module X0 = BuiltinClass.Float
        module X1 = BuiltinClass.Float
        let _register_signal () =
          let open Godotcaml_base.Godotcaml.C in
            let open Godotcaml_apis.Gdforeign in
              let open Living in
                let _signal_name = "teleport_to" in
                let count = 2 in
                let ret =
                  let open Living_core.Default.Let_syntax in
                    let mkstrnamep x =
                      Living_core.Default.map
                        (coerce_ptr string_name_ptr.plain)
                        (string_name_of_string x) in
                    let* class_name_strname =
                      string_name_of_string _godot_class_name
                     in
                    let* signal_name_strname =
                      string_name_of_string _signal_name
                     in
                    let* x = mkstrnamep "x"
                     in
                    let* hint_str =
                      (Godotcaml_apis.Api_builtins.BuiltinClass0.String.of_ocaml
                         "??")
                        |>
                        (Living_core.Default.map
                           (coerce_ptr string_ptr.plain))
                     in
                    let zero = Unsigned.UInt32.of_int 0 in
                    let six = Unsigned.UInt32.of_int 6 in
                    let* argument_info_ptr = gc_alloc ~count PropertyInfo.s
                     in
                    let* argument_infos =
                      (([|(X0.type_enum, X0.type_name);(X1.type_enum,
                                                         X1.type_name)|]
                          |>
                          (Base.Array.map
                             ~f:(fun (te, tn) ->
                                   let* tn = mkstrnamep tn
                                    in
                                   PropertyInfo.make
                                     (gc_alloc ~count:1 ?finalise:None) te tn
                                     tn zero hint_str six)))
                         |> Base.Array.to_list)
                        |> Living_core.Default.sequence_list
                     in
                    for i = 0 to count - 1 do
                      (let ret =
                         let* ai = !@ (List.nth_exn argument_infos i)
                          in (argument_info_ptr +@ i) <-@ ai in
                       Living_core.Default.unsafe_free ret)
                    done;
                    Living_core.Default.return @@
                      (classdb_register_extension_class_signal
                         (!Godotcaml_apis.Gdforeign.library)
                         class_name_strname signal_name_strname
                         argument_info_ptr (count |> Int64.of_int)) in
                Living_core.Default.unsafe_free ret
        let () =
          let old_signals_loader = !_godot_signals_loader in
          let new_signals_loader () =
            _register_signal (); old_signals_loader () in
          _godot_signals_loader := new_signals_loader
      end
    let teleport_to_signal () =
      let open Living_core.Default.Let_syntax in
        let open Godotcaml_apis.Gsignal in
          let open Godotcaml_apis.Gdforeign in
            let open Godotcaml_base.Godotcaml.C in
              let* teleport_to_sn =
                BuiltinClass.StringName.of_string "teleport_to"
               in
              LCore.return
                {
                  name = teleport_to_sn;
                  marshal =
                    (fun (x, y) ->
                       [coerce_ptr variant_ptr.const
                          (LCore.unsafe_free
                             (BuiltinClass.Float.ocaml_to_variant x));
                       coerce_ptr variant_ptr.const
                         (LCore.unsafe_free
                            (BuiltinClass.Float.ocaml_to_variant y))])
                }
    let on_teleport_to x y =
      Stdio.prerr_endline "printing";
      Stdio.eprintf "Teleporting to (%f, %f)\n" x y
    module Goverride__ready =
      struct
        module Self = Class.AnimatedSprite2D
        module Ret = ApiTypes.Void
        let _ready self =
          LCore.unsafe_free @@
            (let open Living_core.Default.Let_syntax in
               let* default_animation =
                 BuiltinClass.StringName.of_string "default"
                in
               let on_teleport_to =
                 let on_teleport_to x y = on_teleport_to x y in
                 let module Ret = ApiTypes.Void in
                   let module X0 = BuiltinClass.Float in
                     let module X1 = BuiltinClass.Float in
                       let final_ret =
                         let open Living in
                           let open Living_core.Default.Let_syntax in
                             let open Godotcaml_apis.Gdforeign in
                               let open Godotcaml_base.Godotcaml.C in
                                 let callable_func :
                                   Godotcaml_base.Godotcaml.C.CallableCustomCall.fn
                                   =
                                   fun _userdata args count ret call_error ->
                                     let final_ret =
                                       let () =
                                         assert
                                           (let open Int64 in
                                              count = (of_int 2)) in
                                       let* call_ok = !@ CallError.call_ok
                                        in
                                       let* () =
                                         (Living_core.Default.return
                                            call_error)
                                           <-@ call_ok
                                        in
                                       let ret' =
                                         on_teleport_to
                                           (LCore.unsafe_free
                                              (X0.ocaml_of_variant
                                                 (let args' =
                                                    coerce_ptr
                                                      (ptr variant_ptr.plain)
                                                      args in
                                                  let arg_i =
                                                    let* arg_i = args' +@ 0
                                                     in !@ arg_i in
                                                  Living_core.Default.unsafe_free
                                                    arg_i)))
                                           (LCore.unsafe_free
                                              (X1.ocaml_of_variant
                                                 (let args' =
                                                    coerce_ptr
                                                      (ptr variant_ptr.plain)
                                                      args in
                                                  let arg_i =
                                                    let* arg_i = args' +@ 1
                                                     in !@ arg_i in
                                                  Living_core.Default.unsafe_free
                                                    arg_i))) in
                                       ignore ret';
                                       Living_core.Default.return () in
                                     Living_core.Default.unsafe_free
                                       final_ret in
                                 let$ callable_func_ptr =
                                   CallableCustomCall.of_fun callable_func
                                  in
                                 let* info_struct =
                                   Godotcaml_base.Godotcaml.C.CallableInfoStruct2.make
                                     (gc_alloc ~count:1 ?finalise:None)
                                     (!Godotcaml_apis.Gdforeign.library)
                                     callable_func_ptr
                                  in
                                 let callable_ptr =
                                   coerce_ptr
                                     Godotcaml_base.Godotcaml.C.type_ptr.uninit
                                     (Living_core.Default.unsafe_free @@
                                        (Godotcaml_apis.Gdforeign.gc_alloc
                                           ~count:1
                                           Godotcaml_apis.Api_types.ApiTypes.Callable.s)) in
                                 let () =
                                   callable_custom_create2 callable_ptr
                                     info_struct in
                                 Living_core.Default.return @@
                                   (coerce_ptr
                                      (ptr
                                         Godotcaml_apis.Api_types.ApiTypes.Callable.s)
                                      callable_ptr) in
                       Living_core.Default.unsafe_free final_ret in
               let* teleport_to_signal' = teleport_to_signal ()
                in
               let* _ =
                 teleport_to_signal' |>
                   (Godotcaml_apis.Gsignal.connect self on_teleport_to)
                in LCore.return ())
        let call_func : Godotcaml_base.Godotcaml.C.ClassMethodCall.fn =
          let open Godotcaml_base.Godotcaml.C in
            let open Godotcaml_apis.Gdforeign in
              fun _method_userdata instance args count ret _err ->
                let () = assert (let open Int64 in count = (of_int 0)) in
                let self =
                  coerce class_instance_ptr.plain Self.godot_typ instance in
                let ret'' = _ready self in ignore ret''; ignore self
        let ptrcall_func : Godotcaml_base.Godotcaml.C.ClassMethodPtrCall.fn =
          let open Godotcaml_base.Godotcaml.C in
            let open Godotcaml_apis.Gdforeign in
              let open Living.Living_core.Default.Let_syntax in
                fun _method_userdata instance args ret ->
                  let self =
                    coerce class_instance_ptr.plain Self.godot_typ instance in
                  let ret'' = _ready self in
                  ignore ret'';
                  (let final_ret = Living.Living_core.Default.return () in
                   Living.Living_core.Default.unsafe_free final_ret)
        let call_func_ptr =
          Ctypes.Root.get
            (Ctypes.Root.create
               (Godotcaml_base.Godotcaml.C.ClassMethodCall.of_fun call_func))
        let ptrcall_func_ptr =
          Ctypes.Root.get
            (Ctypes.Root.create
               (Godotcaml_base.Godotcaml.C.ClassMethodPtrCall.of_fun
                  ptrcall_func))
        let count = 0
        let () =
          let open Living in
            let open Living_core.Default.Let_syntax in
              let old_methods_loader = !_godot_methods_loader in
              let mkstrnamep s =
                let open Godotcaml_base.Godotcaml.C in
                  let open Godotcaml_apis.Gdforeign in
                    Living_core.Default.map
                      (coerce string_name_ptr.const string_name_ptr.plain)
                      (string_name_of_string s) in
              let new_methods_loader () =
                let final_ret =
                  let open Godotcaml_base.Godotcaml.C in
                    let open Godotcaml_apis.Gdforeign in
                      let* arguments_info = gc_alloc ~count PropertyInfo.s
                       in
                      let* arguments_metadata = gc_alloc ~count int
                       in
                      let* callable = mkstrnamep "Callable"
                       in
                      let* hint_str =
                        (Godotcaml_apis.Api_builtins.BuiltinClass0.String.of_ocaml
                           "??")
                          |>
                          (Living_core.Default.map
                             (coerce_ptr string_ptr.plain))
                       in
                      let zero = Unsigned.UInt32.of_int 0 in
                      let six = Unsigned.UInt32.of_int 6 in
                      let* argument_infos =
                        (([||] |>
                            (Base.Array.map
                               ~f:(fun (te, tn) ->
                                     let* tn = mkstrnamep tn
                                      in
                                     PropertyInfo.make
                                       (gc_alloc ~count:1 ?finalise:None) te
                                       tn tn zero hint_str six)))
                           |> Base.Array.to_list)
                          |> Living_core.Default.sequence_list
                       in
                      for i = 0 to count - 1 do
                        (let ret =
                           let* ai = !@ (List.nth_exn argument_infos i)
                            in
                           let* () = (arguments_info +@ i) <-@ ai
                            in
                           (arguments_metadata +@ i) <-@
                             ClassMethodArgumentMetadata.none in
                         Living_core.Default.unsafe_free ret)
                      done;
                      (let (ret_enum, ret_name) = (0, "") in
                       let* ret_name = mkstrnamep ret_name
                        in
                       let* ret_info =
                         PropertyInfo.make (gc_alloc ~count:1 ?finalise:None)
                           ret_enum ret_name ret_name zero hint_str six
                        in
                       let flags =
                         [|ClassMethodFlags.virtual_|] |>
                           (Base.Array.fold ~init:(Unsigned.UInt32.of_int 0)
                              ~f:Unsigned.UInt32.add) in
                       let* function_name = mkstrnamep "_ready"
                        in
                       let count' = Unsigned.UInt32.of_int count in
                       let* method_info =
                         let open Godotcaml_base.Godotcaml.C in
                           ClassMethodInfo.make ~return_value_info:ret_info
                             ~return_value_metadata:ClassMethodArgumentMetadata.none
                             ~method_flags:flags
                             (gc_alloc ~count:1 ?finalise:None) function_name
                             true count' arguments_info arguments_metadata
                             call_func_ptr ptrcall_func_ptr
                        in
                       let* class_name =
                         string_name_of_string _godot_class_name
                        in
                       classdb_register_extension_class_method
                         (!Godotcaml_apis.Gdforeign.library) class_name
                         method_info;
                       Living_core.Default.return (old_methods_loader ())) in
                Living_core.Default.unsafe_free final_ret in
              _godot_methods_loader := new_methods_loader
        let () =
          let _call_virtual_func :
            Godotcaml_base.Godotcaml.C.ClassCallVirtual.t =
            Godotcaml_base.Godotcaml.C.ClassCallVirtual.of_fun
              (fun self args ret ->
                 let open Living in
                   let open Living_core.Default.Let_syntax in
                     let open Living_ctypes.Default in
                       let open Godotcaml_apis.Gdforeign in
                         Living_core.Default.unsafe_free @@
                           (let self = coerce_ptr Self.godot_typ self in
                            let self = Self.to_ocaml self in
                            Living_core.Default.return (_ready self))) in
          let _res = _godot_virtual_function_add "_ready" _call_virtual_func in
          ()
      end
    module Goverride__process =
      struct
        module X0 = BuiltinClass.Float
        module Self = Class.Node
        module Ret = ApiTypes.Void
        let _process delta self =
          LCore.unsafe_free @@
            (let open Godotcaml_apis.Gdforeign in
               let open Living_core.Default.Let_syntax in
                 let* teleport_to_signal' = teleport_to_signal ()
                  in
                 let* input_name = string_name_of_string "Input"
                  in
                 let input = godot_get_singleton input_name Class.Input.typ in
                 let* position = self |> get_position
                  in
                 let* delta_val = delta
                  in
                 let move_amount = speed *. delta_val in
                 let* is_w_pressed =
                   input |>
                     (Class.Input.is_key_pressed
                        (Int64.of_int GlobalEnum.Key._KEY_W))
                  in
                 let* position =
                   if is_w_pressed
                   then
                     LCore.return
                       (Gg.V2.v (Gg.V2.x position)
                          ((Gg.V2.y position) -. move_amount))
                   else LCore.return position
                  in
                 let* is_s_pressed =
                   input |>
                     (Class.Input.is_key_pressed
                        (Int64.of_int GlobalEnum.Key._KEY_S))
                  in
                 let* position =
                   if is_s_pressed
                   then
                     LCore.return
                       (Gg.V2.v (Gg.V2.x position)
                          ((Gg.V2.y position) +. move_amount))
                   else LCore.return position
                  in
                 let* is_a_pressed =
                   input |>
                     (Class.Input.is_key_pressed
                        (Int64.of_int GlobalEnum.Key._KEY_A))
                  in
                 let* position =
                   if is_a_pressed
                   then
                     LCore.return
                       (Gg.V2.v ((Gg.V2.x position) -. move_amount)
                          (Gg.V2.y position))
                   else LCore.return position
                  in
                 let* is_d_pressed =
                   input |>
                     (Class.Input.is_key_pressed
                        (Int64.of_int GlobalEnum.Key._KEY_D))
                  in
                 let* position =
                   if is_d_pressed
                   then
                     LCore.return
                       (Gg.V2.v ((Gg.V2.x position) +. move_amount)
                          (Gg.V2.y position))
                   else LCore.return position
                  in
                 let clamped_position =
                   Gg.V2.v
                     ((Gg.V2.x position) |>
                        (Base.Float.clamp_exn ~min:0.0 ~max:800.0))
                     ((Gg.V2.y position) |>
                        (Base.Float.clamp_exn ~min:0.0 ~max:600.0)) in
                 let* () = self |> (set_position clamped_position)
                  in LCore.return ())
        let call_func : Godotcaml_base.Godotcaml.C.ClassMethodCall.fn =
          let open Godotcaml_base.Godotcaml.C in
            let open Godotcaml_apis.Gdforeign in
              fun _method_userdata instance args count ret _err ->
                let () = assert (let open Int64 in count = (of_int 1)) in
                let self =
                  coerce class_instance_ptr.plain Self.godot_typ instance in
                let ret'' =
                  _process
                    (X0.ocaml_of_variant
                       (let open Living in
                          let open Living_core.Default.Let_syntax in
                            let args' =
                              coerce_ptr (ptr variant_ptr.plain) args in
                            let arg_i = let* arg_i = args' +@ 0
                                         in !@ arg_i in
                            Living_core.Default.unsafe_free arg_i)) self in
                ignore ret''; ignore self
        let ptrcall_func : Godotcaml_base.Godotcaml.C.ClassMethodPtrCall.fn =
          let open Godotcaml_base.Godotcaml.C in
            let open Godotcaml_apis.Gdforeign in
              let open Living.Living_core.Default.Let_syntax in
                fun _method_userdata instance args ret ->
                  let self =
                    coerce class_instance_ptr.plain Self.godot_typ instance in
                  let ret'' =
                    _process
                      (X0.to_ocaml
                         (let open Living in
                            let open Living_core.Default.Let_syntax in
                              let args' = coerce_ptr (ptr X0.typ) args in
                              let arg_i = let* arg_i = args' +@ 0
                                           in !@ arg_i in
                              Living_core.Default.unsafe_free arg_i)) self in
                  ignore ret'';
                  (let final_ret = Living.Living_core.Default.return () in
                   Living.Living_core.Default.unsafe_free final_ret)
        let call_func_ptr =
          Ctypes.Root.get
            (Ctypes.Root.create
               (Godotcaml_base.Godotcaml.C.ClassMethodCall.of_fun call_func))
        let ptrcall_func_ptr =
          Ctypes.Root.get
            (Ctypes.Root.create
               (Godotcaml_base.Godotcaml.C.ClassMethodPtrCall.of_fun
                  ptrcall_func))
        let count = 1
        let () =
          let open Living in
            let open Living_core.Default.Let_syntax in
              let old_methods_loader = !_godot_methods_loader in
              let mkstrnamep s =
                let open Godotcaml_base.Godotcaml.C in
                  let open Godotcaml_apis.Gdforeign in
                    Living_core.Default.map
                      (coerce string_name_ptr.const string_name_ptr.plain)
                      (string_name_of_string s) in
              let new_methods_loader () =
                let final_ret =
                  let open Godotcaml_base.Godotcaml.C in
                    let open Godotcaml_apis.Gdforeign in
                      let* arguments_info = gc_alloc ~count PropertyInfo.s
                       in
                      let* arguments_metadata = gc_alloc ~count int
                       in
                      let* callable = mkstrnamep "Callable"
                       in
                      let* hint_str =
                        (Godotcaml_apis.Api_builtins.BuiltinClass0.String.of_ocaml
                           "??")
                          |>
                          (Living_core.Default.map
                             (coerce_ptr string_ptr.plain))
                       in
                      let zero = Unsigned.UInt32.of_int 0 in
                      let six = Unsigned.UInt32.of_int 6 in
                      let* argument_infos =
                        (([|(X0.type_enum, X0.type_name)|] |>
                            (Base.Array.map
                               ~f:(fun (te, tn) ->
                                     let* tn = mkstrnamep tn
                                      in
                                     PropertyInfo.make
                                       (gc_alloc ~count:1 ?finalise:None) te
                                       tn tn zero hint_str six)))
                           |> Base.Array.to_list)
                          |> Living_core.Default.sequence_list
                       in
                      for i = 0 to count - 1 do
                        (let ret =
                           let* ai = !@ (List.nth_exn argument_infos i)
                            in
                           let* () = (arguments_info +@ i) <-@ ai
                            in
                           (arguments_metadata +@ i) <-@
                             ClassMethodArgumentMetadata.none in
                         Living_core.Default.unsafe_free ret)
                      done;
                      (let (ret_enum, ret_name) = (0, "") in
                       let* ret_name = mkstrnamep ret_name
                        in
                       let* ret_info =
                         PropertyInfo.make (gc_alloc ~count:1 ?finalise:None)
                           ret_enum ret_name ret_name zero hint_str six
                        in
                       let flags =
                         [|ClassMethodFlags.virtual_|] |>
                           (Base.Array.fold ~init:(Unsigned.UInt32.of_int 0)
                              ~f:Unsigned.UInt32.add) in
                       let* function_name = mkstrnamep "_process"
                        in
                       let count' = Unsigned.UInt32.of_int count in
                       let* method_info =
                         let open Godotcaml_base.Godotcaml.C in
                           ClassMethodInfo.make ~return_value_info:ret_info
                             ~return_value_metadata:ClassMethodArgumentMetadata.none
                             ~method_flags:flags
                             (gc_alloc ~count:1 ?finalise:None) function_name
                             true count' arguments_info arguments_metadata
                             call_func_ptr ptrcall_func_ptr
                        in
                       let* class_name =
                         string_name_of_string _godot_class_name
                        in
                       classdb_register_extension_class_method
                         (!Godotcaml_apis.Gdforeign.library) class_name
                         method_info;
                       Living_core.Default.return (old_methods_loader ())) in
                Living_core.Default.unsafe_free final_ret in
              _godot_methods_loader := new_methods_loader
        let () =
          let _call_virtual_func :
            Godotcaml_base.Godotcaml.C.ClassCallVirtual.t =
            Godotcaml_base.Godotcaml.C.ClassCallVirtual.of_fun
              (fun self args ret ->
                 let open Living in
                   let open Living_core.Default.Let_syntax in
                     let open Living_ctypes.Default in
                       let open Godotcaml_apis.Gdforeign in
                         Living_core.Default.unsafe_free @@
                           (let self = coerce_ptr Self.godot_typ self in
                            let self = Self.to_ocaml self in
                            let* loc_k = args +@ 0
                             in
                            let* arg_k = !@ loc_k
                             in
                            let y0 =
                              X0.to_ocaml (coerce_ptr X0.godot_typ arg_k) in
                            Living_core.Default.return ((_process y0) self))) in
          let _res =
            _godot_virtual_function_add "_process" _call_virtual_func in
          ()
      end
    open Living
    open Living_core.Default.Let_syntax
    let instance_binding_callbacks =
      let open Godotcaml_base.Godotcaml.C in
        let open Godotcaml_apis.Gdforeign in
          Living_core.Default.unsafe_free @@
            (InstanceBindingCallbacks.make (gc_alloc ~count:1 ?finalise:None))
    let _godot_create _ _ =
      let open Godotcaml_base.Godotcaml.C in
        let open Godotcaml_apis.Gdforeign in
          let open Living in
            let open Living_core.Default.Let_syntax in
              let* ret =
                Living_core.Default.map (coerce_ptr object_ptr.plain)
                  (Living_core.Default.map classdb_construct_object
                     (string_name_of_string _godot_inherits))
               in
              let* class_name = string_name_of_string _godot_class_name
               in
              object_set_instance ret class_name
                (coerce_ptr class_instance_ptr.plain ret);
              object_set_instance_binding ret
                (coerce_ptr (ptr void) (!library))
                (coerce_ptr (ptr void) ret) instance_binding_callbacks;
              init ret
    let _godot_unsafe_create x y =
      Living_core.Default.unsafe_free (_godot_create x y)
    let new_ () = _godot_create () false
    let new_ptr =
      let open Godotcaml_base.Godotcaml.C in
        let open Godotcaml_apis.Gdforeign in
          ClassCreateInstance2.of_fun _godot_unsafe_create
    let finalizer_ptr =
      let open Godotcaml_base.Godotcaml.C in
        let open Godotcaml_apis.Gdforeign in
          ClassFreeInstance.of_fun _godot_finalizer
    let to_string =
      let open Godotcaml_base.Godotcaml.C in
        let open Godotcaml_apis.Gdforeign in
          let open Living in
            let open Living_core.Default in
              let open Living_core.Default.Let_syntax in
                let open Living_ctypes.Default in
                  ClassToString.of_fun
                    (fun _self _is_valid (out_str : string_ptr structure ptr)
                       ->
                       Living_core.Default.unsafe_free @@
                         (let* () =
                            (return _is_valid) <-@
                              (Unsigned.UInt8.of_int (if true then 1 else 0))
                           in
                          let* out =
                            Living_core.Default.bind (!@)
                              (BuiltinClass.String.of_ocaml _godot_class_name)
                           in
                          let* () =
                            (return
                               (coerce_ptr BuiltinClass.String.godot_typ
                                  out_str))
                              <-@ out
                           in Living_core.Default.return ()))
    let _godot_class_info =
      let open Godotcaml_base.Godotcaml.C in
        let open Godotcaml_apis.Gdforeign in
          let get_virtual =
            ClassGetVirtual2.of_fun
              (fun _ f_str_name _method_flags ->
                 (_godot_virtual_function_lookup f_str_name) |>
                   (Option.value
                      ~default:(coerce_ptr ClassCallVirtual.t null))) in
          Living_core.Default.unsafe_free @@
            (ClassCreationInfo4.make (gc_alloc ~count:1 ?finalise:None)
               new_ptr finalizer_ptr ~get_virtual ~is_runtime:true ~to_string)
    let () =
      let () =
        Stdio.printf "Registering class: %s, inherits: %s\n"
          _godot_class_name _godot_inherits in
      let open Godotcaml_base.Godotcaml.C in
        let open Godotcaml_apis.Gdforeign in
          let open Living in
            let open Living_core.Default.Let_syntax in
              let on_load_func = !on_load in
              let new_on_load_func () =
                Living_core.Default.unsafe_free @@
                  (let* godot_inherits_strname =
                     string_name_of_string _godot_inherits
                    in
                   let* godot_class_name_strname =
                     string_name_of_string _godot_class_name
                    in
                   let () = on_load_func () in
                   classdb_register_extension_class4
                     (!Godotcaml_apis.Gdforeign.library)
                     godot_class_name_strname godot_inherits_strname
                     _godot_class_info;
                   (!_godot_vars_loader) ();
                   (!_godot_signals_loader) ();
                   (!_godot_methods_loader) ();
                   Living_core.Default.return ()) in
              on_load := new_on_load_func
  end
