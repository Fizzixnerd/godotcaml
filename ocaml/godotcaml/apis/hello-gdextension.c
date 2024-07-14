#include "gdextension_interface.h"
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/callback.h>
#include <caml/alloc.h>
#include <caml/custom.h>
#include <caml/backtrace.h>

static struct custom_operations custom_operators = {
    .identifier = "GodotCPointer",
    .finalize = custom_finalize_default,
    .compare = custom_compare_default,
    .compare_ext = custom_compare_ext_default,
    .hash = custom_hash_default,
    .serialize = custom_serialize_default,
    .deserialize = custom_deserialize_default,
    .fixed_length = NULL
};

GDExtensionBool _hello_extension_entry(
    GDExtensionInterfaceGetProcAddress p_get_proc_address,
    GDExtensionClassLibraryPtr p_library,
    GDExtensionInitialization *r_initialization
    ) {
        char** argv_fake = malloc(sizeof(char*) * 2);
        argv_fake[0] = "hello_extension_entry";
        argv_fake[1] = NULL;
        caml_main(argv_fake);
        caml_record_backtraces(1);
        CAMLparam0();
        value* get_proc_addr = malloc(sizeof(value));
        value* library = malloc(sizeof(value));
        value* initialization = malloc(sizeof(value));
        
        *get_proc_addr = caml_alloc_custom_mem(&custom_operators, 8, 0);
        *(GDExtensionInterfaceGetProcAddress*)Data_custom_val(*get_proc_addr) = p_get_proc_address;
        caml_register_global_root(get_proc_addr);

        *library = caml_alloc_custom_mem(&custom_operators, 8, 0);
        *(GDExtensionClassLibraryPtr*)Data_custom_val(*library) = p_library;
        caml_register_global_root(library);

        *initialization = caml_alloc_custom_mem(&custom_operators, 8, 0);
        *(GDExtensionInitialization**)Data_custom_val(*initialization) = r_initialization;
        caml_register_global_root(initialization);

        const value * entry = caml_named_value("hello_extension_entry");
        if (entry == NULL) {
            puts("Could not initialize the extension! Returning 0...");
            CAMLreturn(0);
        } else {
            puts("Initializing extension from OCaml!");
            int ret = Int_val(caml_callback3(*entry, *get_proc_addr, *library, *initialization));
            printf("Done initializing from OCaml! Returning %d...\n", ret);
            CAMLreturn(ret);
        }
    }

GDExtensionBool hello_extension_entry(
    GDExtensionInterfaceGetProcAddress p_get_proc_address,
    GDExtensionClassLibraryPtr p_library,
    GDExtensionInitialization *r_initialization
    ) {
        return _hello_extension_entry(p_get_proc_address, p_library, r_initialization);
    }