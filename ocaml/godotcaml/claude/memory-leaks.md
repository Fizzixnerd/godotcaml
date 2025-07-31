# Memory Leaks Found in GodotCaml

Based on my analysis, here are the critical memory leaks:

## 1. **String Conversion Memory Leak** (apis/conv.ml:102-113)
The `String.to_ocaml` function allocates a character buffer that's never freed:
```ocaml
let* char_buf = gc_alloc ~count:(len + 1) char in
let _ = string_to_utf8_chars const_str char_buf len64 in
LCore.named_return "String.to_ocaml" (string_from_ptr ~length:len char_buf)
```
The `char_buf` is allocated but never deallocated after `string_from_ptr` copies it.

## 2. **Broken Object Reference Counting** (apis/conv.ml:867-868)
The reference counting system is completely non-functional:
```ocaml
let reference _x = LCore.return false
let unreference _x = LCore.return true
```
These functions are stubbed out, meaning Godot RefCounted objects are never properly reference counted when held by OCaml.

## 3. **Missing StringName Destructors** (apis/foreign_base.ml:183)
There's a comment indicating awareness but no implementation:
```ocaml
(* call destructor for string_name here. *)
```
StringName objects are allocated but never have their destructors called.

## 4. **Type Conversion Allocations Without Cleanup**
All `of_ocaml` functions in conv.ml allocate memory without cleanup:
- `StringName.of_string`
- `NodePath.of_string`
- All primitive type conversions (Bool, Int, Float, etc.)

## 5. **Living Monad Misuse**
Many places use `LCore.unsafe_free` immediately after allocation, which defeats the purpose of the Living monad and can lead to use-after-free bugs.

## 6. **No Finalizers in gc_alloc**
The `gc_alloc` function rarely uses finalizers, meaning Godot objects aren't properly cleaned up when OCaml GC collects them.

## Severity

**The most critical leak is the string conversion buffer leak**, as strings are likely converted frequently. The broken reference counting could also cause significant memory leaks for any RefCounted Godot objects (like Resources).

## Recommendations

1. Fix the string buffer leak by properly freeing the allocated buffer after copying
2. Implement proper reference counting for Godot objects
3. Add finalizers to gc_alloc calls for Godot objects
4. Implement destructors for StringName and other allocated types
5. Review all uses of LCore.unsafe_free to ensure they're safe
6. Consider using a more systematic approach to memory management, possibly with RAII-style patterns