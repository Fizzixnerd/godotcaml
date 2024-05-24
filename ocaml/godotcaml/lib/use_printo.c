#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/callback.h>
#include <caml/alloc.h>


int main(int argc, char **argv) {
    caml_main(argv);
    CAMLparam0();
    CAMLlocal2(v, printo_closure);
    puts("RAWR");
    fflush(stdout);
    printo_closure = *caml_named_value("printo");
    const char* rawr = "rawr!";
    v = caml_alloc_tuple(2);
    Field (v, 0) = caml_copy_string(rawr);
    caml_callback(printo_closure, v);
    CAMLreturn(0);
}