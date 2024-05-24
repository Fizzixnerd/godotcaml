open! Ctypes

let printo x = print_endline (string_from_ptr ~length:4 (from_voidp char (ptr_of_raw_address x)))

let () = Callback.register "printo" printo
