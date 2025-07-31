# DEV.md - GodotCaml Player2 Visibility Investigation

Created: 2025-01-25 02:43 UTC
Last Modified: 2025-01-25 04:00 UTC

## Executive Summary

Player2 becomes invisible when specific combinations of virtual methods and operations are present. The issue is specifically triggered when modifying certain properties or performing complex operations in `_process`.

## Investigation Findings

### What Works ✅

1. **MinimalPlayer** - No overrides at all
2. **MinimalPlayer2** - Has empty `_ready` method
3. **Player2EmptyReady** - Has empty `_ready` method 
4. **Player2EmptyProcess** - Has empty `_process` method
5. **Player2ProcessPrint** - `_process` that only reads scale (shows scale is 0.00, 1.88)
6. **Player2SimpleMove** - `_process` with simple position updates
7. **Player2InputOnly** - `_process` with input handling but no position updates
8. **Player2ModulateReady** - `_ready` that modifies modulate (not scale)

### What Doesn't Work ❌

1. **Player2** - Full implementation with scale fix in `_ready` + complex `_process`
2. **Player2NoProcess** - Scale fix in `_ready`, no `_process`
3. **Player2Fixed** - No scale fix, but has full input + movement logic
4. **Player2NoReady** - Has full `_process` logic, no `_ready`
5. **Player2DelayedScale** - Tries to fix scale in first frame of `_process`
6. **Player2SimpleInputMove** - Input + position updates (vanishes when S pressed!)

### Key Discovery

The sprite vanishes **immediately** when certain operations are performed, particularly when pressing the S key in Player2SimpleInputMove. This suggests a specific operation is causing the issue, not just the presence of methods.

### Scale Issue

All AnimatedSprite2D instances show scale of (0.00, 1.88) instead of expected (1.0, 1.0). This is consistent across all tests but doesn't always cause invisibility.

### Pattern Analysis

The issue appears to be triggered by:
1. Complex operations in `_process` involving multiple Living monad operations
2. Possibly specific operations with position updates or input handling
3. The combination of reading input AND updating position

### Memory Leaks

Extensive Living_core.t memory leaks are present - values are not being freed with `LCore.unsafe_free`. This is consistent across all implementations but doesn't directly correlate with visibility.

## Key Position Discovery

**Scene-specified positions are NOT applied before _ready!** All AnimatedSprite2D instances start at (0.00, 4.06) regardless of the position set in the scene file. The position remains at (0.00, 4.06) for at least 5 frames after _ready.

### Visibility Rules

1. ✅ Sprite IS visible when:
   - No position/scale modifications in `_ready`
   - Simple `_process` logic without complex operations
   
2. ❌ Sprite becomes INVISIBLE when:
   - Modifying scale in `_ready` 
   - Modifying position in `_ready`
   - Complex `_process` with multiple Living monad operations

## Next Steps

1. **Handle initial (0, 4.06) position** - Check and correct position in first frame of _process
2. **Simplify the Living monad usage** - Reduce the number of nested operations
3. **Fix memory leaks** - Properly free all Living_core.t values
4. **Investigate why scene positions aren't applied** - This may be a GodotCaml initialization issue

## Working Player Implementation

Based on findings, a working player should:
- **NEVER modify position or scale in `_ready`**
- Keep `_process` logic simple
- Handle the initial (0, 4.06) position gracefully
- Consider using modulate instead of scale for visual effects
- Check and correct position in first frame if needed

### Confirmed Working Pattern

```ocaml
let%goverride_void _ready =
  [| ClassMethodFlags.virtual_ |]
    (module Class.Node)
    (module ApiTypes.Void)
    (fun self ->
      (* DO NOT modify position or scale here! *)
      LCore.return ())
      
let%goverride_void _process = 
  (* Simple movement logic without position correction in _ready *)
```

## Final Summary

After extensive testing, we discovered:

1. **Scene positions are ignored** - All sprites start at (0.00, 4.06) regardless of scene settings
2. **Modifying position/scale in _ready causes invisibility**
3. **Correcting position in first frame of _process also causes invisibility**
4. **Clamping logic in _process causes invisibility** - Using Base.Float.max/min for clamping makes sprites invisible
5. **Working solution**: Simple movement without clamping or property modifications

The "skipping around" behavior is due to the sprite starting at an unexpected position. This appears to be a GodotCaml initialization issue where scene properties aren't applied before the OCaml code runs.

### Critical Discovery - SOLVED!

**The invisibility issue was caused by using the double-precision Godot build!**

The problem wasn't actually with the clamping logic or property modifications. We were using:
- ❌ `/home/fizzixnerd/src/godot/bin/godot.linuxbsd.editor.dev.double.x86_64` (double precision)
- ✅ `/home/fizzixnerd/src/godot/bin/godot.linuxbsd.editor.dev.x86_64` (single precision)

GodotCaml appears to expect single-precision floats, and the mismatch between double-precision Godot and single-precision OCaml floats was causing sprites to become invisible when certain float operations were performed (like `Base.Float.max/min`).

**Solution**: Always use the single-precision (non-double) Godot build with GodotCaml.