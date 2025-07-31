# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

GodotCaml is an OCaml binding for the Godot game engine (version 4.3+) that allows developers to write Godot extensions in OCaml instead of GDScript. It provides type-safe bindings to Godot's API and a PPX preprocessor for defining Godot classes with special syntax.

## Build Commands

This project uses Dune as its build system. Common commands:

```bash
# Install dependencies
opam install . --deps-only

# Build the entire project
dune build

# Build the Godot extension shared library
dune build apis/my_ocaml_extension.so

# Run tests (when implemented)
dune build @runtest

# Build documentation
dune build @doc

# Format code
dune fmt
```

## Architecture

### Core Components

1. **godotcaml_base** - Base library providing core types and FFI infrastructure
   - Living monad for memory management (`LCore`)
   - Pointer coercion utilities
   - Base class definitions

2. **godotcaml_apis** - Generated API bindings
   - `api_types.ml` - Core type definitions
   - `api_builtins.ml` - Built-in Godot types (Vector2, String, etc.)
   - `foreign_*.ml` - FFI bindings to Godot's C API
   - `conv.ml` - Type conversion utilities
   - `gen_api.ml` - Code generator that reads `extension_api.json`

3. **ppx_godot** - PPX preprocessor for Godot-specific syntax
   - Provides `module%gclass`, `let%gfunc`, `let%gsignal` etc.
   - Handles method registration and class initialization

4. **Extension Entry Point**
   - `apis/my_ocaml_extension.ml` - Main entry point
   - `hello-gdextension.c` - C stub that bridges Godot and OCaml
   - `hello.gdextension` - Godot configuration file

### Key Patterns

1. **Living Monad Usage**
   All Godot API calls use the Living monad for memory management. Living prevents use-after-free bugs by tracking dependencies between foreign pointers:
   ```ocaml
   let%bind obj = Class.Node2D.new_ () in
   let* () = obj #. set_position (v2 100.0 200.0) in
   LCore.return obj
   ```
   
   **Living Monad Essentials:**
   - Always use `let*` or `let%bind` for sequential operations
   - Use `LCore.return` to wrap pure values
   - Use `LCore.unsafe_free` only after extracting OCaml values
   - Use `=>` operator to create explicit dependencies: `derived => original`
   - Use `LCore.named_return` for debugging memory leaks

2. **PPX Class Definition**
   ```ocaml
   module%gclass MyNode = struct
     [%%ginherits Node2D]
     include Class.Node2D
     
     let%gfunc_void my_method =
       [||] (module ApiTypes.Void) (fun self ->
         (* Implementation *)
         LCore.return ())
   end
   ```

3. **String Conversions**
   - OCaml to Godot: `string_of_string`, `string_name_of_string`
   - Godot to OCaml: Use appropriate conversion functions from `conv.ml`

4. **Pointer Coercion**
   Use `coerce_ptr` when converting between different Godot object types

## Development Workflow

1. **Adding New Godot Classes**
   - Create a new module using `module%gclass`
   - Inherit from appropriate Godot class with `[%%ginherits]`
   - Define methods with `let%gfunc` or `let%goverride`
   - Register the class in the extension initialization

2. **Updating API Bindings**
   - Modify `gen_api.ml` if needed
   - Run the generator to update bindings from `extension_api.json`
   - Rebuild the project

3. **Testing Integration**
   - Build the extension: `dune build apis/my_ocaml_extension.so`
   - Open Godot project in the root directory
   - The extension loads automatically via `hello.gdextension`
   - Check Godot console for any loading errors

## Important Files

- `apis/uses_ppx_godot.ml` - Example PPX usage and Player class implementation
- `apis/godotcaml.ml` - Core type definitions and utilities
- `apis/gsignal.ml` - Signal handling implementation
- `hello.gdextension` - Points to `_build/default/apis/my_ocaml_extension.so`

## Error Handling

The project defines custom exceptions for API calls:
- `Invalid_method`, `Invalid_argument`, `Instance_is_null`, `Method_not_const`
- Use `is_error` and `to_exn` for CallError checking
- Error handling is integrated into the Living monad

## Memory Management Details

1. **Object Reference Tracking**
   - `_ocaml_referenced_objects` hash set prevents premature GC
   - Use `gc_alloc` for GC-tracked allocations
   - Static allocations via `static_alloc` for global objects

2. **Living Monad Best Practices**
   - Always use `unsafe_free` for computations that allocate
   - Named returns help track allocations during debugging
   - The Living library (in `/home/fizzixnerd/src/living`) provides safety against use-after-free bugs
   - All pointer operations must be lifted into the Living monad using `Living_ctypes`
   - Common safe operations: `!@` (dereference), `<-@` (assign), `+@` (pointer arithmetic)

3. **Safe FFI Pattern**
   ```ocaml
   let safe_operation ptr =
     let* temp = gc_alloc ~count:1 some_type in
     let* () = temp <-@ some_value in
     let* result = process temp in
     LCore.unsafe_free (LCore.map extract_ocaml_value result)
   ```

## Debugging

1. **Debug Output**
   - Extension initialization prints to console
   - Look for "Initializing extension from OCaml!" message
   - OCaml backtraces are enabled by default

2. **PPX Debugging**
   - Inspect generated code in `_build/default/apis/*.pp.ml`
   - Check `.ppx.ml` files for preprocessed output

3. **Common Issues**
   - If extension fails to load, check C stub output
   - Verify shared library path in `hello.gdextension`
   - Check Godot console for loading errors

## Known Issues

### Crash with get_node in Player._ready

There is a segmentation fault when using `get_node` in the `Player._ready` method. The crash occurs specifically when calling:
```ocaml
let* self_path = BuiltinClass.NodePath.of_string "." in
let* self_node = self |> get_node self_path in
```

This appears to be related to the get_node implementation or how NodePath is handled. The workaround is to avoid using get_node in _ready methods until this is fixed.

## Working Patterns

### Implementing _process method
The `_process` method works correctly with player movement. Here's the working pattern:

```ocaml
let%goverride_void _process =
  [| ClassMethodFlags.virtual_ |]
    (module BuiltinClass.Float)
    (module Class.Node)
    (module ApiTypes.Void)
    (fun delta self ->
      LCore.unsafe_free @@
      let open Living_core.Default.Let_syntax in
      (* Get input singleton *)
      let* input_name = string_name_of_string "Input" in
      let input = godot_get_singleton input_name Class.Input.typ in
      
      (* Process input and update position *)
      let* position = self |> get_position in
      let* delta_val = delta in  (* Extract delta from Living monad *)
      let new_position = (* calculate new position *) in
      let* () = self |> set_position new_position in
      LCore.return ())
```

### Float Comparisons with Base
When using Base, use `Base.Float.(x > y)` for float comparisons:
```ocaml
if Base.Float.(vel_norm > 0.0) then
  (* normalize velocity *)
```

## Known TODOs

- Fix crash with get_node method
- Optimize O(n²) complexity in array handling (`foreign_arrayv`)
- Implement hash table memoization for `get_fun`
- Complete foreign builtin method generation
- Add proper CallError enum handling
- Implement test framework

## Compilation Flags

All libraries compile with: `(:standard -g -w -32)`
- `-g`: Debug symbols enabled
- `-w -32`: Disables unused value warnings

## Current Status

This is a work-in-progress project. Key areas under development:
- Complete API coverage for Godot 4.3+
- Memory management refinements
- Signal connection improvements
- Performance optimizations (particularly array handling)
- Documentation and examples