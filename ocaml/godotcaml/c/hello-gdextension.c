#include "../include/gdextension_interface.h"

GDExtensionBool hello_extension_entry(
    GDExtensionInterfaceGetProcAddress p_get_proc_address,
    GDExtensionClassLibraryPtr p_library,
    GDExtensionInitialization *r_initialization
    ) {
        return 1;
    }