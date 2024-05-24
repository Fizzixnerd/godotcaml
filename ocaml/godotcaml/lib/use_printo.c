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
    intnat rawr = 5;
    intnat* rawr_p = malloc(sizeof(intnat));
    *rawr_p = rawr;
    v = caml_alloc(1, Custom_tag);
    *(intnat*)Data_custom_val(v) = "rawr?";
    caml_callback(printo_closure, v);
    CAMLreturn(0);
}