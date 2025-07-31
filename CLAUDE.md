# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

GodotCaml is an OCaml binding for the Godot game engine (version 4.3+) that allows developers to write Godot extensions in OCaml. It provides type-safe bindings to Godot's API through a PPX preprocessor and uses the Living monad for memory-safe foreign pointer management.

## Godot Executable to Use

`/home/fizzixnerd/src/godot/bin/godot.linuxbsd.editor.dev.x86_64`

## Build Commands

```bash
# Install dependencies
opam install . --deps-only

# Build the Godot extension shared library (primary build target)
dune build ocaml/godotcaml/apis/my_ocaml_extension.so

# Build entire project
dune build

# Format code
dune fmt

# Run tests
dune build @runtest

# Build documentation
dune build @doc
```

## Architecture

### Project Structure
- **Root**: Godot project files (`project.godot`, `hello.gdextension`, test scenes)
- **ocaml/godotcaml/**: OCaml source code
  - **apis/**: Core API bindings and extension implementation
  - **base/**: Base types and FFI infrastructure
  - **ppx_godot/**: PPX preprocessor for Godot syntax extensions
  - **test/**: Test files

### Key Components

1. **Living Monad** (from `/home/fizzixnerd/src/living`)
   - ALL Godot API calls must use the Living monad for memory safety
   - Prevents use-after-free bugs by tracking pointer dependencies
   - Use `let*` or `let%bind` for sequential operations
   - Use `LCore.return` to wrap pure values
   - Use `LCore.unsafe_free` only after extracting OCaml values

2. **PPX Syntax Extensions**
   - `module%gclass` - Define Godot classes
   - `let%gfunc` - Define Godot methods
   - `let%goverride` - Override virtual methods
   - `let%gsignal` - Define signals
   - `[%%ginherits]` - Specify inheritance

3. **Type Conversions** (in `conv.ml`)
   - OCaml to Godot strings: `string_of_string`, `string_name_of_string`
   - Pointer coercion: `coerce_ptr` for converting between Godot object types

### Entry Points
- **Extension**: `ocaml/godotcaml/apis/my_ocaml_extension.ml`
- **C Bridge**: `hello-gdextension.c`
- **Config**: `hello.gdextension` (points to `_build/default/ocaml/godotcaml/apis/my_ocaml_extension.so`)

## Development Patterns

### Creating a Godot Class
```ocaml
module%gclass MyNode = struct
  [%%ginherits Node2D]
  include Class.Node2D
  
  let%gfunc_void my_method =
    [||] (module ApiTypes.Void) (fun self ->
      LCore.return ())
end
```

### Implementing _process Method
```ocaml
let%goverride_void _process =
  [| ClassMethodFlags.virtual_ |]
    (module BuiltinClass.Float)
    (module Class.Node)
    (module ApiTypes.Void)
    (fun delta self ->
      LCore.unsafe_free @@
      let open Living_core.Default.Let_syntax in
      (* Implementation using Living monad *)
      LCore.return ())
```

### Safe Memory Pattern
```ocaml
let safe_operation ptr =
  let* temp = gc_alloc ~count:1 some_type in
  let* () = temp <-@ some_value in
  let* result = process temp in
  LCore.unsafe_free (LCore.map extract_ocaml_value result)
```

## Known Issues

1. **CRITICAL: get_node crashes in _ready methods**
   - Causes segmentation fault
   - Workaround: Avoid using get_node in _ready methods

2. **Performance: O(n²) complexity in array handling**
   - Located in `foreign_arrayv`
   - Needs optimization for large arrays

3. **Base.Float comparisons**
   - Use `Base.Float.(x > y)` syntax when Base is imported

## Debugging

1. Check Godot console for "Initializing extension from OCaml!" message
2. OCaml backtraces enabled by default
3. Inspect PPX output in `_build/default/ocaml/godotcaml/apis/*.pp.ml`
4. Check C stub output for loading errors

## Important Files

- `ocaml/godotcaml/apis/uses_ppx_godot.ml` - Example PPX usage
- `ocaml/godotcaml/apis/godotcaml.ml` - Core type definitions
- `ocaml/godotcaml/apis/conv.ml` - Type conversions
- `ocaml/godotcaml/apis/gsignal.ml` - Signal handling
- `ocaml/godotcaml/apis/gen_api.ml` - API code generator

## Testing Workflow

1. Build extension: `dune build ocaml/godotcaml/apis/my_ocaml_extension.so`
2. Open Godot project in root directory
3. Extension loads automatically via `hello.gdextension`
4. Test with provided scene files (e.g., `minimal_test.tscn`, `player_test.tscn`)