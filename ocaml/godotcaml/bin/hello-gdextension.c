#include "gdextension_interface.h"
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/callback.h>
#include <caml/alloc.h>

GDExtensionBool hello_extension_entry(
    GDExtensionInterfaceGetProcAddress p_get_proc_address,
    GDExtensionClassLibraryPtr p_library,
    GDExtensionInitialization *r_initialization
    ) {
        char** argv_fake = malloc(sizeof(char*) * 2);
        argv_fake[0] = "hello_extension_entry";
        argv_fake[1] = NULL;
        caml_main(argv_fake);
        CAMLparam0();
        CAMLlocal3(get_proc_addr, library, initialization);

        get_proc_addr = caml_alloc(1, Custom_tag);
        *(GDExtensionInterfaceGetProcAddress*)Data_custom_val(get_proc_addr) = p_get_proc_address;

        library = caml_alloc(1, Custom_tag);
        *(GDExtensionClassLibraryPtr*)Data_custom_val(library) = p_library;

        initialization = caml_alloc(1, Custom_tag);
        *(GDExtensionInitialization**)Data_custom_val(initialization) = r_initialization;

        const value * entry = caml_named_value("hello_extension_entry");
        if (entry == NULL) {
            puts("Could not initialize the extension! Returning 0...");
            return 0;
        } else {
            puts("Initializing extension from OCaml!");
            int ret = Int_val(caml_callback3(*entry, get_proc_addr, library, initialization));
            printf("Done initializing from OCaml! Returning %d...\n", ret);
            return ret;
        }
    }
