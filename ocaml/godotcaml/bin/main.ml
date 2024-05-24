open! Ctypes

let printo (x,_) = print_endline x

let () = Callback.register "printo" printo
