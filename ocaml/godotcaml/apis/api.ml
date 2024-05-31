open! Base
open Foreign_api
open Foreign_api.Godotcaml
open Ctypes
open Api_types

let funptr = Foreign.funptr
module BuiltinClass(M : FOREIGN_API) = struct
  module Nil = struct







    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_NIL None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.Nil.typ @-> M.Nil.typ @-> M.Bool.typ @-> returning void))






































































































































    let _Nil_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_NIL (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Nil.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))






    let _Nil_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_NIL (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Nil.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))




































    end

  module Bool = struct











    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_BOOL None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.Bool.typ @-> M.Bool.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the two booleans are equal. That is, both are [code]true[/code] or both are [code]false[/code]. This operation can be seen as a logical EQ or XNOR. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_BOOL (Some GlobalEnum.VariantType._TYPE_BOOL) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.Bool.typ @-> M.Bool.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the two booleans are not equal. That is, one is [code]true[/code] and the other is [code]false[/code]. This operation can be seen as a logical XOR. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_BOOL (Some GlobalEnum.VariantType._TYPE_BOOL) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.Bool.typ @-> M.Bool.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the left operand is [code]false[/code] and the right operand is [code]true[/code]. *)
    let (<) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_BOOL (Some GlobalEnum.VariantType._TYPE_BOOL) Godotcaml.GlobalEnum.VariantOperator._OP_LESS
      (funptr (M.Bool.typ @-> M.Bool.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the left operand is [code]true[/code] and the right operand is [code]false[/code]. *)
    let (>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_BOOL (Some GlobalEnum.VariantType._TYPE_BOOL) Godotcaml.GlobalEnum.VariantOperator._OP_GREATER
      (funptr (M.Bool.typ @-> M.Bool.typ @-> M.Bool.typ @-> returning void))


    let (&&) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_BOOL (Some GlobalEnum.VariantType._TYPE_BOOL) Godotcaml.GlobalEnum.VariantOperator._OP_AND
      (funptr (M.Bool.typ @-> M.Bool.typ @-> M.Bool.typ @-> returning void))


    let (||) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_BOOL (Some GlobalEnum.VariantType._TYPE_BOOL) Godotcaml.GlobalEnum.VariantOperator._OP_OR
      (funptr (M.Bool.typ @-> M.Bool.typ @-> M.Bool.typ @-> returning void))


    let (~^^) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_BOOL (Some GlobalEnum.VariantType._TYPE_BOOL) Godotcaml.GlobalEnum.VariantOperator._OP_XOR
      (funptr (M.Bool.typ @-> M.Bool.typ @-> M.Bool.typ @-> returning void))




















    let bool_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_BOOL (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Bool.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let bool_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_BOOL (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Bool.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))
    end

  module Int = struct




    (** Returns the negated value of the [int]. If positive, turns the number negative. If negative, turns the number positive. If zero, does nothing. *)
    let (~-) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT None  Godotcaml.GlobalEnum.VariantOperator._OP_NEGATE
      (funptr (M.Int.typ @-> M.Int.typ @-> M.Int.typ @-> returning void))

    (** Returns the same value as if the [code]+[/code] was not there. Unary [code]+[/code] does nothing, but sometimes it can make your code more readable. *)
    let (~+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT None  Godotcaml.GlobalEnum.VariantOperator._OP_POSITIVE
      (funptr (M.Int.typ @-> M.Int.typ @-> M.Int.typ @-> returning void))

    (** Performs the bitwise [code]NOT[/code] operation on the [int]. Due to [url=https://en.wikipedia.org/wiki/Two%27s_complement]2's complement[/url], it's effectively equal to [code]-(int + 1)[/code].
[codeblock]
print(~4) # Prints -5
print(~(-7)) # Prints 6
[/codeblock] *)
    let (~~~) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT None  Godotcaml.GlobalEnum.VariantOperator._OP_BIT_NEGATE
      (funptr (M.Int.typ @-> M.Int.typ @-> M.Int.typ @-> returning void))








    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.Int.typ @-> M.Int.typ @-> M.Bool.typ @-> returning void))







    (** Returns [code]true[/code] if the two [int]s are equal. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_INT) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.Int.typ @-> M.Int.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the [int]s are not equal. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_INT) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.Int.typ @-> M.Int.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the left [int] is less than the right [int]. *)
    let (<) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_INT) Godotcaml.GlobalEnum.VariantOperator._OP_LESS
      (funptr (M.Int.typ @-> M.Int.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the left [int] is less than or equal to the right [int]. *)
    let (<=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_INT) Godotcaml.GlobalEnum.VariantOperator._OP_LESS_EQUAL
      (funptr (M.Int.typ @-> M.Int.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the left [int] is greater than the right [int]. *)
    let (>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_INT) Godotcaml.GlobalEnum.VariantOperator._OP_GREATER
      (funptr (M.Int.typ @-> M.Int.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the left [int] is greater than or equal to the right [int]. *)
    let (>=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_INT) Godotcaml.GlobalEnum.VariantOperator._OP_GREATER_EQUAL
      (funptr (M.Int.typ @-> M.Int.typ @-> M.Bool.typ @-> returning void))

    (** Adds the two [int]s. *)
    let (+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_INT) Godotcaml.GlobalEnum.VariantOperator._OP_ADD
      (funptr (M.Int.typ @-> M.Int.typ @-> M.Int.typ @-> returning void))

    (** Subtracts the two [int]s. *)
    let (-) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_INT) Godotcaml.GlobalEnum.VariantOperator._OP_SUBTRACT
      (funptr (M.Int.typ @-> M.Int.typ @-> M.Int.typ @-> returning void))

    (** Multiplies the two [int]s. *)
    let ( * ) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_INT) Godotcaml.GlobalEnum.VariantOperator._OP_MULTIPLY
      (funptr (M.Int.typ @-> M.Int.typ @-> M.Int.typ @-> returning void))

    (** Divides the two [int]s. The result is an [int]. This will truncate the [float], discarding anything after the floating point.
[codeblock]
print(6 / 2) # Prints 3
print(5 / 3) # Prints 1
[/codeblock] *)
    let (/) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_INT) Godotcaml.GlobalEnum.VariantOperator._OP_DIVIDE
      (funptr (M.Int.typ @-> M.Int.typ @-> M.Int.typ @-> returning void))

    (** Returns the remainder after dividing two [int]s. Uses truncated division, which returns a negative number if the dividend is negative. If this is not desired, consider using [method @GlobalScope.posmod].
[codeblock]
print(6 % 2) # Prints 0
print(11 % 4) # Prints 3
print(-5 % 3) # Prints -2
[/codeblock] *)
    let (%) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_INT) Godotcaml.GlobalEnum.VariantOperator._OP_MODULE
      (funptr (M.Int.typ @-> M.Int.typ @-> M.Int.typ @-> returning void))

    (** Raises the left [int] to a power of the right [int].
[codeblock]
print(3  *  *  4) # Prints 81
[/codeblock] *)
    let ( ** ) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_INT) Godotcaml.GlobalEnum.VariantOperator._OP_POWER
      (funptr (M.Int.typ @-> M.Int.typ @-> M.Int.typ @-> returning void))

    (** Performs the bitwise shift left operation. Effectively the same as multiplying by a power of 2.
[codeblock]
print(0b1010 << 1) # Prints 20 (binary 10100)
print(0b1010 << 3) # Prints 80 (binary 1010000)
[/codeblock] *)
    let (<<<) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_INT) Godotcaml.GlobalEnum.VariantOperator._OP_SHIFT_LEFT
      (funptr (M.Int.typ @-> M.Int.typ @-> M.Int.typ @-> returning void))

    (** Performs the bitwise shift right operation. Effectively the same as dividing by a power of 2.
[codeblock]
print(0b1010 >> 1) # Prints 5 (binary 101)
print(0b1010 >> 2) # Prints 2 (binary 10)
[/codeblock] *)
    let (>>>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_INT) Godotcaml.GlobalEnum.VariantOperator._OP_SHIFT_RIGHT
      (funptr (M.Int.typ @-> M.Int.typ @-> M.Int.typ @-> returning void))

    (** Performs the bitwise [code]AND[/code] operation.
[codeblock]
print(0b1100 & 0b1010) # Prints 8 (binary 1000)
[/codeblock]
This is useful for retrieving binary flags from a variable.
[codeblock]
var flags = 0b101
# Check if the first or second bit are enabled.
if flags & 0b011:
    do_stuff() # This line will run.
[/codeblock] *)
    let (&&&) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_INT) Godotcaml.GlobalEnum.VariantOperator._OP_BIT_AND
      (funptr (M.Int.typ @-> M.Int.typ @-> M.Int.typ @-> returning void))

    (** Performs the bitwise [code]OR[/code] operation.
[codeblock]
print(0b1100 | 0b1010) # Prints 14 (binary 1110)
[/codeblock]
This is useful for storing binary flags in a variable.
[codeblock]
var flags = 0
flags |= 0b101 # Turn the first and third bits on.
[/codeblock] *)
    let (|||) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_INT) Godotcaml.GlobalEnum.VariantOperator._OP_BIT_OR
      (funptr (M.Int.typ @-> M.Int.typ @-> M.Int.typ @-> returning void))

    (** Performs the bitwise [code]XOR[/code] operation.
[codeblock]
print(0b1100 ^ 0b1010) # Prints 6 (binary 110)
[/codeblock] *)
    let (^^^) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_INT) Godotcaml.GlobalEnum.VariantOperator._OP_BIT_XOR
      (funptr (M.Int.typ @-> M.Int.typ @-> M.Int.typ @-> returning void))


    let (&&) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_INT) Godotcaml.GlobalEnum.VariantOperator._OP_AND
      (funptr (M.Int.typ @-> M.Int.typ @-> M.Bool.typ @-> returning void))


    let (||) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_INT) Godotcaml.GlobalEnum.VariantOperator._OP_OR
      (funptr (M.Int.typ @-> M.Int.typ @-> M.Bool.typ @-> returning void))


    let (~^^) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_INT) Godotcaml.GlobalEnum.VariantOperator._OP_XOR
      (funptr (M.Int.typ @-> M.Int.typ @-> M.Bool.typ @-> returning void))




















































    let int_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Int.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let int_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Int.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))


    let int_elem_PackedByteArray =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_PACKED_BYTE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Int.typ @-> M.PackedByteArray.typ @-> M.Bool.typ @-> returning void))


    let int_elem_PackedInt32Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_PACKED_INT32_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Int.typ @-> M.PackedInt32Array.typ @-> M.Bool.typ @-> returning void))


    let int_elem_PackedInt64Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_PACKED_INT64_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Int.typ @-> M.PackedInt64Array.typ @-> M.Bool.typ @-> returning void))


    let int_elem_PackedFloat32Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_PACKED_FLOAT32_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Int.typ @-> M.PackedFloat32Array.typ @-> M.Bool.typ @-> returning void))


    let int_elem_PackedFloat64Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_INT (Some GlobalEnum.VariantType._TYPE_PACKED_FLOAT64_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Int.typ @-> M.PackedFloat64Array.typ @-> M.Bool.typ @-> returning void))
    end

  module Float = struct




    (** Returns the negative value of the [float]. If positive, turns the number negative. If negative, turns the number positive. With floats, the number zero can be either positive or negative. *)
    let (~-) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_FLOAT None  Godotcaml.GlobalEnum.VariantOperator._OP_NEGATE
      (funptr (M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> returning void))

    (** Returns the same value as if the [code]+[/code] was not there. Unary [code]+[/code] does nothing, but sometimes it can make your code more readable. *)
    let (~+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_FLOAT None  Godotcaml.GlobalEnum.VariantOperator._OP_POSITIVE
      (funptr (M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> returning void))








    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_FLOAT None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.Float.typ @-> M.Float.typ @-> M.Bool.typ @-> returning void))



































    (** Returns [code]true[/code] if both floats are exactly equal.
[b]Note:[/b] Due to floating-point precision errors, consider using [method @GlobalScope.is_equal_approx] or [method @GlobalScope.is_zero_approx] instead, which are more reliable.
[b]Note:[/b] [constant @GDScript.NAN] doesn't behave the same as other numbers. Therefore, the results from this operator may not be accurate if NaNs are included. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_FLOAT (Some GlobalEnum.VariantType._TYPE_FLOAT) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.Float.typ @-> M.Float.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if two floats are different from each other.
[b]Note:[/b] [constant @GDScript.NAN] doesn't behave the same as other numbers. Therefore, the results from this operator may not be accurate if NaNs are included. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_FLOAT (Some GlobalEnum.VariantType._TYPE_FLOAT) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.Float.typ @-> M.Float.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the left float is less than the right one.
[b]Note:[/b] [constant @GDScript.NAN] doesn't behave the same as other numbers. Therefore, the results from this operator may not be accurate if NaNs are included. *)
    let (<) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_FLOAT (Some GlobalEnum.VariantType._TYPE_FLOAT) Godotcaml.GlobalEnum.VariantOperator._OP_LESS
      (funptr (M.Float.typ @-> M.Float.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the left float is less than or equal to the right one.
[b]Note:[/b] [constant @GDScript.NAN] doesn't behave the same as other numbers. Therefore, the results from this operator may not be accurate if NaNs are included. *)
    let (<=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_FLOAT (Some GlobalEnum.VariantType._TYPE_FLOAT) Godotcaml.GlobalEnum.VariantOperator._OP_LESS_EQUAL
      (funptr (M.Float.typ @-> M.Float.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the left float is greater than the right one.
[b]Note:[/b] [constant @GDScript.NAN] doesn't behave the same as other numbers. Therefore, the results from this operator may not be accurate if NaNs are included. *)
    let (>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_FLOAT (Some GlobalEnum.VariantType._TYPE_FLOAT) Godotcaml.GlobalEnum.VariantOperator._OP_GREATER
      (funptr (M.Float.typ @-> M.Float.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the left float is greater than or equal to the right one.
[b]Note:[/b] [constant @GDScript.NAN] doesn't behave the same as other numbers. Therefore, the results from this operator may not be accurate if NaNs are included. *)
    let (>=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_FLOAT (Some GlobalEnum.VariantType._TYPE_FLOAT) Godotcaml.GlobalEnum.VariantOperator._OP_GREATER_EQUAL
      (funptr (M.Float.typ @-> M.Float.typ @-> M.Bool.typ @-> returning void))

    (** Adds two floats. *)
    let (+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_FLOAT (Some GlobalEnum.VariantType._TYPE_FLOAT) Godotcaml.GlobalEnum.VariantOperator._OP_ADD
      (funptr (M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> returning void))

    (** Subtracts a float from a float. *)
    let (-) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_FLOAT (Some GlobalEnum.VariantType._TYPE_FLOAT) Godotcaml.GlobalEnum.VariantOperator._OP_SUBTRACT
      (funptr (M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> returning void))

    (** Multiplies two [float]s. *)
    let ( * ) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_FLOAT (Some GlobalEnum.VariantType._TYPE_FLOAT) Godotcaml.GlobalEnum.VariantOperator._OP_MULTIPLY
      (funptr (M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> returning void))

    (** Divides two floats. *)
    let (/) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_FLOAT (Some GlobalEnum.VariantType._TYPE_FLOAT) Godotcaml.GlobalEnum.VariantOperator._OP_DIVIDE
      (funptr (M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> returning void))

    (** Raises a [float] to a power of a [float].
[codeblock]
print(39.0625 *  * 0.25) # 2.5
[/codeblock] *)
    let ( ** ) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_FLOAT (Some GlobalEnum.VariantType._TYPE_FLOAT) Godotcaml.GlobalEnum.VariantOperator._OP_POWER
      (funptr (M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> returning void))


    let (&&) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_FLOAT (Some GlobalEnum.VariantType._TYPE_FLOAT) Godotcaml.GlobalEnum.VariantOperator._OP_AND
      (funptr (M.Float.typ @-> M.Float.typ @-> M.Bool.typ @-> returning void))


    let (||) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_FLOAT (Some GlobalEnum.VariantType._TYPE_FLOAT) Godotcaml.GlobalEnum.VariantOperator._OP_OR
      (funptr (M.Float.typ @-> M.Float.typ @-> M.Bool.typ @-> returning void))


    let (~^^) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_FLOAT (Some GlobalEnum.VariantType._TYPE_FLOAT) Godotcaml.GlobalEnum.VariantOperator._OP_XOR
      (funptr (M.Float.typ @-> M.Float.typ @-> M.Bool.typ @-> returning void))
























    let float_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_FLOAT (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Float.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let float_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_FLOAT (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Float.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))


    let float_elem_PackedByteArray =
    M.foreign_operator GlobalEnum.VariantType._TYPE_FLOAT (Some GlobalEnum.VariantType._TYPE_PACKED_BYTE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Float.typ @-> M.PackedByteArray.typ @-> M.Bool.typ @-> returning void))


    let float_elem_PackedInt32Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_FLOAT (Some GlobalEnum.VariantType._TYPE_PACKED_INT32_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Float.typ @-> M.PackedInt32Array.typ @-> M.Bool.typ @-> returning void))


    let float_elem_PackedInt64Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_FLOAT (Some GlobalEnum.VariantType._TYPE_PACKED_INT64_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Float.typ @-> M.PackedInt64Array.typ @-> M.Bool.typ @-> returning void))


    let float_elem_PackedFloat32Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_FLOAT (Some GlobalEnum.VariantType._TYPE_PACKED_FLOAT32_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Float.typ @-> M.PackedFloat32Array.typ @-> M.Bool.typ @-> returning void))


    let float_elem_PackedFloat64Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_FLOAT (Some GlobalEnum.VariantType._TYPE_PACKED_FLOAT64_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Float.typ @-> M.PackedFloat64Array.typ @-> M.Bool.typ @-> returning void))
    end

  module String = struct
    (** Performs a case-sensitive comparison to another string. Returns [code]-1[/code] if less than, [code]1[/code] if greater than, or [code]0[/code] if equal. ""Less than"" and ""greater than"" are determined by the [url=https://en.wikipedia.org/wiki/List_of_Unicode_characters]Unicode code points[/url] of each string, which roughly matches the alphabetical order.
With different string lengths, returns [code]1[/code] if this string is longer than the [param to] string, or [code]-1[/code] if shorter. Note that the length of empty strings is [i]always[/i] [code]0[/code].
To get a [bool] result from a string comparison, use the [code]==[/code] operator instead. See also [method nocasecmp_to], [method naturalcasecmp_to], and [method naturalnocasecmp_to]. *)
    let casecmp_to =
    M.foreign_method "String" "casecmp_to" (M.String.typ @-> M.String.typ @-> returning M.Int.typ)

    (** Performs a [b]case-insensitive[/b] comparison to another string. Returns [code]-1[/code] if less than, [code]1[/code] if greater than, or [code]0[/code] if equal. ""Less than"" or ""greater than"" are determined by the [url=https://en.wikipedia.org/wiki/List_of_Unicode_characters]Unicode code points[/url] of each string, which roughly matches the alphabetical order. Internally, lowercase characters are converted to uppercase for the comparison.
With different string lengths, returns [code]1[/code] if this string is longer than the [param to] string, or [code]-1[/code] if shorter. Note that the length of empty strings is [i]always[/i] [code]0[/code].
To get a [bool] result from a string comparison, use the [code]==[/code] operator instead. See also [method casecmp_to], [method naturalcasecmp_to], and [method naturalnocasecmp_to]. *)
    let nocasecmp_to =
    M.foreign_method "String" "nocasecmp_to" (M.String.typ @-> M.String.typ @-> returning M.Int.typ)

    (** Performs a [b]case-sensitive[/b], [i]natural order[/i] comparison to another string. Returns [code]-1[/code] if less than, [code]1[/code] if greater than, or [code]0[/code] if equal. ""Less than"" or ""greater than"" are determined by the [url=https://en.wikipedia.org/wiki/List_of_Unicode_characters]Unicode code points[/url] of each string, which roughly matches the alphabetical order.
When used for sorting, natural order comparison orders sequences of numbers by the combined value of each digit as is often expected, instead of the single digit's value. A sorted sequence of numbered strings will be [code][""1"", ""2"", ""3"", ...][/code], not [code][""1"", ""10"", ""2"", ""3"", ...][/code].
With different string lengths, returns [code]1[/code] if this string is longer than the [param to] string, or [code]-1[/code] if shorter. Note that the length of empty strings is [i]always[/i] [code]0[/code].
To get a [bool] result from a string comparison, use the [code]==[/code] operator instead. See also [method naturalnocasecmp_to], [method nocasecmp_to], and [method casecmp_to]. *)
    let naturalcasecmp_to =
    M.foreign_method "String" "naturalcasecmp_to" (M.String.typ @-> M.String.typ @-> returning M.Int.typ)

    (** Performs a [b]case-insensitive[/b], [i]natural order[/i] comparison to another string. Returns [code]-1[/code] if less than, [code]1[/code] if greater than, or [code]0[/code] if equal. ""Less than"" or ""greater than"" are determined by the [url=https://en.wikipedia.org/wiki/List_of_Unicode_characters]Unicode code points[/url] of each string, which roughly matches the alphabetical order. Internally, lowercase characters are converted to uppercase for the comparison.
When used for sorting, natural order comparison orders sequences of numbers by the combined value of each digit as is often expected, instead of the single digit's value. A sorted sequence of numbered strings will be [code][""1"", ""2"", ""3"", ...][/code], not [code][""1"", ""10"", ""2"", ""3"", ...][/code].
With different string lengths, returns [code]1[/code] if this string is longer than the [param to] string, or [code]-1[/code] if shorter. Note that the length of empty strings is [i]always[/i] [code]0[/code].
To get a [bool] result from a string comparison, use the [code]==[/code] operator instead. See also [method naturalcasecmp_to], [method nocasecmp_to], and [method casecmp_to]. *)
    let naturalnocasecmp_to =
    M.foreign_method "String" "naturalnocasecmp_to" (M.String.typ @-> M.String.typ @-> returning M.Int.typ)

    (** Returns the number of characters in the string. Empty strings ([code]""""[/code]) always return [code]0[/code]. See also [method is_empty]. *)
    let length =
    M.foreign_method "String" "length" (M.String.typ @-> returning M.Int.typ)

    (** Returns part of the string from the position [param from] with length [param len]. If [param len] is [code]-1[/code] (as by default), returns the rest of the string starting from the given position. *)
    let substr =
    M.foreign_method "String" "substr" (M.Int.typ @-> M.Int.typ @-> M.String.typ @-> returning M.String.typ)

    (** Splits the string using a [param delimiter] and returns the substring at index [param slice]. Returns the original string if [param delimiter] does not occur in the string. Returns an empty string if the [param slice] does not exist.
This is faster than [method split], if you only need one substring.
[b]Example:[/b]
[codeblock]
print(""i/am/example/hi"".get_slice(""/"", 2)) # Prints ""example""
[/codeblock] *)
    let get_slice =
    M.foreign_method "String" "get_slice" (M.String.typ @-> M.Int.typ @-> M.String.typ @-> returning M.String.typ)

    (** Splits the string using a Unicode character with code [param delimiter] and returns the substring at index [param slice]. Returns an empty string if the [param slice] does not exist.
This is faster than [method split], if you only need one substring. *)
    let get_slicec =
    M.foreign_method "String" "get_slicec" (M.Int.typ @-> M.Int.typ @-> M.String.typ @-> returning M.String.typ)

    (** Returns the total number of slices when the string is split with the given [param delimiter] (see [method split]). *)
    let get_slice_count =
    M.foreign_method "String" "get_slice_count" (M.String.typ @-> M.String.typ @-> returning M.Int.typ)

    (** Returns the index of the [b]first[/b] occurrence of [param what] in this string, or [code]-1[/code] if there are none. The search's start can be specified with [param from], continuing to the end of the string.
[codeblocks]
[gdscript]
print(""Team"".find(""I"")) # Prints -1

print(""Potato"".find(""t""))    # Prints 2
print(""Potato"".find(""t"", 3)) # Prints 4
print(""Potato"".find(""t"", 5)) # Prints -1
[/gdscript]
[csharp]
GD.Print(""Team"".Find(""I"")); // Prints -1

GD.Print(""Potato"".Find(""t""));    // Prints 2
GD.Print(""Potato"".Find(""t"", 3)); // Prints 4
GD.Print(""Potato"".Find(""t"", 5)); // Prints -1
[/csharp]
[/codeblocks]
[b]Note:[/b] If you just want to know whether the string contains [param what], use [method contains]. In GDScript, you may also use the [code]in[/code] operator. *)
    let find =
    M.foreign_method "String" "find" (M.String.typ @-> M.Int.typ @-> M.String.typ @-> returning M.Int.typ)

    (** Returns the number of occurrences of the substring [param what] between [param from] and [param to] positions. If [param to] is 0, the search continues until the end of the string. *)
    let count =
    M.foreign_method "String" "count" (M.String.typ @-> M.Int.typ @-> M.Int.typ @-> M.String.typ @-> returning M.Int.typ)

    (** Returns the number of occurrences of the substring [param what] between [param from] and [param to] positions, [b]ignoring case[/b]. If [param to] is 0, the search continues until the end of the string. *)
    let countn =
    M.foreign_method "String" "countn" (M.String.typ @-> M.Int.typ @-> M.Int.typ @-> M.String.typ @-> returning M.Int.typ)

    (** Returns the index of the [b]first[/b] [b]case-insensitive[/b] occurrence of [param what] in this string, or [code]-1[/code] if there are none. The starting search index can be specified with [param from], continuing to the end of the string. *)
    let findn =
    M.foreign_method "String" "findn" (M.String.typ @-> M.Int.typ @-> M.String.typ @-> returning M.Int.typ)

    (** Returns the index of the [b]last[/b] occurrence of [param what] in this string, or [code]-1[/code] if there are none. The search's start can be specified with [param from], continuing to the beginning of the string. This method is the reverse of [method find]. *)
    let rfind =
    M.foreign_method "String" "rfind" (M.String.typ @-> M.Int.typ @-> M.String.typ @-> returning M.Int.typ)

    (** Returns the index of the [b]last[/b] [b]case-insensitive[/b] occurrence of [param what] in this string, or [code]-1[/code] if there are none. The starting search index can be specified with [param from], continuing to the beginning of the string. This method is the reverse of [method findn]. *)
    let rfindn =
    M.foreign_method "String" "rfindn" (M.String.typ @-> M.Int.typ @-> M.String.typ @-> returning M.Int.typ)

    (** Does a simple expression match (also called ""glob"" or ""globbing""), where [code] * [/code] matches zero or more arbitrary characters and [code]?[/code] matches any single character except a period ([code].[/code]). An empty string or empty expression always evaluates to [code]false[/code]. *)
    let match_ =
    M.foreign_method "String" "match_" (M.String.typ @-> M.String.typ @-> returning M.Bool.typ)

    (** Does a simple [b]case-insensitive[/b] expression match, where [code] * [/code] matches zero or more arbitrary characters and [code]?[/code] matches any single character except a period ([code].[/code]). An empty string or empty expression always evaluates to [code]false[/code]. *)
    let matchn =
    M.foreign_method "String" "matchn" (M.String.typ @-> M.String.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if the string begins with the given [param text]. See also [method ends_with]. *)
    let begins_with =
    M.foreign_method "String" "begins_with" (M.String.typ @-> M.String.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if the string ends with the given [param text]. See also [method begins_with]. *)
    let ends_with =
    M.foreign_method "String" "ends_with" (M.String.typ @-> M.String.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if all characters of this string can be found in [param text] in their original order.
[codeblock]
var text = ""Wow, incredible!""

print(""inedible"".is_subsequence_of(text)) # Prints true
print(""Word!"".is_subsequence_of(text))    # Prints true
print(""Window"".is_subsequence_of(text))   # Prints false
print("""".is_subsequence_of(text))         # Prints true
[/codeblock] *)
    let is_subsequence_of =
    M.foreign_method "String" "is_subsequence_of" (M.String.typ @-> M.String.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if all characters of this string can be found in [param text] in their original order, [b]ignoring case[/b]. *)
    let is_subsequence_ofn =
    M.foreign_method "String" "is_subsequence_ofn" (M.String.typ @-> M.String.typ @-> returning M.Bool.typ)

    (** Returns an array containing the bigrams (pairs of consecutive characters) of this string.
[codeblock]
print(""Get up!"".bigrams()) # Prints [""Ge"", ""et"", ""t "", "" u"", ""up"", ""p!""]
[/codeblock] *)
    let bigrams =
    M.foreign_method "String" "bigrams" (M.String.typ @-> returning M.PackedStringArray.typ)

    (** Returns the similarity index ([url=https://en.wikipedia.org/wiki/S%C3%B8rensen%E2%80%93Dice_coefficient]Sorensen-Dice coefficient[/url]) of this string compared to another. A result of [code]1.0[/code] means totally similar, while [code]0.0[/code] means totally dissimilar.
[codeblock]
print(""ABC123"".similarity(""ABC123"")) # Prints 1.0
print(""ABC123"".similarity(""XYZ456"")) # Prints 0.0
print(""ABC123"".similarity(""123ABC"")) # Prints 0.8
print(""ABC123"".similarity(""abc123"")) # Prints 0.4
[/codeblock] *)
    let similarity =
    M.foreign_method "String" "similarity" (M.String.typ @-> M.String.typ @-> returning M.Float.typ)

    (** Formats the string by replacing all occurrences of [param placeholder] with the elements of [param values].
[param values] can be a [Dictionary] or an [Array]. Any underscores in [param placeholder] will be replaced with the corresponding keys in advance. Array elements use their index as keys.
[codeblock]
# Prints ""Waiting for Godot is a play by Samuel Beckett, and Godot Engine is named after it.""
var use_array_values = ""Waiting for {0} is a play by {1}, and {0} Engine is named after it.""
print(use_array_values.format([""Godot"", ""Samuel Beckett""]))

# Prints ""User 42 is Godot.""
print(""User {id} is {name}."".format({""id"": 42, ""name"": ""Godot""}))
[/codeblock]
Some additional handling is performed when [param values] is an [Array]. If [param placeholder] does not contain an underscore, the elements of the [param values] array will be used to replace one occurrence of the placeholder in order; If an element of [param values] is another 2-element array, it'll be interpreted as a key-value pair.
[codeblock]
# Prints ""User 42 is Godot.""
print(""User {} is {}."".format([42, ""Godot""], ""{}""))
print(""User {id} is {name}."".format([[""id"", 42], [""name"", ""Godot""]]))
[/codeblock]
See also the [url=$DOCS_URL/tutorials/scripting/gdscript/gdscript_format_string.html]GDScript format string[/url] tutorial.
[b]Note:[/b] The replacement of placeholders is not done all at once, instead each placeholder is replaced in the order they are passed, this means that if one of the replacement strings contains a key it will also be replaced. This can be very powerful, but can also cause unexpected results if you are not careful. If you do not need to perform replacement in the replacement strings, make sure your replacements do not contain placeholders to ensure reliable results.
[codeblock]
print(""{0} {1}"".format([""{1}"", ""x""]))                       # Prints ""x x"".
print(""{0} {1}"".format([""x"", ""{0}""]))                       # Prints ""x {0}"".
print(""{foo} {bar}"".format({""foo"": ""{bar}"", ""bar"": ""baz""})) # Prints ""baz baz"".
print(""{foo} {bar}"".format({""bar"": ""baz"", ""foo"": ""{bar}""})) # Prints ""{bar} baz"".
[/codeblock]
[b]Note:[/b] In C#, it's recommended to [url=https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/tokens/interpolated]interpolate strings with ""$""[/url], instead. *)
    let format =
    M.foreign_method "String" "format" (M.Variant.typ @-> M.String.typ @-> M.String.typ @-> returning M.String.typ)

    (** Replaces all occurrences of [param what] inside the string with the given [param forwhat]. *)
    let replace =
    M.foreign_method "String" "replace" (M.String.typ @-> M.String.typ @-> M.String.typ @-> returning M.String.typ)

    (** Replaces all [b]case-insensitive[/b] occurrences of [param what] inside the string with the given [param forwhat]. *)
    let replacen =
    M.foreign_method "String" "replacen" (M.String.typ @-> M.String.typ @-> M.String.typ @-> returning M.String.typ)

    (** Repeats this string a number of times. [param count] needs to be greater than [code]0[/code]. Otherwise, returns an empty string. *)
    let repeat =
    M.foreign_method "String" "repeat" (M.Int.typ @-> M.String.typ @-> returning M.String.typ)

    (** Returns the copy of this string in reverse order. *)
    let reverse =
    M.foreign_method "String" "reverse" (M.String.typ @-> returning M.String.typ)

    (** Inserts [param what] at the given [param position] in the string. *)
    let insert =
    M.foreign_method "String" "insert" (M.Int.typ @-> M.String.typ @-> M.String.typ @-> returning M.String.typ)

    (** Returns a string with [param chars] characters erased starting from [param position]. If [param chars] goes beyond the string's length given the specified [param position], fewer characters will be erased from the returned string. Returns an empty string if either [param position] or [param chars] is negative. Returns the original string unmodified if [param chars] is [code]0[/code]. *)
    let erase =
    M.foreign_method "String" "erase" (M.Int.typ @-> M.Int.typ @-> M.String.typ @-> returning M.String.typ)

    (** Changes the appearance of the string: replaces underscores ([code]_[/code]) with spaces, adds spaces before uppercase letters in the middle of a word, converts all letters to lowercase, then converts the first one and each one following a space to uppercase.
[codeblocks]
[gdscript]
""move_local_x"".capitalize()   # Returns ""Move Local X""
""sceneFile_path"".capitalize() # Returns ""Scene File Path""
""2D, FPS, PNG"".capitalize()   # Returns ""2d, Fps, Png""
[/gdscript]
[csharp]
""move_local_x"".Capitalize();   // Returns ""Move Local X""
""sceneFile_path"".Capitalize(); // Returns ""Scene File Path""
""2D, FPS, PNG"".Capitalize();   // Returns ""2d, Fps, Png""
[/csharp]
[/codeblocks] *)
    let capitalize =
    M.foreign_method "String" "capitalize" (M.String.typ @-> returning M.String.typ)

    (** Returns the string converted to [code]camelCase[/code]. *)
    let to_camel_case =
    M.foreign_method "String" "to_camel_case" (M.String.typ @-> returning M.String.typ)

    (** Returns the string converted to [code]PascalCase[/code]. *)
    let to_pascal_case =
    M.foreign_method "String" "to_pascal_case" (M.String.typ @-> returning M.String.typ)

    (** Returns the string converted to [code]snake_case[/code].
[b]Note:[/b] Numbers followed by a [i]single[/i] letter are not separated in the conversion to keep some words (such as ""2D"") together.
[codeblocks]
[gdscript]
""Node2D"".to_snake_case()               # Returns ""node_2d""
""2nd place"".to_snake_case()            # Returns ""2_nd_place""
""Texture3DAssetFolder"".to_snake_case() # Returns ""texture_3d_asset_folder""
[/gdscript]
[csharp]
""Node2D"".ToSnakeCase();               // Returns ""node_2d""
""2nd place"".ToSnakeCase();            // Returns ""2_nd_place""
""Texture3DAssetFolder"".ToSnakeCase(); // Returns ""texture_3d_asset_folder""
[/csharp]
[/codeblocks] *)
    let to_snake_case =
    M.foreign_method "String" "to_snake_case" (M.String.typ @-> returning M.String.typ)

    (** Splits the string using a [param delimiter] and returns an array of the substrings. If [param delimiter] is an empty string, each substring will be a single character. This method is the opposite of [method join].
If [param allow_empty] is [code]false[/code], empty strings between adjacent delimiters are excluded from the array.
If [param maxsplit] is greater than [code]0[/code], the number of splits may not exceed [param maxsplit]. By default, the entire string is split.
[b]Example:[/b]
[codeblocks]
[gdscript]
var some_array = ""One,Two,Three,Four"".split("","", true, 2)

print(some_array.size()) # Prints 3
print(some_array[0])     # Prints ""One""
print(some_array[1])     # Prints ""Two""
print(some_array[2])     # Prints ""Three,Four""
[/gdscript]
[csharp]
// C#'s `Split()` does not support the `maxsplit` parameter.
var someArray = ""One,Two,Three"".Split("","");

GD.Print(someArray[0]); // Prints ""One""
GD.Print(someArray[1]); // Prints ""Two""
GD.Print(someArray[2]); // Prints ""Three""
[/csharp]
[/codeblocks]
[b]Note:[/b] If you only need one substring from the array, consider using [method get_slice] which is faster. If you need to split strings with more complex rules, use the [RegEx] class instead. *)
    let split =
    M.foreign_method "String" "split" (M.String.typ @-> M.Bool.typ @-> M.Int.typ @-> M.String.typ @-> returning M.PackedStringArray.typ)

    (** Splits the string using a [param delimiter] and returns an array of the substrings, starting from the end of the string. The splits in the returned array appear in the same order as the original string. If [param delimiter] is an empty string, each substring will be a single character.
If [param allow_empty] is [code]false[/code], empty strings between adjacent delimiters are excluded from the array.
If [param maxsplit] is greater than [code]0[/code], the number of splits may not exceed [param maxsplit]. By default, the entire string is split, which is mostly identical to [method split].
[b]Example:[/b]
[codeblocks]
[gdscript]
var some_string = ""One,Two,Three,Four""
var some_array = some_string.rsplit("","", true, 1)

print(some_array.size()) # Prints 2
print(some_array[0])     # Prints ""One,Two,Three""
print(some_array[1])     # Prints ""Four""
[/gdscript]
[csharp]
// In C#, there is no String.RSplit() method.
[/csharp]
[/codeblocks] *)
    let rsplit =
    M.foreign_method "String" "rsplit" (M.String.typ @-> M.Bool.typ @-> M.Int.typ @-> M.String.typ @-> returning M.PackedStringArray.typ)

    (** Splits the string into floats by using a [param delimiter] and returns a [PackedFloat64Array].
If [param allow_empty] is [code]false[/code], empty or invalid [float] conversions between adjacent delimiters are excluded.
[codeblock]
var a = ""1,2,4.5"".split_floats("","")         # a is [1.0, 2.0, 4.5]
var c = ""1| ||4.5"".split_floats(""|"")        # c is [1.0, 0.0, 0.0, 4.5]
var b = ""1| ||4.5"".split_floats(""|"", false) # b is [1.0, 4.5]
[/codeblock] *)
    let split_floats =
    M.foreign_method "String" "split_floats" (M.String.typ @-> M.Bool.typ @-> M.String.typ @-> returning M.PackedFloat64Array.typ)

    (** Returns the concatenation of [param parts]' elements, with each element separated by the string calling this method. This method is the opposite of [method split].
[b]Example:[/b]
[codeblocks]
[gdscript]
var fruits = [""Apple"", ""Orange"", ""Pear"", ""Kiwi""]

print("", "".join(fruits))  # Prints ""Apple, Orange, Pear, Kiwi""
print(""---"".join(fruits)) # Prints ""Apple---Orange---Pear---Kiwi""
[/gdscript]
[csharp]
var fruits = new string[] {""Apple"", ""Orange"", ""Pear"", ""Kiwi""};

// In C#, this method is static.
GD.Print(string.Join("", "", fruits));  // Prints ""Apple, Orange, Pear, Kiwi""
GD.Print(string.Join(""---"", fruits)); // Prints ""Apple---Orange---Pear---Kiwi""
[/csharp]
[/codeblocks] *)
    let join =
    M.foreign_method "String" "join" (M.PackedStringArray.typ @-> M.String.typ @-> returning M.String.typ)

    (** Returns the string converted to [code]UPPERCASE[/code]. *)
    let to_upper =
    M.foreign_method "String" "to_upper" (M.String.typ @-> returning M.String.typ)

    (** Returns the string converted to [code]lowercase[/code]. *)
    let to_lower =
    M.foreign_method "String" "to_lower" (M.String.typ @-> returning M.String.typ)

    (** Returns the first [param length] characters from the beginning of the string. If [param length] is negative, strips the last [param length] characters from the string's end.
[codeblock]
print(""Hello World!"".left(3))  # Prints ""Hel""
print(""Hello World!"".left(-4)) # Prints ""Hello Wo""
[/codeblock] *)
    let left =
    M.foreign_method "String" "left" (M.Int.typ @-> M.String.typ @-> returning M.String.typ)

    (** Returns the last [param length] characters from the end of the string. If [param length] is negative, strips the first [param length] characters from the string's beginning.
[codeblock]
print(""Hello World!"".right(3))  # Prints ""ld!""
print(""Hello World!"".right(-4)) # Prints ""o World!""
[/codeblock] *)
    let right =
    M.foreign_method "String" "right" (M.Int.typ @-> M.String.typ @-> returning M.String.typ)

    (** Strips all non-printable characters from the beginning and the end of the string. These include spaces, tabulations ([code]\t[/code]), and newlines ([code]\n[/code] [code]\r[/code]).
If [param left] is [code]false[/code], ignores the string's beginning. Likewise, if [param right] is [code]false[/code], ignores the string's end. *)
    let strip_edges =
    M.foreign_method "String" "strip_edges" (M.Bool.typ @-> M.Bool.typ @-> M.String.typ @-> returning M.String.typ)

    (** Strips all escape characters from the string. These include all non-printable control characters of the first page of the ASCII table (values from 0 to 31), such as tabulation ([code]\t[/code]) and newline ([code]\n[/code], [code]\r[/code]) characters, but [i]not[/i] spaces. *)
    let strip_escapes =
    M.foreign_method "String" "strip_escapes" (M.String.typ @-> returning M.String.typ)

    (** Removes a set of characters defined in [param chars] from the string's beginning. See also [method rstrip].
[b]Note:[/b] [param chars] is not a prefix. Use [method trim_prefix] to remove a single prefix, rather than a set of characters. *)
    let lstrip =
    M.foreign_method "String" "lstrip" (M.String.typ @-> M.String.typ @-> returning M.String.typ)

    (** Removes a set of characters defined in [param chars] from the string's end. See also [method lstrip].
[b]Note:[/b] [param chars] is not a suffix. Use [method trim_suffix] to remove a single suffix, rather than a set of characters. *)
    let rstrip =
    M.foreign_method "String" "rstrip" (M.String.typ @-> M.String.typ @-> returning M.String.typ)

    (** If the string is a valid file name or path, returns the file extension without the leading period ([code].[/code]). Otherwise, returns an empty string.
[codeblock]
var a = ""/path/to/file.txt"".get_extension() # a is ""txt""
var b = ""cool.txt"".get_extension()          # b is ""txt""
var c = ""cool.font.tres"".get_extension()    # c is ""tres""
var d = "".pack1"".get_extension()            # d is ""pack1""

var e = ""file.txt."".get_extension()  # e is """"
var f = ""file.txt.."".get_extension() # f is """"
var g = ""txt"".get_extension()        # g is """"
var h = """".get_extension()           # h is """"
[/codeblock] *)
    let get_extension =
    M.foreign_method "String" "get_extension" (M.String.typ @-> returning M.String.typ)

    (** If the string is a valid file path, returns the full file path, without the extension.
[codeblock]
var base = ""/path/to/file.txt"".get_basename() # base is ""/path/to/file""
[/codeblock] *)
    let get_basename =
    M.foreign_method "String" "get_basename" (M.String.typ @-> returning M.String.typ)

    (** Concatenates [param file] at the end of the string as a subpath, adding [code]/[/code] if necessary.
[b]Example:[/b] [code]""this/is"".path_join(""path"") == ""this/is/path""[/code]. *)
    let path_join =
    M.foreign_method "String" "path_join" (M.String.typ @-> M.String.typ @-> returning M.String.typ)

    (** Returns the character code at position [param at]. *)
    let unicode_at =
    M.foreign_method "String" "unicode_at" (M.Int.typ @-> M.String.typ @-> returning M.Int.typ)

    (** Indents every line of the string with the given [param prefix]. Empty lines are not indented. See also [method dedent] to remove indentation.
For example, the string can be indented with two tabulations using [code]""\t\t""[/code], or four spaces using [code]""    ""[/code]. *)
    let indent =
    M.foreign_method "String" "indent" (M.String.typ @-> M.String.typ @-> returning M.String.typ)

    (** Returns a copy of the string with indentation (leading tabs and spaces) removed. See also [method indent] to add indentation. *)
    let dedent =
    M.foreign_method "String" "dedent" (M.String.typ @-> returning M.String.typ)

    (** Returns the 32-bit hash value representing the string's contents.
[b]Note:[/b] Strings with equal hash values are [i]not[/i] guaranteed to be the same, as a result of hash collisions. On the contrary, strings with different hash values are guaranteed to be different. *)
    let hash =
    M.foreign_method "String" "hash" (M.String.typ @-> returning M.Int.typ)

    (** Returns the [url=https://en.wikipedia.org/wiki/MD5]MD5 hash[/url] of the string as another [String]. *)
    let md5_text =
    M.foreign_method "String" "md5_text" (M.String.typ @-> returning M.String.typ)

    (** Returns the [url=https://en.wikipedia.org/wiki/SHA-1]SHA-1[/url] hash of the string as another [String]. *)
    let sha1_text =
    M.foreign_method "String" "sha1_text" (M.String.typ @-> returning M.String.typ)

    (** Returns the [url=https://en.wikipedia.org/wiki/SHA-2]SHA-256[/url] hash of the string as another [String]. *)
    let sha256_text =
    M.foreign_method "String" "sha256_text" (M.String.typ @-> returning M.String.typ)

    (** Returns the [url=https://en.wikipedia.org/wiki/MD5]MD5 hash[/url] of the string as a [PackedByteArray]. *)
    let md5_buffer =
    M.foreign_method "String" "md5_buffer" (M.String.typ @-> returning M.PackedByteArray.typ)

    (** Returns the [url=https://en.wikipedia.org/wiki/SHA-1]SHA-1[/url] hash of the string as a [PackedByteArray]. *)
    let sha1_buffer =
    M.foreign_method "String" "sha1_buffer" (M.String.typ @-> returning M.PackedByteArray.typ)

    (** Returns the [url=https://en.wikipedia.org/wiki/SHA-2]SHA-256[/url] hash of the string as a [PackedByteArray]. *)
    let sha256_buffer =
    M.foreign_method "String" "sha256_buffer" (M.String.typ @-> returning M.PackedByteArray.typ)

    (** Returns [code]true[/code] if the string's length is [code]0[/code] ([code]""""[/code]). See also [method length]. *)
    let is_empty =
    M.foreign_method "String" "is_empty" (M.String.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if the string contains [param what]. In GDScript, this corresponds to the [code]in[/code] operator.
[codeblocks]
[gdscript]
print(""Node"".contains(""de"")) # Prints true
print(""team"".contains(""I""))  # Prints false
print(""I"" in ""team"")         # Prints false
[/gdscript]
[csharp]
GD.Print(""Node"".Contains(""de"")); // Prints true
GD.Print(""team"".Contains(""I""));  // Prints false
[/csharp]
[/codeblocks]
If you need to know where [param what] is within the string, use [method find]. *)
    let contains =
    M.foreign_method "String" "contains" (M.String.typ @-> M.String.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if the string is a path to a file or directory, and its starting point is explicitly defined. This method is the opposite of [method is_relative_path].
This includes all paths starting with [code]""res://""[/code], [code]""user://""[/code], [code]""C:\""[/code], [code]""/""[/code], etc. *)
    let is_absolute_path =
    M.foreign_method "String" "is_absolute_path" (M.String.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if the string is a path, and its starting point is dependent on context. The path could begin from the current directory, or the current [Node] (if the string is derived from a [NodePath]), and may sometimes be prefixed with [code]""./""[/code]. This method is the opposite of [method is_absolute_path]. *)
    let is_relative_path =
    M.foreign_method "String" "is_relative_path" (M.String.typ @-> returning M.Bool.typ)

    (** If the string is a valid file path, converts the string into a canonical path. This is the shortest possible path, without [code]""./""[/code], and all the unnecessary [code]""..""[/code] and [code]""/""[/code].
[codeblock]
var simple_path = ""./path/to///../file"".simplify_path()
print(simple_path) # Prints ""path/file""
[/codeblock] *)
    let simplify_path =
    M.foreign_method "String" "simplify_path" (M.String.typ @-> returning M.String.typ)

    (** If the string is a valid file path, returns the base directory name.
[codeblock]
var dir_path = ""/path/to/file.txt"".get_base_dir() # dir_path is ""/path/to""
[/codeblock] *)
    let get_base_dir =
    M.foreign_method "String" "get_base_dir" (M.String.typ @-> returning M.String.typ)

    (** If the string is a valid file path, returns the file name, including the extension.
[codeblock]
var file = ""/path/to/icon.png"".get_file() # file is ""icon.png""
[/codeblock] *)
    let get_file =
    M.foreign_method "String" "get_file" (M.String.typ @-> returning M.String.typ)

    (** Returns a copy of the string with special characters escaped using the XML standard. If [param escape_quotes] is [code]true[/code], the single quote ([code]'[/code]) and double quote ([code]""[/code]) characters are also escaped. *)
    let xml_escape =
    M.foreign_method "String" "xml_escape" (M.Bool.typ @-> M.String.typ @-> returning M.String.typ)

    (** Returns a copy of the string with escaped characters replaced by their meanings according to the XML standard. *)
    let xml_unescape =
    M.foreign_method "String" "xml_unescape" (M.String.typ @-> returning M.String.typ)

    (** Encodes the string to URL-friendly format. This method is meant to properly encode the parameters in a URL when sending an HTTP request. See also [method uri_decode].
[codeblocks]
[gdscript]
var prefix = ""$DOCS_URL/?highlight=""
var url = prefix + ""Godot Engine:docs"".uri_encode()

print(url) # Prints ""$DOCS_URL/?highlight=Godot%20Engine%3%docs""
[/gdscript]
[csharp]
var prefix = ""$DOCS_URL/?highlight="";
var url = prefix + ""Godot Engine:docs"".URIEncode();

GD.Print(url); // Prints ""$DOCS_URL/?highlight=Godot%20Engine%3%docs""
[/csharp]
[/codeblocks] *)
    let uri_encode =
    M.foreign_method "String" "uri_encode" (M.String.typ @-> returning M.String.typ)

    (** Decodes the string from its URL-encoded format. This method is meant to properly decode the parameters in a URL when receiving an HTTP request. See also [method uri_encode].
[codeblocks]
[gdscript]
var url = ""$DOCS_URL/?highlight=Godot%20Engine%3%docs""
print(url.uri_decode()) # Prints ""$DOCS_URL/?highlight=Godot Engine:docs""
[/gdscript]
[csharp]
var url = ""$DOCS_URL/?highlight=Godot%20Engine%3%docs""
GD.Print(url.URIDecode()) // Prints ""$DOCS_URL/?highlight=Godot Engine:docs""
[/csharp]
[/codeblocks] *)
    let uri_decode =
    M.foreign_method "String" "uri_decode" (M.String.typ @-> returning M.String.typ)

    (** Returns a copy of the string with special characters escaped using the C language standard. *)
    let c_escape =
    M.foreign_method "String" "c_escape" (M.String.typ @-> returning M.String.typ)

    (** Returns a copy of the string with escaped characters replaced by their meanings. Supported escape sequences are [code]\'[/code], [code]\""[/code], [code]\\[/code], [code]\a[/code], [code]\b[/code], [code]\f[/code], [code]\n[/code], [code]\r[/code], [code]\t[/code], [code]\v[/code].
[b]Note:[/b] Unlike the GDScript parser, this method doesn't support the [code]\uXXXX[/code] escape sequence. *)
    let c_unescape =
    M.foreign_method "String" "c_unescape" (M.String.typ @-> returning M.String.typ)

    (** Returns a copy of the string with special characters escaped using the JSON standard. Because it closely matches the C standard, it is possible to use [method c_unescape] to unescape the string, if necessary. *)
    let json_escape =
    M.foreign_method "String" "json_escape" (M.String.typ @-> returning M.String.typ)

    (** Returns a copy of the string with all characters that are not allowed in [member Node.name] ([code].[/code] [code]:[/code] [code]@[/code] [code]/[/code] [code]""[/code] [code]%[/code]) replaced with underscores. *)
    let validate_node_name =
    M.foreign_method "String" "validate_node_name" (M.String.typ @-> returning M.String.typ)

    (** Returns a copy of the string with all characters that are not allowed in [method is_valid_filename] replaced with underscores. *)
    let validate_filename =
    M.foreign_method "String" "validate_filename" (M.String.typ @-> returning M.String.typ)

    (** Returns [code]true[/code] if this string is a valid identifier. A valid identifier may contain only letters, digits and underscores ([code]_[/code]), and the first character may not be a digit.
[codeblock]
print(""node_2d"".is_valid_identifier())    # Prints true
print(""TYPE_FLOAT"".is_valid_identifier()) # Prints true
print(""1st_method"".is_valid_identifier()) # Prints false
print(""MyMethod#2"".is_valid_identifier()) # Prints false
[/codeblock] *)
    let is_valid_identifier =
    M.foreign_method "String" "is_valid_identifier" (M.String.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this string represents a valid integer. A valid integer only contains digits, and may be prefixed with a positive ([code]+[/code]) or negative ([code]-[/code]) sign. See also [method to_int].
[codeblock]
print(""7"".is_valid_int())    # Prints true
print(""1.65"".is_valid_int()) # Prints false
print(""Hi"".is_valid_int())   # Prints false
print(""+3"".is_valid_int())   # Prints true
print(""-12"".is_valid_int())  # Prints true
[/codeblock] *)
    let is_valid_int =
    M.foreign_method "String" "is_valid_int" (M.String.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this string represents a valid floating-point number. A valid float may contain only digits, one decimal point ([code].[/code]), and the exponent letter ([code]e[/code]). It may also be prefixed with a positive ([code]+[/code]) or negative ([code]-[/code]) sign. Any valid integer is also a valid float (see [method is_valid_int]). See also [method to_float].
[codeblock]
print(""1.7"".is_valid_float())   # Prints true
print(""24"".is_valid_float())    # Prints true
print(""7e3"".is_valid_float())   # Prints true
print(""Hello"".is_valid_float()) # Prints false
[/codeblock] *)
    let is_valid_float =
    M.foreign_method "String" "is_valid_float" (M.String.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this string is a valid hexadecimal number. A valid hexadecimal number only contains digits or letters [code]A[/code] to [code]F[/code] (either uppercase or lowercase), and may be prefixed with a positive ([code]+[/code]) or negative ([code]-[/code]) sign.
If [param with_prefix] is [code]true[/code], the hexadecimal number needs to prefixed by [code]""0x""[/code] to be considered valid.
[codeblock]
print(""A08E"".is_valid_hex_number())    # Prints true
print(""-AbCdEf"".is_valid_hex_number()) # Prints true
print(""2.5"".is_valid_hex_number())     # Prints false

print(""0xDEADC0DE"".is_valid_hex_number(true)) # Prints true
[/codeblock] *)
    let is_valid_hex_number =
    M.foreign_method "String" "is_valid_hex_number" (M.Bool.typ @-> M.String.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this string is a valid color in hexadecimal HTML notation. The string must be a hexadecimal value (see [method is_valid_hex_number]) of either 3, 4, 6 or 8 digits, and may be prefixed by a hash sign ([code]#[/code]). Other HTML notations for colors, such as names or [code]hsl()[/code], are not considered valid. See also [method Color.html]. *)
    let is_valid_html_color =
    M.foreign_method "String" "is_valid_html_color" (M.String.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this string represents a well-formatted IPv4 or IPv6 address. This method considers [url=https://en.wikipedia.org/wiki/Reserved_IP_addresses]reserved IP addresses[/url] such as [code]""0.0.0.0""[/code] and [code]""ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff""[/code] as valid. *)
    let is_valid_ip_address =
    M.foreign_method "String" "is_valid_ip_address" (M.String.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this string does not contain characters that are not allowed in file names ([code]:[/code] [code]/[/code] [code]\[/code] [code]?[/code] [code] * [/code] [code]""[/code] [code]|[/code] [code]%[/code] [code]<[/code] [code]>[/code]). *)
    let is_valid_filename =
    M.foreign_method "String" "is_valid_filename" (M.String.typ @-> returning M.Bool.typ)

    (** Converts the string representing an integer number into an [int]. This method removes any non-number character and stops at the first decimal point ([code].[/code]). See also [method is_valid_int].
[codeblock]
var a = ""123"".to_int()    # a is 123
var b = ""x1y2z3"".to_int() # b is 123
var c = ""-1.2.3"".to_int() # c is -1
var d = ""Hello!"".to_int() # d is 0
[/codeblock] *)
    let to_int =
    M.foreign_method "String" "to_int" (M.String.typ @-> returning M.Int.typ)

    (** Converts the string representing a decimal number into a [float]. This method stops on the first non-number character, except the first decimal point ([code].[/code]) and the exponent letter ([code]e[/code]). See also [method is_valid_float].
[codeblock]
var a = ""12.35"".to_float()  # a is 12.35
var b = ""1.2.3"".to_float()  # b is 1.2
var c = ""12xy3"".to_float()  # c is 12.0
var d = ""1e3"".to_float()    # d is 1000.0
var e = ""Hello!"".to_float() # e is 0.0
[/codeblock] *)
    let to_float =
    M.foreign_method "String" "to_float" (M.String.typ @-> returning M.Float.typ)

    (** Converts the string representing a hexadecimal number into an [int]. The string may be optionally prefixed with [code]""0x""[/code], and an additional [code]-[/code] prefix for negative numbers.
[codeblocks]
[gdscript]
print(""0xff"".hex_to_int()) # Prints 255
print(""ab"".hex_to_int())   # Prints 171
[/gdscript]
[csharp]
GD.Print(""0xff"".HexToInt()); // Prints 255
GD.Print(""ab"".HexToInt());   // Prints 171
[/csharp]
[/codeblocks] *)
    let hex_to_int =
    M.foreign_method "String" "hex_to_int" (M.String.typ @-> returning M.Int.typ)

    (** Converts the string representing a binary number into an [int]. The string may optionally be prefixed with [code]""0b""[/code], and an additional [code]-[/code] prefix for negative numbers.
[codeblocks]
[gdscript]
print(""101"".bin_to_int())   # Prints 5
print(""0b101"".bin_to_int()) # Prints 5
print(""-0b10"".bin_to_int()) # Prints -2
[/gdscript]
[csharp]
GD.Print(""101"".BinToInt());   // Prints 5
GD.Print(""0b101"".BinToInt()); // Prints 5
GD.Print(""-0b10"".BinToInt()); // Prints -2
[/csharp]
[/codeblocks] *)
    let bin_to_int =
    M.foreign_method "String" "bin_to_int" (M.String.typ @-> returning M.Int.typ)

    (** Formats the string to be at least [param min_length] long by adding [param character]s to the left of the string, if necessary. See also [method rpad]. *)
    let lpad =
    M.foreign_method "String" "lpad" (M.Int.typ @-> M.String.typ @-> M.String.typ @-> returning M.String.typ)

    (** Formats the string to be at least [param min_length] long, by adding [param character]s to the right of the string, if necessary. See also [method lpad]. *)
    let rpad =
    M.foreign_method "String" "rpad" (M.Int.typ @-> M.String.typ @-> M.String.typ @-> returning M.String.typ)

    (** Formats the string representing a number to have an exact number of [param digits] [i]after[/i] the decimal point. *)
    let pad_decimals =
    M.foreign_method "String" "pad_decimals" (M.Int.typ @-> M.String.typ @-> returning M.String.typ)

    (** Formats the string representing a number to have an exact number of [param digits] [i]before[/i] the decimal point. *)
    let pad_zeros =
    M.foreign_method "String" "pad_zeros" (M.Int.typ @-> M.String.typ @-> returning M.String.typ)

    (** Removes the given [param prefix] from the start of the string, or returns the string unchanged. *)
    let trim_prefix =
    M.foreign_method "String" "trim_prefix" (M.String.typ @-> M.String.typ @-> returning M.String.typ)

    (** Removes the given [param suffix] from the end of the string, or returns the string unchanged. *)
    let trim_suffix =
    M.foreign_method "String" "trim_suffix" (M.String.typ @-> M.String.typ @-> returning M.String.typ)

    (** Converts the string to an [url=https://en.wikipedia.org/wiki/ASCII]ASCII[/url]/Latin-1 encoded [PackedByteArray]. This method is slightly faster than [method to_utf8_buffer], but replaces all unsupported characters with spaces. This is the inverse of [method PackedByteArray.get_string_from_ascii]. *)
    let to_ascii_buffer =
    M.foreign_method "String" "to_ascii_buffer" (M.String.typ @-> returning M.PackedByteArray.typ)

    (** Converts the string to a [url=https://en.wikipedia.org/wiki/UTF-8]UTF-8[/url] encoded [PackedByteArray]. This method is slightly slower than [method to_ascii_buffer], but supports all UTF-8 characters. For most cases, prefer using this method. This is the inverse of [method PackedByteArray.get_string_from_utf8]. *)
    let to_utf8_buffer =
    M.foreign_method "String" "to_utf8_buffer" (M.String.typ @-> returning M.PackedByteArray.typ)

    (** Converts the string to a [url=https://en.wikipedia.org/wiki/UTF-16]UTF-16[/url] encoded [PackedByteArray]. This is the inverse of [method PackedByteArray.get_string_from_utf16]. *)
    let to_utf16_buffer =
    M.foreign_method "String" "to_utf16_buffer" (M.String.typ @-> returning M.PackedByteArray.typ)

    (** Converts the string to a [url=https://en.wikipedia.org/wiki/UTF-32]UTF-32[/url] encoded [PackedByteArray]. This is the inverse of [method PackedByteArray.get_string_from_utf32]. *)
    let to_utf32_buffer =
    M.foreign_method "String" "to_utf32_buffer" (M.String.typ @-> returning M.PackedByteArray.typ)

    (** Decodes a hexadecimal string as a [PackedByteArray].
[codeblocks]
[gdscript]
var text = ""hello world""
var encoded = text.to_utf8_buffer().hex_encode() # outputs ""68656c6c6f20776f726c64""
print(buf.hex_decode().get_string_from_utf8())
[/gdscript]
[csharp]
var text = ""hello world"";
var encoded = text.ToUtf8Buffer().HexEncode(); // outputs ""68656c6c6f20776f726c64""
GD.Print(buf.HexDecode().GetStringFromUtf8());
[/csharp]
[/codeblocks] *)
    let hex_decode =
    M.foreign_method "String" "hex_decode" (M.String.typ @-> returning M.PackedByteArray.typ)

    (** Converts the string to a [url=https://en.wikipedia.org/wiki/Wide_character]wide character[/url] ([code]wchar_t[/code], UTF-16 on Windows, UTF-32 on other platforms) encoded [PackedByteArray]. This is the inverse of [method PackedByteArray.get_string_from_wchar]. *)
    let to_wchar_buffer =
    M.foreign_method "String" "to_wchar_buffer" (M.String.typ @-> returning M.PackedByteArray.typ)

    (** Converts the given [param number] to a string representation, in scientific notation.
[codeblocks]
[gdscript]
var n = -5.2e8
print(n)                        # Prints -520000000
print(String.num_scientific(n)) # Prints -5.2e+08
[/gdscript]
[csharp]
// This method is not implemented in C#.
// Use `string.ToString()` with ""e"" to achieve similar results.
var n = -5.2e8f;
GD.Print(n);                // Prints -520000000
GD.Print(n.ToString(""e1"")); // Prints -5.2e+008
[/csharp]
[/codeblocks]
[b]Note:[/b] In C#, this method is not implemented. To achieve similar results, see C#'s [url=https://learn.microsoft.com/en-us/dotnet/standard/base-types/standard-numeric-format-strings]Standard numeric format strings[/url] *)
    let num_scientific =
    M.foreign_method "String" "num_scientific" (M.Float.typ @-> returning M.String.typ)

    (** Converts a [float] to a string representation of a decimal number, with the number of decimal places specified in [param decimals].
If [param decimals] is [code]-1[/code] as by default, the string representation may only have up to 14 significant digits, with digits before the decimal point having priority over digits after.
Trailing zeros are not included in the string. The last digit is rounded, not truncated.
[b]Example:[/b]
[codeblock]
String.num(3.141593)     # Returns ""3.141593""
String.num(3.141593, 3)  # Returns ""3.142""
String.num(3.14159300)   # Returns ""3.141593""

# Here, the last digit will be rounded up,
# which reduces the total digit count, since trailing zeros are removed:
String.num(42.129999, 5) # Returns ""42.13""

# If `decimals` is not specified, the maximum number of significant digits is 14:
String.num(-0.0000012345432123454321)     # Returns ""-0.00000123454321""
String.num(-10000.0000012345432123454321) # Returns ""-10000.0000012345""
[/codeblock] *)
    let num =
    M.foreign_method "String" "num" (M.Float.typ @-> M.Int.typ @-> returning M.String.typ)

    (** Converts the given [param number] to a string representation, with the given [param base].
By default, [param base] is set to decimal ([code]10[/code]). Other common bases in programming include binary ([code]2[/code]), [url=https://en.wikipedia.org/wiki/Octal]octal[/url] ([code]8[/code]), hexadecimal ([code]16[/code]).
If [param capitalize_hex] is [code]true[/code], digits higher than 9 are represented in uppercase. *)
    let num_int64 =
    M.foreign_method "String" "num_int64" (M.Int.typ @-> M.Int.typ @-> M.Bool.typ @-> returning M.String.typ)

    (** Converts the given unsigned [int] to a string representation, with the given [param base].
By default, [param base] is set to decimal ([code]10[/code]). Other common bases in programming include binary ([code]2[/code]), [url=https://en.wikipedia.org/wiki/Octal]octal[/url] ([code]8[/code]), hexadecimal ([code]16[/code]).
If [param capitalize_hex] is [code]true[/code], digits higher than 9 are represented in uppercase. *)
    let num_uint64 =
    M.foreign_method "String" "num_uint64" (M.Int.typ @-> M.Int.typ @-> M.Bool.typ @-> returning M.String.typ)

    (** Returns a single Unicode character from the decimal [param char]. You may use [url=https://unicodelookup.com/]unicodelookup.com[/url] or [url=https://www.unicode.org/charts/]unicode.org[/url] as points of reference.
[codeblock]
print(String.chr(65))     # Prints ""A""
print(String.chr(129302)) # Prints ""🤖"" (robot face emoji)
[/codeblock] *)
    let chr =
    M.foreign_method "String" "chr" (M.Int.typ @-> returning M.String.typ)

    (** Converts [param size] which represents a number of bytes into a human-readable form.
The result is in [url=https://en.wikipedia.org/wiki/Binary_prefix#IEC_prefixes]IEC prefix format[/url], which may end in either [code]""B""[/code], [code]""KiB""[/code], [code]""MiB""[/code], [code]""GiB""[/code], [code]""TiB""[/code], [code]""PiB""[/code], or [code]""EiB""[/code]. *)
    let humanize_size =
    M.foreign_method "String" "humanize_size" (M.Int.typ @-> returning M.String.typ)








    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.String.typ @-> M.String.typ @-> M.Bool.typ @-> returning void))







    (** Returns [code]true[/code] if both strings contain the same sequence of characters. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING (Some GlobalEnum.VariantType._TYPE_STRING) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.String.typ @-> M.String.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if both strings do not contain the same sequence of characters. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING (Some GlobalEnum.VariantType._TYPE_STRING) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.String.typ @-> M.String.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the left [String] comes before [param right] in [url=https://en.wikipedia.org/wiki/List_of_Unicode_characters]Unicode order[/url], which roughly matches the alphabetical order. Useful for sorting. *)
    let (<) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING (Some GlobalEnum.VariantType._TYPE_STRING) Godotcaml.GlobalEnum.VariantOperator._OP_LESS
      (funptr (M.String.typ @-> M.String.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the left [String] comes before [param right] in [url=https://en.wikipedia.org/wiki/List_of_Unicode_characters]Unicode order[/url], which roughly matches the alphabetical order, or if both are equal. *)
    let (<=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING (Some GlobalEnum.VariantType._TYPE_STRING) Godotcaml.GlobalEnum.VariantOperator._OP_LESS_EQUAL
      (funptr (M.String.typ @-> M.String.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the left [String] comes after [param right] in [url=https://en.wikipedia.org/wiki/List_of_Unicode_characters]Unicode order[/url], which roughly matches the alphabetical order. Useful for sorting. *)
    let (>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING (Some GlobalEnum.VariantType._TYPE_STRING) Godotcaml.GlobalEnum.VariantOperator._OP_GREATER
      (funptr (M.String.typ @-> M.String.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the left [String] comes after [param right] in [url=https://en.wikipedia.org/wiki/List_of_Unicode_characters]Unicode order[/url], which roughly matches the alphabetical order, or if both are equal. *)
    let (>=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING (Some GlobalEnum.VariantType._TYPE_STRING) Godotcaml.GlobalEnum.VariantOperator._OP_GREATER_EQUAL
      (funptr (M.String.typ @-> M.String.typ @-> M.Bool.typ @-> returning void))

    (** Appends [param right] at the end of this [String], also known as a string concatenation. *)
    let (+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING (Some GlobalEnum.VariantType._TYPE_STRING) Godotcaml.GlobalEnum.VariantOperator._OP_ADD
      (funptr (M.String.typ @-> M.String.typ @-> M.String.typ @-> returning void))


    let (%) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING (Some GlobalEnum.VariantType._TYPE_STRING) Godotcaml.GlobalEnum.VariantOperator._OP_MODULE
      (funptr (M.String.typ @-> M.String.typ @-> M.String.typ @-> returning void))


    let _String_elem_String =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING (Some GlobalEnum.VariantType._TYPE_STRING) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.String.typ @-> M.String.typ @-> M.Bool.typ @-> returning void))










































    let _String_elem_StringName =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING (Some GlobalEnum.VariantType._TYPE_STRING_NAME) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.String.typ @-> M.StringName.typ @-> M.Bool.typ @-> returning void))






    let _String_elem_Object =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING (Some GlobalEnum.VariantType._TYPE_OBJECT) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.String.typ @-> M.Object.typ @-> M.Bool.typ @-> returning void))








    let _String_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.String.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))




    let _String_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.String.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))














    let _String_elem_PackedStringArray =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING (Some GlobalEnum.VariantType._TYPE_PACKED_STRING_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.String.typ @-> M.PackedStringArray.typ @-> M.Bool.typ @-> returning void))






    end

  module Vector2 = struct
    (** Returns this vector's angle with respect to the positive X axis, or [code](1, 0)[/code] vector, in radians.
For example, [code]Vector2.RIGHT.angle()[/code] will return zero, [code]Vector2.DOWN.angle()[/code] will return [code]PI / 2[/code] (a quarter turn, or 90 degrees), and [code]Vector2(1, -1).angle()[/code] will return [code]-PI / 4[/code] (a negative eighth turn, or -45 degrees).
[url=https://raw.githubusercontent.com/godotengine/godot-docs/master/img/vector2_angle.png]Illustration of the returned angle.[/url]
Equivalent to the result of [method @GlobalScope.atan2] when called with the vector's [member y] and [member x] as parameters: [code]atan2(y, x)[/code]. *)
    let angle =
    M.foreign_method "Vector2" "angle" (M.Vector2.typ @-> returning M.Float.typ)

    (** Returns the angle to the given vector, in radians.
[url=https://raw.githubusercontent.com/godotengine/godot-docs/master/img/vector2_angle_to.png]Illustration of the returned angle.[/url] *)
    let angle_to =
    M.foreign_method "Vector2" "angle_to" (M.Vector2.typ @-> M.Vector2.typ @-> returning M.Float.typ)

    (** Returns the angle between the line connecting the two points and the X axis, in radians.
[code]a.angle_to_point(b)[/code] is equivalent of doing [code](b - a).angle()[/code].
[url=https://raw.githubusercontent.com/godotengine/godot-docs/master/img/vector2_angle_to_point.png]Illustration of the returned angle.[/url] *)
    let angle_to_point =
    M.foreign_method "Vector2" "angle_to_point" (M.Vector2.typ @-> M.Vector2.typ @-> returning M.Float.typ)

    (** Returns the normalized vector pointing from this vector to [param to]. This is equivalent to using [code](b - a).normalized()[/code]. *)
    let direction_to =
    M.foreign_method "Vector2" "direction_to" (M.Vector2.typ @-> M.Vector2.typ @-> returning M.Vector2.typ)

    (** Returns the distance between this vector and [param to]. *)
    let distance_to =
    M.foreign_method "Vector2" "distance_to" (M.Vector2.typ @-> M.Vector2.typ @-> returning M.Float.typ)

    (** Returns the squared distance between this vector and [param to].
This method runs faster than [method distance_to], so prefer it if you need to compare vectors or need the squared distance for some formula. *)
    let distance_squared_to =
    M.foreign_method "Vector2" "distance_squared_to" (M.Vector2.typ @-> M.Vector2.typ @-> returning M.Float.typ)

    (** Returns the length (magnitude) of this vector. *)
    let length =
    M.foreign_method "Vector2" "length" (M.Vector2.typ @-> returning M.Float.typ)

    (** Returns the squared length (squared magnitude) of this vector.
This method runs faster than [method length], so prefer it if you need to compare vectors or need the squared distance for some formula. *)
    let length_squared =
    M.foreign_method "Vector2" "length_squared" (M.Vector2.typ @-> returning M.Float.typ)

    (** Returns the vector with a maximum length by limiting its length to [param length]. *)
    let limit_length =
    M.foreign_method "Vector2" "limit_length" (M.Float.typ @-> M.Vector2.typ @-> returning M.Vector2.typ)

    (** Returns the result of scaling the vector to unit length. Equivalent to [code]v / v.length()[/code]. See also [method is_normalized].
[b]Note:[/b] This function may return incorrect values if the input vector length is near zero. *)
    let normalized =
    M.foreign_method "Vector2" "normalized" (M.Vector2.typ @-> returning M.Vector2.typ)

    (** Returns [code]true[/code] if the vector is normalized, i.e. its length is approximately equal to 1. *)
    let is_normalized =
    M.foreign_method "Vector2" "is_normalized" (M.Vector2.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this vector and [param to] are approximately equal, by running [method @GlobalScope.is_equal_approx] on each component. *)
    let is_equal_approx =
    M.foreign_method "Vector2" "is_equal_approx" (M.Vector2.typ @-> M.Vector2.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this vector's values are approximately zero, by running [method @GlobalScope.is_zero_approx] on each component.
This method is faster than using [method is_equal_approx] with one value as a zero vector. *)
    let is_zero_approx =
    M.foreign_method "Vector2" "is_zero_approx" (M.Vector2.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this vector is finite, by calling [method @GlobalScope.is_finite] on each component. *)
    let is_finite =
    M.foreign_method "Vector2" "is_finite" (M.Vector2.typ @-> returning M.Bool.typ)

    (** Returns a vector composed of the [method @GlobalScope.fposmod] of this vector's components and [param mod]. *)
    let posmod =
    M.foreign_method "Vector2" "posmod" (M.Float.typ @-> M.Vector2.typ @-> returning M.Vector2.typ)

    (** Returns a vector composed of the [method @GlobalScope.fposmod] of this vector's components and [param modv]'s components. *)
    let posmodv =
    M.foreign_method "Vector2" "posmodv" (M.Vector2.typ @-> M.Vector2.typ @-> returning M.Vector2.typ)

    (** Returns the result of projecting the vector onto the given vector [param b]. *)
    let project =
    M.foreign_method "Vector2" "project" (M.Vector2.typ @-> M.Vector2.typ @-> returning M.Vector2.typ)

    (** Returns the result of the linear interpolation between this vector and [param to] by amount [param weight]. [param weight] is on the range of [code]0.0[/code] to [code]1.0[/code], representing the amount of interpolation. *)
    let lerp =
    M.foreign_method "Vector2" "lerp" (M.Vector2.typ @-> M.Float.typ @-> M.Vector2.typ @-> returning M.Vector2.typ)

    (** Returns the result of spherical linear interpolation between this vector and [param to], by amount [param weight]. [param weight] is on the range of 0.0 to 1.0, representing the amount of interpolation.
This method also handles interpolating the lengths if the input vectors have different lengths. For the special case of one or both input vectors having zero length, this method behaves like [method lerp]. *)
    let slerp =
    M.foreign_method "Vector2" "slerp" (M.Vector2.typ @-> M.Float.typ @-> M.Vector2.typ @-> returning M.Vector2.typ)

    (** Performs a cubic interpolation between this vector and [param b] using [param pre_a] and [param post_b] as handles, and returns the result at position [param weight]. [param weight] is on the range of 0.0 to 1.0, representing the amount of interpolation. *)
    let cubic_interpolate =
    M.foreign_method "Vector2" "cubic_interpolate" (M.Vector2.typ @-> M.Vector2.typ @-> M.Vector2.typ @-> M.Float.typ @-> M.Vector2.typ @-> returning M.Vector2.typ)

    (** Performs a cubic interpolation between this vector and [param b] using [param pre_a] and [param post_b] as handles, and returns the result at position [param weight]. [param weight] is on the range of 0.0 to 1.0, representing the amount of interpolation.
It can perform smoother interpolation than [method cubic_interpolate] by the time values. *)
    let cubic_interpolate_in_time =
    M.foreign_method "Vector2" "cubic_interpolate_in_time" (M.Vector2.typ @-> M.Vector2.typ @-> M.Vector2.typ @-> M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Vector2.typ @-> returning M.Vector2.typ)

    (** Returns the point at the given [param t] on the [url=https://en.wikipedia.org/wiki/B%C3%A9zier_curve]Bézier curve[/url] defined by this vector and the given [param control_1], [param control_2], and [param end] points. *)
    let bezier_interpolate =
    M.foreign_method "Vector2" "bezier_interpolate" (M.Vector2.typ @-> M.Vector2.typ @-> M.Vector2.typ @-> M.Float.typ @-> M.Vector2.typ @-> returning M.Vector2.typ)

    (** Returns the derivative at the given [param t] on the [url=https://en.wikipedia.org/wiki/B%C3%A9zier_curve]Bézier curve[/url] defined by this vector and the given [param control_1], [param control_2], and [param end] points. *)
    let bezier_derivative =
    M.foreign_method "Vector2" "bezier_derivative" (M.Vector2.typ @-> M.Vector2.typ @-> M.Vector2.typ @-> M.Float.typ @-> M.Vector2.typ @-> returning M.Vector2.typ)

    (** Returns the axis of the vector's highest value. See [code]AXIS_ * [/code] constants. If all components are equal, this method returns [constant AXIS_X]. *)
    let max_axis_index =
    M.foreign_method "Vector2" "max_axis_index" (M.Vector2.typ @-> returning M.Int.typ)

    (** Returns the axis of the vector's lowest value. See [code]AXIS_ * [/code] constants. If all components are equal, this method returns [constant AXIS_Y]. *)
    let min_axis_index =
    M.foreign_method "Vector2" "min_axis_index" (M.Vector2.typ @-> returning M.Int.typ)

    (** Returns a new vector moved toward [param to] by the fixed [param delta] amount. Will not go past the final value. *)
    let move_toward =
    M.foreign_method "Vector2" "move_toward" (M.Vector2.typ @-> M.Float.typ @-> M.Vector2.typ @-> returning M.Vector2.typ)

    (** Returns the result of rotating this vector by [param angle] (in radians). See also [method @GlobalScope.deg_to_rad]. *)
    let rotated =
    M.foreign_method "Vector2" "rotated" (M.Float.typ @-> M.Vector2.typ @-> returning M.Vector2.typ)

    (** Returns a perpendicular vector rotated 90 degrees counter-clockwise compared to the original, with the same length. *)
    let orthogonal =
    M.foreign_method "Vector2" "orthogonal" (M.Vector2.typ @-> returning M.Vector2.typ)

    (** Returns a new vector with all components rounded down (towards negative infinity). *)
    let floor =
    M.foreign_method "Vector2" "floor" (M.Vector2.typ @-> returning M.Vector2.typ)

    (** Returns a new vector with all components rounded up (towards positive infinity). *)
    let ceil =
    M.foreign_method "Vector2" "ceil" (M.Vector2.typ @-> returning M.Vector2.typ)

    (** Returns a new vector with all components rounded to the nearest integer, with halfway cases rounded away from zero. *)
    let round =
    M.foreign_method "Vector2" "round" (M.Vector2.typ @-> returning M.Vector2.typ)

    (** Returns the aspect ratio of this vector, the ratio of [member x] to [member y]. *)
    let aspect =
    M.foreign_method "Vector2" "aspect" (M.Vector2.typ @-> returning M.Float.typ)

    (** Returns the dot product of this vector and [param with]. This can be used to compare the angle between two vectors. For example, this can be used to determine whether an enemy is facing the player.
The dot product will be [code]0[/code] for a straight angle (90 degrees), greater than 0 for angles narrower than 90 degrees and lower than 0 for angles wider than 90 degrees.
When using unit (normalized) vectors, the result will always be between [code]-1.0[/code] (180 degree angle) when the vectors are facing opposite directions, and [code]1.0[/code] (0 degree angle) when the vectors are aligned.
[b]Note:[/b] [code]a.dot(b)[/code] is equivalent to [code]b.dot(a)[/code]. *)
    let dot =
    M.foreign_method "Vector2" "dot" (M.Vector2.typ @-> M.Vector2.typ @-> returning M.Float.typ)

    (** Returns the result of sliding the vector along a plane defined by the given normal. *)
    let slide =
    M.foreign_method "Vector2" "slide" (M.Vector2.typ @-> M.Vector2.typ @-> returning M.Vector2.typ)

    (** Returns a new vector ""bounced off"" from a plane defined by the given normal. *)
    let bounce =
    M.foreign_method "Vector2" "bounce" (M.Vector2.typ @-> M.Vector2.typ @-> returning M.Vector2.typ)

    (** Returns the result of reflecting the vector from a line defined by the given direction vector [param n]. *)
    let reflect =
    M.foreign_method "Vector2" "reflect" (M.Vector2.typ @-> M.Vector2.typ @-> returning M.Vector2.typ)

    (** Returns the 2D analog of the cross product for this vector and [param with].
This is the signed area of the parallelogram formed by the two vectors. If the second vector is clockwise from the first vector, then the cross product is the positive area. If counter-clockwise, the cross product is the negative area. If the two vectors are parallel this returns zero, making it useful for testing if two vectors are parallel.
[b]Note:[/b] Cross product is not defined in 2D mathematically. This method embeds the 2D vectors in the XY plane of 3D space and uses their cross product's Z component as the analog. *)
    let cross =
    M.foreign_method "Vector2" "cross" (M.Vector2.typ @-> M.Vector2.typ @-> returning M.Float.typ)

    (** Returns a new vector with all components in absolute values (i.e. positive). *)
    let abs =
    M.foreign_method "Vector2" "abs" (M.Vector2.typ @-> returning M.Vector2.typ)

    (** Returns a new vector with each component set to [code]1.0[/code] if it's positive, [code]-1.0[/code] if it's negative, and [code]0.0[/code] if it's zero. The result is identical to calling [method @GlobalScope.sign] on each component. *)
    let sign =
    M.foreign_method "Vector2" "sign" (M.Vector2.typ @-> returning M.Vector2.typ)

    (** Returns a new vector with all components clamped between the components of [param min] and [param max], by running [method @GlobalScope.clamp] on each component. *)
    let clamp =
    M.foreign_method "Vector2" "clamp" (M.Vector2.typ @-> M.Vector2.typ @-> M.Vector2.typ @-> returning M.Vector2.typ)

    (** Returns a new vector with each component snapped to the nearest multiple of the corresponding component in [param step]. This can also be used to round the components to an arbitrary number of decimals. *)
    let snapped =
    M.foreign_method "Vector2" "snapped" (M.Vector2.typ @-> M.Vector2.typ @-> returning M.Vector2.typ)

    (** Creates a unit [Vector2] rotated to the given [param angle] in radians. This is equivalent to doing [code]Vector2(cos(angle), sin(angle))[/code] or [code]Vector2.RIGHT.rotated(angle)[/code].
[codeblock]
print(Vector2.from_angle(0)) # Prints (1, 0).
print(Vector2(1, 0).angle()) # Prints 0, which is the angle used above.
print(Vector2.from_angle(PI / 2)) # Prints (0, 1).
[/codeblock] *)
    let from_angle =
    M.foreign_method "Vector2" "from_angle" (M.Float.typ @-> returning M.Vector2.typ)





    (** Returns the negative value of the [Vector2]. This is the same as writing [code]Vector2(-v.x, -v.y)[/code]. This operation flips the direction of the vector while keeping the same magnitude. With floats, the number zero can be either positive or negative. *)
    let (~-) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2 None  Godotcaml.GlobalEnum.VariantOperator._OP_NEGATE
      (funptr (M.Vector2.typ @-> M.Vector2.typ @-> M.Vector2.typ @-> returning void))

    (** Returns the same value as if the [code]+[/code] was not there. Unary [code]+[/code] does nothing, but sometimes it can make your code more readable. *)
    let (~+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2 None  Godotcaml.GlobalEnum.VariantOperator._OP_POSITIVE
      (funptr (M.Vector2.typ @-> M.Vector2.typ @-> M.Vector2.typ @-> returning void))


    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2 None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.Vector2.typ @-> M.Vector2.typ @-> M.Bool.typ @-> returning void))









    (** Returns [code]true[/code] if the vectors are exactly equal.
[b]Note:[/b] Due to floating-point precision errors, consider using [method is_equal_approx] instead, which is more reliable.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this operator may not be accurate if NaNs are included. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2 (Some GlobalEnum.VariantType._TYPE_VECTOR2) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.Vector2.typ @-> M.Vector2.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the vectors are not equal.
[b]Note:[/b] Due to floating-point precision errors, consider using [method is_equal_approx] instead, which is more reliable.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this operator may not be accurate if NaNs are included. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2 (Some GlobalEnum.VariantType._TYPE_VECTOR2) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.Vector2.typ @-> M.Vector2.typ @-> M.Bool.typ @-> returning void))

    (** Compares two [Vector2] vectors by first checking if the X value of the left vector is less than the X value of the [param right] vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors. This operator is useful for sorting vectors.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this operator may not be accurate if NaNs are included. *)
    let (<) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2 (Some GlobalEnum.VariantType._TYPE_VECTOR2) Godotcaml.GlobalEnum.VariantOperator._OP_LESS
      (funptr (M.Vector2.typ @-> M.Vector2.typ @-> M.Bool.typ @-> returning void))

    (** Compares two [Vector2] vectors by first checking if the X value of the left vector is less than or equal to the X value of the [param right] vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors. This operator is useful for sorting vectors.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this operator may not be accurate if NaNs are included. *)
    let (<=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2 (Some GlobalEnum.VariantType._TYPE_VECTOR2) Godotcaml.GlobalEnum.VariantOperator._OP_LESS_EQUAL
      (funptr (M.Vector2.typ @-> M.Vector2.typ @-> M.Bool.typ @-> returning void))

    (** Compares two [Vector2] vectors by first checking if the X value of the left vector is greater than the X value of the [param right] vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors. This operator is useful for sorting vectors.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this operator may not be accurate if NaNs are included. *)
    let (>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2 (Some GlobalEnum.VariantType._TYPE_VECTOR2) Godotcaml.GlobalEnum.VariantOperator._OP_GREATER
      (funptr (M.Vector2.typ @-> M.Vector2.typ @-> M.Bool.typ @-> returning void))

    (** Compares two [Vector2] vectors by first checking if the X value of the left vector is greater than or equal to the X value of the [param right] vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors. This operator is useful for sorting vectors.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this operator may not be accurate if NaNs are included. *)
    let (>=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2 (Some GlobalEnum.VariantType._TYPE_VECTOR2) Godotcaml.GlobalEnum.VariantOperator._OP_GREATER_EQUAL
      (funptr (M.Vector2.typ @-> M.Vector2.typ @-> M.Bool.typ @-> returning void))

    (** Adds each component of the [Vector2] by the components of the given [Vector2].
[codeblock]
print(Vector2(10, 20) + Vector2(3, 4)) # Prints ""(13, 24)""
[/codeblock] *)
    let (+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2 (Some GlobalEnum.VariantType._TYPE_VECTOR2) Godotcaml.GlobalEnum.VariantOperator._OP_ADD
      (funptr (M.Vector2.typ @-> M.Vector2.typ @-> M.Vector2.typ @-> returning void))

    (** Subtracts each component of the [Vector2] by the components of the given [Vector2].
[codeblock]
print(Vector2(10, 20) - Vector2(3, 4)) # Prints ""(7, 16)""
[/codeblock] *)
    let (-) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2 (Some GlobalEnum.VariantType._TYPE_VECTOR2) Godotcaml.GlobalEnum.VariantOperator._OP_SUBTRACT
      (funptr (M.Vector2.typ @-> M.Vector2.typ @-> M.Vector2.typ @-> returning void))

    (** Multiplies each component of the [Vector2] by the components of the given [Vector2].
[codeblock]
print(Vector2(10, 20)  *  Vector2(3, 4)) # Prints ""(30, 80)""
[/codeblock] *)
    let ( * ) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2 (Some GlobalEnum.VariantType._TYPE_VECTOR2) Godotcaml.GlobalEnum.VariantOperator._OP_MULTIPLY
      (funptr (M.Vector2.typ @-> M.Vector2.typ @-> M.Vector2.typ @-> returning void))

    (** Divides each component of the [Vector2] by the components of the given [Vector2].
[codeblock]
print(Vector2(10, 20) / Vector2(2, 5)) # Prints ""(5, 4)""
[/codeblock] *)
    let (/) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2 (Some GlobalEnum.VariantType._TYPE_VECTOR2) Godotcaml.GlobalEnum.VariantOperator._OP_DIVIDE
      (funptr (M.Vector2.typ @-> M.Vector2.typ @-> M.Vector2.typ @-> returning void))




    let _Vector2_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2 (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Vector2.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _Vector2_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2 (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Vector2.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))


    let _Vector2_elem_PackedVector2Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2 (Some GlobalEnum.VariantType._TYPE_PACKED_VECTOR2_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Vector2.typ @-> M.PackedVector2Array.typ @-> M.Bool.typ @-> returning void))

    module Axis = struct
      (** Enumerated value for the X axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
      let _AXIS_X =
      0

      (** Enumerated value for the Y axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
      let _AXIS_Y =
      1
      end

    (** Enumerated value for the X axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
    let _AXIS_X =
    0

    (** Enumerated value for the Y axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
    let _AXIS_Y =
    1

    (** Zero vector, a vector with all components set to [code]0[/code]. *)
    let _ZERO =
    Vector2(0, 0)

    (** One vector, a vector with all components set to [code]1[/code]. *)
    let _ONE =
    Vector2(1, 1)

    (** Infinity vector, a vector with all components set to [constant @GDScript.INF]. *)
    let _INF =
    Vector2(inf, inf)

    (** Left unit vector. Represents the direction of left. *)
    let _LEFT =
    Vector2(-1, 0)

    (** Right unit vector. Represents the direction of right. *)
    let _RIGHT =
    Vector2(1, 0)

    (** Up unit vector. Y is down in 2D, so this vector points -Y. *)
    let _UP =
    Vector2(0, -1)

    (** Down unit vector. Y is down in 2D, so this vector points +Y. *)
    let _DOWN =
    Vector2(0, 1)
    end

  module Vector2i = struct
    (** Returns the aspect ratio of this vector, the ratio of [member x] to [member y]. *)
    let aspect =
    M.foreign_method "Vector2i" "aspect" (M.Vector2i.typ @-> returning M.Float.typ)

    (** Returns the axis of the vector's highest value. See [code]AXIS_ * [/code] constants. If all components are equal, this method returns [constant AXIS_X]. *)
    let max_axis_index =
    M.foreign_method "Vector2i" "max_axis_index" (M.Vector2i.typ @-> returning M.Int.typ)

    (** Returns the axis of the vector's lowest value. See [code]AXIS_ * [/code] constants. If all components are equal, this method returns [constant AXIS_Y]. *)
    let min_axis_index =
    M.foreign_method "Vector2i" "min_axis_index" (M.Vector2i.typ @-> returning M.Int.typ)

    (** Returns the length (magnitude) of this vector. *)
    let length =
    M.foreign_method "Vector2i" "length" (M.Vector2i.typ @-> returning M.Float.typ)

    (** Returns the squared length (squared magnitude) of this vector.
This method runs faster than [method length], so prefer it if you need to compare vectors or need the squared distance for some formula. *)
    let length_squared =
    M.foreign_method "Vector2i" "length_squared" (M.Vector2i.typ @-> returning M.Int.typ)

    (** Returns a new vector with each component set to [code]1[/code] if it's positive, [code]-1[/code] if it's negative, and [code]0[/code] if it's zero. The result is identical to calling [method @GlobalScope.sign] on each component. *)
    let sign =
    M.foreign_method "Vector2i" "sign" (M.Vector2i.typ @-> returning M.Vector2i.typ)

    (** Returns a new vector with all components in absolute values (i.e. positive). *)
    let abs =
    M.foreign_method "Vector2i" "abs" (M.Vector2i.typ @-> returning M.Vector2i.typ)

    (** Returns a new vector with all components clamped between the components of [param min] and [param max], by running [method @GlobalScope.clamp] on each component. *)
    let clamp =
    M.foreign_method "Vector2i" "clamp" (M.Vector2i.typ @-> M.Vector2i.typ @-> M.Vector2i.typ @-> returning M.Vector2i.typ)

    (** Returns a new vector with each component snapped to the closest multiple of the corresponding component in [param step]. *)
    let snapped =
    M.foreign_method "Vector2i" "snapped" (M.Vector2i.typ @-> M.Vector2i.typ @-> returning M.Vector2i.typ)





    (** Returns the negative value of the [Vector2i]. This is the same as writing [code]Vector2i(-v.x, -v.y)[/code]. This operation flips the direction of the vector while keeping the same magnitude. *)
    let (~-) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2I None  Godotcaml.GlobalEnum.VariantOperator._OP_NEGATE
      (funptr (M.Vector2i.typ @-> M.Vector2i.typ @-> M.Vector2i.typ @-> returning void))

    (** Returns the same value as if the [code]+[/code] was not there. Unary [code]+[/code] does nothing, but sometimes it can make your code more readable. *)
    let (~+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2I None  Godotcaml.GlobalEnum.VariantOperator._OP_POSITIVE
      (funptr (M.Vector2i.typ @-> M.Vector2i.typ @-> M.Vector2i.typ @-> returning void))


    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2I None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.Vector2i.typ @-> M.Vector2i.typ @-> M.Bool.typ @-> returning void))











    (** Returns [code]true[/code] if the vectors are equal. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2I (Some GlobalEnum.VariantType._TYPE_VECTOR2I) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.Vector2i.typ @-> M.Vector2i.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the vectors are not equal. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2I (Some GlobalEnum.VariantType._TYPE_VECTOR2I) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.Vector2i.typ @-> M.Vector2i.typ @-> M.Bool.typ @-> returning void))

    (** Compares two [Vector2i] vectors by first checking if the X value of the left vector is less than the X value of the [param right] vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors. This operator is useful for sorting vectors. *)
    let (<) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2I (Some GlobalEnum.VariantType._TYPE_VECTOR2I) Godotcaml.GlobalEnum.VariantOperator._OP_LESS
      (funptr (M.Vector2i.typ @-> M.Vector2i.typ @-> M.Bool.typ @-> returning void))

    (** Compares two [Vector2i] vectors by first checking if the X value of the left vector is less than or equal to the X value of the [param right] vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors. This operator is useful for sorting vectors. *)
    let (<=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2I (Some GlobalEnum.VariantType._TYPE_VECTOR2I) Godotcaml.GlobalEnum.VariantOperator._OP_LESS_EQUAL
      (funptr (M.Vector2i.typ @-> M.Vector2i.typ @-> M.Bool.typ @-> returning void))

    (** Compares two [Vector2i] vectors by first checking if the X value of the left vector is greater than the X value of the [param right] vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors. This operator is useful for sorting vectors. *)
    let (>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2I (Some GlobalEnum.VariantType._TYPE_VECTOR2I) Godotcaml.GlobalEnum.VariantOperator._OP_GREATER
      (funptr (M.Vector2i.typ @-> M.Vector2i.typ @-> M.Bool.typ @-> returning void))

    (** Compares two [Vector2i] vectors by first checking if the X value of the left vector is greater than or equal to the X value of the [param right] vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors. This operator is useful for sorting vectors. *)
    let (>=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2I (Some GlobalEnum.VariantType._TYPE_VECTOR2I) Godotcaml.GlobalEnum.VariantOperator._OP_GREATER_EQUAL
      (funptr (M.Vector2i.typ @-> M.Vector2i.typ @-> M.Bool.typ @-> returning void))

    (** Adds each component of the [Vector2i] by the components of the given [Vector2i].
[codeblock]
print(Vector2i(10, 20) + Vector2i(3, 4)) # Prints ""(13, 24)""
[/codeblock] *)
    let (+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2I (Some GlobalEnum.VariantType._TYPE_VECTOR2I) Godotcaml.GlobalEnum.VariantOperator._OP_ADD
      (funptr (M.Vector2i.typ @-> M.Vector2i.typ @-> M.Vector2i.typ @-> returning void))

    (** Subtracts each component of the [Vector2i] by the components of the given [Vector2i].
[codeblock]
print(Vector2i(10, 20) - Vector2i(3, 4)) # Prints ""(7, 16)""
[/codeblock] *)
    let (-) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2I (Some GlobalEnum.VariantType._TYPE_VECTOR2I) Godotcaml.GlobalEnum.VariantOperator._OP_SUBTRACT
      (funptr (M.Vector2i.typ @-> M.Vector2i.typ @-> M.Vector2i.typ @-> returning void))

    (** Multiplies each component of the [Vector2i] by the components of the given [Vector2i].
[codeblock]
print(Vector2i(10, 20)  *  Vector2i(3, 4)) # Prints ""(30, 80)""
[/codeblock] *)
    let ( * ) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2I (Some GlobalEnum.VariantType._TYPE_VECTOR2I) Godotcaml.GlobalEnum.VariantOperator._OP_MULTIPLY
      (funptr (M.Vector2i.typ @-> M.Vector2i.typ @-> M.Vector2i.typ @-> returning void))

    (** Divides each component of the [Vector2i] by the components of the given [Vector2i].
[codeblock]
print(Vector2i(10, 20) / Vector2i(2, 5)) # Prints ""(5, 4)""
[/codeblock] *)
    let (/) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2I (Some GlobalEnum.VariantType._TYPE_VECTOR2I) Godotcaml.GlobalEnum.VariantOperator._OP_DIVIDE
      (funptr (M.Vector2i.typ @-> M.Vector2i.typ @-> M.Vector2i.typ @-> returning void))

    (** Gets the remainder of each component of the [Vector2i] with the components of the given [Vector2i]. This operation uses truncated division, which is often not desired as it does not work well with negative numbers. Consider using [method @GlobalScope.posmod] instead if you want to handle negative numbers.
[codeblock]
print(Vector2i(10, -20) % Vector2i(7, 8)) # Prints ""(3, -4)""
[/codeblock] *)
    let (%) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2I (Some GlobalEnum.VariantType._TYPE_VECTOR2I) Godotcaml.GlobalEnum.VariantOperator._OP_MODULE
      (funptr (M.Vector2i.typ @-> M.Vector2i.typ @-> M.Vector2i.typ @-> returning void))


    let _Vector2i_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2I (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Vector2i.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _Vector2i_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR2I (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Vector2i.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))

    module Axis = struct
      (** Enumerated value for the X axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
      let _AXIS_X =
      0

      (** Enumerated value for the Y axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
      let _AXIS_Y =
      1
      end

    (** Enumerated value for the X axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
    let _AXIS_X =
    0

    (** Enumerated value for the Y axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
    let _AXIS_Y =
    1

    (** Zero vector, a vector with all components set to [code]0[/code]. *)
    let _ZERO =
    Vector2i(0, 0)

    (** One vector, a vector with all components set to [code]1[/code]. *)
    let _ONE =
    Vector2i(1, 1)

    (** Min vector, a vector with all components equal to [code]INT32_MIN[/code]. Can be used as a negative integer equivalent of [constant Vector2.INF]. *)
    let _MIN =
    Vector2i(-2147483648, -2147483648)

    (** Max vector, a vector with all components equal to [code]INT32_MAX[/code]. Can be used as an integer equivalent of [constant Vector2.INF]. *)
    let _MAX =
    Vector2i(2147483647, 2147483647)

    (** Left unit vector. Represents the direction of left. *)
    let _LEFT =
    Vector2i(-1, 0)

    (** Right unit vector. Represents the direction of right. *)
    let _RIGHT =
    Vector2i(1, 0)

    (** Up unit vector. Y is down in 2D, so this vector points -Y. *)
    let _UP =
    Vector2i(0, -1)

    (** Down unit vector. Y is down in 2D, so this vector points +Y. *)
    let _DOWN =
    Vector2i(0, 1)
    end

  module Rect2 = struct
    (** Returns the center point of the rectangle. This is the same as [code]position + (size / 2.0)[/code]. *)
    let get_center =
    M.foreign_method "Rect2" "get_center" (M.Rect2.typ @-> returning M.Vector2.typ)

    (** Returns the rectangle's area. This is equivalent to [code]size.x  *  size.y[/code]. See also [method has_area]. *)
    let get_area =
    M.foreign_method "Rect2" "get_area" (M.Rect2.typ @-> returning M.Float.typ)

    (** Returns [code]true[/code] if this rectangle has positive width and height. See also [method get_area]. *)
    let has_area =
    M.foreign_method "Rect2" "has_area" (M.Rect2.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if the rectangle contains the given [param point]. By convention, points on the right and bottom edges are [b]not[/b] included.
[b]Note:[/b] This method is not reliable for [Rect2] with a [i]negative[/i] [member size]. Use [method abs] first to get a valid rectangle. *)
    let has_point =
    M.foreign_method "Rect2" "has_point" (M.Vector2.typ @-> M.Rect2.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this rectangle and [param rect] are approximately equal, by calling [method Vector2.is_equal_approx] on the [member position] and the [member size]. *)
    let is_equal_approx =
    M.foreign_method "Rect2" "is_equal_approx" (M.Rect2.typ @-> M.Rect2.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this rectangle's values are finite, by calling [method Vector2.is_finite] on the [member position] and the [member size]. *)
    let is_finite =
    M.foreign_method "Rect2" "is_finite" (M.Rect2.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this rectangle overlaps with the [param b] rectangle. The edges of both rectangles are excluded, unless [param include_borders] is [code]true[/code]. *)
    let intersects =
    M.foreign_method "Rect2" "intersects" (M.Rect2.typ @-> M.Bool.typ @-> M.Rect2.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this rectangle [i]completely[/i] encloses the [param b] rectangle. *)
    let encloses =
    M.foreign_method "Rect2" "encloses" (M.Rect2.typ @-> M.Rect2.typ @-> returning M.Bool.typ)

    (** Returns the intersection between this rectangle and [param b]. If the rectangles do not intersect, returns an empty [Rect2].
[codeblocks]
[gdscript]
var rect1 = Rect2(0, 0, 5, 10)
var rect2 = Rect2(2, 0, 8, 4)

var a = rect1.intersection(rect2) # a is Rect2(2, 0, 3, 4)
[/gdscript]
[csharp]
var rect1 = new Rect2(0, 0, 5, 10);
var rect2 = new Rect2(2, 0, 8, 4);

var a = rect1.Intersection(rect2); // a is Rect2(2, 0, 3, 4)
[/csharp]
[/codeblocks]
[b]Note:[/b] If you only need to know whether two rectangles are overlapping, use [method intersects], instead. *)
    let intersection =
    M.foreign_method "Rect2" "intersection" (M.Rect2.typ @-> M.Rect2.typ @-> returning M.Rect2.typ)

    (** Returns a [Rect2] that encloses both this rectangle and [param b] around the edges. See also [method encloses]. *)
    let merge =
    M.foreign_method "Rect2" "merge" (M.Rect2.typ @-> M.Rect2.typ @-> returning M.Rect2.typ)

    (** Returns a copy of this rectangle expanded to align the edges with the given [param to] point, if necessary.
[codeblocks]
[gdscript]
var rect = Rect2(0, 0, 5, 2)

rect = rect.expand(Vector2(10, 0)) # rect is Rect2(0, 0, 10, 2)
rect = rect.expand(Vector2(-5, 5)) # rect is Rect2(-5, 0, 10, 5)
[/gdscript]
[csharp]
var rect = new Rect2(0, 0, 5, 2);

rect = rect.Expand(new Vector2(10, 0)); // rect is Rect2(0, 0, 10, 2)
rect = rect.Expand(new Vector2(-5, 5)); // rect is Rect2(-5, 0, 10, 5)
[/csharp]
[/codeblocks] *)
    let expand =
    M.foreign_method "Rect2" "expand" (M.Vector2.typ @-> M.Rect2.typ @-> returning M.Rect2.typ)

    (** Returns a copy of this rectangle extended on all sides by the given [param amount]. A negative [param amount] shrinks the rectangle instead. See also [method grow_individual] and [method grow_side].
[codeblocks]
[gdscript]
var a = Rect2(4, 4, 8, 8).grow(4) # a is Rect2(0, 0, 16, 16)
var b = Rect2(0, 0, 8, 4).grow(2) # b is Rect2(-2, -2, 12, 8)
[/gdscript]
[csharp]
var a = new Rect2(4, 4, 8, 8).Grow(4); // a is Rect2(0, 0, 16, 16)
var b = new Rect2(0, 0, 8, 4).Grow(2); // b is Rect2(-2, -2, 12, 8)
[/csharp]
[/codeblocks] *)
    let grow =
    M.foreign_method "Rect2" "grow" (M.Float.typ @-> M.Rect2.typ @-> returning M.Rect2.typ)

    (** Returns a copy of this rectangle with its [param side] extended by the given [param amount] (see [enum Side] constants). A negative [param amount] shrinks the rectangle, instead. See also [method grow] and [method grow_individual]. *)
    let grow_side =
    M.foreign_method "Rect2" "grow_side" (M.Int.typ @-> M.Float.typ @-> M.Rect2.typ @-> returning M.Rect2.typ)

    (** Returns a copy of this rectangle with its [param left], [param top], [param right], and [param bottom] sides extended by the given amounts. Negative values shrink the sides, instead. See also [method grow] and [method grow_side]. *)
    let grow_individual =
    M.foreign_method "Rect2" "grow_individual" (M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Rect2.typ @-> returning M.Rect2.typ)

    (** Returns a [Rect2] equivalent to this rectangle, with its width and height modified to be non-negative values, and with its [member position] being the top-left corner of the rectangle.
[codeblocks]
[gdscript]
var rect = Rect2(25, 25, -100, -50)
var absolute = rect.abs() # absolute is Rect2(-75, -25, 100, 50)
[/gdscript]
[csharp]
var rect = new Rect2(25, 25, -100, -50);
var absolute = rect.Abs(); // absolute is Rect2(-75, -25, 100, 50)
[/csharp]
[/codeblocks]
[b]Note:[/b] It's recommended to use this method when [member size] is negative, as most other methods in Godot assume that the [member position] is the top-left corner, and the [member end] is the bottom-right corner. *)
    let abs =
    M.foreign_method "Rect2" "abs" (M.Rect2.typ @-> returning M.Rect2.typ)






    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_RECT2 None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.Rect2.typ @-> M.Rect2.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if both [member position] and [member size] of the rectangles are exactly equal, respectively.
[b]Note:[/b] Due to floating-point precision errors, consider using [method is_equal_approx] instead, which is more reliable. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_RECT2 (Some GlobalEnum.VariantType._TYPE_RECT2) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.Rect2.typ @-> M.Rect2.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the [member position] or [member size] of both rectangles are not equal.
[b]Note:[/b] Due to floating-point precision errors, consider using [method is_equal_approx] instead, which is more reliable. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_RECT2 (Some GlobalEnum.VariantType._TYPE_RECT2) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.Rect2.typ @-> M.Rect2.typ @-> M.Bool.typ @-> returning void))




    let _Rect2_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_RECT2 (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Rect2.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _Rect2_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_RECT2 (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Rect2.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))
    end

  module Rect2i = struct
    (** Returns the center point of the rectangle. This is the same as [code]position + (size / 2)[/code].
[b]Note:[/b] If the [member size] is odd, the result will be rounded towards [member position]. *)
    let get_center =
    M.foreign_method "Rect2i" "get_center" (M.Rect2i.typ @-> returning M.Vector2i.typ)

    (** Returns the rectangle's area. This is equivalent to [code]size.x  *  size.y[/code]. See also [method has_area]. *)
    let get_area =
    M.foreign_method "Rect2i" "get_area" (M.Rect2i.typ @-> returning M.Int.typ)

    (** Returns [code]true[/code] if this rectangle has positive width and height. See also [method get_area]. *)
    let has_area =
    M.foreign_method "Rect2i" "has_area" (M.Rect2i.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if the rectangle contains the given [param point]. By convention, points on the right and bottom edges are [b]not[/b] included.
[b]Note:[/b] This method is not reliable for [Rect2i] with a [i]negative[/i] [member size]. Use [method abs] first to get a valid rectangle. *)
    let has_point =
    M.foreign_method "Rect2i" "has_point" (M.Vector2i.typ @-> M.Rect2i.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this rectangle overlaps with the [param b] rectangle. The edges of both rectangles are excluded. *)
    let intersects =
    M.foreign_method "Rect2i" "intersects" (M.Rect2i.typ @-> M.Rect2i.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this [Rect2i] completely encloses another one. *)
    let encloses =
    M.foreign_method "Rect2i" "encloses" (M.Rect2i.typ @-> M.Rect2i.typ @-> returning M.Bool.typ)

    (** Returns the intersection between this rectangle and [param b]. If the rectangles do not intersect, returns an empty [Rect2i].
[codeblocks]
[gdscript]
var a = Rect2i(0, 0, 5, 10)
var b = Rect2i(2, 0, 8, 4)

var c = a.intersection(b) # c is Rect2i(2, 0, 3, 4)
[/gdscript]
[csharp]
var a = new Rect2I(0, 0, 5, 10);
var b = new Rect2I(2, 0, 8, 4);

var c = rect1.Intersection(rect2); // c is Rect2I(2, 0, 3, 4)
[/csharp]
[/codeblocks]
[b]Note:[/b] If you only need to know whether two rectangles are overlapping, use [method intersects], instead. *)
    let intersection =
    M.foreign_method "Rect2i" "intersection" (M.Rect2i.typ @-> M.Rect2i.typ @-> returning M.Rect2i.typ)

    (** Returns a [Rect2i] that encloses both this rectangle and [param b] around the edges. See also [method encloses]. *)
    let merge =
    M.foreign_method "Rect2i" "merge" (M.Rect2i.typ @-> M.Rect2i.typ @-> returning M.Rect2i.typ)

    (** Returns a copy of this rectangle expanded to align the edges with the given [param to] point, if necessary.
[codeblocks]
[gdscript]
var rect = Rect2i(0, 0, 5, 2)

rect = rect.expand(Vector2i(10, 0)) # rect is Rect2i(0, 0, 10, 2)
rect = rect.expand(Vector2i(-5, 5)) # rect is Rect2i(-5, 0, 10, 5)
[/gdscript]
[csharp]
var rect = new Rect2I(0, 0, 5, 2);

rect = rect.Expand(new Vector2I(10, 0)); // rect is Rect2I(0, 0, 10, 2)
rect = rect.Expand(new Vector2I(-5, 5)); // rect is Rect2I(-5, 0, 10, 5)
[/csharp]
[/codeblocks] *)
    let expand =
    M.foreign_method "Rect2i" "expand" (M.Vector2i.typ @-> M.Rect2i.typ @-> returning M.Rect2i.typ)

    (** Returns a copy of this rectangle extended on all sides by the given [param amount]. A negative [param amount] shrinks the rectangle instead. See also [method grow_individual] and [method grow_side].
[codeblocks]
[gdscript]
var a = Rect2i(4, 4, 8, 8).grow(4) # a is Rect2i(0, 0, 16, 16)
var b = Rect2i(0, 0, 8, 4).grow(2) # b is Rect2i(-2, -2, 12, 8)
[/gdscript]
[csharp]
var a = new Rect2I(4, 4, 8, 8).Grow(4); // a is Rect2I(0, 0, 16, 16)
var b = new Rect2I(0, 0, 8, 4).Grow(2); // b is Rect2I(-2, -2, 12, 8)
[/csharp]
[/codeblocks] *)
    let grow =
    M.foreign_method "Rect2i" "grow" (M.Int.typ @-> M.Rect2i.typ @-> returning M.Rect2i.typ)

    (** Returns a copy of this rectangle with its [param side] extended by the given [param amount] (see [enum Side] constants). A negative [param amount] shrinks the rectangle, instead. See also [method grow] and [method grow_individual]. *)
    let grow_side =
    M.foreign_method "Rect2i" "grow_side" (M.Int.typ @-> M.Int.typ @-> M.Rect2i.typ @-> returning M.Rect2i.typ)

    (** Returns a copy of this rectangle with its [param left], [param top], [param right], and [param bottom] sides extended by the given amounts. Negative values shrink the sides, instead. See also [method grow] and [method grow_side]. *)
    let grow_individual =
    M.foreign_method "Rect2i" "grow_individual" (M.Int.typ @-> M.Int.typ @-> M.Int.typ @-> M.Int.typ @-> M.Rect2i.typ @-> returning M.Rect2i.typ)

    (** Returns a [Rect2i] equivalent to this rectangle, with its width and height modified to be non-negative values, and with its [member position] being the top-left corner of the rectangle.
[codeblocks]
[gdscript]
var rect = Rect2i(25, 25, -100, -50)
var absolute = rect.abs() # absolute is Rect2i(-75, -25, 100, 50)
[/gdscript]
[csharp]
var rect = new Rect2I(25, 25, -100, -50);
var absolute = rect.Abs(); // absolute is Rect2I(-75, -25, 100, 50)
[/csharp]
[/codeblocks]
[b]Note:[/b] It's recommended to use this method when [member size] is negative, as most other methods in Godot assume that the [member position] is the top-left corner, and the [member end] is the bottom-right corner. *)
    let abs =
    M.foreign_method "Rect2i" "abs" (M.Rect2i.typ @-> returning M.Rect2i.typ)






    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_RECT2I None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.Rect2i.typ @-> M.Rect2i.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if both [member position] and [member size] of the rectangles are equal, respectively. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_RECT2I (Some GlobalEnum.VariantType._TYPE_RECT2I) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.Rect2i.typ @-> M.Rect2i.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the [member position] or [member size] of both rectangles are not equal. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_RECT2I (Some GlobalEnum.VariantType._TYPE_RECT2I) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.Rect2i.typ @-> M.Rect2i.typ @-> M.Bool.typ @-> returning void))


    let _Rect2i_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_RECT2I (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Rect2i.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _Rect2i_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_RECT2I (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Rect2i.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))
    end

  module Vector3 = struct
    (** Returns the axis of the vector's lowest value. See [code]AXIS_ * [/code] constants. If all components are equal, this method returns [constant AXIS_Z]. *)
    let min_axis_index =
    M.foreign_method "Vector3" "min_axis_index" (M.Vector3.typ @-> returning M.Int.typ)

    (** Returns the axis of the vector's highest value. See [code]AXIS_ * [/code] constants. If all components are equal, this method returns [constant AXIS_X]. *)
    let max_axis_index =
    M.foreign_method "Vector3" "max_axis_index" (M.Vector3.typ @-> returning M.Int.typ)

    (** Returns the unsigned minimum angle to the given vector, in radians. *)
    let angle_to =
    M.foreign_method "Vector3" "angle_to" (M.Vector3.typ @-> M.Vector3.typ @-> returning M.Float.typ)

    (** Returns the signed angle to the given vector, in radians. The sign of the angle is positive in a counter-clockwise direction and negative in a clockwise direction when viewed from the side specified by the [param axis]. *)
    let signed_angle_to =
    M.foreign_method "Vector3" "signed_angle_to" (M.Vector3.typ @-> M.Vector3.typ @-> M.Vector3.typ @-> returning M.Float.typ)

    (** Returns the normalized vector pointing from this vector to [param to]. This is equivalent to using [code](b - a).normalized()[/code]. *)
    let direction_to =
    M.foreign_method "Vector3" "direction_to" (M.Vector3.typ @-> M.Vector3.typ @-> returning M.Vector3.typ)

    (** Returns the distance between this vector and [param to]. *)
    let distance_to =
    M.foreign_method "Vector3" "distance_to" (M.Vector3.typ @-> M.Vector3.typ @-> returning M.Float.typ)

    (** Returns the squared distance between this vector and [param to].
This method runs faster than [method distance_to], so prefer it if you need to compare vectors or need the squared distance for some formula. *)
    let distance_squared_to =
    M.foreign_method "Vector3" "distance_squared_to" (M.Vector3.typ @-> M.Vector3.typ @-> returning M.Float.typ)

    (** Returns the length (magnitude) of this vector. *)
    let length =
    M.foreign_method "Vector3" "length" (M.Vector3.typ @-> returning M.Float.typ)

    (** Returns the squared length (squared magnitude) of this vector.
This method runs faster than [method length], so prefer it if you need to compare vectors or need the squared distance for some formula. *)
    let length_squared =
    M.foreign_method "Vector3" "length_squared" (M.Vector3.typ @-> returning M.Float.typ)

    (** Returns the vector with a maximum length by limiting its length to [param length]. *)
    let limit_length =
    M.foreign_method "Vector3" "limit_length" (M.Float.typ @-> M.Vector3.typ @-> returning M.Vector3.typ)

    (** Returns the result of scaling the vector to unit length. Equivalent to [code]v / v.length()[/code]. See also [method is_normalized].
[b]Note:[/b] This function may return incorrect values if the input vector length is near zero. *)
    let normalized =
    M.foreign_method "Vector3" "normalized" (M.Vector3.typ @-> returning M.Vector3.typ)

    (** Returns [code]true[/code] if the vector is normalized, i.e. its length is approximately equal to 1. *)
    let is_normalized =
    M.foreign_method "Vector3" "is_normalized" (M.Vector3.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this vector and [param to] are approximately equal, by running [method @GlobalScope.is_equal_approx] on each component. *)
    let is_equal_approx =
    M.foreign_method "Vector3" "is_equal_approx" (M.Vector3.typ @-> M.Vector3.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this vector's values are approximately zero, by running [method @GlobalScope.is_zero_approx] on each component.
This method is faster than using [method is_equal_approx] with one value as a zero vector. *)
    let is_zero_approx =
    M.foreign_method "Vector3" "is_zero_approx" (M.Vector3.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this vector is finite, by calling [method @GlobalScope.is_finite] on each component. *)
    let is_finite =
    M.foreign_method "Vector3" "is_finite" (M.Vector3.typ @-> returning M.Bool.typ)

    (** Returns the inverse of the vector. This is the same as [code]Vector3(1.0 / v.x, 1.0 / v.y, 1.0 / v.z)[/code]. *)
    let inverse =
    M.foreign_method "Vector3" "inverse" (M.Vector3.typ @-> returning M.Vector3.typ)

    (** Returns a new vector with all components clamped between the components of [param min] and [param max], by running [method @GlobalScope.clamp] on each component. *)
    let clamp =
    M.foreign_method "Vector3" "clamp" (M.Vector3.typ @-> M.Vector3.typ @-> M.Vector3.typ @-> returning M.Vector3.typ)

    (** Returns a new vector with each component snapped to the nearest multiple of the corresponding component in [param step]. This can also be used to round the components to an arbitrary number of decimals. *)
    let snapped =
    M.foreign_method "Vector3" "snapped" (M.Vector3.typ @-> M.Vector3.typ @-> returning M.Vector3.typ)

    (** Returns the result of rotating this vector around a given axis by [param angle] (in radians). The axis must be a normalized vector. See also [method @GlobalScope.deg_to_rad]. *)
    let rotated =
    M.foreign_method "Vector3" "rotated" (M.Vector3.typ @-> M.Float.typ @-> M.Vector3.typ @-> returning M.Vector3.typ)

    (** Returns the result of the linear interpolation between this vector and [param to] by amount [param weight]. [param weight] is on the range of [code]0.0[/code] to [code]1.0[/code], representing the amount of interpolation. *)
    let lerp =
    M.foreign_method "Vector3" "lerp" (M.Vector3.typ @-> M.Float.typ @-> M.Vector3.typ @-> returning M.Vector3.typ)

    (** Returns the result of spherical linear interpolation between this vector and [param to], by amount [param weight]. [param weight] is on the range of 0.0 to 1.0, representing the amount of interpolation.
This method also handles interpolating the lengths if the input vectors have different lengths. For the special case of one or both input vectors having zero length, this method behaves like [method lerp]. *)
    let slerp =
    M.foreign_method "Vector3" "slerp" (M.Vector3.typ @-> M.Float.typ @-> M.Vector3.typ @-> returning M.Vector3.typ)

    (** Performs a cubic interpolation between this vector and [param b] using [param pre_a] and [param post_b] as handles, and returns the result at position [param weight]. [param weight] is on the range of 0.0 to 1.0, representing the amount of interpolation. *)
    let cubic_interpolate =
    M.foreign_method "Vector3" "cubic_interpolate" (M.Vector3.typ @-> M.Vector3.typ @-> M.Vector3.typ @-> M.Float.typ @-> M.Vector3.typ @-> returning M.Vector3.typ)

    (** Performs a cubic interpolation between this vector and [param b] using [param pre_a] and [param post_b] as handles, and returns the result at position [param weight]. [param weight] is on the range of 0.0 to 1.0, representing the amount of interpolation.
It can perform smoother interpolation than [method cubic_interpolate] by the time values. *)
    let cubic_interpolate_in_time =
    M.foreign_method "Vector3" "cubic_interpolate_in_time" (M.Vector3.typ @-> M.Vector3.typ @-> M.Vector3.typ @-> M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Vector3.typ @-> returning M.Vector3.typ)

    (** Returns the point at the given [param t] on the [url=https://en.wikipedia.org/wiki/B%C3%A9zier_curve]Bézier curve[/url] defined by this vector and the given [param control_1], [param control_2], and [param end] points. *)
    let bezier_interpolate =
    M.foreign_method "Vector3" "bezier_interpolate" (M.Vector3.typ @-> M.Vector3.typ @-> M.Vector3.typ @-> M.Float.typ @-> M.Vector3.typ @-> returning M.Vector3.typ)

    (** Returns the derivative at the given [param t] on the [url=https://en.wikipedia.org/wiki/B%C3%A9zier_curve]Bézier curve[/url] defined by this vector and the given [param control_1], [param control_2], and [param end] points. *)
    let bezier_derivative =
    M.foreign_method "Vector3" "bezier_derivative" (M.Vector3.typ @-> M.Vector3.typ @-> M.Vector3.typ @-> M.Float.typ @-> M.Vector3.typ @-> returning M.Vector3.typ)

    (** Returns a new vector moved toward [param to] by the fixed [param delta] amount. Will not go past the final value. *)
    let move_toward =
    M.foreign_method "Vector3" "move_toward" (M.Vector3.typ @-> M.Float.typ @-> M.Vector3.typ @-> returning M.Vector3.typ)

    (** Returns the dot product of this vector and [param with]. This can be used to compare the angle between two vectors. For example, this can be used to determine whether an enemy is facing the player.
The dot product will be [code]0[/code] for a straight angle (90 degrees), greater than 0 for angles narrower than 90 degrees and lower than 0 for angles wider than 90 degrees.
When using unit (normalized) vectors, the result will always be between [code]-1.0[/code] (180 degree angle) when the vectors are facing opposite directions, and [code]1.0[/code] (0 degree angle) when the vectors are aligned.
[b]Note:[/b] [code]a.dot(b)[/code] is equivalent to [code]b.dot(a)[/code]. *)
    let dot =
    M.foreign_method "Vector3" "dot" (M.Vector3.typ @-> M.Vector3.typ @-> returning M.Float.typ)

    (** Returns the cross product of this vector and [param with].
This returns a vector perpendicular to both this and [param with], which would be the normal vector of the plane defined by the two vectors. As there are two such vectors, in opposite directions, this method returns the vector defined by a right-handed coordinate system. If the two vectors are parallel this returns an empty vector, making it useful for testing if two vectors are parallel. *)
    let cross =
    M.foreign_method "Vector3" "cross" (M.Vector3.typ @-> M.Vector3.typ @-> returning M.Vector3.typ)

    (** Returns the outer product with [param with]. *)
    let outer =
    M.foreign_method "Vector3" "outer" (M.Vector3.typ @-> M.Vector3.typ @-> returning M.Basis.typ)

    (** Returns a new vector with all components in absolute values (i.e. positive). *)
    let abs =
    M.foreign_method "Vector3" "abs" (M.Vector3.typ @-> returning M.Vector3.typ)

    (** Returns a new vector with all components rounded down (towards negative infinity). *)
    let floor =
    M.foreign_method "Vector3" "floor" (M.Vector3.typ @-> returning M.Vector3.typ)

    (** Returns a new vector with all components rounded up (towards positive infinity). *)
    let ceil =
    M.foreign_method "Vector3" "ceil" (M.Vector3.typ @-> returning M.Vector3.typ)

    (** Returns a new vector with all components rounded to the nearest integer, with halfway cases rounded away from zero. *)
    let round =
    M.foreign_method "Vector3" "round" (M.Vector3.typ @-> returning M.Vector3.typ)

    (** Returns a vector composed of the [method @GlobalScope.fposmod] of this vector's components and [param mod]. *)
    let posmod =
    M.foreign_method "Vector3" "posmod" (M.Float.typ @-> M.Vector3.typ @-> returning M.Vector3.typ)

    (** Returns a vector composed of the [method @GlobalScope.fposmod] of this vector's components and [param modv]'s components. *)
    let posmodv =
    M.foreign_method "Vector3" "posmodv" (M.Vector3.typ @-> M.Vector3.typ @-> returning M.Vector3.typ)

    (** Returns the result of projecting the vector onto the given vector [param b]. *)
    let project =
    M.foreign_method "Vector3" "project" (M.Vector3.typ @-> M.Vector3.typ @-> returning M.Vector3.typ)

    (** Returns a new vector slid along a plane defined by the given normal. *)
    let slide =
    M.foreign_method "Vector3" "slide" (M.Vector3.typ @-> M.Vector3.typ @-> returning M.Vector3.typ)

    (** Returns the vector ""bounced off"" from a plane defined by the given normal. *)
    let bounce =
    M.foreign_method "Vector3" "bounce" (M.Vector3.typ @-> M.Vector3.typ @-> returning M.Vector3.typ)

    (** Returns the result of reflecting the vector from a plane defined by the given normal [param n]. *)
    let reflect =
    M.foreign_method "Vector3" "reflect" (M.Vector3.typ @-> M.Vector3.typ @-> returning M.Vector3.typ)

    (** Returns a new vector with each component set to [code]1.0[/code] if it's positive, [code]-1.0[/code] if it's negative, and [code]0.0[/code] if it's zero. The result is identical to calling [method @GlobalScope.sign] on each component. *)
    let sign =
    M.foreign_method "Vector3" "sign" (M.Vector3.typ @-> returning M.Vector3.typ)

    (** Returns the octahedral-encoded (oct32) form of this [Vector3] as a [Vector2]. Since a [Vector2] occupies 1/3 less memory compared to [Vector3], this form of compression can be used to pass greater amounts of [method normalized] [Vector3]s without increasing storage or memory requirements. See also [method octahedron_decode].
[b]Note:[/b] [method octahedron_encode] can only be used for [method normalized] vectors. [method octahedron_encode] does [i]not[/i] check whether this [Vector3] is normalized, and will return a value that does not decompress to the original value if the [Vector3] is not normalized.
[b]Note:[/b] Octahedral compression is [i]lossy[/i], although visual differences are rarely perceptible in real world scenarios. *)
    let octahedron_encode =
    M.foreign_method "Vector3" "octahedron_encode" (M.Vector3.typ @-> returning M.Vector2.typ)

    (** Returns the [Vector3] from an octahedral-compressed form created using [method octahedron_encode] (stored as a [Vector2]). *)
    let octahedron_decode =
    M.foreign_method "Vector3" "octahedron_decode" (M.Vector2.typ @-> returning M.Vector3.typ)





    (** Returns the negative value of the [Vector3]. This is the same as writing [code]Vector3(-v.x, -v.y, -v.z)[/code]. This operation flips the direction of the vector while keeping the same magnitude. With floats, the number zero can be either positive or negative. *)
    let (~-) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3 None  Godotcaml.GlobalEnum.VariantOperator._OP_NEGATE
      (funptr (M.Vector3.typ @-> M.Vector3.typ @-> M.Vector3.typ @-> returning void))

    (** Returns the same value as if the [code]+[/code] was not there. Unary [code]+[/code] does nothing, but sometimes it can make your code more readable. *)
    let (~+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3 None  Godotcaml.GlobalEnum.VariantOperator._OP_POSITIVE
      (funptr (M.Vector3.typ @-> M.Vector3.typ @-> M.Vector3.typ @-> returning void))


    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3 None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.Vector3.typ @-> M.Vector3.typ @-> M.Bool.typ @-> returning void))









    (** Returns [code]true[/code] if the vectors are exactly equal.
[b]Note:[/b] Due to floating-point precision errors, consider using [method is_equal_approx] instead, which is more reliable.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this operator may not be accurate if NaNs are included. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3 (Some GlobalEnum.VariantType._TYPE_VECTOR3) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.Vector3.typ @-> M.Vector3.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the vectors are not equal.
[b]Note:[/b] Due to floating-point precision errors, consider using [method is_equal_approx] instead, which is more reliable.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this operator may not be accurate if NaNs are included. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3 (Some GlobalEnum.VariantType._TYPE_VECTOR3) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.Vector3.typ @-> M.Vector3.typ @-> M.Bool.typ @-> returning void))

    (** Compares two [Vector3] vectors by first checking if the X value of the left vector is less than the X value of the [param right] vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors, and then with the Z values. This operator is useful for sorting vectors.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this operator may not be accurate if NaNs are included. *)
    let (<) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3 (Some GlobalEnum.VariantType._TYPE_VECTOR3) Godotcaml.GlobalEnum.VariantOperator._OP_LESS
      (funptr (M.Vector3.typ @-> M.Vector3.typ @-> M.Bool.typ @-> returning void))

    (** Compares two [Vector3] vectors by first checking if the X value of the left vector is less than or equal to the X value of the [param right] vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors, and then with the Z values. This operator is useful for sorting vectors.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this operator may not be accurate if NaNs are included. *)
    let (<=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3 (Some GlobalEnum.VariantType._TYPE_VECTOR3) Godotcaml.GlobalEnum.VariantOperator._OP_LESS_EQUAL
      (funptr (M.Vector3.typ @-> M.Vector3.typ @-> M.Bool.typ @-> returning void))

    (** Compares two [Vector3] vectors by first checking if the X value of the left vector is greater than the X value of the [param right] vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors, and then with the Z values. This operator is useful for sorting vectors.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this operator may not be accurate if NaNs are included. *)
    let (>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3 (Some GlobalEnum.VariantType._TYPE_VECTOR3) Godotcaml.GlobalEnum.VariantOperator._OP_GREATER
      (funptr (M.Vector3.typ @-> M.Vector3.typ @-> M.Bool.typ @-> returning void))

    (** Compares two [Vector3] vectors by first checking if the X value of the left vector is greater than or equal to the X value of the [param right] vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors, and then with the Z values. This operator is useful for sorting vectors.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this operator may not be accurate if NaNs are included. *)
    let (>=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3 (Some GlobalEnum.VariantType._TYPE_VECTOR3) Godotcaml.GlobalEnum.VariantOperator._OP_GREATER_EQUAL
      (funptr (M.Vector3.typ @-> M.Vector3.typ @-> M.Bool.typ @-> returning void))

    (** Adds each component of the [Vector3] by the components of the given [Vector3].
[codeblock]
print(Vector3(10, 20, 30) + Vector3(3, 4, 5)) # Prints ""(13, 24, 35)""
[/codeblock] *)
    let (+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3 (Some GlobalEnum.VariantType._TYPE_VECTOR3) Godotcaml.GlobalEnum.VariantOperator._OP_ADD
      (funptr (M.Vector3.typ @-> M.Vector3.typ @-> M.Vector3.typ @-> returning void))

    (** Subtracts each component of the [Vector3] by the components of the given [Vector3].
[codeblock]
print(Vector3(10, 20, 30) - Vector3(3, 4, 5)) # Prints ""(7, 16, 25)""
[/codeblock] *)
    let (-) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3 (Some GlobalEnum.VariantType._TYPE_VECTOR3) Godotcaml.GlobalEnum.VariantOperator._OP_SUBTRACT
      (funptr (M.Vector3.typ @-> M.Vector3.typ @-> M.Vector3.typ @-> returning void))

    (** Multiplies each component of the [Vector3] by the components of the given [Vector3].
[codeblock]
print(Vector3(10, 20, 30)  *  Vector3(3, 4, 5)) # Prints ""(30, 80, 150)""
[/codeblock] *)
    let ( * ) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3 (Some GlobalEnum.VariantType._TYPE_VECTOR3) Godotcaml.GlobalEnum.VariantOperator._OP_MULTIPLY
      (funptr (M.Vector3.typ @-> M.Vector3.typ @-> M.Vector3.typ @-> returning void))

    (** Divides each component of the [Vector3] by the components of the given [Vector3].
[codeblock]
print(Vector3(10, 20, 30) / Vector3(2, 5, 3)) # Prints ""(5, 4, 10)""
[/codeblock] *)
    let (/) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3 (Some GlobalEnum.VariantType._TYPE_VECTOR3) Godotcaml.GlobalEnum.VariantOperator._OP_DIVIDE
      (funptr (M.Vector3.typ @-> M.Vector3.typ @-> M.Vector3.typ @-> returning void))








    let _Vector3_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3 (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Vector3.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _Vector3_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3 (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Vector3.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))


    let _Vector3_elem_PackedVector3Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3 (Some GlobalEnum.VariantType._TYPE_PACKED_VECTOR3_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Vector3.typ @-> M.PackedVector3Array.typ @-> M.Bool.typ @-> returning void))

    module Axis = struct
      (** Enumerated value for the X axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
      let _AXIS_X =
      0

      (** Enumerated value for the Y axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
      let _AXIS_Y =
      1

      (** Enumerated value for the Z axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
      let _AXIS_Z =
      2
      end

    (** Enumerated value for the X axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
    let _AXIS_X =
    0

    (** Enumerated value for the Y axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
    let _AXIS_Y =
    1

    (** Enumerated value for the Z axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
    let _AXIS_Z =
    2

    (** Zero vector, a vector with all components set to [code]0[/code]. *)
    let _ZERO =
    Vector3(0, 0, 0)

    (** One vector, a vector with all components set to [code]1[/code]. *)
    let _ONE =
    Vector3(1, 1, 1)

    (** Infinity vector, a vector with all components set to [constant @GDScript.INF]. *)
    let _INF =
    Vector3(inf, inf, inf)

    (** Left unit vector. Represents the local direction of left, and the global direction of west. *)
    let _LEFT =
    Vector3(-1, 0, 0)

    (** Right unit vector. Represents the local direction of right, and the global direction of east. *)
    let _RIGHT =
    Vector3(1, 0, 0)

    (** Up unit vector. *)
    let _UP =
    Vector3(0, 1, 0)

    (** Down unit vector. *)
    let _DOWN =
    Vector3(0, -1, 0)

    (** Forward unit vector. Represents the local direction of forward, and the global direction of north. Keep in mind that the forward direction for lights, cameras, etc is different from 3D assets like characters, which face towards the camera by convention. Use [constant Vector3.MODEL_FRONT] and similar constants when working in 3D asset space. *)
    let _FORWARD =
    Vector3(0, 0, -1)

    (** Back unit vector. Represents the local direction of back, and the global direction of south. *)
    let _BACK =
    Vector3(0, 0, 1)

    (** Unit vector pointing towards the left side of imported 3D assets. *)
    let _MODEL_LEFT =
    Vector3(1, 0, 0)

    (** Unit vector pointing towards the right side of imported 3D assets. *)
    let _MODEL_RIGHT =
    Vector3(-1, 0, 0)

    (** Unit vector pointing towards the top side (up) of imported 3D assets. *)
    let _MODEL_TOP =
    Vector3(0, 1, 0)

    (** Unit vector pointing towards the bottom side (down) of imported 3D assets. *)
    let _MODEL_BOTTOM =
    Vector3(0, -1, 0)

    (** Unit vector pointing towards the front side (facing forward) of imported 3D assets. *)
    let _MODEL_FRONT =
    Vector3(0, 0, 1)

    (** Unit vector pointing towards the rear side (back) of imported 3D assets. *)
    let _MODEL_REAR =
    Vector3(0, 0, -1)
    end

  module Vector3i = struct
    (** Returns the axis of the vector's lowest value. See [code]AXIS_ * [/code] constants. If all components are equal, this method returns [constant AXIS_Z]. *)
    let min_axis_index =
    M.foreign_method "Vector3i" "min_axis_index" (M.Vector3i.typ @-> returning M.Int.typ)

    (** Returns the axis of the vector's highest value. See [code]AXIS_ * [/code] constants. If all components are equal, this method returns [constant AXIS_X]. *)
    let max_axis_index =
    M.foreign_method "Vector3i" "max_axis_index" (M.Vector3i.typ @-> returning M.Int.typ)

    (** Returns the length (magnitude) of this vector. *)
    let length =
    M.foreign_method "Vector3i" "length" (M.Vector3i.typ @-> returning M.Float.typ)

    (** Returns the squared length (squared magnitude) of this vector.
This method runs faster than [method length], so prefer it if you need to compare vectors or need the squared distance for some formula. *)
    let length_squared =
    M.foreign_method "Vector3i" "length_squared" (M.Vector3i.typ @-> returning M.Int.typ)

    (** Returns a new vector with each component set to [code]1[/code] if it's positive, [code]-1[/code] if it's negative, and [code]0[/code] if it's zero. The result is identical to calling [method @GlobalScope.sign] on each component. *)
    let sign =
    M.foreign_method "Vector3i" "sign" (M.Vector3i.typ @-> returning M.Vector3i.typ)

    (** Returns a new vector with all components in absolute values (i.e. positive). *)
    let abs =
    M.foreign_method "Vector3i" "abs" (M.Vector3i.typ @-> returning M.Vector3i.typ)

    (** Returns a new vector with all components clamped between the components of [param min] and [param max], by running [method @GlobalScope.clamp] on each component. *)
    let clamp =
    M.foreign_method "Vector3i" "clamp" (M.Vector3i.typ @-> M.Vector3i.typ @-> M.Vector3i.typ @-> returning M.Vector3i.typ)

    (** Returns a new vector with each component snapped to the closest multiple of the corresponding component in [param step]. *)
    let snapped =
    M.foreign_method "Vector3i" "snapped" (M.Vector3i.typ @-> M.Vector3i.typ @-> returning M.Vector3i.typ)





    (** Returns the negative value of the [Vector3i]. This is the same as writing [code]Vector3i(-v.x, -v.y, -v.z)[/code]. This operation flips the direction of the vector while keeping the same magnitude. *)
    let (~-) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3I None  Godotcaml.GlobalEnum.VariantOperator._OP_NEGATE
      (funptr (M.Vector3i.typ @-> M.Vector3i.typ @-> M.Vector3i.typ @-> returning void))

    (** Returns the same value as if the [code]+[/code] was not there. Unary [code]+[/code] does nothing, but sometimes it can make your code more readable. *)
    let (~+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3I None  Godotcaml.GlobalEnum.VariantOperator._OP_POSITIVE
      (funptr (M.Vector3i.typ @-> M.Vector3i.typ @-> M.Vector3i.typ @-> returning void))


    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3I None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.Vector3i.typ @-> M.Vector3i.typ @-> M.Bool.typ @-> returning void))











    (** Returns [code]true[/code] if the vectors are equal. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3I (Some GlobalEnum.VariantType._TYPE_VECTOR3I) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.Vector3i.typ @-> M.Vector3i.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the vectors are not equal. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3I (Some GlobalEnum.VariantType._TYPE_VECTOR3I) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.Vector3i.typ @-> M.Vector3i.typ @-> M.Bool.typ @-> returning void))

    (** Compares two [Vector3i] vectors by first checking if the X value of the left vector is less than the X value of the [param right] vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors, and then with the Z values. This operator is useful for sorting vectors. *)
    let (<) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3I (Some GlobalEnum.VariantType._TYPE_VECTOR3I) Godotcaml.GlobalEnum.VariantOperator._OP_LESS
      (funptr (M.Vector3i.typ @-> M.Vector3i.typ @-> M.Bool.typ @-> returning void))

    (** Compares two [Vector3i] vectors by first checking if the X value of the left vector is less than or equal to the X value of the [param right] vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors, and then with the Z values. This operator is useful for sorting vectors. *)
    let (<=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3I (Some GlobalEnum.VariantType._TYPE_VECTOR3I) Godotcaml.GlobalEnum.VariantOperator._OP_LESS_EQUAL
      (funptr (M.Vector3i.typ @-> M.Vector3i.typ @-> M.Bool.typ @-> returning void))

    (** Compares two [Vector3i] vectors by first checking if the X value of the left vector is greater than the X value of the [param right] vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors, and then with the Z values. This operator is useful for sorting vectors. *)
    let (>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3I (Some GlobalEnum.VariantType._TYPE_VECTOR3I) Godotcaml.GlobalEnum.VariantOperator._OP_GREATER
      (funptr (M.Vector3i.typ @-> M.Vector3i.typ @-> M.Bool.typ @-> returning void))

    (** Compares two [Vector3i] vectors by first checking if the X value of the left vector is greater than or equal to the X value of the [param right] vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors, and then with the Z values. This operator is useful for sorting vectors. *)
    let (>=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3I (Some GlobalEnum.VariantType._TYPE_VECTOR3I) Godotcaml.GlobalEnum.VariantOperator._OP_GREATER_EQUAL
      (funptr (M.Vector3i.typ @-> M.Vector3i.typ @-> M.Bool.typ @-> returning void))

    (** Adds each component of the [Vector3i] by the components of the given [Vector3i].
[codeblock]
print(Vector3i(10, 20, 30) + Vector3i(3, 4, 5)) # Prints ""(13, 24, 35)""
[/codeblock] *)
    let (+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3I (Some GlobalEnum.VariantType._TYPE_VECTOR3I) Godotcaml.GlobalEnum.VariantOperator._OP_ADD
      (funptr (M.Vector3i.typ @-> M.Vector3i.typ @-> M.Vector3i.typ @-> returning void))

    (** Subtracts each component of the [Vector3i] by the components of the given [Vector3i].
[codeblock]
print(Vector3i(10, 20, 30) - Vector3i(3, 4, 5)) # Prints ""(7, 16, 25)""
[/codeblock] *)
    let (-) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3I (Some GlobalEnum.VariantType._TYPE_VECTOR3I) Godotcaml.GlobalEnum.VariantOperator._OP_SUBTRACT
      (funptr (M.Vector3i.typ @-> M.Vector3i.typ @-> M.Vector3i.typ @-> returning void))

    (** Multiplies each component of the [Vector3i] by the components of the given [Vector3i].
[codeblock]
print(Vector3i(10, 20, 30)  *  Vector3i(3, 4, 5)) # Prints ""(30, 80, 150)""
[/codeblock] *)
    let ( * ) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3I (Some GlobalEnum.VariantType._TYPE_VECTOR3I) Godotcaml.GlobalEnum.VariantOperator._OP_MULTIPLY
      (funptr (M.Vector3i.typ @-> M.Vector3i.typ @-> M.Vector3i.typ @-> returning void))

    (** Divides each component of the [Vector3i] by the components of the given [Vector3i].
[codeblock]
print(Vector3i(10, 20, 30) / Vector3i(2, 5, 3)) # Prints ""(5, 4, 10)""
[/codeblock] *)
    let (/) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3I (Some GlobalEnum.VariantType._TYPE_VECTOR3I) Godotcaml.GlobalEnum.VariantOperator._OP_DIVIDE
      (funptr (M.Vector3i.typ @-> M.Vector3i.typ @-> M.Vector3i.typ @-> returning void))

    (** Gets the remainder of each component of the [Vector3i] with the components of the given [Vector3i]. This operation uses truncated division, which is often not desired as it does not work well with negative numbers. Consider using [method @GlobalScope.posmod] instead if you want to handle negative numbers.
[codeblock]
print(Vector3i(10, -20, 30) % Vector3i(7, 8, 9)) # Prints ""(3, -4, 3)""
[/codeblock] *)
    let (%) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3I (Some GlobalEnum.VariantType._TYPE_VECTOR3I) Godotcaml.GlobalEnum.VariantOperator._OP_MODULE
      (funptr (M.Vector3i.typ @-> M.Vector3i.typ @-> M.Vector3i.typ @-> returning void))


    let _Vector3i_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3I (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Vector3i.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _Vector3i_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR3I (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Vector3i.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))

    module Axis = struct
      (** Enumerated value for the X axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
      let _AXIS_X =
      0

      (** Enumerated value for the Y axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
      let _AXIS_Y =
      1

      (** Enumerated value for the Z axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
      let _AXIS_Z =
      2
      end

    (** Enumerated value for the X axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
    let _AXIS_X =
    0

    (** Enumerated value for the Y axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
    let _AXIS_Y =
    1

    (** Enumerated value for the Z axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
    let _AXIS_Z =
    2

    (** Zero vector, a vector with all components set to [code]0[/code]. *)
    let _ZERO =
    Vector3i(0, 0, 0)

    (** One vector, a vector with all components set to [code]1[/code]. *)
    let _ONE =
    Vector3i(1, 1, 1)

    (** Min vector, a vector with all components equal to [code]INT32_MIN[/code]. Can be used as a negative integer equivalent of [constant Vector3.INF]. *)
    let _MIN =
    Vector3i(-2147483648, -2147483648, -2147483648)

    (** Max vector, a vector with all components equal to [code]INT32_MAX[/code]. Can be used as an integer equivalent of [constant Vector3.INF]. *)
    let _MAX =
    Vector3i(2147483647, 2147483647, 2147483647)

    (** Left unit vector. Represents the local direction of left, and the global direction of west. *)
    let _LEFT =
    Vector3i(-1, 0, 0)

    (** Right unit vector. Represents the local direction of right, and the global direction of east. *)
    let _RIGHT =
    Vector3i(1, 0, 0)

    (** Up unit vector. *)
    let _UP =
    Vector3i(0, 1, 0)

    (** Down unit vector. *)
    let _DOWN =
    Vector3i(0, -1, 0)

    (** Forward unit vector. Represents the local direction of forward, and the global direction of north. *)
    let _FORWARD =
    Vector3i(0, 0, -1)

    (** Back unit vector. Represents the local direction of back, and the global direction of south. *)
    let _BACK =
    Vector3i(0, 0, 1)
    end

  module Transform2D = struct
    (** Returns the inverse of the transform, under the assumption that the transformation basis is orthonormal (i.e. rotation/reflection is fine, scaling/skew is not). Use [method affine_inverse] for non-orthonormal transforms (e.g. with scaling). *)
    let inverse =
    M.foreign_method "Transform2D" "inverse" (M.Transform2D.typ @-> returning M.Transform2D.typ)

    (** Returns the inverse of the transform, under the assumption that the basis is invertible (must have non-zero determinant). *)
    let affine_inverse =
    M.foreign_method "Transform2D" "affine_inverse" (M.Transform2D.typ @-> returning M.Transform2D.typ)

    (** Returns the transform's rotation (in radians). *)
    let get_rotation =
    M.foreign_method "Transform2D" "get_rotation" (M.Transform2D.typ @-> returning M.Float.typ)

    (** Returns the transform's origin (translation). *)
    let get_origin =
    M.foreign_method "Transform2D" "get_origin" (M.Transform2D.typ @-> returning M.Vector2.typ)

    (** Returns the scale. *)
    let get_scale =
    M.foreign_method "Transform2D" "get_scale" (M.Transform2D.typ @-> returning M.Vector2.typ)

    (** Returns the transform's skew (in radians). *)
    let get_skew =
    M.foreign_method "Transform2D" "get_skew" (M.Transform2D.typ @-> returning M.Float.typ)

    (** Returns the transform with the basis orthogonal (90 degrees), and normalized axis vectors (scale of 1 or -1). *)
    let orthonormalized =
    M.foreign_method "Transform2D" "orthonormalized" (M.Transform2D.typ @-> returning M.Transform2D.typ)

    (** Returns a copy of the transform rotated by the given [param angle] (in radians).
This method is an optimized version of multiplying the given transform [code]X[/code] with a corresponding rotation transform [code]R[/code] from the left, i.e., [code]R  *  X[/code].
This can be seen as transforming with respect to the global/parent frame. *)
    let rotated =
    M.foreign_method "Transform2D" "rotated" (M.Float.typ @-> M.Transform2D.typ @-> returning M.Transform2D.typ)

    (** Returns a copy of the transform rotated by the given [param angle] (in radians).
This method is an optimized version of multiplying the given transform [code]X[/code] with a corresponding rotation transform [code]R[/code] from the right, i.e., [code]X  *  R[/code].
This can be seen as transforming with respect to the local frame. *)
    let rotated_local =
    M.foreign_method "Transform2D" "rotated_local" (M.Float.typ @-> M.Transform2D.typ @-> returning M.Transform2D.typ)

    (** Returns a copy of the transform scaled by the given [param scale] factor.
This method is an optimized version of multiplying the given transform [code]X[/code] with a corresponding scaling transform [code]S[/code] from the left, i.e., [code]S  *  X[/code].
This can be seen as transforming with respect to the global/parent frame. *)
    let scaled =
    M.foreign_method "Transform2D" "scaled" (M.Vector2.typ @-> M.Transform2D.typ @-> returning M.Transform2D.typ)

    (** Returns a copy of the transform scaled by the given [param scale] factor.
This method is an optimized version of multiplying the given transform [code]X[/code] with a corresponding scaling transform [code]S[/code] from the right, i.e., [code]X  *  S[/code].
This can be seen as transforming with respect to the local frame. *)
    let scaled_local =
    M.foreign_method "Transform2D" "scaled_local" (M.Vector2.typ @-> M.Transform2D.typ @-> returning M.Transform2D.typ)

    (** Returns a copy of the transform translated by the given [param offset].
This method is an optimized version of multiplying the given transform [code]X[/code] with a corresponding translation transform [code]T[/code] from the left, i.e., [code]T  *  X[/code].
This can be seen as transforming with respect to the global/parent frame. *)
    let translated =
    M.foreign_method "Transform2D" "translated" (M.Vector2.typ @-> M.Transform2D.typ @-> returning M.Transform2D.typ)

    (** Returns a copy of the transform translated by the given [param offset].
This method is an optimized version of multiplying the given transform [code]X[/code] with a corresponding translation transform [code]T[/code] from the right, i.e., [code]X  *  T[/code].
This can be seen as transforming with respect to the local frame. *)
    let translated_local =
    M.foreign_method "Transform2D" "translated_local" (M.Vector2.typ @-> M.Transform2D.typ @-> returning M.Transform2D.typ)

    (** Returns the determinant of the basis matrix. If the basis is uniformly scaled, then its determinant equals the square of the scale factor.
A negative determinant means the basis was flipped, so one part of the scale is negative. A zero determinant means the basis isn't invertible, and is usually considered invalid. *)
    let determinant =
    M.foreign_method "Transform2D" "determinant" (M.Transform2D.typ @-> returning M.Float.typ)

    (** Returns a vector transformed (multiplied) by the basis matrix.
This method does not account for translation (the [member origin] vector). *)
    let basis_xform =
    M.foreign_method "Transform2D" "basis_xform" (M.Vector2.typ @-> M.Transform2D.typ @-> returning M.Vector2.typ)

    (** Returns a vector transformed (multiplied) by the inverse basis matrix, under the assumption that the basis is orthonormal (i.e. rotation/reflection is fine, scaling/skew is not).
This method does not account for translation (the [member origin] vector).
[code]transform.basis_xform_inv(vector)[/code] is equivalent to [code]transform.inverse().basis_xform(vector)[/code]. See [method inverse].
For non-orthonormal transforms (e.g. with scaling) [code]transform.affine_inverse().basis_xform(vector)[/code] can be used instead. See [method affine_inverse]. *)
    let basis_xform_inv =
    M.foreign_method "Transform2D" "basis_xform_inv" (M.Vector2.typ @-> M.Transform2D.typ @-> returning M.Vector2.typ)

    (** Returns a transform interpolated between this transform and another by a given [param weight] (on the range of 0.0 to 1.0). *)
    let interpolate_with =
    M.foreign_method "Transform2D" "interpolate_with" (M.Transform2D.typ @-> M.Float.typ @-> M.Transform2D.typ @-> returning M.Transform2D.typ)

    (** Returns [code]true[/code] if the transform's basis is conformal, meaning it preserves angles and distance ratios, and may only be composed of rotation and uniform scale. Returns [code]false[/code] if the transform's basis has non-uniform scale or shear/skew. This can be used to validate if the transform is non-distorted, which is important for physics and other use cases. *)
    let is_conformal =
    M.foreign_method "Transform2D" "is_conformal" (M.Transform2D.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this transform and [param xform] are approximately equal, by running [method @GlobalScope.is_equal_approx] on each component. *)
    let is_equal_approx =
    M.foreign_method "Transform2D" "is_equal_approx" (M.Transform2D.typ @-> M.Transform2D.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this transform is finite, by calling [method @GlobalScope.is_finite] on each component. *)
    let is_finite =
    M.foreign_method "Transform2D" "is_finite" (M.Transform2D.typ @-> returning M.Bool.typ)

    (** Returns a copy of the transform rotated such that the rotated X-axis points towards the [param target] position.
Operations take place in global space. *)
    let looking_at =
    M.foreign_method "Transform2D" "looking_at" (M.Vector2.typ @-> M.Transform2D.typ @-> returning M.Transform2D.typ)






    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_TRANSFORM2_D None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.Transform2D.typ @-> M.Transform2D.typ @-> M.Bool.typ @-> returning void))









    (** Returns [code]true[/code] if the transforms are exactly equal.
[b]Note:[/b] Due to floating-point precision errors, consider using [method is_equal_approx] instead, which is more reliable. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_TRANSFORM2_D (Some GlobalEnum.VariantType._TYPE_TRANSFORM2_D) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.Transform2D.typ @-> M.Transform2D.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the transforms are not equal.
[b]Note:[/b] Due to floating-point precision errors, consider using [method is_equal_approx] instead, which is more reliable. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_TRANSFORM2_D (Some GlobalEnum.VariantType._TYPE_TRANSFORM2_D) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.Transform2D.typ @-> M.Transform2D.typ @-> M.Bool.typ @-> returning void))

    (** Composes these two transformation matrices by multiplying them together. This has the effect of transforming the second transform (the child) by the first transform (the parent). *)
    let ( * ) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_TRANSFORM2_D (Some GlobalEnum.VariantType._TYPE_TRANSFORM2_D) Godotcaml.GlobalEnum.VariantOperator._OP_MULTIPLY
      (funptr (M.Transform2D.typ @-> M.Transform2D.typ @-> M.Transform2D.typ @-> returning void))


    let _Transform2D_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_TRANSFORM2_D (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Transform2D.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _Transform2D_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_TRANSFORM2_D (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Transform2D.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))



    (** The identity [Transform2D] with no translation, rotation or scaling applied. When applied to other data structures, [constant IDENTITY] performs no transformation. *)
    let _IDENTITY =
    Transform2D(1, 0, 0, 1, 0, 0)

    (** The [Transform2D] that will flip something along the X axis. *)
    let _FLIP_X =
    Transform2D(-1, 0, 0, 1, 0, 0)

    (** The [Transform2D] that will flip something along the Y axis. *)
    let _FLIP_Y =
    Transform2D(1, 0, 0, -1, 0, 0)
    end

  module Vector4 = struct
    (** Returns the axis of the vector's lowest value. See [code]AXIS_ * [/code] constants. If all components are equal, this method returns [constant AXIS_W]. *)
    let min_axis_index =
    M.foreign_method "Vector4" "min_axis_index" (M.Vector4.typ @-> returning M.Int.typ)

    (** Returns the axis of the vector's highest value. See [code]AXIS_ * [/code] constants. If all components are equal, this method returns [constant AXIS_X]. *)
    let max_axis_index =
    M.foreign_method "Vector4" "max_axis_index" (M.Vector4.typ @-> returning M.Int.typ)

    (** Returns the length (magnitude) of this vector. *)
    let length =
    M.foreign_method "Vector4" "length" (M.Vector4.typ @-> returning M.Float.typ)

    (** Returns the squared length (squared magnitude) of this vector.
This method runs faster than [method length], so prefer it if you need to compare vectors or need the squared distance for some formula. *)
    let length_squared =
    M.foreign_method "Vector4" "length_squared" (M.Vector4.typ @-> returning M.Float.typ)

    (** Returns a new vector with all components in absolute values (i.e. positive). *)
    let abs =
    M.foreign_method "Vector4" "abs" (M.Vector4.typ @-> returning M.Vector4.typ)

    (** Returns a new vector with each component set to [code]1.0[/code] if it's positive, [code]-1.0[/code] if it's negative, and [code]0.0[/code] if it's zero. The result is identical to calling [method @GlobalScope.sign] on each component. *)
    let sign =
    M.foreign_method "Vector4" "sign" (M.Vector4.typ @-> returning M.Vector4.typ)

    (** Returns a new vector with all components rounded down (towards negative infinity). *)
    let floor =
    M.foreign_method "Vector4" "floor" (M.Vector4.typ @-> returning M.Vector4.typ)

    (** Returns a new vector with all components rounded up (towards positive infinity). *)
    let ceil =
    M.foreign_method "Vector4" "ceil" (M.Vector4.typ @-> returning M.Vector4.typ)

    (** Returns a new vector with all components rounded to the nearest integer, with halfway cases rounded away from zero. *)
    let round =
    M.foreign_method "Vector4" "round" (M.Vector4.typ @-> returning M.Vector4.typ)

    (** Returns the result of the linear interpolation between this vector and [param to] by amount [param weight]. [param weight] is on the range of [code]0.0[/code] to [code]1.0[/code], representing the amount of interpolation. *)
    let lerp =
    M.foreign_method "Vector4" "lerp" (M.Vector4.typ @-> M.Float.typ @-> M.Vector4.typ @-> returning M.Vector4.typ)

    (** Performs a cubic interpolation between this vector and [param b] using [param pre_a] and [param post_b] as handles, and returns the result at position [param weight]. [param weight] is on the range of 0.0 to 1.0, representing the amount of interpolation. *)
    let cubic_interpolate =
    M.foreign_method "Vector4" "cubic_interpolate" (M.Vector4.typ @-> M.Vector4.typ @-> M.Vector4.typ @-> M.Float.typ @-> M.Vector4.typ @-> returning M.Vector4.typ)

    (** Performs a cubic interpolation between this vector and [param b] using [param pre_a] and [param post_b] as handles, and returns the result at position [param weight]. [param weight] is on the range of 0.0 to 1.0, representing the amount of interpolation.
It can perform smoother interpolation than [method cubic_interpolate] by the time values. *)
    let cubic_interpolate_in_time =
    M.foreign_method "Vector4" "cubic_interpolate_in_time" (M.Vector4.typ @-> M.Vector4.typ @-> M.Vector4.typ @-> M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Vector4.typ @-> returning M.Vector4.typ)

    (** Returns a vector composed of the [method @GlobalScope.fposmod] of this vector's components and [param mod]. *)
    let posmod =
    M.foreign_method "Vector4" "posmod" (M.Float.typ @-> M.Vector4.typ @-> returning M.Vector4.typ)

    (** Returns a vector composed of the [method @GlobalScope.fposmod] of this vector's components and [param modv]'s components. *)
    let posmodv =
    M.foreign_method "Vector4" "posmodv" (M.Vector4.typ @-> M.Vector4.typ @-> returning M.Vector4.typ)

    (** Returns a new vector with each component snapped to the nearest multiple of the corresponding component in [param step]. This can also be used to round the components to an arbitrary number of decimals. *)
    let snapped =
    M.foreign_method "Vector4" "snapped" (M.Vector4.typ @-> M.Vector4.typ @-> returning M.Vector4.typ)

    (** Returns a new vector with all components clamped between the components of [param min] and [param max], by running [method @GlobalScope.clamp] on each component. *)
    let clamp =
    M.foreign_method "Vector4" "clamp" (M.Vector4.typ @-> M.Vector4.typ @-> M.Vector4.typ @-> returning M.Vector4.typ)

    (** Returns the result of scaling the vector to unit length. Equivalent to [code]v / v.length()[/code]. See also [method is_normalized].
[b]Note:[/b] This function may return incorrect values if the input vector length is near zero. *)
    let normalized =
    M.foreign_method "Vector4" "normalized" (M.Vector4.typ @-> returning M.Vector4.typ)

    (** Returns [code]true[/code] if the vector is normalized, i.e. its length is approximately equal to 1. *)
    let is_normalized =
    M.foreign_method "Vector4" "is_normalized" (M.Vector4.typ @-> returning M.Bool.typ)

    (** Returns the normalized vector pointing from this vector to [param to]. This is equivalent to using [code](b - a).normalized()[/code]. *)
    let direction_to =
    M.foreign_method "Vector4" "direction_to" (M.Vector4.typ @-> M.Vector4.typ @-> returning M.Vector4.typ)

    (** Returns the distance between this vector and [param to]. *)
    let distance_to =
    M.foreign_method "Vector4" "distance_to" (M.Vector4.typ @-> M.Vector4.typ @-> returning M.Float.typ)

    (** Returns the squared distance between this vector and [param to].
This method runs faster than [method distance_to], so prefer it if you need to compare vectors or need the squared distance for some formula. *)
    let distance_squared_to =
    M.foreign_method "Vector4" "distance_squared_to" (M.Vector4.typ @-> M.Vector4.typ @-> returning M.Float.typ)

    (** Returns the dot product of this vector and [param with]. *)
    let dot =
    M.foreign_method "Vector4" "dot" (M.Vector4.typ @-> M.Vector4.typ @-> returning M.Float.typ)

    (** Returns the inverse of the vector. This is the same as [code]Vector4(1.0 / v.x, 1.0 / v.y, 1.0 / v.z, 1.0 / v.w)[/code]. *)
    let inverse =
    M.foreign_method "Vector4" "inverse" (M.Vector4.typ @-> returning M.Vector4.typ)

    (** Returns [code]true[/code] if this vector and [param to] are approximately equal, by running [method @GlobalScope.is_equal_approx] on each component. *)
    let is_equal_approx =
    M.foreign_method "Vector4" "is_equal_approx" (M.Vector4.typ @-> M.Vector4.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this vector's values are approximately zero, by running [method @GlobalScope.is_zero_approx] on each component.
This method is faster than using [method is_equal_approx] with one value as a zero vector. *)
    let is_zero_approx =
    M.foreign_method "Vector4" "is_zero_approx" (M.Vector4.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this vector is finite, by calling [method @GlobalScope.is_finite] on each component. *)
    let is_finite =
    M.foreign_method "Vector4" "is_finite" (M.Vector4.typ @-> returning M.Bool.typ)





    (** Returns the negative value of the [Vector4]. This is the same as writing [code]Vector4(-v.x, -v.y, -v.z, -v.w)[/code]. This operation flips the direction of the vector while keeping the same magnitude. With floats, the number zero can be either positive or negative. *)
    let (~-) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4 None  Godotcaml.GlobalEnum.VariantOperator._OP_NEGATE
      (funptr (M.Vector4.typ @-> M.Vector4.typ @-> M.Vector4.typ @-> returning void))

    (** Returns the same value as if the [code]+[/code] was not there. Unary [code]+[/code] does nothing, but sometimes it can make your code more readable. *)
    let (~+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4 None  Godotcaml.GlobalEnum.VariantOperator._OP_POSITIVE
      (funptr (M.Vector4.typ @-> M.Vector4.typ @-> M.Vector4.typ @-> returning void))


    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4 None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.Vector4.typ @-> M.Vector4.typ @-> M.Bool.typ @-> returning void))









    (** Returns [code]true[/code] if the vectors are exactly equal.
[b]Note:[/b] Due to floating-point precision errors, consider using [method is_equal_approx] instead, which is more reliable.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this operator may not be accurate if NaNs are included. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4 (Some GlobalEnum.VariantType._TYPE_VECTOR4) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.Vector4.typ @-> M.Vector4.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the vectors are not equal.
[b]Note:[/b] Due to floating-point precision errors, consider using [method is_equal_approx] instead, which is more reliable.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this operator may not be accurate if NaNs are included. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4 (Some GlobalEnum.VariantType._TYPE_VECTOR4) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.Vector4.typ @-> M.Vector4.typ @-> M.Bool.typ @-> returning void))

    (** Compares two [Vector4] vectors by first checking if the X value of the left vector is less than the X value of the [param right] vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors, Z values of the two vectors, and then with the W values. This operator is useful for sorting vectors.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this operator may not be accurate if NaNs are included. *)
    let (<) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4 (Some GlobalEnum.VariantType._TYPE_VECTOR4) Godotcaml.GlobalEnum.VariantOperator._OP_LESS
      (funptr (M.Vector4.typ @-> M.Vector4.typ @-> M.Bool.typ @-> returning void))

    (** Compares two [Vector4] vectors by first checking if the X value of the left vector is less than or equal to the X value of the [param right] vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors, Z values of the two vectors, and then with the W values. This operator is useful for sorting vectors.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this operator may not be accurate if NaNs are included. *)
    let (<=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4 (Some GlobalEnum.VariantType._TYPE_VECTOR4) Godotcaml.GlobalEnum.VariantOperator._OP_LESS_EQUAL
      (funptr (M.Vector4.typ @-> M.Vector4.typ @-> M.Bool.typ @-> returning void))

    (** Compares two [Vector4] vectors by first checking if the X value of the left vector is greater than the X value of the [param right] vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors, Z values of the two vectors, and then with the W values. This operator is useful for sorting vectors.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this operator may not be accurate if NaNs are included. *)
    let (>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4 (Some GlobalEnum.VariantType._TYPE_VECTOR4) Godotcaml.GlobalEnum.VariantOperator._OP_GREATER
      (funptr (M.Vector4.typ @-> M.Vector4.typ @-> M.Bool.typ @-> returning void))

    (** Compares two [Vector4] vectors by first checking if the X value of the left vector is greater than or equal to the X value of the [param right] vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors, Z values of the two vectors, and then with the W values. This operator is useful for sorting vectors.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this operator may not be accurate if NaNs are included. *)
    let (>=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4 (Some GlobalEnum.VariantType._TYPE_VECTOR4) Godotcaml.GlobalEnum.VariantOperator._OP_GREATER_EQUAL
      (funptr (M.Vector4.typ @-> M.Vector4.typ @-> M.Bool.typ @-> returning void))

    (** Adds each component of the [Vector4] by the components of the given [Vector4].
[codeblock]
print(Vector4(10, 20, 30, 40) + Vector4(3, 4, 5, 6)) # Prints ""(13, 24, 35, 46)""
[/codeblock] *)
    let (+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4 (Some GlobalEnum.VariantType._TYPE_VECTOR4) Godotcaml.GlobalEnum.VariantOperator._OP_ADD
      (funptr (M.Vector4.typ @-> M.Vector4.typ @-> M.Vector4.typ @-> returning void))

    (** Subtracts each component of the [Vector4] by the components of the given [Vector4].
[codeblock]
print(Vector4(10, 20, 30, 40) - Vector4(3, 4, 5, 6)) # Prints ""(7, 16, 25, 34)""
[/codeblock] *)
    let (-) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4 (Some GlobalEnum.VariantType._TYPE_VECTOR4) Godotcaml.GlobalEnum.VariantOperator._OP_SUBTRACT
      (funptr (M.Vector4.typ @-> M.Vector4.typ @-> M.Vector4.typ @-> returning void))

    (** Multiplies each component of the [Vector4] by the components of the given [Vector4].
[codeblock]
print(Vector4(10, 20, 30, 40)  *  Vector4(3, 4, 5, 6)) # Prints ""(30, 80, 150, 240)""
[/codeblock] *)
    let ( * ) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4 (Some GlobalEnum.VariantType._TYPE_VECTOR4) Godotcaml.GlobalEnum.VariantOperator._OP_MULTIPLY
      (funptr (M.Vector4.typ @-> M.Vector4.typ @-> M.Vector4.typ @-> returning void))

    (** Divides each component of the [Vector4] by the components of the given [Vector4].
[codeblock]
print(Vector4(10, 20, 30, 40) / Vector4(2, 5, 3, 4)) # Prints ""(5, 4, 10, 10)""
[/codeblock] *)
    let (/) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4 (Some GlobalEnum.VariantType._TYPE_VECTOR4) Godotcaml.GlobalEnum.VariantOperator._OP_DIVIDE
      (funptr (M.Vector4.typ @-> M.Vector4.typ @-> M.Vector4.typ @-> returning void))




    let _Vector4_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4 (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Vector4.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _Vector4_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4 (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Vector4.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))

    module Axis = struct
      (** Enumerated value for the X axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
      let _AXIS_X =
      0

      (** Enumerated value for the Y axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
      let _AXIS_Y =
      1

      (** Enumerated value for the Z axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
      let _AXIS_Z =
      2

      (** Enumerated value for the W axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
      let _AXIS_W =
      3
      end

    (** Enumerated value for the X axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
    let _AXIS_X =
    0

    (** Enumerated value for the Y axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
    let _AXIS_Y =
    1

    (** Enumerated value for the Z axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
    let _AXIS_Z =
    2

    (** Enumerated value for the W axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
    let _AXIS_W =
    3

    (** Zero vector, a vector with all components set to [code]0[/code]. *)
    let _ZERO =
    Vector4(0, 0, 0, 0)

    (** One vector, a vector with all components set to [code]1[/code]. *)
    let _ONE =
    Vector4(1, 1, 1, 1)

    (** Infinity vector, a vector with all components set to [constant @GDScript.INF]. *)
    let _INF =
    Vector4(inf, inf, inf, inf)
    end

  module Vector4i = struct
    (** Returns the axis of the vector's lowest value. See [code]AXIS_ * [/code] constants. If all components are equal, this method returns [constant AXIS_W]. *)
    let min_axis_index =
    M.foreign_method "Vector4i" "min_axis_index" (M.Vector4i.typ @-> returning M.Int.typ)

    (** Returns the axis of the vector's highest value. See [code]AXIS_ * [/code] constants. If all components are equal, this method returns [constant AXIS_X]. *)
    let max_axis_index =
    M.foreign_method "Vector4i" "max_axis_index" (M.Vector4i.typ @-> returning M.Int.typ)

    (** Returns the length (magnitude) of this vector. *)
    let length =
    M.foreign_method "Vector4i" "length" (M.Vector4i.typ @-> returning M.Float.typ)

    (** Returns the squared length (squared magnitude) of this vector.
This method runs faster than [method length], so prefer it if you need to compare vectors or need the squared distance for some formula. *)
    let length_squared =
    M.foreign_method "Vector4i" "length_squared" (M.Vector4i.typ @-> returning M.Int.typ)

    (** Returns a new vector with each component set to [code]1[/code] if it's positive, [code]-1[/code] if it's negative, and [code]0[/code] if it's zero. The result is identical to calling [method @GlobalScope.sign] on each component. *)
    let sign =
    M.foreign_method "Vector4i" "sign" (M.Vector4i.typ @-> returning M.Vector4i.typ)

    (** Returns a new vector with all components in absolute values (i.e. positive). *)
    let abs =
    M.foreign_method "Vector4i" "abs" (M.Vector4i.typ @-> returning M.Vector4i.typ)

    (** Returns a new vector with all components clamped between the components of [param min] and [param max], by running [method @GlobalScope.clamp] on each component. *)
    let clamp =
    M.foreign_method "Vector4i" "clamp" (M.Vector4i.typ @-> M.Vector4i.typ @-> M.Vector4i.typ @-> returning M.Vector4i.typ)

    (** Returns a new vector with each component snapped to the closest multiple of the corresponding component in [param step]. *)
    let snapped =
    M.foreign_method "Vector4i" "snapped" (M.Vector4i.typ @-> M.Vector4i.typ @-> returning M.Vector4i.typ)





    (** Returns the negative value of the [Vector4i]. This is the same as writing [code]Vector4i(-v.x, -v.y, -v.z, -v.w)[/code]. This operation flips the direction of the vector while keeping the same magnitude. *)
    let (~-) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4I None  Godotcaml.GlobalEnum.VariantOperator._OP_NEGATE
      (funptr (M.Vector4i.typ @-> M.Vector4i.typ @-> M.Vector4i.typ @-> returning void))

    (** Returns the same value as if the [code]+[/code] was not there. Unary [code]+[/code] does nothing, but sometimes it can make your code more readable. *)
    let (~+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4I None  Godotcaml.GlobalEnum.VariantOperator._OP_POSITIVE
      (funptr (M.Vector4i.typ @-> M.Vector4i.typ @-> M.Vector4i.typ @-> returning void))


    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4I None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.Vector4i.typ @-> M.Vector4i.typ @-> M.Bool.typ @-> returning void))











    (** Returns [code]true[/code] if the vectors are exactly equal. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4I (Some GlobalEnum.VariantType._TYPE_VECTOR4I) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.Vector4i.typ @-> M.Vector4i.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the vectors are not equal. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4I (Some GlobalEnum.VariantType._TYPE_VECTOR4I) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.Vector4i.typ @-> M.Vector4i.typ @-> M.Bool.typ @-> returning void))

    (** Compares two [Vector4i] vectors by first checking if the X value of the left vector is less than the X value of the [param right] vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors, Z values of the two vectors, and then with the W values. This operator is useful for sorting vectors. *)
    let (<) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4I (Some GlobalEnum.VariantType._TYPE_VECTOR4I) Godotcaml.GlobalEnum.VariantOperator._OP_LESS
      (funptr (M.Vector4i.typ @-> M.Vector4i.typ @-> M.Bool.typ @-> returning void))

    (** Compares two [Vector4i] vectors by first checking if the X value of the left vector is less than or equal to the X value of the [param right] vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors, Z values of the two vectors, and then with the W values. This operator is useful for sorting vectors. *)
    let (<=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4I (Some GlobalEnum.VariantType._TYPE_VECTOR4I) Godotcaml.GlobalEnum.VariantOperator._OP_LESS_EQUAL
      (funptr (M.Vector4i.typ @-> M.Vector4i.typ @-> M.Bool.typ @-> returning void))

    (** Compares two [Vector4i] vectors by first checking if the X value of the left vector is greater than the X value of the [param right] vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors, Z values of the two vectors, and then with the W values. This operator is useful for sorting vectors. *)
    let (>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4I (Some GlobalEnum.VariantType._TYPE_VECTOR4I) Godotcaml.GlobalEnum.VariantOperator._OP_GREATER
      (funptr (M.Vector4i.typ @-> M.Vector4i.typ @-> M.Bool.typ @-> returning void))

    (** Compares two [Vector4i] vectors by first checking if the X value of the left vector is greater than or equal to the X value of the [param right] vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors, Z values of the two vectors, and then with the W values. This operator is useful for sorting vectors. *)
    let (>=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4I (Some GlobalEnum.VariantType._TYPE_VECTOR4I) Godotcaml.GlobalEnum.VariantOperator._OP_GREATER_EQUAL
      (funptr (M.Vector4i.typ @-> M.Vector4i.typ @-> M.Bool.typ @-> returning void))

    (** Adds each component of the [Vector4i] by the components of the given [Vector4i].
[codeblock]
print(Vector4i(10, 20, 30, 40) + Vector4i(3, 4, 5, 6)) # Prints ""(13, 24, 35, 46)""
[/codeblock] *)
    let (+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4I (Some GlobalEnum.VariantType._TYPE_VECTOR4I) Godotcaml.GlobalEnum.VariantOperator._OP_ADD
      (funptr (M.Vector4i.typ @-> M.Vector4i.typ @-> M.Vector4i.typ @-> returning void))

    (** Subtracts each component of the [Vector4i] by the components of the given [Vector4i].
[codeblock]
print(Vector4i(10, 20, 30, 40) - Vector4i(3, 4, 5, 6)) # Prints ""(7, 16, 25, 34)""
[/codeblock] *)
    let (-) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4I (Some GlobalEnum.VariantType._TYPE_VECTOR4I) Godotcaml.GlobalEnum.VariantOperator._OP_SUBTRACT
      (funptr (M.Vector4i.typ @-> M.Vector4i.typ @-> M.Vector4i.typ @-> returning void))

    (** Multiplies each component of the [Vector4i] by the components of the given [Vector4i].
[codeblock]
print(Vector4i(10, 20, 30, 40)  *  Vector4i(3, 4, 5, 6)) # Prints ""(30, 80, 150, 240)""
[/codeblock] *)
    let ( * ) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4I (Some GlobalEnum.VariantType._TYPE_VECTOR4I) Godotcaml.GlobalEnum.VariantOperator._OP_MULTIPLY
      (funptr (M.Vector4i.typ @-> M.Vector4i.typ @-> M.Vector4i.typ @-> returning void))

    (** Divides each component of the [Vector4i] by the components of the given [Vector4i].
[codeblock]
print(Vector4i(10, 20, 30, 40) / Vector4i(2, 5, 3, 4)) # Prints ""(5, 4, 10, 10)""
[/codeblock] *)
    let (/) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4I (Some GlobalEnum.VariantType._TYPE_VECTOR4I) Godotcaml.GlobalEnum.VariantOperator._OP_DIVIDE
      (funptr (M.Vector4i.typ @-> M.Vector4i.typ @-> M.Vector4i.typ @-> returning void))

    (** Gets the remainder of each component of the [Vector4i] with the components of the given [Vector4i]. This operation uses truncated division, which is often not desired as it does not work well with negative numbers. Consider using [method @GlobalScope.posmod] instead if you want to handle negative numbers.
[codeblock]
print(Vector4i(10, -20, 30, -40) % Vector4i(7, 8, 9, 10))  # Prints ""(3, -4, 3, 0)""
[/codeblock] *)
    let (%) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4I (Some GlobalEnum.VariantType._TYPE_VECTOR4I) Godotcaml.GlobalEnum.VariantOperator._OP_MODULE
      (funptr (M.Vector4i.typ @-> M.Vector4i.typ @-> M.Vector4i.typ @-> returning void))


    let _Vector4i_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4I (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Vector4i.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _Vector4i_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_VECTOR4I (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Vector4i.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))

    module Axis = struct
      (** Enumerated value for the X axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
      let _AXIS_X =
      0

      (** Enumerated value for the Y axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
      let _AXIS_Y =
      1

      (** Enumerated value for the Z axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
      let _AXIS_Z =
      2

      (** Enumerated value for the W axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
      let _AXIS_W =
      3
      end

    (** Enumerated value for the X axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
    let _AXIS_X =
    0

    (** Enumerated value for the Y axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
    let _AXIS_Y =
    1

    (** Enumerated value for the Z axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
    let _AXIS_Z =
    2

    (** Enumerated value for the W axis. Returned by [method max_axis_index] and [method min_axis_index]. *)
    let _AXIS_W =
    3

    (** Zero vector, a vector with all components set to [code]0[/code]. *)
    let _ZERO =
    Vector4i(0, 0, 0, 0)

    (** One vector, a vector with all components set to [code]1[/code]. *)
    let _ONE =
    Vector4i(1, 1, 1, 1)

    (** Min vector, a vector with all components equal to [code]INT32_MIN[/code]. Can be used as a negative integer equivalent of [constant Vector4.INF]. *)
    let _MIN =
    Vector4i(-2147483648, -2147483648, -2147483648, -2147483648)

    (** Max vector, a vector with all components equal to [code]INT32_MAX[/code]. Can be used as an integer equivalent of [constant Vector4.INF]. *)
    let _MAX =
    Vector4i(2147483647, 2147483647, 2147483647, 2147483647)
    end

  module Plane = struct
    (** Returns a copy of the plane, with normalized [member normal] (so it's a unit vector). Returns [code]Plane(0, 0, 0, 0)[/code] if [member normal] can't be normalized (it has zero length). *)
    let normalized =
    M.foreign_method "Plane" "normalized" (M.Plane.typ @-> returning M.Plane.typ)

    (** Returns the center of the plane. *)
    let get_center =
    M.foreign_method "Plane" "get_center" (M.Plane.typ @-> returning M.Vector3.typ)

    (** Returns [code]true[/code] if this plane and [param to_plane] are approximately equal, by running [method @GlobalScope.is_equal_approx] on each component. *)
    let is_equal_approx =
    M.foreign_method "Plane" "is_equal_approx" (M.Plane.typ @-> M.Plane.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this plane is finite, by calling [method @GlobalScope.is_finite] on each component. *)
    let is_finite =
    M.foreign_method "Plane" "is_finite" (M.Plane.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if [param point] is located above the plane. *)
    let is_point_over =
    M.foreign_method "Plane" "is_point_over" (M.Vector3.typ @-> M.Plane.typ @-> returning M.Bool.typ)

    (** Returns the shortest distance from the plane to the position [param point]. If the point is above the plane, the distance will be positive. If below, the distance will be negative. *)
    let distance_to =
    M.foreign_method "Plane" "distance_to" (M.Vector3.typ @-> M.Plane.typ @-> returning M.Float.typ)

    (** Returns [code]true[/code] if [param point] is inside the plane. Comparison uses a custom minimum [param tolerance] threshold. *)
    let has_point =
    M.foreign_method "Plane" "has_point" (M.Vector3.typ @-> M.Float.typ @-> M.Plane.typ @-> returning M.Bool.typ)

    (** Returns the orthogonal projection of [param point] into a point in the plane. *)
    let project =
    M.foreign_method "Plane" "project" (M.Vector3.typ @-> M.Plane.typ @-> returning M.Vector3.typ)

    (** Returns the intersection point of the three planes [param b], [param c] and this plane. If no intersection is found, [code]null[/code] is returned. *)
    let intersect_3 =
    M.foreign_method "Plane" "intersect_3" (M.Plane.typ @-> M.Plane.typ @-> M.Plane.typ @-> returning M.Variant.typ)

    (** Returns the intersection point of a ray consisting of the position [param from] and the direction normal [param dir] with this plane. If no intersection is found, [code]null[/code] is returned. *)
    let intersects_ray =
    M.foreign_method "Plane" "intersects_ray" (M.Vector3.typ @-> M.Vector3.typ @-> M.Plane.typ @-> returning M.Variant.typ)

    (** Returns the intersection point of a segment from position [param from] to position [param to] with this plane. If no intersection is found, [code]null[/code] is returned. *)
    let intersects_segment =
    M.foreign_method "Plane" "intersects_segment" (M.Vector3.typ @-> M.Vector3.typ @-> M.Plane.typ @-> returning M.Variant.typ)





    (** Returns the negative value of the [Plane]. This is the same as writing [code]Plane(-p.normal, -p.d)[/code]. This operation flips the direction of the normal vector and also flips the distance value, resulting in a Plane that is in the same place, but facing the opposite direction. *)
    let (~-) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PLANE None  Godotcaml.GlobalEnum.VariantOperator._OP_NEGATE
      (funptr (M.Plane.typ @-> M.Plane.typ @-> M.Plane.typ @-> returning void))

    (** Returns the same value as if the [code]+[/code] was not there. Unary [code]+[/code] does nothing, but sometimes it can make your code more readable. *)
    let (~+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PLANE None  Godotcaml.GlobalEnum.VariantOperator._OP_POSITIVE
      (funptr (M.Plane.typ @-> M.Plane.typ @-> M.Plane.typ @-> returning void))


    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PLANE None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.Plane.typ @-> M.Plane.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the planes are exactly equal.
[b]Note:[/b] Due to floating-point precision errors, consider using [method is_equal_approx] instead, which is more reliable. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PLANE (Some GlobalEnum.VariantType._TYPE_PLANE) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.Plane.typ @-> M.Plane.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the planes are not equal.
[b]Note:[/b] Due to floating-point precision errors, consider using [method is_equal_approx] instead, which is more reliable. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PLANE (Some GlobalEnum.VariantType._TYPE_PLANE) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.Plane.typ @-> M.Plane.typ @-> M.Bool.typ @-> returning void))




    let _Plane_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PLANE (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Plane.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _Plane_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PLANE (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Plane.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))

    (** A plane that extends in the Y and Z axes (normal vector points +X). *)
    let _PLANE_YZ =
    Plane(1, 0, 0, 0)

    (** A plane that extends in the X and Z axes (normal vector points +Y). *)
    let _PLANE_XZ =
    Plane(0, 1, 0, 0)

    (** A plane that extends in the X and Y axes (normal vector points +Z). *)
    let _PLANE_XY =
    Plane(0, 0, 1, 0)
    end

  module Quaternion = struct
    (** Returns this quaternion's length, also called magnitude. *)
    let length =
    M.foreign_method "Quaternion" "length" (M.Quaternion.typ @-> returning M.Float.typ)

    (** Returns this quaternion's length, squared.
[b]Note:[/b] This method is faster than [method length], so prefer it if you only need to compare quaternion lengths. *)
    let length_squared =
    M.foreign_method "Quaternion" "length_squared" (M.Quaternion.typ @-> returning M.Float.typ)

    (** Returns a copy of this quaternion, normalized so that its length is [code]1.0[/code]. See also [method is_normalized]. *)
    let normalized =
    M.foreign_method "Quaternion" "normalized" (M.Quaternion.typ @-> returning M.Quaternion.typ)

    (** Returns [code]true[/code] if this quaternion is normalized. See also [method normalized]. *)
    let is_normalized =
    M.foreign_method "Quaternion" "is_normalized" (M.Quaternion.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this quaternion and [param to] are approximately equal, by running [method @GlobalScope.is_equal_approx] on each component. *)
    let is_equal_approx =
    M.foreign_method "Quaternion" "is_equal_approx" (M.Quaternion.typ @-> M.Quaternion.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this quaternion is finite, by calling [method @GlobalScope.is_finite] on each component. *)
    let is_finite =
    M.foreign_method "Quaternion" "is_finite" (M.Quaternion.typ @-> returning M.Bool.typ)

    (** Returns the inverse version of this quaternion, inverting the sign of every component except [member w]. *)
    let inverse =
    M.foreign_method "Quaternion" "inverse" (M.Quaternion.typ @-> returning M.Quaternion.typ)

    (** Returns the logarithm of this quaternion. Multiplies this quaternion's rotation axis by its rotation angle, and stores the result in the returned quaternion's vector part ([member x], [member y], and [member z]). The returned quaternion's real part ([member w]) is always [code]0.0[/code]. *)
    let log =
    M.foreign_method "Quaternion" "log" (M.Quaternion.typ @-> returning M.Quaternion.typ)

    (** Returns the exponential of this quaternion. The rotation axis of the result is the normalized rotation axis of this quaternion, the angle of the result is the length of the vector part of this quaternion. *)
    let exp =
    M.foreign_method "Quaternion" "exp" (M.Quaternion.typ @-> returning M.Quaternion.typ)

    (** Returns the angle between this quaternion and [param to]. This is the magnitude of the angle you would need to rotate by to get from one to the other.
[b]Note:[/b] The magnitude of the floating-point error for this method is abnormally high, so methods such as [code]is_zero_approx[/code] will not work reliably. *)
    let angle_to =
    M.foreign_method "Quaternion" "angle_to" (M.Quaternion.typ @-> M.Quaternion.typ @-> returning M.Float.typ)

    (** Returns the dot product between this quaternion and [param with].
This is equivalent to [code](quat.x  *  with.x) + (quat.y  *  with.y) + (quat.z  *  with.z) + (quat.w  *  with.w)[/code]. *)
    let dot =
    M.foreign_method "Quaternion" "dot" (M.Quaternion.typ @-> M.Quaternion.typ @-> returning M.Float.typ)

    (** Performs a spherical-linear interpolation with the [param to] quaternion, given a [param weight] and returns the result. Both this quaternion and [param to] must be normalized. *)
    let slerp =
    M.foreign_method "Quaternion" "slerp" (M.Quaternion.typ @-> M.Float.typ @-> M.Quaternion.typ @-> returning M.Quaternion.typ)

    (** Performs a spherical-linear interpolation with the [param to] quaternion, given a [param weight] and returns the result. Unlike [method slerp], this method does not check if the rotation path is smaller than 90 degrees. Both this quaternion and [param to] must be normalized. *)
    let slerpni =
    M.foreign_method "Quaternion" "slerpni" (M.Quaternion.typ @-> M.Float.typ @-> M.Quaternion.typ @-> returning M.Quaternion.typ)

    (** Performs a spherical cubic interpolation between quaternions [param pre_a], this vector, [param b], and [param post_b], by the given amount [param weight]. *)
    let spherical_cubic_interpolate =
    M.foreign_method "Quaternion" "spherical_cubic_interpolate" (M.Quaternion.typ @-> M.Quaternion.typ @-> M.Quaternion.typ @-> M.Float.typ @-> M.Quaternion.typ @-> returning M.Quaternion.typ)

    (** Performs a spherical cubic interpolation between quaternions [param pre_a], this vector, [param b], and [param post_b], by the given amount [param weight].
It can perform smoother interpolation than [method spherical_cubic_interpolate] by the time values. *)
    let spherical_cubic_interpolate_in_time =
    M.foreign_method "Quaternion" "spherical_cubic_interpolate_in_time" (M.Quaternion.typ @-> M.Quaternion.typ @-> M.Quaternion.typ @-> M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Quaternion.typ @-> returning M.Quaternion.typ)

    (** Returns this quaternion's rotation as a [Vector3] of [url=https://en.wikipedia.org/wiki/Euler_angles]Euler angles[/url], in radians.
The order of each consecutive rotation can be changed with [param order] (see [enum EulerOrder] constants). By default, the YXZ convention is used ([constant EULER_ORDER_YXZ]): Z (roll) is calculated first, then X (pitch), and lastly Y (yaw). When using the opposite method [method from_euler], this order is reversed. *)
    let get_euler =
    M.foreign_method "Quaternion" "get_euler" (M.Int.typ @-> M.Quaternion.typ @-> returning M.Vector3.typ)

    (** Constructs a new [Quaternion] from the given [Vector3] of [url=https://en.wikipedia.org/wiki/Euler_angles]Euler angles[/url], in radians. This method always uses the YXZ convention ([constant EULER_ORDER_YXZ]). *)
    let from_euler =
    M.foreign_method "Quaternion" "from_euler" (M.Vector3.typ @-> returning M.Quaternion.typ)

    (** Returns the rotation axis of the rotation represented by this quaternion. *)
    let get_axis =
    M.foreign_method "Quaternion" "get_axis" (M.Quaternion.typ @-> returning M.Vector3.typ)

    (** Returns the angle of the rotation represented by this quaternion.
[b]Note:[/b] The quaternion must be normalized. *)
    let get_angle =
    M.foreign_method "Quaternion" "get_angle" (M.Quaternion.typ @-> returning M.Float.typ)





    (** Returns the negative value of the [Quaternion]. This is the same as multiplying all components by [code]-1[/code]. This operation results in a quaternion that represents the same rotation. *)
    let (~-) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_QUATERNION None  Godotcaml.GlobalEnum.VariantOperator._OP_NEGATE
      (funptr (M.Quaternion.typ @-> M.Quaternion.typ @-> M.Quaternion.typ @-> returning void))

    (** Returns the same value as if the [code]+[/code] was not there. Unary [code]+[/code] does nothing, but sometimes it can make your code more readable. *)
    let (~+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_QUATERNION None  Godotcaml.GlobalEnum.VariantOperator._OP_POSITIVE
      (funptr (M.Quaternion.typ @-> M.Quaternion.typ @-> M.Quaternion.typ @-> returning void))


    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_QUATERNION None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.Quaternion.typ @-> M.Quaternion.typ @-> M.Bool.typ @-> returning void))











    (** Returns [code]true[/code] if the components of both quaternions are exactly equal.
[b]Note:[/b] Due to floating-point precision errors, consider using [method is_equal_approx] instead, which is more reliable. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_QUATERNION (Some GlobalEnum.VariantType._TYPE_QUATERNION) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.Quaternion.typ @-> M.Quaternion.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the components of both quaternions are not exactly equal.
[b]Note:[/b] Due to floating-point precision errors, consider using [method is_equal_approx] instead, which is more reliable. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_QUATERNION (Some GlobalEnum.VariantType._TYPE_QUATERNION) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.Quaternion.typ @-> M.Quaternion.typ @-> M.Bool.typ @-> returning void))

    (** Adds each component of the left [Quaternion] to the right [Quaternion].
This operation is not meaningful on its own, but it can be used as a part of a larger expression, such as approximating an intermediate rotation between two nearby rotations. *)
    let (+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_QUATERNION (Some GlobalEnum.VariantType._TYPE_QUATERNION) Godotcaml.GlobalEnum.VariantOperator._OP_ADD
      (funptr (M.Quaternion.typ @-> M.Quaternion.typ @-> M.Quaternion.typ @-> returning void))

    (** Subtracts each component of the left [Quaternion] by the right [Quaternion].
This operation is not meaningful on its own, but it can be used as a part of a larger expression. *)
    let (-) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_QUATERNION (Some GlobalEnum.VariantType._TYPE_QUATERNION) Godotcaml.GlobalEnum.VariantOperator._OP_SUBTRACT
      (funptr (M.Quaternion.typ @-> M.Quaternion.typ @-> M.Quaternion.typ @-> returning void))

    (** Composes (multiplies) two quaternions. This rotates the [param right] quaternion (the child) by this quaternion (the parent). *)
    let ( * ) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_QUATERNION (Some GlobalEnum.VariantType._TYPE_QUATERNION) Godotcaml.GlobalEnum.VariantOperator._OP_MULTIPLY
      (funptr (M.Quaternion.typ @-> M.Quaternion.typ @-> M.Quaternion.typ @-> returning void))


    let _Quaternion_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_QUATERNION (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Quaternion.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _Quaternion_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_QUATERNION (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Quaternion.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))

    (** The identity quaternion, representing no rotation. This has the same rotation as [constant Basis.IDENTITY].
If a [Vector3] is rotated (multiplied) by this quaternion, it does not change. *)
    let _IDENTITY =
    Quaternion(0, 0, 0, 1)
    end

  module AABB = struct
    (** Returns an [AABB] equivalent to this bounding box, with its width, height, and depth modified to be non-negative values.
[codeblocks]
[gdscript]
var box = AABB(Vector3(5, 0, 5), Vector3(-20, -10, -5))
var absolute = box.abs()
print(absolute.position) # Prints (-15, -10, 0)
print(absolute.size)     # Prints (20, 10, 5)
[/gdscript]
[csharp]
var box = new Aabb(new Vector3(5, 0, 5), new Vector3(-20, -10, -5));
var absolute = box.Abs();
GD.Print(absolute.Position); // Prints (-15, -10, 0)
GD.Print(absolute.Size);     // Prints (20, 10, 5)
[/csharp]
[/codeblocks]
[b]Note:[/b] It's recommended to use this method when [member size] is negative, as most other methods in Godot assume that the [member size]'s components are greater than [code]0[/code]. *)
    let abs =
    M.foreign_method "AABB" "abs" (M.AABB.typ @-> returning M.AABB.typ)

    (** Returns the center point of the bounding box. This is the same as [code]position + (size / 2.0)[/code]. *)
    let get_center =
    M.foreign_method "AABB" "get_center" (M.AABB.typ @-> returning M.Vector3.typ)

    (** Returns the bounding box's volume. This is equivalent to [code]size.x  *  size.y  *  size.z[/code]. See also [method has_volume]. *)
    let get_volume =
    M.foreign_method "AABB" "get_volume" (M.AABB.typ @-> returning M.Float.typ)

    (** Returns [code]true[/code] if this bounding box's width, height, and depth are all positive. See also [method get_volume]. *)
    let has_volume =
    M.foreign_method "AABB" "has_volume" (M.AABB.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this bounding box has a surface or a length, that is, at least one component of [member size] is greater than [code]0[/code]. Otherwise, returns [code]false[/code]. *)
    let has_surface =
    M.foreign_method "AABB" "has_surface" (M.AABB.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if the bounding box contains the given [param point]. By convention, points exactly on the right, top, and front sides are [b]not[/b] included.
[b]Note:[/b] This method is not reliable for [AABB] with a [i]negative[/i] [member size]. Use [method abs] first to get a valid bounding box. *)
    let has_point =
    M.foreign_method "AABB" "has_point" (M.Vector3.typ @-> M.AABB.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this bounding box and [param aabb] are approximately equal, by calling [method Vector2.is_equal_approx] on the [member position] and the [member size]. *)
    let is_equal_approx =
    M.foreign_method "AABB" "is_equal_approx" (M.AABB.typ @-> M.AABB.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this bounding box's values are finite, by calling [method Vector2.is_finite] on the [member position] and the [member size]. *)
    let is_finite =
    M.foreign_method "AABB" "is_finite" (M.AABB.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this bounding box overlaps with the box [param with]. The edges of both boxes are [i]always[/i] excluded. *)
    let intersects =
    M.foreign_method "AABB" "intersects" (M.AABB.typ @-> M.AABB.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this bounding box [i]completely[/i] encloses the [param with] box. The edges of both boxes are included.
[codeblocks]
[gdscript]
var a = AABB(Vector3(0, 0, 0), Vector3(4, 4, 4))
var b = AABB(Vector3(1, 1, 1), Vector3(3, 3, 3))
var c = AABB(Vector3(2, 2, 2), Vector3(8, 8, 8))

print(a.encloses(a)) # Prints true
print(a.encloses(b)) # Prints true
print(a.encloses(c)) # Prints false
[/gdscript]
[csharp]
var a = new Aabb(new Vector3(0, 0, 0), new Vector3(4, 4, 4));
var b = new Aabb(new Vector3(1, 1, 1), new Vector3(3, 3, 3));
var c = new Aabb(new Vector3(2, 2, 2), new Vector3(8, 8, 8));

GD.Print(a.Encloses(a)); // Prints True
GD.Print(a.Encloses(b)); // Prints True
GD.Print(a.Encloses(c)); // Prints False
[/csharp]
[/codeblocks] *)
    let encloses =
    M.foreign_method "AABB" "encloses" (M.AABB.typ @-> M.AABB.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this bounding box is on both sides of the given [param plane]. *)
    let intersects_plane =
    M.foreign_method "AABB" "intersects_plane" (M.Plane.typ @-> M.AABB.typ @-> returning M.Bool.typ)

    (** Returns the intersection between this bounding box and [param with]. If the boxes do not intersect, returns an empty [AABB]. If the boxes intersect at the edge, returns a flat [AABB] with no volume (see [method has_surface] and [method has_volume]).
[codeblocks]
[gdscript]
var box1 = AABB(Vector3(0, 0, 0), Vector3(5, 2, 8))
var box2 = AABB(Vector3(2, 0, 2), Vector3(8, 4, 4))

var intersection = box1.intersection(box2)
print(intersection.position) # Prints (2, 0, 2)
print(intersection.size)     # Prints (3, 2, 4)
[/gdscript]
[csharp]
var box1 = new Aabb(new Vector3(0, 0, 0), new Vector3(5, 2, 8));
var box2 = new Aabb(new Vector3(2, 0, 2), new Vector3(8, 4, 4));

var intersection = box1.Intersection(box2);
GD.Print(intersection.Position); // Prints (2, 0, 2)
GD.Print(intersection.Size);     // Prints (3, 2, 4)
[/csharp]
[/codeblocks]
[b]Note:[/b] If you only need to know whether two bounding boxes are intersecting, use [method intersects], instead. *)
    let intersection =
    M.foreign_method "AABB" "intersection" (M.AABB.typ @-> M.AABB.typ @-> returning M.AABB.typ)

    (** Returns an [AABB] that encloses both this bounding box and [param with] around the edges. See also [method encloses]. *)
    let merge =
    M.foreign_method "AABB" "merge" (M.AABB.typ @-> M.AABB.typ @-> returning M.AABB.typ)

    (** Returns a copy of this bounding box expanded to align the edges with the given [param to_point], if necessary.
[codeblocks]
[gdscript]
var box = AABB(Vector3(0, 0, 0), Vector3(5, 2, 5))

box = box.expand(Vector3(10, 0, 0))
print(box.position) # Prints (0, 0, 0)
print(box.size)     # Prints (10, 2, 5)

box = box.expand(Vector3(-5, 0, 5))
print(box.position) # Prints (-5, 0, 0)
print(box.size)     # Prints (15, 2, 5)
[/gdscript]
[csharp]
var box = new Aabb(new Vector3(0, 0, 0), new Vector3(5, 2, 5));

box = box.Expand(new Vector3(10, 0, 0));
GD.Print(box.Position); // Prints (0, 0, 0)
GD.Print(box.Size);     // Prints (10, 2, 5)

box = box.Expand(new Vector3(-5, 0, 5));
GD.Print(box.Position); // Prints (-5, 0, 0)
GD.Print(box.Size);     // Prints (15, 2, 5)
[/csharp]
[/codeblocks] *)
    let expand =
    M.foreign_method "AABB" "expand" (M.Vector3.typ @-> M.AABB.typ @-> returning M.AABB.typ)

    (** Returns a copy of this bounding box extended on all sides by the given amount [param by]. A negative amount shrinks the box instead.
[codeblocks]
[gdscript]
var a = AABB(Vector3(4, 4, 4), Vector3(8, 8, 8)).grow(4)
print(a.position) # Prints (0, 0, 0)
print(a.size)     # Prints (16, 16, 16)

var b = AABB(Vector3(0, 0, 0), Vector3(8, 4, 2)).grow(2)
print(b.position) # Prints (-2, -2, -2)
print(b.size)     # Prints (12, 8, 6)
[/gdscript]
[csharp]
var a = new Aabb(new Vector3(4, 4, 4), new Vector3(8, 8, 8)).Grow(4);
GD.Print(a.Position); // Prints (0, 0, 0)
GD.Print(a.Size);     // Prints (16, 16, 16)

var b = new Aabb(new Vector3(0, 0, 0), new Vector3(8, 4, 2)).Grow(2);
GD.Print(b.Position); // Prints (-2, -2, -2)
GD.Print(b.Size);     // Prints (12, 8, 6)
[/csharp]
[/codeblocks] *)
    let grow =
    M.foreign_method "AABB" "grow" (M.Float.typ @-> M.AABB.typ @-> returning M.AABB.typ)

    (** Returns the vertex's position of this bounding box that's the farthest in the given direction. This point is commonly known as the support point in collision detection algorithms. *)
    let get_support =
    M.foreign_method "AABB" "get_support" (M.Vector3.typ @-> M.AABB.typ @-> returning M.Vector3.typ)

    (** Returns the longest normalized axis of this bounding box's [member size], as a [Vector3] ([constant Vector3.RIGHT], [constant Vector3.UP], or [constant Vector3.BACK]).
[codeblocks]
[gdscript]
var box = AABB(Vector3(0, 0, 0), Vector3(2, 4, 8))

print(box.get_longest_axis())       # Prints (0, 0, 1)
print(box.get_longest_axis_index()) # Prints 2
print(box.get_longest_axis_size())  # Prints 8
[/gdscript]
[csharp]
var box = new Aabb(new Vector3(0, 0, 0), new Vector3(2, 4, 8));

GD.Print(box.GetLongestAxis());      // Prints (0, 0, 1)
GD.Print(box.GetLongestAxisIndex()); // Prints 2
GD.Print(box.GetLongestAxisSize());  // Prints 8
[/csharp]
[/codeblocks]
See also [method get_longest_axis_index] and [method get_longest_axis_size]. *)
    let get_longest_axis =
    M.foreign_method "AABB" "get_longest_axis" (M.AABB.typ @-> returning M.Vector3.typ)

    (** Returns the index to the longest axis of this bounding box's [member size] (see [constant Vector3.AXIS_X], [constant Vector3.AXIS_Y], and [constant Vector3.AXIS_Z]).
For an example, see [method get_longest_axis]. *)
    let get_longest_axis_index =
    M.foreign_method "AABB" "get_longest_axis_index" (M.AABB.typ @-> returning M.Int.typ)

    (** Returns the longest dimension of this bounding box's [member size].
For an example, see [method get_longest_axis]. *)
    let get_longest_axis_size =
    M.foreign_method "AABB" "get_longest_axis_size" (M.AABB.typ @-> returning M.Float.typ)

    (** Returns the shortest normaalized axis of this bounding box's [member size], as a [Vector3] ([constant Vector3.RIGHT], [constant Vector3.UP], or [constant Vector3.BACK]).
[codeblocks]
[gdscript]
var box = AABB(Vector3(0, 0, 0), Vector3(2, 4, 8))

print(box.get_shortest_axis())       # Prints (1, 0, 0)
print(box.get_shortest_axis_index()) # Prints 0
print(box.get_shortest_axis_size())  # Prints 2
[/gdscript]
[csharp]
var box = new Aabb(new Vector3(0, 0, 0), new Vector3(2, 4, 8));

GD.Print(box.GetShortestAxis());      // Prints (1, 0, 0)
GD.Print(box.GetShortestAxisIndex()); // Prints 0
GD.Print(box.GetShortestAxisSize());  // Prints 2
[/csharp]
[/codeblocks]
See also [method get_shortest_axis_index] and [method get_shortest_axis_size]. *)
    let get_shortest_axis =
    M.foreign_method "AABB" "get_shortest_axis" (M.AABB.typ @-> returning M.Vector3.typ)

    (** Returns the index to the shortest axis of this bounding box's [member size] (see [constant Vector3.AXIS_X], [constant Vector3.AXIS_Y], and [constant Vector3.AXIS_Z]).
For an example, see [method get_shortest_axis]. *)
    let get_shortest_axis_index =
    M.foreign_method "AABB" "get_shortest_axis_index" (M.AABB.typ @-> returning M.Int.typ)

    (** Returns the shortest dimension of this bounding box's [member size].
For an example, see [method get_shortest_axis]. *)
    let get_shortest_axis_size =
    M.foreign_method "AABB" "get_shortest_axis_size" (M.AABB.typ @-> returning M.Float.typ)

    (** Returns the position of one of the 8 vertices that compose this bounding box. With a [param idx] of [code]0[/code] this is the same as [member position], and a [param idx] of [code]7[/code] is the same as [member end]. *)
    let get_endpoint =
    M.foreign_method "AABB" "get_endpoint" (M.Int.typ @-> M.AABB.typ @-> returning M.Vector3.typ)

    (** Returns the first point where this bounding box and the given segment intersect, as a [Vector3]. If no intersection occurs, returns [code]null[/code].
The segment begins at [param from] and ends at [param to]. *)
    let intersects_segment =
    M.foreign_method "AABB" "intersects_segment" (M.Vector3.typ @-> M.Vector3.typ @-> M.AABB.typ @-> returning M.Variant.typ)

    (** Returns the first point where this bounding box and the given ray intersect, as a [Vector3]. If no intersection occurs, returns [code]null[/code].
The ray begin at [param from], faces [param dir] and extends towards infinity. *)
    let intersects_ray =
    M.foreign_method "AABB" "intersects_ray" (M.Vector3.typ @-> M.Vector3.typ @-> M.AABB.typ @-> returning M.Variant.typ)






    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_A_A_B_B None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.AABB.typ @-> M.AABB.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if both [member position] and [member size] of the bounding boxes are exactly equal, respectively.
[b]Note:[/b] Due to floating-point precision errors, consider using [method is_equal_approx] instead, which is more reliable. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_A_A_B_B (Some GlobalEnum.VariantType._TYPE_A_A_B_B) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.AABB.typ @-> M.AABB.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the [member position] or [member size] of both bounding boxes are not equal.
[b]Note:[/b] Due to floating-point precision errors, consider using [method is_equal_approx] instead, which is more reliable. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_A_A_B_B (Some GlobalEnum.VariantType._TYPE_A_A_B_B) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.AABB.typ @-> M.AABB.typ @-> M.Bool.typ @-> returning void))




    let _AABB_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_A_A_B_B (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.AABB.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _AABB_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_A_A_B_B (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.AABB.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))
    end

  module Basis = struct
    (** Returns the [url=https://en.wikipedia.org/wiki/Invertible_matrix]inverse of this basis's matrix[/url]. *)
    let inverse =
    M.foreign_method "Basis" "inverse" (M.Basis.typ @-> returning M.Basis.typ)

    (** Returns the transposed version of this basis. This turns the basis matrix's columns into rows, and its rows into columns.
[codeblocks]
[gdscript]
var my_basis = Basis(
    Vector3(1, 2, 3),
    Vector3(4, 5, 6),
    Vector3(7, 8, 9)
)
my_basis = my_basis.transposed()

print(my_basis.x) # Prints (1, 4, 7).
print(my_basis.y) # Prints (2, 5, 8).
print(my_basis.z) # Prints (3, 6, 9).
[/gdscript]
[csharp]
var myBasis = new Basis(
    new Vector3(1.0f, 2.0f, 3.0f),
    new Vector3(4.0f, 5.0f, 6.0f),
    new Vector3(7.0f, 8.0f, 9.0f)
);
myBasis = myBasis.Transposed();

GD.Print(myBasis.X); // Prints (1, 4, 7).
GD.Print(myBasis.Y); // Prints (2, 5, 8).
GD.Print(myBasis.Z); // Prints (3, 6, 9).
[/csharp]
[/codeblocks] *)
    let transposed =
    M.foreign_method "Basis" "transposed" (M.Basis.typ @-> returning M.Basis.typ)

    (** Returns the orthonormalized version of this basis. An orthonormal basis is both [i]orthogonal[/i] (the axes are perpendicular to each other) and [i]normalized[/i] (the axes have a length of [code]1[/code]), which also means it can only represent rotation.
It is often useful to call this method to avoid rounding errors on a rotating basis:
[codeblocks]
[gdscript]
# Rotate this Node3D every frame.
func _process(delta):
    basis = basis.rotated(Vector3.UP, TAU  *  delta)
    basis = basis.rotated(Vector3.RIGHT, TAU  *  delta)

    basis = basis.orthonormalized()
[/gdscript]
[csharp]
// Rotate this Node3D every frame.
public override void _Process(double delta)
{
    Basis = Basis.Rotated(Vector3.Up, Mathf.Tau  *  (float)delta)
                 .Rotated(Vector3.Right, Mathf.Tau  *  (float)delta)
                 .Orthonormalized();
}
[/csharp]
[/codeblocks] *)
    let orthonormalized =
    M.foreign_method "Basis" "orthonormalized" (M.Basis.typ @-> returning M.Basis.typ)

    (** Returns the [url=https://en.wikipedia.org/wiki/Determinant]determinant[/url] of this basis's matrix. For advanced math, this number can be used to determine a few attributes:
- If the determinant is exactly [code]0[/code], the basis is not invertible (see [method inverse]).
- If the determinant is a negative number, the basis represents a negative scale.
[b]Note:[/b] If the basis's scale is the same for every axis, its determinant is always that scale by the power of 2. *)
    let determinant =
    M.foreign_method "Basis" "determinant" (M.Basis.typ @-> returning M.Float.typ)

    (** Returns this basis rotated around the given [param axis] by [param angle] (in radians). The [param axis] must be a normalized vector (see [method Vector3.normalized]).
Positive values rotate this basis clockwise around the axis, while negative values rotate it counterclockwise.
[codeblocks]
[gdscript]
var my_basis = Basis.IDENTITY
var angle = TAU / 2

my_basis = my_basis.rotated(Vector3.UP, angle)    # Rotate around the up axis (yaw).
my_basis = my_basis.rotated(Vector3.RIGHT, angle) # Rotate around the right axis (pitch).
my_basis = my_basis.rotated(Vector3.BACK, angle)  # Rotate around the back axis (roll).
[/gdscript]
[csharp]
var myBasis = Basis.Identity;
var angle = Mathf.Tau / 2.0f;

myBasis = myBasis.Rotated(Vector3.Up, angle);    // Rotate around the up axis (yaw).
myBasis = myBasis.Rotated(Vector3.Right, angle); // Rotate around the right axis (pitch).
myBasis = myBasis.Rotated(Vector3.Back, angle);  // Rotate around the back axis (roll).
[/csharp]
[/codeblocks] *)
    let rotated =
    M.foreign_method "Basis" "rotated" (M.Vector3.typ @-> M.Float.typ @-> M.Basis.typ @-> returning M.Basis.typ)

    (** Returns this basis with each axis's components scaled by the given [param scale]'s components.
The basis matrix's rows are multiplied by [param scale]'s components. This operation is a global scale (relative to the parent).
[codeblocks]
[gdscript]
var my_basis = Basis(
    Vector3(1, 1, 1),
    Vector3(2, 2, 2),
    Vector3(3, 3, 3)
)
my_basis = my_basis.scaled(Vector3(0, 2, -2))

print(my_basis.x) # Prints (0, 2, -2).
print(my_basis.y) # Prints (0, 4, -4).
print(my_basis.z) # Prints (0, 6, -6).
[/gdscript]
[csharp]
var myBasis = new Basis(
    new Vector3(1.0f, 1.0f, 1.0f),
    new Vector3(2.0f, 2.0f, 2.0f),
    new Vector3(3.0f, 3.0f, 3.0f)
);
myBasis = myBasis.Scaled(new Vector3(0.0f, 2.0f, -2.0f));

GD.Print(myBasis.X); // Prints (0, 2, -2).
GD.Print(myBasis.Y); // Prints (0, 4, -4).
GD.Print(myBasis.Z); // Prints (0, 6, -6).
[/csharp]
[/codeblocks] *)
    let scaled =
    M.foreign_method "Basis" "scaled" (M.Vector3.typ @-> M.Basis.typ @-> returning M.Basis.typ)

    (** Returns the length of each axis of this basis, as a [Vector3]. If the basis is not sheared, this is the scaling factor. It is not affected by rotation.
[codeblocks]
[gdscript]
var my_basis = Basis(
    Vector3(2, 0, 0),
    Vector3(0, 4, 0),
    Vector3(0, 0, 8)
)
# Rotating the Basis in any way preserves its scale.
my_basis = my_basis.rotated(Vector3.UP, TAU / 2)
my_basis = my_basis.rotated(Vector3.RIGHT, TAU / 4)

print(my_basis.get_scale()) # Prints (2, 4, 8).
[/gdscript]
[csharp]
var myBasis = new Basis(
    Vector3(2.0f, 0.0f, 0.0f),
    Vector3(0.0f, 4.0f, 0.0f),
    Vector3(0.0f, 0.0f, 8.0f)
);
// Rotating the Basis in any way preserves its scale.
myBasis = myBasis.Rotated(Vector3.Up, Mathf.Tau / 2.0f);
myBasis = myBasis.Rotated(Vector3.Right, Mathf.Tau / 4.0f);

GD.Print(myBasis.Scale); // Prints (2, 4, 8).
[/csharp]
[/codeblocks]
[b]Note:[/b] If the value returned by [method determinant] is negative, the scale is also negative. *)
    let get_scale =
    M.foreign_method "Basis" "get_scale" (M.Basis.typ @-> returning M.Vector3.typ)

    (** Returns this basis's rotation as a [Vector3] of [url=https://en.wikipedia.org/wiki/Euler_angles]Euler angles[/url], in radians.
- The [member Vector3.x] contains the angle around the [member x] axis (pitch);
- The [member Vector3.y] contains the angle around the [member y] axis (yaw);
- The [member Vector3.z] contains the angle around the [member z] axis (roll).
The order of each consecutive rotation can be changed with [param order] (see [enum EulerOrder] constants). By default, the YXZ convention is used ([constant EULER_ORDER_YXZ]): Z (roll) is calculated first, then X (pitch), and lastly Y (yaw). When using the opposite method [method from_euler], this order is reversed.
[b]Note:[/b] Euler angles are much more intuitive but are not suitable for 3D math. Because of this, consider using the [method get_rotation_quaternion] method instead, which returns a [Quaternion].
[b]Note:[/b] In the Inspector dock, a basis's rotation is often displayed in Euler angles (in degrees), as is the case with the [member Node3D.rotation] property. *)
    let get_euler =
    M.foreign_method "Basis" "get_euler" (M.Int.typ @-> M.Basis.typ @-> returning M.Vector3.typ)

    (** Returns the transposed dot product between [param with] and the [member x] axis (see [method transposed]).
This is equivalent to [code]basis.x.dot(vector)[/code]. *)
    let tdotx =
    M.foreign_method "Basis" "tdotx" (M.Vector3.typ @-> M.Basis.typ @-> returning M.Float.typ)

    (** Returns the transposed dot product between [param with] and the [member y] axis (see [method transposed]).
This is equivalent to [code]basis.y.dot(vector)[/code]. *)
    let tdoty =
    M.foreign_method "Basis" "tdoty" (M.Vector3.typ @-> M.Basis.typ @-> returning M.Float.typ)

    (** Returns the transposed dot product between [param with] and the [member z] axis (see [method transposed]).
This is equivalent to [code]basis.z.dot(vector)[/code]. *)
    let tdotz =
    M.foreign_method "Basis" "tdotz" (M.Vector3.typ @-> M.Basis.typ @-> returning M.Float.typ)

    (** Performs a spherical-linear interpolation with the [param to] basis, given a [param weight]. Both this basis and [param to] should represent a rotation.
[b]Example:[/b] Smoothly rotate a [Node3D] to the target basis over time, with a [Tween].
[codeblock]
var start_basis = Basis.IDENTITY
var target_basis = Basis.IDENTITY.rotated(Vector3.UP, TAU / 2)

func _ready():
    create_tween().tween_method(interpolate, 0.0, 1.0, 5.0).set_trans(Tween.TRANS_EXPO)

func interpolate(weight):
    basis = start_basis.slerp(target_basis, weight)
[/codeblock] *)
    let slerp =
    M.foreign_method "Basis" "slerp" (M.Basis.typ @-> M.Float.typ @-> M.Basis.typ @-> returning M.Basis.typ)

    (** Returns [code]true[/code] if this basis is conformal. A conformal basis is both [i]orthogonal[/i] (the axes are perpendicular to each other) and [i]uniform[/i] (the axes share the same length). This method can be especially useful during physics calculations. *)
    let is_conformal =
    M.foreign_method "Basis" "is_conformal" (M.Basis.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this basis and [param b] are approximately equal, by calling [method @GlobalScope.is_equal_approx] on all vector components. *)
    let is_equal_approx =
    M.foreign_method "Basis" "is_equal_approx" (M.Basis.typ @-> M.Basis.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this basis is finite, by calling [method @GlobalScope.is_finite] on all vector components. *)
    let is_finite =
    M.foreign_method "Basis" "is_finite" (M.Basis.typ @-> returning M.Bool.typ)

    (** Returns this basis's rotation as a [Quaternion].
[b]Note:[/b] Quatenions are much more suitable for 3D math but are less intuitive. For user interfaces, consider using the [method get_euler] method, which returns Euler angles. *)
    let get_rotation_quaternion =
    M.foreign_method "Basis" "get_rotation_quaternion" (M.Basis.typ @-> returning M.Quaternion.typ)

    (** Creates a new [Basis] with a rotation such that the forward axis (-Z) points towards the [param target] position.
By default, the -Z axis (camera forward) is treated as forward (implies +X is right). If [param use_model_front] is [code]true[/code], the +Z axis (asset front) is treated as forward (implies +X is left) and points toward the [param target] position.
The up axis (+Y) points as close to the [param up] vector as possible while staying perpendicular to the forward axis. The returned basis is orthonormalized (see [method orthonormalized]). The [param target] and [param up] vectors cannot be [constant Vector3.ZERO], and cannot be parallel to each other. *)
    let looking_at =
    M.foreign_method "Basis" "looking_at" (M.Vector3.typ @-> M.Vector3.typ @-> M.Bool.typ @-> returning M.Basis.typ)

    (** Constructs a new [Basis] that only represents scale, with no rotation or shear, from the given [param scale] vector.
[codeblocks]
[gdscript]
var my_basis = Basis.from_scale(Vector3(2, 4, 8))

print(my_basis.x) # Prints (2, 0, 0).
print(my_basis.y) # Prints (0, 4, 0).
print(my_basis.z) # Prints (0, 0, 8).
[/gdscript]
[csharp]
var myBasis = Basis.FromScale(new Vector3(2.0f, 4.0f, 8.0f));

GD.Print(myBasis.X); // Prints (2, 0, 0).
GD.Print(myBasis.Y); // Prints (0, 4, 0).
GD.Print(myBasis.Z); // Prints (0, 0, 8).
[/csharp]
[/codeblocks]
[b]Note:[/b] In linear algebra, the matrix of this basis is also known as a [url=https://en.wikipedia.org/wiki/Diagonal_matrix]diagonal matrix[/url]. *)
    let from_scale =
    M.foreign_method "Basis" "from_scale" (M.Vector3.typ @-> returning M.Basis.typ)

    (** Constructs a new [Basis] that only represents rotation from the given [Vector3] of [url=https://en.wikipedia.org/wiki/Euler_angles]Euler angles[/url], in radians.
- The [member Vector3.x] should contain the angle around the [member x] axis (pitch).
- The [member Vector3.y] should contain the angle around the [member y] axis (yaw).
- The [member Vector3.z] should contain the angle around the [member z] axis (roll).
[codeblocks]
[gdscript]
# Creates a Basis whose z axis points down.
var my_basis = Basis.from_euler(Vector3(TAU / 4, 0, 0))

print(my_basis.z) # Prints (0, -1, 0).
[/gdscript]
[csharp]
// Creates a Basis whose z axis points down.
var myBasis = Basis.FromEuler(new Vector3(Mathf.Tau / 4.0f, 0.0f, 0.0f));

GD.Print(myBasis.Z); // Prints (0, -1, 0).
[/csharp]
[/codeblocks]
The order of each consecutive rotation can be changed with [param order] (see [enum EulerOrder] constants). By default, the YXZ convention is used ([constant EULER_ORDER_YXZ]): the basis rotates first around the Y axis (yaw), then X (pitch), and lastly Z (roll). When using the opposite method [method get_euler], this order is reversed. *)
    let from_euler =
    M.foreign_method "Basis" "from_euler" (M.Vector3.typ @-> M.Int.typ @-> returning M.Basis.typ)






    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_BASIS None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.Basis.typ @-> M.Basis.typ @-> M.Bool.typ @-> returning void))







    (** Returns [code]true[/code] if the components of both [Basis] matrices are exactly equal.
[b]Note:[/b] Due to floating-point precision errors, consider using [method is_equal_approx] instead, which is more reliable. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_BASIS (Some GlobalEnum.VariantType._TYPE_BASIS) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.Basis.typ @-> M.Basis.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the components of both [Basis] matrices are not equal.
[b]Note:[/b] Due to floating-point precision errors, consider using [method is_equal_approx] instead, which is more reliable. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_BASIS (Some GlobalEnum.VariantType._TYPE_BASIS) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.Basis.typ @-> M.Basis.typ @-> M.Bool.typ @-> returning void))

    (** Transforms (multiplies) the [param right] basis by this basis.
This is the operation performed between parent and child [Node3D]s. *)
    let ( * ) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_BASIS (Some GlobalEnum.VariantType._TYPE_BASIS) Godotcaml.GlobalEnum.VariantOperator._OP_MULTIPLY
      (funptr (M.Basis.typ @-> M.Basis.typ @-> M.Basis.typ @-> returning void))


    let _Basis_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_BASIS (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Basis.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _Basis_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_BASIS (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Basis.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))

    (** The identity basis. This is a basis with no rotation, no shear, and its scale being [code]1[/code]. This means that:
- The [member x] points right ([constant Vector3.RIGHT]);
- The [member y] points up ([constant Vector3.UP]);
- The [member z] points back ([constant Vector3.BACK]).
[codeblock]
var basis := Basis.IDENTITY
print(""| X | Y | Z"")
print(""| %s | %s | %s"" % [basis.x.x, basis.y.x, basis.z.x])
print(""| %s | %s | %s"" % [basis.x.y, basis.y.y, basis.z.y])
print(""| %s | %s | %s"" % [basis.x.z, basis.y.z, basis.z.z])
# Prints:
# | X | Y | Z
# | 1 | 0 | 0
# | 0 | 1 | 0
# | 0 | 0 | 1
[/codeblock]
This is identical to creating [constructor Basis] without any parameters. This constant can be used to make your code clearer, and for consistency with C#. *)
    let _IDENTITY =
    Basis(1, 0, 0, 0, 1, 0, 0, 0, 1)

    (** When any basis is multiplied by [constant FLIP_X], it negates all components of the [member x] axis (the X column).
When [constant FLIP_X] is multiplied by any basis, it negates the [member Vector3.x] component of all axes (the X row). *)
    let _FLIP_X =
    Basis(-1, 0, 0, 0, 1, 0, 0, 0, 1)

    (** When any basis is multiplied by [constant FLIP_Y], it negates all components of the [member y] axis (the Y column).
When [constant FLIP_Y] is multiplied by any basis, it negates the [member Vector3.y] component of all axes (the Y row). *)
    let _FLIP_Y =
    Basis(1, 0, 0, 0, -1, 0, 0, 0, 1)

    (** When any basis is multiplied by [constant FLIP_Z], it negates all components of the [member z] axis (the Z column).
When [constant FLIP_Z] is multiplied by any basis, it negates the [member Vector3.z] component of all axes (the Z row). *)
    let _FLIP_Z =
    Basis(1, 0, 0, 0, 1, 0, 0, 0, -1)
    end

  module Transform3D = struct
    (** Returns the inverted version of this transform. See also [method Basis.inverse].
[b]Note:[/b] For this method to return correctly, the transform's [member basis] needs to be [i]orthonormal[/i] (see [method Basis.orthonormalized]). That means, the basis should only represent a rotation. If it does not, use [method affine_inverse] instead. *)
    let inverse =
    M.foreign_method "Transform3D" "inverse" (M.Transform3D.typ @-> returning M.Transform3D.typ)

    (** Returns the inverted version of this transform. Unlike [method inverse], this method works with almost any [member basis], including non-uniform ones, but is slower. See also [method Basis.inverse].
[b]Note:[/b] For this method to return correctly, the transform's [member basis] needs to have a determinant that is not exactly [code]0[/code] (see [method Basis.determinant]). *)
    let affine_inverse =
    M.foreign_method "Transform3D" "affine_inverse" (M.Transform3D.typ @-> returning M.Transform3D.typ)

    (** Returns a copy of this transform with its [member basis] orthonormalized. An orthonormal basis is both [i]orthogonal[/i] (the axes are perpendicular to each other) and [i]normalized[/i] (the axes have a length of [code]1[/code]), which also means it can only represent rotation. See also [method Basis.orthonormalized]. *)
    let orthonormalized =
    M.foreign_method "Transform3D" "orthonormalized" (M.Transform3D.typ @-> returning M.Transform3D.typ)

    (** Returns a copy of this transform rotated around the given [param axis] by the given [param angle] (in radians).
The [param axis] must be a normalized vector.
This method is an optimized version of multiplying the given transform [code]X[/code] with a corresponding rotation transform [code]R[/code] from the left, i.e., [code]R  *  X[/code].
This can be seen as transforming with respect to the global/parent frame. *)
    let rotated =
    M.foreign_method "Transform3D" "rotated" (M.Vector3.typ @-> M.Float.typ @-> M.Transform3D.typ @-> returning M.Transform3D.typ)

    (** Returns a copy of this transform rotated around the given [param axis] by the given [param angle] (in radians).
The [param axis] must be a normalized vector.
This method is an optimized version of multiplying the given transform [code]X[/code] with a corresponding rotation transform [code]R[/code] from the right, i.e., [code]X  *  R[/code].
This can be seen as transforming with respect to the local frame. *)
    let rotated_local =
    M.foreign_method "Transform3D" "rotated_local" (M.Vector3.typ @-> M.Float.typ @-> M.Transform3D.typ @-> returning M.Transform3D.typ)

    (** Returns a copy of this transform scaled by the given [param scale] factor.
This method is an optimized version of multiplying the given transform [code]X[/code] with a corresponding scaling transform [code]S[/code] from the left, i.e., [code]S  *  X[/code].
This can be seen as transforming with respect to the global/parent frame. *)
    let scaled =
    M.foreign_method "Transform3D" "scaled" (M.Vector3.typ @-> M.Transform3D.typ @-> returning M.Transform3D.typ)

    (** Returns a copy of this transform scaled by the given [param scale] factor.
This method is an optimized version of multiplying the given transform [code]X[/code] with a corresponding scaling transform [code]S[/code] from the right, i.e., [code]X  *  S[/code].
This can be seen as transforming with respect to the local frame. *)
    let scaled_local =
    M.foreign_method "Transform3D" "scaled_local" (M.Vector3.typ @-> M.Transform3D.typ @-> returning M.Transform3D.typ)

    (** Returns a copy of this transform translated by the given [param offset].
This method is an optimized version of multiplying the given transform [code]X[/code] with a corresponding translation transform [code]T[/code] from the left, i.e., [code]T  *  X[/code].
This can be seen as transforming with respect to the global/parent frame. *)
    let translated =
    M.foreign_method "Transform3D" "translated" (M.Vector3.typ @-> M.Transform3D.typ @-> returning M.Transform3D.typ)

    (** Returns a copy of this transform translated by the given [param offset].
This method is an optimized version of multiplying the given transform [code]X[/code] with a corresponding translation transform [code]T[/code] from the right, i.e., [code]X  *  T[/code].
This can be seen as transforming with respect to the local frame. *)
    let translated_local =
    M.foreign_method "Transform3D" "translated_local" (M.Vector3.typ @-> M.Transform3D.typ @-> returning M.Transform3D.typ)

    (** Returns a copy of this transform rotated so that the forward axis (-Z) points towards the [param target] position.
The up axis (+Y) points as close to the [param up] vector as possible while staying perpendicular to the forward axis. The resulting transform is orthonormalized. The existing rotation, scale, and skew information from the original transform is discarded. The [param target] and [param up] vectors cannot be zero, cannot be parallel to each other, and are defined in global/parent space.
If [param use_model_front] is [code]true[/code], the +Z axis (asset front) is treated as forward (implies +X is left) and points toward the [param target] position. By default, the -Z axis (camera forward) is treated as forward (implies +X is right). *)
    let looking_at =
    M.foreign_method "Transform3D" "looking_at" (M.Vector3.typ @-> M.Vector3.typ @-> M.Bool.typ @-> M.Transform3D.typ @-> returning M.Transform3D.typ)

    (** Returns the result of the linear interpolation between this transform and [param xform] by the given [param weight].
The [param weight] should be between [code]0.0[/code] and [code]1.0[/code] (inclusive). Values outside this range are allowed and can be used to perform [i]extrapolation[/i] instead. *)
    let interpolate_with =
    M.foreign_method "Transform3D" "interpolate_with" (M.Transform3D.typ @-> M.Float.typ @-> M.Transform3D.typ @-> returning M.Transform3D.typ)

    (** Returns [code]true[/code] if this transform and [param xform] are approximately equal, by running [method @GlobalScope.is_equal_approx] on each component. *)
    let is_equal_approx =
    M.foreign_method "Transform3D" "is_equal_approx" (M.Transform3D.typ @-> M.Transform3D.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this transform is finite, by calling [method @GlobalScope.is_finite] on each component. *)
    let is_finite =
    M.foreign_method "Transform3D" "is_finite" (M.Transform3D.typ @-> returning M.Bool.typ)






    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_TRANSFORM3_D None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.Transform3D.typ @-> M.Transform3D.typ @-> M.Bool.typ @-> returning void))











    (** Returns [code]true[/code] if the components of both transforms are exactly equal.
[b]Note:[/b] Due to floating-point precision errors, consider using [method is_equal_approx] instead, which is more reliable. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_TRANSFORM3_D (Some GlobalEnum.VariantType._TYPE_TRANSFORM3_D) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.Transform3D.typ @-> M.Transform3D.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the components of both transforms are not equal.
[b]Note:[/b] Due to floating-point precision errors, consider using [method is_equal_approx] instead, which is more reliable. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_TRANSFORM3_D (Some GlobalEnum.VariantType._TYPE_TRANSFORM3_D) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.Transform3D.typ @-> M.Transform3D.typ @-> M.Bool.typ @-> returning void))

    (** Transforms (multiplies) this transform by the [param right] transform.
This is the operation performed between parent and child [Node3D]s.
[b]Note:[/b] If you need to only modify one attribute of this transform, consider using one of the following methods, instead:
- For translation, see [method translated] or [method translated_local].
- For rotation, see [method rotated] or [method rotated_local].
- For scale, see [method scaled] or [method scaled_local]. *)
    let ( * ) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_TRANSFORM3_D (Some GlobalEnum.VariantType._TYPE_TRANSFORM3_D) Godotcaml.GlobalEnum.VariantOperator._OP_MULTIPLY
      (funptr (M.Transform3D.typ @-> M.Transform3D.typ @-> M.Transform3D.typ @-> returning void))


    let _Transform3D_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_TRANSFORM3_D (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Transform3D.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _Transform3D_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_TRANSFORM3_D (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Transform3D.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))



    (** A transform with no translation, no rotation, and its scale being [code]1[/code]. Its [member basis] is equal to [constant Basis.IDENTITY].
When multiplied by another [Variant] such as [AABB] or another [Transform3D], no transformation occurs. *)
    let _IDENTITY =
    Transform3D(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0)

    (** [Transform3D] with mirroring applied perpendicular to the YZ plane. Its [member basis] is equal to [constant Basis.FLIP_X]. *)
    let _FLIP_X =
    Transform3D(-1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0)

    (** [Transform3D] with mirroring applied perpendicular to the XZ plane. Its [member basis] is equal to [constant Basis.FLIP_Y]. *)
    let _FLIP_Y =
    Transform3D(1, 0, 0, 0, -1, 0, 0, 0, 1, 0, 0, 0)

    (** [Transform3D] with mirroring applied perpendicular to the XY plane. Its [member basis] is equal to [constant Basis.FLIP_Z]. *)
    let _FLIP_Z =
    Transform3D(1, 0, 0, 0, 1, 0, 0, 0, -1, 0, 0, 0)
    end

  module Projection = struct
    (** Creates a new [Projection] that projects positions from a depth range of [code]-1[/code] to [code]1[/code] to one that ranges from [code]0[/code] to [code]1[/code], and flips the projected positions vertically, according to [param flip_y]. *)
    let create_depth_correction =
    M.foreign_method "Projection" "create_depth_correction" (M.Bool.typ @-> returning M.Projection.typ)

    (** Creates a new [Projection] that projects positions into the given [Rect2]. *)
    let create_light_atlas_rect =
    M.foreign_method "Projection" "create_light_atlas_rect" (M.Rect2.typ @-> returning M.Projection.typ)

    (** Creates a new [Projection] that projects positions using a perspective projection with the given Y-axis field of view (in degrees), X:Y aspect ratio, and clipping planes.
[param flip_fov] determines whether the projection's field of view is flipped over its diagonal. *)
    let create_perspective =
    M.foreign_method "Projection" "create_perspective" (M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Bool.typ @-> returning M.Projection.typ)

    (** Creates a new [Projection] that projects positions using a perspective projection with the given Y-axis field of view (in degrees), X:Y aspect ratio, and clipping distances. The projection is adjusted for a head-mounted display with the given distance between eyes and distance to a point that can be focused on.
[param eye] creates the projection for the left eye when set to 1, or the right eye when set to 2.
[param flip_fov] determines whether the projection's field of view is flipped over its diagonal. *)
    let create_perspective_hmd =
    M.foreign_method "Projection" "create_perspective_hmd" (M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Bool.typ @-> M.Int.typ @-> M.Float.typ @-> M.Float.typ @-> returning M.Projection.typ)

    (** Creates a new [Projection] for projecting positions onto a head-mounted display with the given X:Y aspect ratio, distance between eyes, display width, distance to lens, oversampling factor, and depth clipping planes.
[param eye] creates the projection for the left eye when set to 1, or the right eye when set to 2. *)
    let create_for_hmd =
    M.foreign_method "Projection" "create_for_hmd" (M.Int.typ @-> M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> returning M.Projection.typ)

    (** Creates a new [Projection] that projects positions using an orthogonal projection with the given clipping planes. *)
    let create_orthogonal =
    M.foreign_method "Projection" "create_orthogonal" (M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> returning M.Projection.typ)

    (** Creates a new [Projection] that projects positions using an orthogonal projection with the given size, X:Y aspect ratio, and clipping planes.
[param flip_fov] determines whether the projection's field of view is flipped over its diagonal. *)
    let create_orthogonal_aspect =
    M.foreign_method "Projection" "create_orthogonal_aspect" (M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Bool.typ @-> returning M.Projection.typ)

    (** Creates a new [Projection] that projects positions in a frustum with the given clipping planes. *)
    let create_frustum =
    M.foreign_method "Projection" "create_frustum" (M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> returning M.Projection.typ)

    (** Creates a new [Projection] that projects positions in a frustum with the given size, X:Y aspect ratio, offset, and clipping planes.
[param flip_fov] determines whether the projection's field of view is flipped over its diagonal. *)
    let create_frustum_aspect =
    M.foreign_method "Projection" "create_frustum_aspect" (M.Float.typ @-> M.Float.typ @-> M.Vector2.typ @-> M.Float.typ @-> M.Float.typ @-> M.Bool.typ @-> returning M.Projection.typ)

    (** Creates a new [Projection] that scales a given projection to fit around a given [AABB] in projection space. *)
    let create_fit_aabb =
    M.foreign_method "Projection" "create_fit_aabb" (M.AABB.typ @-> returning M.Projection.typ)

    (** Returns a scalar value that is the signed factor by which areas are scaled by this matrix. If the sign is negative, the matrix flips the orientation of the area.
The determinant can be used to calculate the invertibility of a matrix or solve linear systems of equations involving the matrix, among other applications. *)
    let determinant =
    M.foreign_method "Projection" "determinant" (M.Projection.typ @-> returning M.Float.typ)

    (** Returns a [Projection] with the near clipping distance adjusted to be [param new_znear].
[b]Note:[/b] The original [Projection] must be a perspective projection. *)
    let perspective_znear_adjusted =
    M.foreign_method "Projection" "perspective_znear_adjusted" (M.Float.typ @-> M.Projection.typ @-> returning M.Projection.typ)

    (** Returns the clipping plane of this [Projection] whose index is given by [param plane].
[param plane] should be equal to one of [constant PLANE_NEAR], [constant PLANE_FAR], [constant PLANE_LEFT], [constant PLANE_TOP], [constant PLANE_RIGHT], or [constant PLANE_BOTTOM]. *)
    let get_projection_plane =
    M.foreign_method "Projection" "get_projection_plane" (M.Int.typ @-> M.Projection.typ @-> returning M.Plane.typ)

    (** Returns a copy of this [Projection] with the signs of the values of the Y column flipped. *)
    let flipped_y =
    M.foreign_method "Projection" "flipped_y" (M.Projection.typ @-> returning M.Projection.typ)

    (** Returns a [Projection] with the X and Y values from the given [Vector2] added to the first and second values of the final column respectively. *)
    let jitter_offseted =
    M.foreign_method "Projection" "jitter_offseted" (M.Vector2.typ @-> M.Projection.typ @-> returning M.Projection.typ)

    (** Returns the vertical field of view of the projection (in degrees) associated with the given horizontal field of view (in degrees) and aspect ratio. *)
    let get_fovy =
    M.foreign_method "Projection" "get_fovy" (M.Float.typ @-> M.Float.typ @-> returning M.Float.typ)

    (** Returns the distance for this [Projection] beyond which positions are clipped. *)
    let get_z_far =
    M.foreign_method "Projection" "get_z_far" (M.Projection.typ @-> returning M.Float.typ)

    (** Returns the distance for this [Projection] before which positions are clipped. *)
    let get_z_near =
    M.foreign_method "Projection" "get_z_near" (M.Projection.typ @-> returning M.Float.typ)

    (** Returns the X:Y aspect ratio of this [Projection]'s viewport. *)
    let get_aspect =
    M.foreign_method "Projection" "get_aspect" (M.Projection.typ @-> returning M.Float.typ)

    (** Returns the horizontal field of view of the projection (in degrees). *)
    let get_fov =
    M.foreign_method "Projection" "get_fov" (M.Projection.typ @-> returning M.Float.typ)

    (** Returns [code]true[/code] if this [Projection] performs an orthogonal projection. *)
    let is_orthogonal =
    M.foreign_method "Projection" "is_orthogonal" (M.Projection.typ @-> returning M.Bool.typ)

    (** Returns the dimensions of the viewport plane that this [Projection] projects positions onto, divided by two. *)
    let get_viewport_half_extents =
    M.foreign_method "Projection" "get_viewport_half_extents" (M.Projection.typ @-> returning M.Vector2.typ)

    (** Returns the dimensions of the far clipping plane of the projection, divided by two. *)
    let get_far_plane_half_extents =
    M.foreign_method "Projection" "get_far_plane_half_extents" (M.Projection.typ @-> returning M.Vector2.typ)

    (** Returns a [Projection] that performs the inverse of this [Projection]'s projective transformation. *)
    let inverse =
    M.foreign_method "Projection" "inverse" (M.Projection.typ @-> returning M.Projection.typ)

    (** Returns the number of pixels with the given pixel width displayed per meter, after this [Projection] is applied. *)
    let get_pixels_per_meter =
    M.foreign_method "Projection" "get_pixels_per_meter" (M.Int.typ @-> M.Projection.typ @-> returning M.Int.typ)

    (** Returns the factor by which the visible level of detail is scaled by this [Projection]. *)
    let get_lod_multiplier =
    M.foreign_method "Projection" "get_lod_multiplier" (M.Projection.typ @-> returning M.Float.typ)






    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PROJECTION None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.Projection.typ @-> M.Projection.typ @-> M.Bool.typ @-> returning void))



    (** Returns [code]true[/code] if the projections are equal.
[b]Note:[/b] Due to floating-point precision errors, this may return [code]false[/code], even if the projections are virtually equal. An [code]is_equal_approx[/code] method may be added in a future version of Godot. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PROJECTION (Some GlobalEnum.VariantType._TYPE_PROJECTION) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.Projection.typ @-> M.Projection.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the projections are not equal.
[b]Note:[/b] Due to floating-point precision errors, this may return [code]true[/code], even if the projections are virtually equal. An [code]is_equal_approx[/code] method may be added in a future version of Godot. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PROJECTION (Some GlobalEnum.VariantType._TYPE_PROJECTION) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.Projection.typ @-> M.Projection.typ @-> M.Bool.typ @-> returning void))

    (** Returns a [Projection] that applies the combined transformations of this [Projection] and [param right]. *)
    let ( * ) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PROJECTION (Some GlobalEnum.VariantType._TYPE_PROJECTION) Godotcaml.GlobalEnum.VariantOperator._OP_MULTIPLY
      (funptr (M.Projection.typ @-> M.Projection.typ @-> M.Projection.typ @-> returning void))


    let _Projection_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PROJECTION (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Projection.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _Projection_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PROJECTION (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Projection.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))

    module Planes = struct
      (** The index value of the projection's near clipping plane. *)
      let _PLANE_NEAR =
      0

      (** The index value of the projection's far clipping plane. *)
      let _PLANE_FAR =
      1

      (** The index value of the projection's left clipping plane. *)
      let _PLANE_LEFT =
      2

      (** The index value of the projection's top clipping plane. *)
      let _PLANE_TOP =
      3

      (** The index value of the projection's right clipping plane. *)
      let _PLANE_RIGHT =
      4

      (** The index value of the projection bottom clipping plane. *)
      let _PLANE_BOTTOM =
      5
      end

    (** The index value of the projection's near clipping plane. *)
    let _PLANE_NEAR =
    0

    (** The index value of the projection's far clipping plane. *)
    let _PLANE_FAR =
    1

    (** The index value of the projection's left clipping plane. *)
    let _PLANE_LEFT =
    2

    (** The index value of the projection's top clipping plane. *)
    let _PLANE_TOP =
    3

    (** The index value of the projection's right clipping plane. *)
    let _PLANE_RIGHT =
    4

    (** The index value of the projection bottom clipping plane. *)
    let _PLANE_BOTTOM =
    5

    (** A [Projection] with no transformation defined. When applied to other data structures, no transformation is performed. *)
    let _IDENTITY =
    Projection(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)

    (** A [Projection] with all values initialized to 0. When applied to other data structures, they will be zeroed. *)
    let _ZERO =
    Projection(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    end

  module Color = struct
    (** Returns the color converted to a 32-bit integer in ARGB format (each component is 8 bits). ARGB is more compatible with DirectX.
[codeblocks]
[gdscript]
var color = Color(1, 0.5, 0.2)
print(color.to_argb32()) # Prints 4294934323
[/gdscript]
[csharp]
var color = new Color(1.0f, 0.5f, 0.2f);
GD.Print(color.ToArgb32()); // Prints 4294934323
[/csharp]
[/codeblocks] *)
    let to_argb32 =
    M.foreign_method "Color" "to_argb32" (M.Color.typ @-> returning M.Int.typ)

    (** Returns the color converted to a 32-bit integer in ABGR format (each component is 8 bits). ABGR is the reversed version of the default RGBA format.
[codeblocks]
[gdscript]
var color = Color(1, 0.5, 0.2)
print(color.to_abgr32()) # Prints 4281565439
[/gdscript]
[csharp]
var color = new Color(1.0f, 0.5f, 0.2f);
GD.Print(color.ToAbgr32()); // Prints 4281565439
[/csharp]
[/codeblocks] *)
    let to_abgr32 =
    M.foreign_method "Color" "to_abgr32" (M.Color.typ @-> returning M.Int.typ)

    (** Returns the color converted to a 32-bit integer in RGBA format (each component is 8 bits). RGBA is Godot's default format.
[codeblocks]
[gdscript]
var color = Color(1, 0.5, 0.2)
print(color.to_rgba32()) # Prints 4286526463
[/gdscript]
[csharp]
var color = new Color(1, 0.5f, 0.2f);
GD.Print(color.ToRgba32()); // Prints 4286526463
[/csharp]
[/codeblocks] *)
    let to_rgba32 =
    M.foreign_method "Color" "to_rgba32" (M.Color.typ @-> returning M.Int.typ)

    (** Returns the color converted to a 64-bit integer in ARGB format (each component is 16 bits). ARGB is more compatible with DirectX.
[codeblocks]
[gdscript]
var color = Color(1, 0.5, 0.2)
print(color.to_argb64()) # Prints -2147470541
[/gdscript]
[csharp]
var color = new Color(1.0f, 0.5f, 0.2f);
GD.Print(color.ToArgb64()); // Prints -2147470541
[/csharp]
[/codeblocks] *)
    let to_argb64 =
    M.foreign_method "Color" "to_argb64" (M.Color.typ @-> returning M.Int.typ)

    (** Returns the color converted to a 64-bit integer in ABGR format (each component is 16 bits). ABGR is the reversed version of the default RGBA format.
[codeblocks]
[gdscript]
var color = Color(1, 0.5, 0.2)
print(color.to_abgr64()) # Prints -225178692812801
[/gdscript]
[csharp]
var color = new Color(1.0f, 0.5f, 0.2f);
GD.Print(color.ToAbgr64()); // Prints -225178692812801
[/csharp]
[/codeblocks] *)
    let to_abgr64 =
    M.foreign_method "Color" "to_abgr64" (M.Color.typ @-> returning M.Int.typ)

    (** Returns the color converted to a 64-bit integer in RGBA format (each component is 16 bits). RGBA is Godot's default format.
[codeblocks]
[gdscript]
var color = Color(1, 0.5, 0.2)
print(color.to_rgba64()) # Prints -140736629309441
[/gdscript]
[csharp]
var color = new Color(1, 0.5f, 0.2f);
GD.Print(color.ToRgba64()); // Prints -140736629309441
[/csharp]
[/codeblocks] *)
    let to_rgba64 =
    M.foreign_method "Color" "to_rgba64" (M.Color.typ @-> returning M.Int.typ)

    (** Returns the color converted to an HTML hexadecimal color [String] in RGBA format, without the hash ([code]#[/code]) prefix.
Setting [param with_alpha] to [code]false[/code], excludes alpha from the hexadecimal string, using RGB format instead of RGBA format.
[codeblocks]
[gdscript]
var white = Color(1, 1, 1, 0.5)
var with_alpha = white.to_html() # Returns ""ffffff7f""
var without_alpha = white.to_html(false) # Returns ""ffffff""
[/gdscript]
[csharp]
var white = new Color(1, 1, 1, 0.5f);
string withAlpha = white.ToHtml(); // Returns ""ffffff7f""
string withoutAlpha = white.ToHtml(false); // Returns ""ffffff""
[/csharp]
[/codeblocks] *)
    let to_html =
    M.foreign_method "Color" "to_html" (M.Bool.typ @-> M.Color.typ @-> returning M.String.typ)

    (** Returns a new color with all components clamped between the components of [param min] and [param max], by running [method @GlobalScope.clamp] on each component. *)
    let clamp =
    M.foreign_method "Color" "clamp" (M.Color.typ @-> M.Color.typ @-> M.Color.typ @-> returning M.Color.typ)

    (** Returns the color with its [member r], [member g], and [member b] components inverted ([code](1 - r, 1 - g, 1 - b, a)[/code]).
[codeblocks]
[gdscript]
var black = Color.WHITE.inverted()
var color = Color(0.3, 0.4, 0.9)
var inverted_color = color.inverted() # Equivalent to `Color(0.7, 0.6, 0.1)`
[/gdscript]
[csharp]
var black = Colors.White.Inverted();
var color = new Color(0.3f, 0.4f, 0.9f);
Color invertedColor = color.Inverted(); // Equivalent to `new Color(0.7f, 0.6f, 0.1f)`
[/csharp]
[/codeblocks] *)
    let inverted =
    M.foreign_method "Color" "inverted" (M.Color.typ @-> returning M.Color.typ)

    (** Returns the linear interpolation between this color's components and [param to]'s components. The interpolation factor [param weight] should be between 0.0 and 1.0 (inclusive). See also [method @GlobalScope.lerp].
[codeblocks]
[gdscript]
var red = Color(1.0, 0.0, 0.0)
var aqua = Color(0.0, 1.0, 0.8)

red.lerp(aqua, 0.2) # Returns Color(0.8, 0.2, 0.16)
red.lerp(aqua, 0.5) # Returns Color(0.5, 0.5, 0.4)
red.lerp(aqua, 1.0) # Returns Color(0.0, 1.0, 0.8)
[/gdscript]
[csharp]
var red = new Color(1.0f, 0.0f, 0.0f);
var aqua = new Color(0.0f, 1.0f, 0.8f);

red.Lerp(aqua, 0.2f); // Returns Color(0.8f, 0.2f, 0.16f)
red.Lerp(aqua, 0.5f); // Returns Color(0.5f, 0.5f, 0.4f)
red.Lerp(aqua, 1.0f); // Returns Color(0.0f, 1.0f, 0.8f)
[/csharp]
[/codeblocks] *)
    let lerp =
    M.foreign_method "Color" "lerp" (M.Color.typ @-> M.Float.typ @-> M.Color.typ @-> returning M.Color.typ)

    (** Returns a new color resulting from making this color lighter by the specified [param amount], which should be a ratio from 0.0 to 1.0. See also [method darkened].
[codeblocks]
[gdscript]
var green = Color(0.0, 1.0, 0.0)
var light_green = green.lightened(0.2) # 20% lighter than regular green
[/gdscript]
[csharp]
var green = new Color(0.0f, 1.0f, 0.0f);
Color lightGreen = green.Lightened(0.2f); // 20% lighter than regular green
[/csharp]
[/codeblocks] *)
    let lightened =
    M.foreign_method "Color" "lightened" (M.Float.typ @-> M.Color.typ @-> returning M.Color.typ)

    (** Returns a new color resulting from making this color darker by the specified [param amount] (ratio from 0.0 to 1.0). See also [method lightened].
[codeblocks]
[gdscript]
var green = Color(0.0, 1.0, 0.0)
var darkgreen = green.darkened(0.2) # 20% darker than regular green
[/gdscript]
[csharp]
var green = new Color(0.0f, 1.0f, 0.0f);
Color darkgreen = green.Darkened(0.2f); // 20% darker than regular green
[/csharp]
[/codeblocks] *)
    let darkened =
    M.foreign_method "Color" "darkened" (M.Float.typ @-> M.Color.typ @-> returning M.Color.typ)

    (** Returns a new color resulting from overlaying this color over the given color. In a painting program, you can imagine it as the [param over] color painted over this color (including alpha).
[codeblocks]
[gdscript]
var bg = Color(0.0, 1.0, 0.0, 0.5) # Green with alpha of 50%
var fg = Color(1.0, 0.0, 0.0, 0.5) # Red with alpha of 50%
var blended_color = bg.blend(fg) # Brown with alpha of 75%
[/gdscript]
[csharp]
var bg = new Color(0.0f, 1.0f, 0.0f, 0.5f); // Green with alpha of 50%
var fg = new Color(1.0f, 0.0f, 0.0f, 0.5f); // Red with alpha of 50%
Color blendedColor = bg.Blend(fg); // Brown with alpha of 75%
[/csharp]
[/codeblocks] *)
    let blend =
    M.foreign_method "Color" "blend" (M.Color.typ @-> M.Color.typ @-> returning M.Color.typ)

    (** Returns the light intensity of the color, as a value between 0.0 and 1.0 (inclusive). This is useful when determining light or dark color. Colors with a luminance smaller than 0.5 can be generally considered dark.
[b]Note:[/b] [method get_luminance] relies on the color being in the linear color space to return an accurate relative luminance value. If the color is in the sRGB color space, use [method srgb_to_linear] to convert it to the linear color space first. *)
    let get_luminance =
    M.foreign_method "Color" "get_luminance" (M.Color.typ @-> returning M.Float.typ)

    (** Returns the color converted to the linear color space. This method assumes the original color already is in the sRGB color space. See also [method linear_to_srgb] which performs the opposite operation. *)
    let srgb_to_linear =
    M.foreign_method "Color" "srgb_to_linear" (M.Color.typ @-> returning M.Color.typ)

    (** Returns the color converted to the [url=https://en.wikipedia.org/wiki/SRGB]sRGB[/url] color space. This method assumes the original color is in the linear color space. See also [method srgb_to_linear] which performs the opposite operation. *)
    let linear_to_srgb =
    M.foreign_method "Color" "linear_to_srgb" (M.Color.typ @-> returning M.Color.typ)

    (** Returns [code]true[/code] if this color and [param to] are approximately equal, by running [method @GlobalScope.is_equal_approx] on each component. *)
    let is_equal_approx =
    M.foreign_method "Color" "is_equal_approx" (M.Color.typ @-> M.Color.typ @-> returning M.Bool.typ)

    (** Returns the [Color] associated with the provided [param hex] integer in 32-bit RGBA format (8 bits per channel).
In GDScript and C#, the [int] is best visualized with hexadecimal notation ([code]""0x""[/code] prefix, making it [code]""0xRRGGBBAA""[/code]).
[codeblocks]
[gdscript]
var red = Color.hex(0xff0000ff)
var dark_cyan = Color.hex(0x008b8bff)
var my_color = Color.hex(0xbbefd2a4)
[/gdscript]
[csharp]
var red = new Color(0xff0000ff);
var dark_cyan = new Color(0x008b8bff);
var my_color = new Color(0xbbefd2a4);
[/csharp]
[/codeblocks] *)
    let hex =
    M.foreign_method "Color" "hex" (M.Int.typ @-> returning M.Color.typ)

    (** Returns the [Color] associated with the provided [param hex] integer in 64-bit RGBA format (16 bits per channel).
In GDScript and C#, the [int] is best visualized with hexadecimal notation ([code]""0x""[/code] prefix, making it [code]""0xRRRRGGGGBBBBAAAA""[/code]). *)
    let hex64 =
    M.foreign_method "Color" "hex64" (M.Int.typ @-> returning M.Color.typ)

    (** Returns a new color from [param rgba], an HTML hexadecimal color string. [param rgba] is not case-sensitive, and may be prefixed by a hash sign ([code]#[/code]).
[param rgba] must be a valid three-digit or six-digit hexadecimal color string, and may contain an alpha channel value. If [param rgba] does not contain an alpha channel value, an alpha channel value of 1.0 is applied. If [param rgba] is invalid, returns an empty color.
[codeblocks]
[gdscript]
var blue = Color.html(""#0000ff"") # blue is Color(0.0, 0.0, 1.0, 1.0)
var green = Color.html(""#0F0"")   # green is Color(0.0, 1.0, 0.0, 1.0)
var col = Color.html(""663399cc"") # col is Color(0.4, 0.2, 0.6, 0.8)
[/gdscript]
[csharp]
var blue = Color.FromHtml(""#0000ff""); // blue is Color(0.0, 0.0, 1.0, 1.0)
var green = Color.FromHtml(""#0F0"");   // green is Color(0.0, 1.0, 0.0, 1.0)
var col = Color.FromHtml(""663399cc""); // col is Color(0.4, 0.2, 0.6, 0.8)
[/csharp]
[/codeblocks] *)
    let html =
    M.foreign_method "Color" "html" (M.String.typ @-> returning M.Color.typ)

    (** Returns [code]true[/code] if [param color] is a valid HTML hexadecimal color string. The string must be a hexadecimal value (case-insensitive) of either 3, 4, 6 or 8 digits, and may be prefixed by a hash sign ([code]#[/code]). This method is identical to [method String.is_valid_html_color].
[codeblocks]
[gdscript]
Color.html_is_valid(""#55aaFF"")   # Returns true
Color.html_is_valid(""#55AAFF20"") # Returns true
Color.html_is_valid(""55AAFF"")    # Returns true
Color.html_is_valid(""#F2C"")      # Returns true

Color.html_is_valid(""#AABBC"")    # Returns false
Color.html_is_valid(""#55aaFF5"")  # Returns false
[/gdscript]
[csharp]
Color.HtmlIsValid(""#55AAFF"");   // Returns true
Color.HtmlIsValid(""#55AAFF20""); // Returns true
Color.HtmlIsValid(""55AAFF"");    // Returns true
Color.HtmlIsValid(""#F2C"");      // Returns true

Color.HtmlIsValid(""#AABBC"");    // Returns false
Color.HtmlIsValid(""#55aaFF5"");  // Returns false
[/csharp]
[/codeblocks] *)
    let html_is_valid =
    M.foreign_method "Color" "html_is_valid" (M.String.typ @-> returning M.Bool.typ)

    (** Creates a [Color] from the given string, which can be either an HTML color code or a named color (case-insensitive). Returns [param default] if the color cannot be inferred from the string. *)
    let from_string =
    M.foreign_method "Color" "from_string" (M.String.typ @-> M.Color.typ @-> returning M.Color.typ)

    (** Constructs a color from an [url=https://en.wikipedia.org/wiki/HSL_and_HSV]HSV profile[/url]. The hue ([param h]), saturation ([param s]), and value ([param v]) are typically between 0.0 and 1.0.
[codeblocks]
[gdscript]
var color = Color.from_hsv(0.58, 0.5, 0.79, 0.8)
[/gdscript]
[csharp]
var color = Color.FromHsv(0.58f, 0.5f, 0.79f, 0.8f);
[/csharp]
[/codeblocks] *)
    let from_hsv =
    M.foreign_method "Color" "from_hsv" (M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> returning M.Color.typ)

    (** Constructs a color from an [url=https://bottosson.github.io/posts/colorpicker/]OK HSL profile[/url]. The hue ([param h]), saturation ([param s]), and lightness ([param l]) are typically between 0.0 and 1.0.
[codeblocks]
[gdscript]
var color = Color.from_ok_hsl(0.58, 0.5, 0.79, 0.8)
[/gdscript]
[csharp]
var color = Color.FromOkHsl(0.58f, 0.5f, 0.79f, 0.8f);
[/csharp]
[/codeblocks] *)
    let from_ok_hsl =
    M.foreign_method "Color" "from_ok_hsl" (M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> M.Float.typ @-> returning M.Color.typ)

    (** Decodes a [Color] from a RGBE9995 format integer. See [constant Image.FORMAT_RGBE9995]. *)
    let from_rgbe9995 =
    M.foreign_method "Color" "from_rgbe9995" (M.Int.typ @-> returning M.Color.typ)





    (** Inverts the given color. This is equivalent to [code]Color.WHITE - c[/code] or [code]Color(1 - c.r, 1 - c.g, 1 - c.b, 1 - c.a)[/code]. Unlike with [method inverted], the [member a] component is inverted, too. *)
    let (~-) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_COLOR None  Godotcaml.GlobalEnum.VariantOperator._OP_NEGATE
      (funptr (M.Color.typ @-> M.Color.typ @-> M.Color.typ @-> returning void))

    (** Returns the same value as if the [code]+[/code] was not there. Unary [code]+[/code] does nothing, but sometimes it can make your code more readable. *)
    let (~+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_COLOR None  Godotcaml.GlobalEnum.VariantOperator._OP_POSITIVE
      (funptr (M.Color.typ @-> M.Color.typ @-> M.Color.typ @-> returning void))


    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_COLOR None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.Color.typ @-> M.Color.typ @-> M.Bool.typ @-> returning void))









    (** Returns [code]true[/code] if the colors are exactly equal.
[b]Note:[/b] Due to floating-point precision errors, consider using [method is_equal_approx] instead, which is more reliable. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_COLOR (Some GlobalEnum.VariantType._TYPE_COLOR) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.Color.typ @-> M.Color.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the colors are not exactly equal.
[b]Note:[/b] Due to floating-point precision errors, consider using [method is_equal_approx] instead, which is more reliable. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_COLOR (Some GlobalEnum.VariantType._TYPE_COLOR) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.Color.typ @-> M.Color.typ @-> M.Bool.typ @-> returning void))

    (** Adds each component of the [Color] with the components of the given [Color]. *)
    let (+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_COLOR (Some GlobalEnum.VariantType._TYPE_COLOR) Godotcaml.GlobalEnum.VariantOperator._OP_ADD
      (funptr (M.Color.typ @-> M.Color.typ @-> M.Color.typ @-> returning void))

    (** Subtracts each component of the [Color] by the components of the given [Color]. *)
    let (-) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_COLOR (Some GlobalEnum.VariantType._TYPE_COLOR) Godotcaml.GlobalEnum.VariantOperator._OP_SUBTRACT
      (funptr (M.Color.typ @-> M.Color.typ @-> M.Color.typ @-> returning void))

    (** Multiplies each component of the [Color] by the components of the given [Color]. *)
    let ( * ) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_COLOR (Some GlobalEnum.VariantType._TYPE_COLOR) Godotcaml.GlobalEnum.VariantOperator._OP_MULTIPLY
      (funptr (M.Color.typ @-> M.Color.typ @-> M.Color.typ @-> returning void))

    (** Divides each component of the [Color] by the components of the given [Color]. *)
    let (/) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_COLOR (Some GlobalEnum.VariantType._TYPE_COLOR) Godotcaml.GlobalEnum.VariantOperator._OP_DIVIDE
      (funptr (M.Color.typ @-> M.Color.typ @-> M.Color.typ @-> returning void))


    let _Color_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_COLOR (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Color.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _Color_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_COLOR (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Color.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))


    let _Color_elem_PackedColorArray =
    M.foreign_operator GlobalEnum.VariantType._TYPE_COLOR (Some GlobalEnum.VariantType._TYPE_PACKED_COLOR_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Color.typ @-> M.PackedColorArray.typ @-> M.Bool.typ @-> returning void))

    (** Alice blue color. *)
    let _ALICE_BLUE =
    Color(0.941176, 0.972549, 1, 1)

    (** Antique white color. *)
    let _ANTIQUE_WHITE =
    Color(0.980392, 0.921569, 0.843137, 1)

    (** Aqua color. *)
    let _AQUA =
    Color(0, 1, 1, 1)

    (** Aquamarine color. *)
    let _AQUAMARINE =
    Color(0.498039, 1, 0.831373, 1)

    (** Azure color. *)
    let _AZURE =
    Color(0.941176, 1, 1, 1)

    (** Beige color. *)
    let _BEIGE =
    Color(0.960784, 0.960784, 0.862745, 1)

    (** Bisque color. *)
    let _BISQUE =
    Color(1, 0.894118, 0.768627, 1)

    (** Black color. In GDScript, this is the default value of any color. *)
    let _BLACK =
    Color(0, 0, 0, 1)

    (** Blanched almond color. *)
    let _BLANCHED_ALMOND =
    Color(1, 0.921569, 0.803922, 1)

    (** Blue color. *)
    let _BLUE =
    Color(0, 0, 1, 1)

    (** Blue violet color. *)
    let _BLUE_VIOLET =
    Color(0.541176, 0.168627, 0.886275, 1)

    (** Brown color. *)
    let _BROWN =
    Color(0.647059, 0.164706, 0.164706, 1)

    (** Burlywood color. *)
    let _BURLYWOOD =
    Color(0.870588, 0.721569, 0.529412, 1)

    (** Cadet blue color. *)
    let _CADET_BLUE =
    Color(0.372549, 0.619608, 0.627451, 1)

    (** Chartreuse color. *)
    let _CHARTREUSE =
    Color(0.498039, 1, 0, 1)

    (** Chocolate color. *)
    let _CHOCOLATE =
    Color(0.823529, 0.411765, 0.117647, 1)

    (** Coral color. *)
    let _CORAL =
    Color(1, 0.498039, 0.313726, 1)

    (** Cornflower blue color. *)
    let _CORNFLOWER_BLUE =
    Color(0.392157, 0.584314, 0.929412, 1)

    (** Cornsilk color. *)
    let _CORNSILK =
    Color(1, 0.972549, 0.862745, 1)

    (** Crimson color. *)
    let _CRIMSON =
    Color(0.862745, 0.0784314, 0.235294, 1)

    (** Cyan color. *)
    let _CYAN =
    Color(0, 1, 1, 1)

    (** Dark blue color. *)
    let _DARK_BLUE =
    Color(0, 0, 0.545098, 1)

    (** Dark cyan color. *)
    let _DARK_CYAN =
    Color(0, 0.545098, 0.545098, 1)

    (** Dark goldenrod color. *)
    let _DARK_GOLDENROD =
    Color(0.721569, 0.52549, 0.0431373, 1)

    (** Dark gray color. *)
    let _DARK_GRAY =
    Color(0.662745, 0.662745, 0.662745, 1)

    (** Dark green color. *)
    let _DARK_GREEN =
    Color(0, 0.392157, 0, 1)

    (** Dark khaki color. *)
    let _DARK_KHAKI =
    Color(0.741176, 0.717647, 0.419608, 1)

    (** Dark magenta color. *)
    let _DARK_MAGENTA =
    Color(0.545098, 0, 0.545098, 1)

    (** Dark olive green color. *)
    let _DARK_OLIVE_GREEN =
    Color(0.333333, 0.419608, 0.184314, 1)

    (** Dark orange color. *)
    let _DARK_ORANGE =
    Color(1, 0.54902, 0, 1)

    (** Dark orchid color. *)
    let _DARK_ORCHID =
    Color(0.6, 0.196078, 0.8, 1)

    (** Dark red color. *)
    let _DARK_RED =
    Color(0.545098, 0, 0, 1)

    (** Dark salmon color. *)
    let _DARK_SALMON =
    Color(0.913725, 0.588235, 0.478431, 1)

    (** Dark sea green color. *)
    let _DARK_SEA_GREEN =
    Color(0.560784, 0.737255, 0.560784, 1)

    (** Dark slate blue color. *)
    let _DARK_SLATE_BLUE =
    Color(0.282353, 0.239216, 0.545098, 1)

    (** Dark slate gray color. *)
    let _DARK_SLATE_GRAY =
    Color(0.184314, 0.309804, 0.309804, 1)

    (** Dark turquoise color. *)
    let _DARK_TURQUOISE =
    Color(0, 0.807843, 0.819608, 1)

    (** Dark violet color. *)
    let _DARK_VIOLET =
    Color(0.580392, 0, 0.827451, 1)

    (** Deep pink color. *)
    let _DEEP_PINK =
    Color(1, 0.0784314, 0.576471, 1)

    (** Deep sky blue color. *)
    let _DEEP_SKY_BLUE =
    Color(0, 0.74902, 1, 1)

    (** Dim gray color. *)
    let _DIM_GRAY =
    Color(0.411765, 0.411765, 0.411765, 1)

    (** Dodger blue color. *)
    let _DODGER_BLUE =
    Color(0.117647, 0.564706, 1, 1)

    (** Firebrick color. *)
    let _FIREBRICK =
    Color(0.698039, 0.133333, 0.133333, 1)

    (** Floral white color. *)
    let _FLORAL_WHITE =
    Color(1, 0.980392, 0.941176, 1)

    (** Forest green color. *)
    let _FOREST_GREEN =
    Color(0.133333, 0.545098, 0.133333, 1)

    (** Fuchsia color. *)
    let _FUCHSIA =
    Color(1, 0, 1, 1)

    (** Gainsboro color. *)
    let _GAINSBORO =
    Color(0.862745, 0.862745, 0.862745, 1)

    (** Ghost white color. *)
    let _GHOST_WHITE =
    Color(0.972549, 0.972549, 1, 1)

    (** Gold color. *)
    let _GOLD =
    Color(1, 0.843137, 0, 1)

    (** Goldenrod color. *)
    let _GOLDENROD =
    Color(0.854902, 0.647059, 0.12549, 1)

    (** Gray color. *)
    let _GRAY =
    Color(0.745098, 0.745098, 0.745098, 1)

    (** Green color. *)
    let _GREEN =
    Color(0, 1, 0, 1)

    (** Green yellow color. *)
    let _GREEN_YELLOW =
    Color(0.678431, 1, 0.184314, 1)

    (** Honeydew color. *)
    let _HONEYDEW =
    Color(0.941176, 1, 0.941176, 1)

    (** Hot pink color. *)
    let _HOT_PINK =
    Color(1, 0.411765, 0.705882, 1)

    (** Indian red color. *)
    let _INDIAN_RED =
    Color(0.803922, 0.360784, 0.360784, 1)

    (** Indigo color. *)
    let _INDIGO =
    Color(0.294118, 0, 0.509804, 1)

    (** Ivory color. *)
    let _IVORY =
    Color(1, 1, 0.941176, 1)

    (** Khaki color. *)
    let _KHAKI =
    Color(0.941176, 0.901961, 0.54902, 1)

    (** Lavender color. *)
    let _LAVENDER =
    Color(0.901961, 0.901961, 0.980392, 1)

    (** Lavender blush color. *)
    let _LAVENDER_BLUSH =
    Color(1, 0.941176, 0.960784, 1)

    (** Lawn green color. *)
    let _LAWN_GREEN =
    Color(0.486275, 0.988235, 0, 1)

    (** Lemon chiffon color. *)
    let _LEMON_CHIFFON =
    Color(1, 0.980392, 0.803922, 1)

    (** Light blue color. *)
    let _LIGHT_BLUE =
    Color(0.678431, 0.847059, 0.901961, 1)

    (** Light coral color. *)
    let _LIGHT_CORAL =
    Color(0.941176, 0.501961, 0.501961, 1)

    (** Light cyan color. *)
    let _LIGHT_CYAN =
    Color(0.878431, 1, 1, 1)

    (** Light goldenrod color. *)
    let _LIGHT_GOLDENROD =
    Color(0.980392, 0.980392, 0.823529, 1)

    (** Light gray color. *)
    let _LIGHT_GRAY =
    Color(0.827451, 0.827451, 0.827451, 1)

    (** Light green color. *)
    let _LIGHT_GREEN =
    Color(0.564706, 0.933333, 0.564706, 1)

    (** Light pink color. *)
    let _LIGHT_PINK =
    Color(1, 0.713726, 0.756863, 1)

    (** Light salmon color. *)
    let _LIGHT_SALMON =
    Color(1, 0.627451, 0.478431, 1)

    (** Light sea green color. *)
    let _LIGHT_SEA_GREEN =
    Color(0.12549, 0.698039, 0.666667, 1)

    (** Light sky blue color. *)
    let _LIGHT_SKY_BLUE =
    Color(0.529412, 0.807843, 0.980392, 1)

    (** Light slate gray color. *)
    let _LIGHT_SLATE_GRAY =
    Color(0.466667, 0.533333, 0.6, 1)

    (** Light steel blue color. *)
    let _LIGHT_STEEL_BLUE =
    Color(0.690196, 0.768627, 0.870588, 1)

    (** Light yellow color. *)
    let _LIGHT_YELLOW =
    Color(1, 1, 0.878431, 1)

    (** Lime color. *)
    let _LIME =
    Color(0, 1, 0, 1)

    (** Lime green color. *)
    let _LIME_GREEN =
    Color(0.196078, 0.803922, 0.196078, 1)

    (** Linen color. *)
    let _LINEN =
    Color(0.980392, 0.941176, 0.901961, 1)

    (** Magenta color. *)
    let _MAGENTA =
    Color(1, 0, 1, 1)

    (** Maroon color. *)
    let _MAROON =
    Color(0.690196, 0.188235, 0.376471, 1)

    (** Medium aquamarine color. *)
    let _MEDIUM_AQUAMARINE =
    Color(0.4, 0.803922, 0.666667, 1)

    (** Medium blue color. *)
    let _MEDIUM_BLUE =
    Color(0, 0, 0.803922, 1)

    (** Medium orchid color. *)
    let _MEDIUM_ORCHID =
    Color(0.729412, 0.333333, 0.827451, 1)

    (** Medium purple color. *)
    let _MEDIUM_PURPLE =
    Color(0.576471, 0.439216, 0.858824, 1)

    (** Medium sea green color. *)
    let _MEDIUM_SEA_GREEN =
    Color(0.235294, 0.701961, 0.443137, 1)

    (** Medium slate blue color. *)
    let _MEDIUM_SLATE_BLUE =
    Color(0.482353, 0.407843, 0.933333, 1)

    (** Medium spring green color. *)
    let _MEDIUM_SPRING_GREEN =
    Color(0, 0.980392, 0.603922, 1)

    (** Medium turquoise color. *)
    let _MEDIUM_TURQUOISE =
    Color(0.282353, 0.819608, 0.8, 1)

    (** Medium violet red color. *)
    let _MEDIUM_VIOLET_RED =
    Color(0.780392, 0.0823529, 0.521569, 1)

    (** Midnight blue color. *)
    let _MIDNIGHT_BLUE =
    Color(0.0980392, 0.0980392, 0.439216, 1)

    (** Mint cream color. *)
    let _MINT_CREAM =
    Color(0.960784, 1, 0.980392, 1)

    (** Misty rose color. *)
    let _MISTY_ROSE =
    Color(1, 0.894118, 0.882353, 1)

    (** Moccasin color. *)
    let _MOCCASIN =
    Color(1, 0.894118, 0.709804, 1)

    (** Navajo white color. *)
    let _NAVAJO_WHITE =
    Color(1, 0.870588, 0.678431, 1)

    (** Navy blue color. *)
    let _NAVY_BLUE =
    Color(0, 0, 0.501961, 1)

    (** Old lace color. *)
    let _OLD_LACE =
    Color(0.992157, 0.960784, 0.901961, 1)

    (** Olive color. *)
    let _OLIVE =
    Color(0.501961, 0.501961, 0, 1)

    (** Olive drab color. *)
    let _OLIVE_DRAB =
    Color(0.419608, 0.556863, 0.137255, 1)

    (** Orange color. *)
    let _ORANGE =
    Color(1, 0.647059, 0, 1)

    (** Orange red color. *)
    let _ORANGE_RED =
    Color(1, 0.270588, 0, 1)

    (** Orchid color. *)
    let _ORCHID =
    Color(0.854902, 0.439216, 0.839216, 1)

    (** Pale goldenrod color. *)
    let _PALE_GOLDENROD =
    Color(0.933333, 0.909804, 0.666667, 1)

    (** Pale green color. *)
    let _PALE_GREEN =
    Color(0.596078, 0.984314, 0.596078, 1)

    (** Pale turquoise color. *)
    let _PALE_TURQUOISE =
    Color(0.686275, 0.933333, 0.933333, 1)

    (** Pale violet red color. *)
    let _PALE_VIOLET_RED =
    Color(0.858824, 0.439216, 0.576471, 1)

    (** Papaya whip color. *)
    let _PAPAYA_WHIP =
    Color(1, 0.937255, 0.835294, 1)

    (** Peach puff color. *)
    let _PEACH_PUFF =
    Color(1, 0.854902, 0.72549, 1)

    (** Peru color. *)
    let _PERU =
    Color(0.803922, 0.521569, 0.247059, 1)

    (** Pink color. *)
    let _PINK =
    Color(1, 0.752941, 0.796078, 1)

    (** Plum color. *)
    let _PLUM =
    Color(0.866667, 0.627451, 0.866667, 1)

    (** Powder blue color. *)
    let _POWDER_BLUE =
    Color(0.690196, 0.878431, 0.901961, 1)

    (** Purple color. *)
    let _PURPLE =
    Color(0.627451, 0.12549, 0.941176, 1)

    (** Rebecca purple color. *)
    let _REBECCA_PURPLE =
    Color(0.4, 0.2, 0.6, 1)

    (** Red color. *)
    let _RED =
    Color(1, 0, 0, 1)

    (** Rosy brown color. *)
    let _ROSY_BROWN =
    Color(0.737255, 0.560784, 0.560784, 1)

    (** Royal blue color. *)
    let _ROYAL_BLUE =
    Color(0.254902, 0.411765, 0.882353, 1)

    (** Saddle brown color. *)
    let _SADDLE_BROWN =
    Color(0.545098, 0.270588, 0.0745098, 1)

    (** Salmon color. *)
    let _SALMON =
    Color(0.980392, 0.501961, 0.447059, 1)

    (** Sandy brown color. *)
    let _SANDY_BROWN =
    Color(0.956863, 0.643137, 0.376471, 1)

    (** Sea green color. *)
    let _SEA_GREEN =
    Color(0.180392, 0.545098, 0.341176, 1)

    (** Seashell color. *)
    let _SEASHELL =
    Color(1, 0.960784, 0.933333, 1)

    (** Sienna color. *)
    let _SIENNA =
    Color(0.627451, 0.321569, 0.176471, 1)

    (** Silver color. *)
    let _SILVER =
    Color(0.752941, 0.752941, 0.752941, 1)

    (** Sky blue color. *)
    let _SKY_BLUE =
    Color(0.529412, 0.807843, 0.921569, 1)

    (** Slate blue color. *)
    let _SLATE_BLUE =
    Color(0.415686, 0.352941, 0.803922, 1)

    (** Slate gray color. *)
    let _SLATE_GRAY =
    Color(0.439216, 0.501961, 0.564706, 1)

    (** Snow color. *)
    let _SNOW =
    Color(1, 0.980392, 0.980392, 1)

    (** Spring green color. *)
    let _SPRING_GREEN =
    Color(0, 1, 0.498039, 1)

    (** Steel blue color. *)
    let _STEEL_BLUE =
    Color(0.27451, 0.509804, 0.705882, 1)

    (** Tan color. *)
    let _TAN =
    Color(0.823529, 0.705882, 0.54902, 1)

    (** Teal color. *)
    let _TEAL =
    Color(0, 0.501961, 0.501961, 1)

    (** Thistle color. *)
    let _THISTLE =
    Color(0.847059, 0.74902, 0.847059, 1)

    (** Tomato color. *)
    let _TOMATO =
    Color(1, 0.388235, 0.278431, 1)

    (** Transparent color (white with zero alpha). *)
    let _TRANSPARENT =
    Color(1, 1, 1, 0)

    (** Turquoise color. *)
    let _TURQUOISE =
    Color(0.25098, 0.878431, 0.815686, 1)

    (** Violet color. *)
    let _VIOLET =
    Color(0.933333, 0.509804, 0.933333, 1)

    (** Web gray color. *)
    let _WEB_GRAY =
    Color(0.501961, 0.501961, 0.501961, 1)

    (** Web green color. *)
    let _WEB_GREEN =
    Color(0, 0.501961, 0, 1)

    (** Web maroon color. *)
    let _WEB_MAROON =
    Color(0.501961, 0, 0, 1)

    (** Web purple color. *)
    let _WEB_PURPLE =
    Color(0.501961, 0, 0.501961, 1)

    (** Wheat color. *)
    let _WHEAT =
    Color(0.960784, 0.870588, 0.701961, 1)

    (** White color. *)
    let _WHITE =
    Color(1, 1, 1, 1)

    (** White smoke color. *)
    let _WHITE_SMOKE =
    Color(0.960784, 0.960784, 0.960784, 1)

    (** Yellow color. *)
    let _YELLOW =
    Color(1, 1, 0, 1)

    (** Yellow green color. *)
    let _YELLOW_GREEN =
    Color(0.603922, 0.803922, 0.196078, 1)
    end

  module StringName = struct
    (** Performs a case-sensitive comparison to another string. Returns [code]-1[/code] if less than, [code]1[/code] if greater than, or [code]0[/code] if equal. ""Less than"" and ""greater than"" are determined by the [url=https://en.wikipedia.org/wiki/List_of_Unicode_characters]Unicode code points[/url] of each string, which roughly matches the alphabetical order.
With different string lengths, returns [code]1[/code] if this string is longer than the [param to] string, or [code]-1[/code] if shorter. Note that the length of empty strings is [i]always[/i] [code]0[/code].
To get a [bool] result from a string comparison, use the [code]==[/code] operator instead. See also [method nocasecmp_to], [method naturalcasecmp_to], and [method naturalnocasecmp_to]. *)
    let casecmp_to =
    M.foreign_method "StringName" "casecmp_to" (M.String.typ @-> M.StringName.typ @-> returning M.Int.typ)

    (** Performs a [b]case-insensitive[/b] comparison to another string. Returns [code]-1[/code] if less than, [code]1[/code] if greater than, or [code]0[/code] if equal. ""Less than"" or ""greater than"" are determined by the [url=https://en.wikipedia.org/wiki/List_of_Unicode_characters]Unicode code points[/url] of each string, which roughly matches the alphabetical order. Internally, lowercase characters are converted to uppercase for the comparison.
With different string lengths, returns [code]1[/code] if this string is longer than the [param to] string, or [code]-1[/code] if shorter. Note that the length of empty strings is [i]always[/i] [code]0[/code].
To get a [bool] result from a string comparison, use the [code]==[/code] operator instead. See also [method casecmp_to], [method naturalcasecmp_to], and [method naturalnocasecmp_to]. *)
    let nocasecmp_to =
    M.foreign_method "StringName" "nocasecmp_to" (M.String.typ @-> M.StringName.typ @-> returning M.Int.typ)

    (** Performs a [b]case-sensitive[/b], [i]natural order[/i] comparison to another string. Returns [code]-1[/code] if less than, [code]1[/code] if greater than, or [code]0[/code] if equal. ""Less than"" or ""greater than"" are determined by the [url=https://en.wikipedia.org/wiki/List_of_Unicode_characters]Unicode code points[/url] of each string, which roughly matches the alphabetical order.
When used for sorting, natural order comparison orders sequences of numbers by the combined value of each digit as is often expected, instead of the single digit's value. A sorted sequence of numbered strings will be [code][""1"", ""2"", ""3"", ...][/code], not [code][""1"", ""10"", ""2"", ""3"", ...][/code].
With different string lengths, returns [code]1[/code] if this string is longer than the [param to] string, or [code]-1[/code] if shorter. Note that the length of empty strings is [i]always[/i] [code]0[/code].
To get a [bool] result from a string comparison, use the [code]==[/code] operator instead. See also [method naturalnocasecmp_to], [method nocasecmp_to], and [method casecmp_to]. *)
    let naturalcasecmp_to =
    M.foreign_method "StringName" "naturalcasecmp_to" (M.String.typ @-> M.StringName.typ @-> returning M.Int.typ)

    (** Performs a [b]case-insensitive[/b], [i]natural order[/i] comparison to another string. Returns [code]-1[/code] if less than, [code]1[/code] if greater than, or [code]0[/code] if equal. ""Less than"" or ""greater than"" are determined by the [url=https://en.wikipedia.org/wiki/List_of_Unicode_characters]Unicode code points[/url] of each string, which roughly matches the alphabetical order. Internally, lowercase characters are converted to uppercase for the comparison.
When used for sorting, natural order comparison orders sequences of numbers by the combined value of each digit as is often expected, instead of the single digit's value. A sorted sequence of numbered strings will be [code][""1"", ""2"", ""3"", ...][/code], not [code][""1"", ""10"", ""2"", ""3"", ...][/code].
With different string lengths, returns [code]1[/code] if this string is longer than the [param to] string, or [code]-1[/code] if shorter. Note that the length of empty strings is [i]always[/i] [code]0[/code].
To get a [bool] result from a string comparison, use the [code]==[/code] operator instead. See also [method naturalcasecmp_to], [method nocasecmp_to], and [method casecmp_to]. *)
    let naturalnocasecmp_to =
    M.foreign_method "StringName" "naturalnocasecmp_to" (M.String.typ @-> M.StringName.typ @-> returning M.Int.typ)

    (** Returns the number of characters in the string. Empty strings ([code]""""[/code]) always return [code]0[/code]. See also [method is_empty]. *)
    let length =
    M.foreign_method "StringName" "length" (M.StringName.typ @-> returning M.Int.typ)

    (** Returns part of the string from the position [param from] with length [param len]. If [param len] is [code]-1[/code] (as by default), returns the rest of the string starting from the given position. *)
    let substr =
    M.foreign_method "StringName" "substr" (M.Int.typ @-> M.Int.typ @-> M.StringName.typ @-> returning M.String.typ)

    (** Splits the string using a [param delimiter] and returns the substring at index [param slice]. Returns an empty string if the [param slice] does not exist.
This is faster than [method split], if you only need one substring.
[b]Example:[/b]
[codeblock]
print(""i/am/example/hi"".get_slice(""/"", 2)) # Prints ""example""
[/codeblock] *)
    let get_slice =
    M.foreign_method "StringName" "get_slice" (M.String.typ @-> M.Int.typ @-> M.StringName.typ @-> returning M.String.typ)

    (** Splits the string using a Unicode character with code [param delimiter] and returns the substring at index [param slice]. Returns an empty string if the [param slice] does not exist.
This is faster than [method split], if you only need one substring. *)
    let get_slicec =
    M.foreign_method "StringName" "get_slicec" (M.Int.typ @-> M.Int.typ @-> M.StringName.typ @-> returning M.String.typ)

    (** Returns the total number of slices when the string is split with the given [param delimiter] (see [method split]). *)
    let get_slice_count =
    M.foreign_method "StringName" "get_slice_count" (M.String.typ @-> M.StringName.typ @-> returning M.Int.typ)

    (** Returns the index of the [b]first[/b] occurrence of [param what] in this string, or [code]-1[/code] if there are none. The search's start can be specified with [param from], continuing to the end of the string.
[codeblocks]
[gdscript]
print(""Team"".find(""I"")) # Prints -1

print(""Potato"".find(""t""))    # Prints 2
print(""Potato"".find(""t"", 3)) # Prints 4
print(""Potato"".find(""t"", 5)) # Prints -1
[/gdscript]
[csharp]
GD.Print(""Team"".Find(""I"")); // Prints -1

GD.Print(""Potato"".Find(""t""));    // Prints 2
GD.Print(""Potato"".Find(""t"", 3)); // Prints 4
GD.Print(""Potato"".Find(""t"", 5)); // Prints -1
[/csharp]
[/codeblocks]
[b]Note:[/b] If you just want to know whether the string contains [param what], use [method contains]. In GDScript, you may also use the [code]in[/code] operator. *)
    let find =
    M.foreign_method "StringName" "find" (M.String.typ @-> M.Int.typ @-> M.StringName.typ @-> returning M.Int.typ)

    (** Returns the number of occurrences of the substring [param what] between [param from] and [param to] positions. If [param to] is 0, the search continues until the end of the string. *)
    let count =
    M.foreign_method "StringName" "count" (M.String.typ @-> M.Int.typ @-> M.Int.typ @-> M.StringName.typ @-> returning M.Int.typ)

    (** Returns the number of occurrences of the substring [param what] between [param from] and [param to] positions, [b]ignoring case[/b]. If [param to] is 0, the search continues until the end of the string. *)
    let countn =
    M.foreign_method "StringName" "countn" (M.String.typ @-> M.Int.typ @-> M.Int.typ @-> M.StringName.typ @-> returning M.Int.typ)

    (** Returns the index of the [b]first[/b] [b]case-insensitive[/b] occurrence of [param what] in this string, or [code]-1[/code] if there are none. The starting search index can be specified with [param from], continuing to the end of the string. *)
    let findn =
    M.foreign_method "StringName" "findn" (M.String.typ @-> M.Int.typ @-> M.StringName.typ @-> returning M.Int.typ)

    (** Returns the index of the [b]last[/b] occurrence of [param what] in this string, or [code]-1[/code] if there are none. The search's start can be specified with [param from], continuing to the beginning of the string. This method is the reverse of [method find]. *)
    let rfind =
    M.foreign_method "StringName" "rfind" (M.String.typ @-> M.Int.typ @-> M.StringName.typ @-> returning M.Int.typ)

    (** Returns the index of the [b]last[/b] [b]case-insensitive[/b] occurrence of [param what] in this string, or [code]-1[/code] if there are none. The starting search index can be specified with [param from], continuing to the beginning of the string. This method is the reverse of [method findn]. *)
    let rfindn =
    M.foreign_method "StringName" "rfindn" (M.String.typ @-> M.Int.typ @-> M.StringName.typ @-> returning M.Int.typ)

    (** Does a simple expression match (also called ""glob"" or ""globbing""), where [code] * [/code] matches zero or more arbitrary characters and [code]?[/code] matches any single character except a period ([code].[/code]). An empty string or empty expression always evaluates to [code]false[/code]. *)
    let match_ =
    M.foreign_method "StringName" "match_" (M.String.typ @-> M.StringName.typ @-> returning M.Bool.typ)

    (** Does a simple [b]case-insensitive[/b] expression match, where [code] * [/code] matches zero or more arbitrary characters and [code]?[/code] matches any single character except a period ([code].[/code]). An empty string or empty expression always evaluates to [code]false[/code]. *)
    let matchn =
    M.foreign_method "StringName" "matchn" (M.String.typ @-> M.StringName.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if the string begins with the given [param text]. See also [method ends_with]. *)
    let begins_with =
    M.foreign_method "StringName" "begins_with" (M.String.typ @-> M.StringName.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if the string ends with the given [param text]. See also [method begins_with]. *)
    let ends_with =
    M.foreign_method "StringName" "ends_with" (M.String.typ @-> M.StringName.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if all characters of this string can be found in [param text] in their original order.
[codeblock]
var text = ""Wow, incredible!""

print(""inedible"".is_subsequence_of(text)) # Prints true
print(""Word!"".is_subsequence_of(text))    # Prints true
print(""Window"".is_subsequence_of(text))   # Prints false
print("""".is_subsequence_of(text))         # Prints true
[/codeblock] *)
    let is_subsequence_of =
    M.foreign_method "StringName" "is_subsequence_of" (M.String.typ @-> M.StringName.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if all characters of this string can be found in [param text] in their original order, [b]ignoring case[/b]. *)
    let is_subsequence_ofn =
    M.foreign_method "StringName" "is_subsequence_ofn" (M.String.typ @-> M.StringName.typ @-> returning M.Bool.typ)

    (** Returns an array containing the bigrams (pairs of consecutive characters) of this string.
[codeblock]
print(""Get up!"".bigrams()) # Prints [""Ge"", ""et"", ""t "", "" u"", ""up"", ""p!""]
[/codeblock] *)
    let bigrams =
    M.foreign_method "StringName" "bigrams" (M.StringName.typ @-> returning M.PackedStringArray.typ)

    (** Returns the similarity index ([url=https://en.wikipedia.org/wiki/S%C3%B8rensen%E2%80%93Dice_coefficient]Sorensen-Dice coefficient[/url]) of this string compared to another. A result of [code]1.0[/code] means totally similar, while [code]0.0[/code] means totally dissimilar.
[codeblock]
print(""ABC123"".similarity(""ABC123"")) # Prints 1.0
print(""ABC123"".similarity(""XYZ456"")) # Prints 0.0
print(""ABC123"".similarity(""123ABC"")) # Prints 0.8
print(""ABC123"".similarity(""abc123"")) # Prints 0.4
[/codeblock] *)
    let similarity =
    M.foreign_method "StringName" "similarity" (M.String.typ @-> M.StringName.typ @-> returning M.Float.typ)

    (** Formats the string by replacing all occurrences of [param placeholder] with the elements of [param values].
[param values] can be a [Dictionary] or an [Array]. Any underscores in [param placeholder] will be replaced with the corresponding keys in advance. Array elements use their index as keys.
[codeblock]
# Prints ""Waiting for Godot is a play by Samuel Beckett, and Godot Engine is named after it.""
var use_array_values = ""Waiting for {0} is a play by {1}, and {0} Engine is named after it.""
print(use_array_values.format([""Godot"", ""Samuel Beckett""]))

# Prints ""User 42 is Godot.""
print(""User {id} is {name}."".format({""id"": 42, ""name"": ""Godot""}))
[/codeblock]
Some additional handling is performed when [param values] is an [Array]. If [param placeholder] does not contain an underscore, the elements of the [param values] array will be used to replace one occurrence of the placeholder in order; If an element of [param values] is another 2-element array, it'll be interpreted as a key-value pair.
[codeblock]
# Prints ""User 42 is Godot.""
print(""User {} is {}."".format([42, ""Godot""], ""{}""))
print(""User {id} is {name}."".format([[""id"", 42], [""name"", ""Godot""]]))
[/codeblock]
See also the [url=$DOCS_URL/tutorials/scripting/gdscript/gdscript_format_string.html]GDScript format string[/url] tutorial.
[b]Note:[/b] In C#, it's recommended to [url=https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/tokens/interpolated]interpolate strings with ""$""[/url], instead. *)
    let format =
    M.foreign_method "StringName" "format" (M.Variant.typ @-> M.String.typ @-> M.StringName.typ @-> returning M.String.typ)

    (** Replaces all occurrences of [param what] inside the string with the given [param forwhat]. *)
    let replace =
    M.foreign_method "StringName" "replace" (M.String.typ @-> M.String.typ @-> M.StringName.typ @-> returning M.String.typ)

    (** Replaces all [b]case-insensitive[/b] occurrences of [param what] inside the string with the given [param forwhat]. *)
    let replacen =
    M.foreign_method "StringName" "replacen" (M.String.typ @-> M.String.typ @-> M.StringName.typ @-> returning M.String.typ)

    (** Repeats this string a number of times. [param count] needs to be greater than [code]0[/code]. Otherwise, returns an empty string. *)
    let repeat =
    M.foreign_method "StringName" "repeat" (M.Int.typ @-> M.StringName.typ @-> returning M.String.typ)

    (** Returns the copy of this string in reverse order. *)
    let reverse =
    M.foreign_method "StringName" "reverse" (M.StringName.typ @-> returning M.String.typ)

    (** Inserts [param what] at the given [param position] in the string. *)
    let insert =
    M.foreign_method "StringName" "insert" (M.Int.typ @-> M.String.typ @-> M.StringName.typ @-> returning M.String.typ)

    (** Returns a string with [param chars] characters erased starting from [param position]. If [param chars] goes beyond the string's length given the specified [param position], fewer characters will be erased from the returned string. Returns an empty string if either [param position] or [param chars] is negative. Returns the original string unmodified if [param chars] is [code]0[/code]. *)
    let erase =
    M.foreign_method "StringName" "erase" (M.Int.typ @-> M.Int.typ @-> M.StringName.typ @-> returning M.String.typ)

    (** Changes the appearance of the string: replaces underscores ([code]_[/code]) with spaces, adds spaces before uppercase letters in the middle of a word, converts all letters to lowercase, then converts the first one and each one following a space to uppercase.
[codeblocks]
[gdscript]
""move_local_x"".capitalize()   # Returns ""Move Local X""
""sceneFile_path"".capitalize() # Returns ""Scene File Path""
""2D, FPS, PNG"".capitalize()   # Returns ""2d, Fps, Png""
[/gdscript]
[csharp]
""move_local_x"".Capitalize();   // Returns ""Move Local X""
""sceneFile_path"".Capitalize(); // Returns ""Scene File Path""
""2D, FPS, PNG"".Capitalize();   // Returns ""2d, Fps, Png""
[/csharp]
[/codeblocks] *)
    let capitalize =
    M.foreign_method "StringName" "capitalize" (M.StringName.typ @-> returning M.String.typ)

    (** Returns the string converted to [code]camelCase[/code]. *)
    let to_camel_case =
    M.foreign_method "StringName" "to_camel_case" (M.StringName.typ @-> returning M.String.typ)

    (** Returns the string converted to [code]PascalCase[/code]. *)
    let to_pascal_case =
    M.foreign_method "StringName" "to_pascal_case" (M.StringName.typ @-> returning M.String.typ)

    (** Returns the string converted to [code]snake_case[/code].
[b]Note:[/b] Numbers followed by a [i]single[/i] letter are not separated in the conversion to keep some words (such as ""2D"") together.
[codeblocks]
[gdscript]
""Node2D"".to_snake_case()               # Returns ""node_2d""
""2nd place"".to_snake_case()            # Returns ""2_nd_place""
""Texture3DAssetFolder"".to_snake_case() # Returns ""texture_3d_asset_folder""
[/gdscript]
[csharp]
""Node2D"".ToSnakeCase();               // Returns ""node_2d""
""2nd place"".ToSnakeCase();            // Returns ""2_nd_place""
""Texture3DAssetFolder"".ToSnakeCase(); // Returns ""texture_3d_asset_folder""
[/csharp]
[/codeblocks] *)
    let to_snake_case =
    M.foreign_method "StringName" "to_snake_case" (M.StringName.typ @-> returning M.String.typ)

    (** Splits the string using a [param delimiter] and returns an array of the substrings. If [param delimiter] is an empty string, each substring will be a single character. This method is the opposite of [method join].
If [param allow_empty] is [code]false[/code], empty strings between adjacent delimiters are excluded from the array.
If [param maxsplit] is greater than [code]0[/code], the number of splits may not exceed [param maxsplit]. By default, the entire string is split.
[b]Example:[/b]
[codeblocks]
[gdscript]
var some_array = ""One,Two,Three,Four"".split("","", true, 2)

print(some_array.size()) # Prints 3
print(some_array[0])     # Prints ""One""
print(some_array[1])     # Prints ""Two""
print(some_array[2])     # Prints ""Three,Four""
[/gdscript]
[csharp]
// C#'s `Split()` does not support the `maxsplit` parameter.
var someArray = ""One,Two,Three"".Split("","");

GD.Print(someArray[0]); // Prints ""One""
GD.Print(someArray[1]); // Prints ""Two""
GD.Print(someArray[2]); // Prints ""Three""
[/csharp]
[/codeblocks]
[b]Note:[/b] If you only need one substring from the array, consider using [method get_slice] which is faster. If you need to split strings with more complex rules, use the [RegEx] class instead. *)
    let split =
    M.foreign_method "StringName" "split" (M.String.typ @-> M.Bool.typ @-> M.Int.typ @-> M.StringName.typ @-> returning M.PackedStringArray.typ)

    (** Splits the string using a [param delimiter] and returns an array of the substrings, starting from the end of the string. The splits in the returned array appear in the same order as the original string. If [param delimiter] is an empty string, each substring will be a single character.
If [param allow_empty] is [code]false[/code], empty strings between adjacent delimiters are excluded from the array.
If [param maxsplit] is greater than [code]0[/code], the number of splits may not exceed [param maxsplit]. By default, the entire string is split, which is mostly identical to [method split].
[b]Example:[/b]
[codeblocks]
[gdscript]
var some_string = ""One,Two,Three,Four""
var some_array = some_string.rsplit("","", true, 1)

print(some_array.size()) # Prints 2
print(some_array[0])     # Prints ""One,Two,Three""
print(some_array[1])     # Prints ""Four""
[/gdscript]
[csharp]
// In C#, there is no String.RSplit() method.
[/csharp]
[/codeblocks] *)
    let rsplit =
    M.foreign_method "StringName" "rsplit" (M.String.typ @-> M.Bool.typ @-> M.Int.typ @-> M.StringName.typ @-> returning M.PackedStringArray.typ)

    (** Splits the string into floats by using a [param delimiter] and returns a [PackedFloat64Array].
If [param allow_empty] is [code]false[/code], empty or invalid [float] conversions between adjacent delimiters are excluded.
[codeblock]
var a = ""1,2,4.5"".split_floats("","")         # a is [1.0, 2.0, 4.5]
var c = ""1| ||4.5"".split_floats(""|"")        # c is [1.0, 0.0, 0.0, 4.5]
var b = ""1| ||4.5"".split_floats(""|"", false) # b is [1.0, 4.5]
[/codeblock] *)
    let split_floats =
    M.foreign_method "StringName" "split_floats" (M.String.typ @-> M.Bool.typ @-> M.StringName.typ @-> returning M.PackedFloat64Array.typ)

    (** Returns the concatenation of [param parts]' elements, with each element separated by the string calling this method. This method is the opposite of [method split].
[b]Example:[/b]
[codeblocks]
[gdscript]
var fruits = [""Apple"", ""Orange"", ""Pear"", ""Kiwi""]

print("", "".join(fruits))  # Prints ""Apple, Orange, Pear, Kiwi""
print(""---"".join(fruits)) # Prints ""Apple---Orange---Pear---Kiwi""
[/gdscript]
[csharp]
var fruits = new string[] {""Apple"", ""Orange"", ""Pear"", ""Kiwi""};

// In C#, this method is static.
GD.Print(string.Join("", "", fruits));  // Prints ""Apple, Orange, Pear, Kiwi""
GD.Print(string.Join(""---"", fruits)); // Prints ""Apple---Orange---Pear---Kiwi""
[/csharp]
[/codeblocks] *)
    let join =
    M.foreign_method "StringName" "join" (M.PackedStringArray.typ @-> M.StringName.typ @-> returning M.String.typ)

    (** Returns the string converted to [code]UPPERCASE[/code]. *)
    let to_upper =
    M.foreign_method "StringName" "to_upper" (M.StringName.typ @-> returning M.String.typ)

    (** Returns the string converted to [code]lowercase[/code]. *)
    let to_lower =
    M.foreign_method "StringName" "to_lower" (M.StringName.typ @-> returning M.String.typ)

    (** Returns the first [param length] characters from the beginning of the string. If [param length] is negative, strips the last [param length] characters from the string's end.
[codeblock]
print(""Hello World!"".left(3))  # Prints ""Hel""
print(""Hello World!"".left(-4)) # Prints ""Hello Wo""
[/codeblock] *)
    let left =
    M.foreign_method "StringName" "left" (M.Int.typ @-> M.StringName.typ @-> returning M.String.typ)

    (** Returns the last [param length] characters from the end of the string. If [param length] is negative, strips the first [param length] characters from the string's beginning.
[codeblock]
print(""Hello World!"".right(3))  # Prints ""ld!""
print(""Hello World!"".right(-4)) # Prints ""o World!""
[/codeblock] *)
    let right =
    M.foreign_method "StringName" "right" (M.Int.typ @-> M.StringName.typ @-> returning M.String.typ)

    (** Strips all non-printable characters from the beginning and the end of the string. These include spaces, tabulations ([code]\t[/code]), and newlines ([code]\n[/code] [code]\r[/code]).
If [param left] is [code]false[/code], ignores the string's beginning. Likewise, if [param right] is [code]false[/code], ignores the string's end. *)
    let strip_edges =
    M.foreign_method "StringName" "strip_edges" (M.Bool.typ @-> M.Bool.typ @-> M.StringName.typ @-> returning M.String.typ)

    (** Strips all escape characters from the string. These include all non-printable control characters of the first page of the ASCII table (values from 0 to 31), such as tabulation ([code]\t[/code]) and newline ([code]\n[/code], [code]\r[/code]) characters, but [i]not[/i] spaces. *)
    let strip_escapes =
    M.foreign_method "StringName" "strip_escapes" (M.StringName.typ @-> returning M.String.typ)

    (** Removes a set of characters defined in [param chars] from the string's beginning. See also [method rstrip].
[b]Note:[/b] [param chars] is not a prefix. Use [method trim_prefix] to remove a single prefix, rather than a set of characters. *)
    let lstrip =
    M.foreign_method "StringName" "lstrip" (M.String.typ @-> M.StringName.typ @-> returning M.String.typ)

    (** Removes a set of characters defined in [param chars] from the string's end. See also [method lstrip].
[b]Note:[/b] [param chars] is not a suffix. Use [method trim_suffix] to remove a single suffix, rather than a set of characters. *)
    let rstrip =
    M.foreign_method "StringName" "rstrip" (M.String.typ @-> M.StringName.typ @-> returning M.String.typ)

    (** If the string is a valid file name or path, returns the file extension without the leading period ([code].[/code]). Otherwise, returns an empty string.
[codeblock]
var a = ""/path/to/file.txt"".get_extension() # a is ""txt""
var b = ""cool.txt"".get_extension()          # b is ""txt""
var c = ""cool.font.tres"".get_extension()    # c is ""tres""
var d = "".pack1"".get_extension()            # d is ""pack1""

var e = ""file.txt."".get_extension()  # e is """"
var f = ""file.txt.."".get_extension() # f is """"
var g = ""txt"".get_extension()        # g is """"
var h = """".get_extension()           # h is """"
[/codeblock] *)
    let get_extension =
    M.foreign_method "StringName" "get_extension" (M.StringName.typ @-> returning M.String.typ)

    (** If the string is a valid file path, returns the full file path, without the extension.
[codeblock]
var base = ""/path/to/file.txt"".get_basename() # base is ""/path/to/file""
[/codeblock] *)
    let get_basename =
    M.foreign_method "StringName" "get_basename" (M.StringName.typ @-> returning M.String.typ)

    (** Concatenates [param file] at the end of the string as a subpath, adding [code]/[/code] if necessary.
[b]Example:[/b] [code]""this/is"".path_join(""path"") == ""this/is/path""[/code]. *)
    let path_join =
    M.foreign_method "StringName" "path_join" (M.String.typ @-> M.StringName.typ @-> returning M.String.typ)

    (** Returns the character code at position [param at]. *)
    let unicode_at =
    M.foreign_method "StringName" "unicode_at" (M.Int.typ @-> M.StringName.typ @-> returning M.Int.typ)

    (** Indents every line of the string with the given [param prefix]. Empty lines are not indented. See also [method dedent] to remove indentation.
For example, the string can be indented with two tabulations using [code]""\t\t""[/code], or four spaces using [code]""    ""[/code]. *)
    let indent =
    M.foreign_method "StringName" "indent" (M.String.typ @-> M.StringName.typ @-> returning M.String.typ)

    (** Returns a copy of the string with indentation (leading tabs and spaces) removed. See also [method indent] to add indentation. *)
    let dedent =
    M.foreign_method "StringName" "dedent" (M.StringName.typ @-> returning M.String.typ)

    (** Returns the [url=https://en.wikipedia.org/wiki/MD5]MD5 hash[/url] of the string as another [String]. *)
    let md5_text =
    M.foreign_method "StringName" "md5_text" (M.StringName.typ @-> returning M.String.typ)

    (** Returns the [url=https://en.wikipedia.org/wiki/SHA-1]SHA-1[/url] hash of the string as another [String]. *)
    let sha1_text =
    M.foreign_method "StringName" "sha1_text" (M.StringName.typ @-> returning M.String.typ)

    (** Returns the [url=https://en.wikipedia.org/wiki/SHA-2]SHA-256[/url] hash of the string as another [String]. *)
    let sha256_text =
    M.foreign_method "StringName" "sha256_text" (M.StringName.typ @-> returning M.String.typ)

    (** Returns the [url=https://en.wikipedia.org/wiki/MD5]MD5 hash[/url] of the string as a [PackedByteArray]. *)
    let md5_buffer =
    M.foreign_method "StringName" "md5_buffer" (M.StringName.typ @-> returning M.PackedByteArray.typ)

    (** Returns the [url=https://en.wikipedia.org/wiki/SHA-1]SHA-1[/url] hash of the string as a [PackedByteArray]. *)
    let sha1_buffer =
    M.foreign_method "StringName" "sha1_buffer" (M.StringName.typ @-> returning M.PackedByteArray.typ)

    (** Returns the [url=https://en.wikipedia.org/wiki/SHA-2]SHA-256[/url] hash of the string as a [PackedByteArray]. *)
    let sha256_buffer =
    M.foreign_method "StringName" "sha256_buffer" (M.StringName.typ @-> returning M.PackedByteArray.typ)

    (** Returns [code]true[/code] if the string's length is [code]0[/code] ([code]""""[/code]). See also [method length]. *)
    let is_empty =
    M.foreign_method "StringName" "is_empty" (M.StringName.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if the string contains [param what]. In GDScript, this corresponds to the [code]in[/code] operator.
[codeblocks]
[gdscript]
print(""Node"".contains(""de"")) # Prints true
print(""team"".contains(""I""))  # Prints false
print(""I"" in ""team"")         # Prints false
[/gdscript]
[csharp]
GD.Print(""Node"".Contains(""de"")); // Prints true
GD.Print(""team"".Contains(""I""));  // Prints false
[/csharp]
[/codeblocks]
If you need to know where [param what] is within the string, use [method find]. *)
    let contains =
    M.foreign_method "StringName" "contains" (M.String.typ @-> M.StringName.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if the string is a path to a file or directory, and its starting point is explicitly defined. This method is the opposite of [method is_relative_path].
This includes all paths starting with [code]""res://""[/code], [code]""user://""[/code], [code]""C:\""[/code], [code]""/""[/code], etc. *)
    let is_absolute_path =
    M.foreign_method "StringName" "is_absolute_path" (M.StringName.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if the string is a path, and its starting point is dependent on context. The path could begin from the current directory, or the current [Node] (if the string is derived from a [NodePath]), and may sometimes be prefixed with [code]""./""[/code]. This method is the opposite of [method is_absolute_path]. *)
    let is_relative_path =
    M.foreign_method "StringName" "is_relative_path" (M.StringName.typ @-> returning M.Bool.typ)

    (** If the string is a valid file path, converts the string into a canonical path. This is the shortest possible path, without [code]""./""[/code], and all the unnecessary [code]""..""[/code] and [code]""/""[/code].
[codeblock]
var simple_path = ""./path/to///../file"".simplify_path()
print(simple_path) # Prints ""path/file""
[/codeblock] *)
    let simplify_path =
    M.foreign_method "StringName" "simplify_path" (M.StringName.typ @-> returning M.String.typ)

    (** If the string is a valid file path, returns the base directory name.
[codeblock]
var dir_path = ""/path/to/file.txt"".get_base_dir() # dir_path is ""/path/to""
[/codeblock] *)
    let get_base_dir =
    M.foreign_method "StringName" "get_base_dir" (M.StringName.typ @-> returning M.String.typ)

    (** If the string is a valid file path, returns the file name, including the extension.
[codeblock]
var file = ""/path/to/icon.png"".get_file() # file is ""icon.png""
[/codeblock] *)
    let get_file =
    M.foreign_method "StringName" "get_file" (M.StringName.typ @-> returning M.String.typ)

    (** Returns a copy of the string with special characters escaped using the XML standard. If [param escape_quotes] is [code]true[/code], the single quote ([code]'[/code]) and double quote ([code]""[/code]) characters are also escaped. *)
    let xml_escape =
    M.foreign_method "StringName" "xml_escape" (M.Bool.typ @-> M.StringName.typ @-> returning M.String.typ)

    (** Returns a copy of the string with escaped characters replaced by their meanings according to the XML standard. *)
    let xml_unescape =
    M.foreign_method "StringName" "xml_unescape" (M.StringName.typ @-> returning M.String.typ)

    (** Encodes the string to URL-friendly format. This method is meant to properly encode the parameters in a URL when sending an HTTP request.
[codeblocks]
[gdscript]
var prefix = ""$DOCS_URL/?highlight=""
var url = prefix + ""Godot Engine:docs"".uri_encode()

print(url) # Prints ""$DOCS_URL/?highlight=Godot%20Engine%3%docs""
[/gdscript]
[csharp]
var prefix = ""$DOCS_URL/?highlight="";
var url = prefix + ""Godot Engine:docs"".URIEncode();

GD.Print(url); // Prints ""$DOCS_URL/?highlight=Godot%20Engine%3%docs""
[/csharp]
[/codeblocks] *)
    let uri_encode =
    M.foreign_method "StringName" "uri_encode" (M.StringName.typ @-> returning M.String.typ)

    (** Decodes the string from its URL-encoded format. This method is meant to properly decode the parameters in a URL when receiving an HTTP request.
[codeblocks]
[gdscript]
var url = ""$DOCS_URL/?highlight=Godot%20Engine%3%docs""
print(url.uri_decode()) # Prints ""$DOCS_URL/?highlight=Godot Engine:docs""
[/gdscript]
[csharp]
var url = ""$DOCS_URL/?highlight=Godot%20Engine%3%docs""
GD.Print(url.URIDecode()) // Prints ""$DOCS_URL/?highlight=Godot Engine:docs""
[/csharp]
[/codeblocks] *)
    let uri_decode =
    M.foreign_method "StringName" "uri_decode" (M.StringName.typ @-> returning M.String.typ)

    (** Returns a copy of the string with special characters escaped using the C language standard. *)
    let c_escape =
    M.foreign_method "StringName" "c_escape" (M.StringName.typ @-> returning M.String.typ)

    (** Returns a copy of the string with escaped characters replaced by their meanings. Supported escape sequences are [code]\'[/code], [code]\""[/code], [code]\\[/code], [code]\a[/code], [code]\b[/code], [code]\f[/code], [code]\n[/code], [code]\r[/code], [code]\t[/code], [code]\v[/code].
[b]Note:[/b] Unlike the GDScript parser, this method doesn't support the [code]\uXXXX[/code] escape sequence. *)
    let c_unescape =
    M.foreign_method "StringName" "c_unescape" (M.StringName.typ @-> returning M.String.typ)

    (** Returns a copy of the string with special characters escaped using the JSON standard. Because it closely matches the C standard, it is possible to use [method c_unescape] to unescape the string, if necessary. *)
    let json_escape =
    M.foreign_method "StringName" "json_escape" (M.StringName.typ @-> returning M.String.typ)

    (** Returns a copy of the string with all characters that are not allowed in [member Node.name] ([code].[/code] [code]:[/code] [code]@[/code] [code]/[/code] [code]""[/code] [code]%[/code]) replaced with underscores. *)
    let validate_node_name =
    M.foreign_method "StringName" "validate_node_name" (M.StringName.typ @-> returning M.String.typ)

    (** Returns a copy of the string with all characters that are not allowed in [method is_valid_filename] replaced with underscores. *)
    let validate_filename =
    M.foreign_method "StringName" "validate_filename" (M.StringName.typ @-> returning M.String.typ)

    (** Returns [code]true[/code] if this string is a valid identifier. A valid identifier may contain only letters, digits and underscores ([code]_[/code]), and the first character may not be a digit.
[codeblock]
print(""node_2d"".is_valid_identifier())    # Prints true
print(""TYPE_FLOAT"".is_valid_identifier()) # Prints true
print(""1st_method"".is_valid_identifier()) # Prints false
print(""MyMethod#2"".is_valid_identifier()) # Prints false
[/codeblock] *)
    let is_valid_identifier =
    M.foreign_method "StringName" "is_valid_identifier" (M.StringName.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this string represents a valid integer. A valid integer only contains digits, and may be prefixed with a positive ([code]+[/code]) or negative ([code]-[/code]) sign. See also [method to_int].
[codeblock]
print(""7"".is_valid_int())    # Prints true
print(""1.65"".is_valid_int()) # Prints false
print(""Hi"".is_valid_int())   # Prints false
print(""+3"".is_valid_int())   # Prints true
print(""-12"".is_valid_int())  # Prints true
[/codeblock] *)
    let is_valid_int =
    M.foreign_method "StringName" "is_valid_int" (M.StringName.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this string represents a valid floating-point number. A valid float may contain only digits, one decimal point ([code].[/code]), and the exponent letter ([code]e[/code]). It may also be prefixed with a positive ([code]+[/code]) or negative ([code]-[/code]) sign. Any valid integer is also a valid float (see [method is_valid_int]). See also [method to_float].
[codeblock]
print(""1.7"".is_valid_float())   # Prints true
print(""24"".is_valid_float())    # Prints true
print(""7e3"".is_valid_float())   # Prints true
print(""Hello"".is_valid_float()) # Prints false
[/codeblock] *)
    let is_valid_float =
    M.foreign_method "StringName" "is_valid_float" (M.StringName.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this string is a valid hexadecimal number. A valid hexadecimal number only contains digits or letters [code]A[/code] to [code]F[/code] (either uppercase or lowercase), and may be prefixed with a positive ([code]+[/code]) or negative ([code]-[/code]) sign.
If [param with_prefix] is [code]true[/code], the hexadecimal number needs to prefixed by [code]""0x""[/code] to be considered valid.
[codeblock]
print(""A08E"".is_valid_hex_number())    # Prints true
print(""-AbCdEf"".is_valid_hex_number()) # Prints true
print(""2.5"".is_valid_hex_number())     # Prints false

print(""0xDEADC0DE"".is_valid_hex_number(true)) # Prints true
[/codeblock] *)
    let is_valid_hex_number =
    M.foreign_method "StringName" "is_valid_hex_number" (M.Bool.typ @-> M.StringName.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this string is a valid color in hexadecimal HTML notation. The string must be a hexadecimal value (see [method is_valid_hex_number]) of either 3, 4, 6 or 8 digits, and may be prefixed by a hash sign ([code]#[/code]). Other HTML notations for colors, such as names or [code]hsl()[/code], are not considered valid. See also [method Color.html]. *)
    let is_valid_html_color =
    M.foreign_method "StringName" "is_valid_html_color" (M.StringName.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this string represents a well-formatted IPv4 or IPv6 address. This method considers [url=https://en.wikipedia.org/wiki/Reserved_IP_addresses]reserved IP addresses[/url] such as [code]""0.0.0.0""[/code] and [code]""ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff""[/code] as valid. *)
    let is_valid_ip_address =
    M.foreign_method "StringName" "is_valid_ip_address" (M.StringName.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this string does not contain characters that are not allowed in file names ([code]:[/code] [code]/[/code] [code]\[/code] [code]?[/code] [code] * [/code] [code]""[/code] [code]|[/code] [code]%[/code] [code]<[/code] [code]>[/code]). *)
    let is_valid_filename =
    M.foreign_method "StringName" "is_valid_filename" (M.StringName.typ @-> returning M.Bool.typ)

    (** Converts the string representing an integer number into an [int]. This method removes any non-number character and stops at the first decimal point ([code].[/code]). See also [method is_valid_int].
[codeblock]
var a = ""123"".to_int()    # a is 123
var b = ""x1y2z3"".to_int() # b is 123
var c = ""-1.2.3"".to_int() # c is -1
var d = ""Hello!"".to_int() # d is 0
[/codeblock] *)
    let to_int =
    M.foreign_method "StringName" "to_int" (M.StringName.typ @-> returning M.Int.typ)

    (** Converts the string representing a decimal number into a [float]. This method stops on the first non-number character, except the first decimal point ([code].[/code]) and the exponent letter ([code]e[/code]). See also [method is_valid_float].
[codeblock]
var a = ""12.35"".to_float() # a is 12.35
var b = ""1.2.3"".to_float() # b is 1.2
var c = ""12xy3"".to_float() # c is 12.0
var d = ""1e3"".to_float()   # d is 1000.0
var e = ""Hello!"".to_int()  # e is 0.0
[/codeblock] *)
    let to_float =
    M.foreign_method "StringName" "to_float" (M.StringName.typ @-> returning M.Float.typ)

    (** Converts the string representing a hexadecimal number into an [int]. The string may be optionally prefixed with [code]""0x""[/code], and an additional [code]-[/code] prefix for negative numbers.
[codeblocks]
[gdscript]
print(""0xff"".hex_to_int()) # Prints 255
print(""ab"".hex_to_int())   # Prints 171
[/gdscript]
[csharp]
GD.Print(""0xff"".HexToInt()); // Prints 255
GD.Print(""ab"".HexToInt());   // Prints 171
[/csharp]
[/codeblocks] *)
    let hex_to_int =
    M.foreign_method "StringName" "hex_to_int" (M.StringName.typ @-> returning M.Int.typ)

    (** Converts the string representing a binary number into an [int]. The string may optionally be prefixed with [code]""0b""[/code], and an additional [code]-[/code] prefix for negative numbers.
[codeblocks]
[gdscript]
print(""101"".bin_to_int())   # Prints 5
print(""0b101"".bin_to_int()) # Prints 5
print(""-0b10"".bin_to_int()) # Prints -2
[/gdscript]
[csharp]
GD.Print(""101"".BinToInt());   // Prints 5
GD.Print(""0b101"".BinToInt()); // Prints 5
GD.Print(""-0b10"".BinToInt()); // Prints -2
[/csharp]
[/codeblocks] *)
    let bin_to_int =
    M.foreign_method "StringName" "bin_to_int" (M.StringName.typ @-> returning M.Int.typ)

    (** Formats the string to be at least [param min_length] long by adding [param character]s to the left of the string, if necessary. See also [method rpad]. *)
    let lpad =
    M.foreign_method "StringName" "lpad" (M.Int.typ @-> M.String.typ @-> M.StringName.typ @-> returning M.String.typ)

    (** Formats the string to be at least [param min_length] long, by adding [param character]s to the right of the string, if necessary. See also [method lpad]. *)
    let rpad =
    M.foreign_method "StringName" "rpad" (M.Int.typ @-> M.String.typ @-> M.StringName.typ @-> returning M.String.typ)

    (** Formats the string representing a number to have an exact number of [param digits] [i]after[/i] the decimal point. *)
    let pad_decimals =
    M.foreign_method "StringName" "pad_decimals" (M.Int.typ @-> M.StringName.typ @-> returning M.String.typ)

    (** Formats the string representing a number to have an exact number of [param digits] [i]before[/i] the decimal point. *)
    let pad_zeros =
    M.foreign_method "StringName" "pad_zeros" (M.Int.typ @-> M.StringName.typ @-> returning M.String.typ)

    (** Removes the given [param prefix] from the start of the string, or returns the string unchanged. *)
    let trim_prefix =
    M.foreign_method "StringName" "trim_prefix" (M.String.typ @-> M.StringName.typ @-> returning M.String.typ)

    (** Removes the given [param suffix] from the end of the string, or returns the string unchanged. *)
    let trim_suffix =
    M.foreign_method "StringName" "trim_suffix" (M.String.typ @-> M.StringName.typ @-> returning M.String.typ)

    (** Converts the string to an [url=https://en.wikipedia.org/wiki/ASCII]ASCII[/url]/Latin-1 encoded [PackedByteArray]. This method is slightly faster than [method to_utf8_buffer], but replaces all unsupported characters with spaces. *)
    let to_ascii_buffer =
    M.foreign_method "StringName" "to_ascii_buffer" (M.StringName.typ @-> returning M.PackedByteArray.typ)

    (** Converts the string to a [url=https://en.wikipedia.org/wiki/UTF-8]UTF-8[/url] encoded [PackedByteArray]. This method is slightly slower than [method to_ascii_buffer], but supports all UTF-8 characters. For most cases, prefer using this method. *)
    let to_utf8_buffer =
    M.foreign_method "StringName" "to_utf8_buffer" (M.StringName.typ @-> returning M.PackedByteArray.typ)

    (** Converts the string to a [url=https://en.wikipedia.org/wiki/UTF-16]UTF-16[/url] encoded [PackedByteArray]. *)
    let to_utf16_buffer =
    M.foreign_method "StringName" "to_utf16_buffer" (M.StringName.typ @-> returning M.PackedByteArray.typ)

    (** Converts the string to a [url=https://en.wikipedia.org/wiki/UTF-32]UTF-32[/url] encoded [PackedByteArray]. *)
    let to_utf32_buffer =
    M.foreign_method "StringName" "to_utf32_buffer" (M.StringName.typ @-> returning M.PackedByteArray.typ)

    (** Decodes a hexadecimal string as a [PackedByteArray].
[codeblocks]
[gdscript]
var text = ""hello world""
var encoded = text.to_utf8_buffer().hex_encode() # outputs ""68656c6c6f20776f726c64""
print(buf.hex_decode().get_string_from_utf8())
[/gdscript]
[csharp]
var text = ""hello world"";
var encoded = text.ToUtf8Buffer().HexEncode(); // outputs ""68656c6c6f20776f726c64""
GD.Print(buf.HexDecode().GetStringFromUtf8());
[/csharp]
[/codeblocks] *)
    let hex_decode =
    M.foreign_method "StringName" "hex_decode" (M.StringName.typ @-> returning M.PackedByteArray.typ)

    (** Converts the string to a [url=https://en.wikipedia.org/wiki/Wide_character]wide character[/url] ([code]wchar_t[/code], UTF-16 on Windows, UTF-32 on other platforms) encoded [PackedByteArray]. *)
    let to_wchar_buffer =
    M.foreign_method "StringName" "to_wchar_buffer" (M.StringName.typ @-> returning M.PackedByteArray.typ)

    (** Returns the 32-bit hash value representing the string's contents.
[b]Note:[/b] Strings with equal hash values are [i]not[/i] guaranteed to be the same, as a result of hash collisions. On the contrary, strings with different hash values are guaranteed to be different. *)
    let hash =
    M.foreign_method "StringName" "hash" (M.StringName.typ @-> returning M.Int.typ)








    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING_NAME None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.StringName.typ @-> M.StringName.typ @-> M.Bool.typ @-> returning void))
















    let _StringName_elem_String =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING_NAME (Some GlobalEnum.VariantType._TYPE_STRING) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.StringName.typ @-> M.String.typ @-> M.Bool.typ @-> returning void))

































    (** Returns [code]true[/code] if the [StringName] and [param right] refer to the same name. Comparisons between [StringName]s are much faster than regular [String] comparisons. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING_NAME (Some GlobalEnum.VariantType._TYPE_STRING_NAME) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.StringName.typ @-> M.StringName.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the [StringName] and [param right] do not refer to the same name. Comparisons between [StringName]s are much faster than regular [String] comparisons. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING_NAME (Some GlobalEnum.VariantType._TYPE_STRING_NAME) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.StringName.typ @-> M.StringName.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the left [StringName]'s pointer comes before [param right]. Note that this will not match their [url=https://en.wikipedia.org/wiki/List_of_Unicode_characters]Unicode order[/url]. *)
    let (<) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING_NAME (Some GlobalEnum.VariantType._TYPE_STRING_NAME) Godotcaml.GlobalEnum.VariantOperator._OP_LESS
      (funptr (M.StringName.typ @-> M.StringName.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the left [StringName]'s pointer comes before [param right] or if they are the same. Note that this will not match their [url=https://en.wikipedia.org/wiki/List_of_Unicode_characters]Unicode order[/url]. *)
    let (<=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING_NAME (Some GlobalEnum.VariantType._TYPE_STRING_NAME) Godotcaml.GlobalEnum.VariantOperator._OP_LESS_EQUAL
      (funptr (M.StringName.typ @-> M.StringName.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the left [StringName]'s pointer comes after [param right]. Note that this will not match their [url=https://en.wikipedia.org/wiki/List_of_Unicode_characters]Unicode order[/url]. *)
    let (>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING_NAME (Some GlobalEnum.VariantType._TYPE_STRING_NAME) Godotcaml.GlobalEnum.VariantOperator._OP_GREATER
      (funptr (M.StringName.typ @-> M.StringName.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the left [StringName]'s pointer comes after [param right] or if they are the same. Note that this will not match their [url=https://en.wikipedia.org/wiki/List_of_Unicode_characters]Unicode order[/url]. *)
    let (>=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING_NAME (Some GlobalEnum.VariantType._TYPE_STRING_NAME) Godotcaml.GlobalEnum.VariantOperator._OP_GREATER_EQUAL
      (funptr (M.StringName.typ @-> M.StringName.typ @-> M.Bool.typ @-> returning void))

    (** Appends [param right] at the end of this [StringName], returning a [String]. This is also known as a string concatenation. *)
    let (+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING_NAME (Some GlobalEnum.VariantType._TYPE_STRING_NAME) Godotcaml.GlobalEnum.VariantOperator._OP_ADD
      (funptr (M.StringName.typ @-> M.StringName.typ @-> M.String.typ @-> returning void))


    let (%) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING_NAME (Some GlobalEnum.VariantType._TYPE_STRING_NAME) Godotcaml.GlobalEnum.VariantOperator._OP_MODULE
      (funptr (M.StringName.typ @-> M.StringName.typ @-> M.String.typ @-> returning void))


    let _StringName_elem_StringName =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING_NAME (Some GlobalEnum.VariantType._TYPE_STRING_NAME) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.StringName.typ @-> M.StringName.typ @-> M.Bool.typ @-> returning void))






    let _StringName_elem_Object =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING_NAME (Some GlobalEnum.VariantType._TYPE_OBJECT) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.StringName.typ @-> M.Object.typ @-> M.Bool.typ @-> returning void))








    let _StringName_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING_NAME (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.StringName.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))




    let _StringName_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING_NAME (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.StringName.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))














    let _StringName_elem_PackedStringArray =
    M.foreign_operator GlobalEnum.VariantType._TYPE_STRING_NAME (Some GlobalEnum.VariantType._TYPE_PACKED_STRING_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.StringName.typ @-> M.PackedStringArray.typ @-> M.Bool.typ @-> returning void))






    end

  module NodePath = struct
    (** Returns [code]true[/code] if the node path is absolute (as opposed to relative), which means that it starts with a slash character ([code]/[/code]). Absolute node paths can be used to access the root node ([code]""/root""[/code]) or autoloads (e.g. [code]""/global""[/code] if a ""global"" autoload was registered). *)
    let is_absolute =
    M.foreign_method "NodePath" "is_absolute" (M.NodePath.typ @-> returning M.Bool.typ)

    (** Gets the number of node names which make up the path. Subnames (see [method get_subname_count]) are not included.
For example, [code]""Path2D/PathFollow2D/Sprite2D""[/code] has 3 names. *)
    let get_name_count =
    M.foreign_method "NodePath" "get_name_count" (M.NodePath.typ @-> returning M.Int.typ)

    (** Gets the node name indicated by [param idx] (0 to [method get_name_count] - 1).
[codeblocks]
[gdscript]
var node_path = NodePath(""Path2D/PathFollow2D/Sprite2D"")
print(node_path.get_name(0)) # Path2D
print(node_path.get_name(1)) # PathFollow2D
print(node_path.get_name(2)) # Sprite
[/gdscript]
[csharp]
var nodePath = new NodePath(""Path2D/PathFollow2D/Sprite2D"");
GD.Print(nodePath.GetName(0)); // Path2D
GD.Print(nodePath.GetName(1)); // PathFollow2D
GD.Print(nodePath.GetName(2)); // Sprite
[/csharp]
[/codeblocks] *)
    let get_name =
    M.foreign_method "NodePath" "get_name" (M.Int.typ @-> M.NodePath.typ @-> returning M.StringName.typ)

    (** Gets the number of resource or property names (""subnames"") in the path. Each subname is listed after a colon character ([code]:[/code]) in the node path.
For example, [code]""Path2D/PathFollow2D/Sprite2D:texture:load_path""[/code] has 2 subnames. *)
    let get_subname_count =
    M.foreign_method "NodePath" "get_subname_count" (M.NodePath.typ @-> returning M.Int.typ)

    (** Returns the 32-bit hash value representing the [NodePath]'s contents. *)
    let hash =
    M.foreign_method "NodePath" "hash" (M.NodePath.typ @-> returning M.Int.typ)

    (** Gets the resource or property name indicated by [param idx] (0 to [method get_subname_count] - 1).
[codeblocks]
[gdscript]
var node_path = NodePath(""Path2D/PathFollow2D/Sprite2D:texture:load_path"")
print(node_path.get_subname(0)) # texture
print(node_path.get_subname(1)) # load_path
[/gdscript]
[csharp]
var nodePath = new NodePath(""Path2D/PathFollow2D/Sprite2D:texture:load_path"");
GD.Print(nodePath.GetSubname(0)); // texture
GD.Print(nodePath.GetSubname(1)); // load_path
[/csharp]
[/codeblocks] *)
    let get_subname =
    M.foreign_method "NodePath" "get_subname" (M.Int.typ @-> M.NodePath.typ @-> returning M.StringName.typ)

    (** Returns all paths concatenated with a slash character ([code]/[/code]) as separator without subnames. *)
    let get_concatenated_names =
    M.foreign_method "NodePath" "get_concatenated_names" (M.NodePath.typ @-> returning M.StringName.typ)

    (** Returns all subnames concatenated with a colon character ([code]:[/code]) as separator, i.e. the right side of the first colon in a node path.
[codeblocks]
[gdscript]
var node_path = NodePath(""Path2D/PathFollow2D/Sprite2D:texture:load_path"")
print(node_path.get_concatenated_subnames()) # texture:load_path
[/gdscript]
[csharp]
var nodePath = new NodePath(""Path2D/PathFollow2D/Sprite2D:texture:load_path"");
GD.Print(nodePath.GetConcatenatedSubnames()); // texture:load_path
[/csharp]
[/codeblocks] *)
    let get_concatenated_subnames =
    M.foreign_method "NodePath" "get_concatenated_subnames" (M.NodePath.typ @-> returning M.StringName.typ)

    (** Returns a node path with a colon character ([code]:[/code]) prepended, transforming it to a pure property path with no node name (defaults to resolving from the current node).
[codeblocks]
[gdscript]
# This will be parsed as a node path to the ""x"" property in the ""position"" node.
var node_path = NodePath(""position:x"")
# This will be parsed as a node path to the ""x"" component of the ""position"" property in the current node.
var property_path = node_path.get_as_property_path()
print(property_path) # :position:x
[/gdscript]
[csharp]
// This will be parsed as a node path to the ""x"" property in the ""position"" node.
var nodePath = new NodePath(""position:x"");
// This will be parsed as a node path to the ""x"" component of the ""position"" property in the current node.
NodePath propertyPath = nodePath.GetAsPropertyPath();
GD.Print(propertyPath); // :position:x
[/csharp]
[/codeblocks] *)
    let get_as_property_path =
    M.foreign_method "NodePath" "get_as_property_path" (M.NodePath.typ @-> returning M.NodePath.typ)

    (** Returns [code]true[/code] if the node path is empty. *)
    let is_empty =
    M.foreign_method "NodePath" "is_empty" (M.NodePath.typ @-> returning M.Bool.typ)






    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_NODE_PATH None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.NodePath.typ @-> M.NodePath.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if two node paths are equal, i.e. all node names in the path are the same and in the same order. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_NODE_PATH (Some GlobalEnum.VariantType._TYPE_NODE_PATH) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.NodePath.typ @-> M.NodePath.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if two node paths are not equal. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_NODE_PATH (Some GlobalEnum.VariantType._TYPE_NODE_PATH) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.NodePath.typ @-> M.NodePath.typ @-> M.Bool.typ @-> returning void))


    let _NodePath_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_NODE_PATH (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.NodePath.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _NodePath_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_NODE_PATH (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.NodePath.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))
    end

  module RID = struct
    (** Returns [code]true[/code] if the [RID] is not [code]0[/code]. *)
    let is_valid =
    M.foreign_method "RID" "is_valid" (M.RID.typ @-> returning M.Bool.typ)

    (** Returns the ID of the referenced low-level resource. *)
    let get_id =
    M.foreign_method "RID" "get_id" (M.RID.typ @-> returning M.Int.typ)






    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_R_I_D None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.RID.typ @-> M.RID.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if both [RID]s are equal, which means they both refer to the same low-level resource. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_R_I_D (Some GlobalEnum.VariantType._TYPE_R_I_D) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.RID.typ @-> M.RID.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the [RID]s are not equal. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_R_I_D (Some GlobalEnum.VariantType._TYPE_R_I_D) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.RID.typ @-> M.RID.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the [RID]'s ID is less than [param right]'s ID. *)
    let (<) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_R_I_D (Some GlobalEnum.VariantType._TYPE_R_I_D) Godotcaml.GlobalEnum.VariantOperator._OP_LESS
      (funptr (M.RID.typ @-> M.RID.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the [RID]'s ID is less than or equal to [param right]'s ID. *)
    let (<=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_R_I_D (Some GlobalEnum.VariantType._TYPE_R_I_D) Godotcaml.GlobalEnum.VariantOperator._OP_LESS_EQUAL
      (funptr (M.RID.typ @-> M.RID.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the [RID]'s ID is greater than [param right]'s ID. *)
    let (>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_R_I_D (Some GlobalEnum.VariantType._TYPE_R_I_D) Godotcaml.GlobalEnum.VariantOperator._OP_GREATER
      (funptr (M.RID.typ @-> M.RID.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the [RID]'s ID is greater than or equal to [param right]'s ID. *)
    let (>=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_R_I_D (Some GlobalEnum.VariantType._TYPE_R_I_D) Godotcaml.GlobalEnum.VariantOperator._OP_GREATER_EQUAL
      (funptr (M.RID.typ @-> M.RID.typ @-> M.Bool.typ @-> returning void))
    end

  module Callable = struct
    (** Calls the method represented by this [Callable]. Unlike [method call], this method expects all arguments to be contained inside the [param arguments] [Array]. *)
    let callv =
    M.foreign_method "Callable" "callv" (M.Array.typ @-> M.Callable.typ @-> returning M.Variant.typ)

    (** Returns [code]true[/code] if this [Callable] has no target to call the method on. *)
    let is_null =
    M.foreign_method "Callable" "is_null" (M.Callable.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this [Callable] is a custom callable. Custom callables are created from [method bind] or [method unbind]. In GDScript, lambda functions are also custom callables. *)
    let is_custom =
    M.foreign_method "Callable" "is_custom" (M.Callable.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if this [Callable] is a standard callable. This method is the opposite of [method is_custom]. Returns [code]false[/code] if this callable is a lambda function. *)
    let is_standard =
    M.foreign_method "Callable" "is_standard" (M.Callable.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if the callable's object exists and has a valid method name assigned, or is a custom callable. *)
    let is_valid =
    M.foreign_method "Callable" "is_valid" (M.Callable.typ @-> returning M.Bool.typ)

    (** Returns the object on which this [Callable] is called. *)
    let get_object =
    M.foreign_method "Callable" "get_object" (M.Callable.typ @-> returning M.Object.typ)

    (** Returns the ID of this [Callable]'s object (see [method Object.get_instance_id]). *)
    let get_object_id =
    M.foreign_method "Callable" "get_object_id" (M.Callable.typ @-> returning M.Int.typ)

    (** Returns the name of the method represented by this [Callable]. If the callable is a GDScript lambda function, returns the function's name or [code]""<anonymous lambda>""[/code]. *)
    let get_method =
    M.foreign_method "Callable" "get_method" (M.Callable.typ @-> returning M.StringName.typ)

    (** Returns the total amount of arguments bound (or unbound) via successive [method bind] or [method unbind] calls. If the amount of arguments unbound is greater than the ones bound, this function returns a value less than zero. *)
    let get_bound_arguments_count =
    M.foreign_method "Callable" "get_bound_arguments_count" (M.Callable.typ @-> returning M.Int.typ)

    (** Return the bound arguments (as long as [method get_bound_arguments_count] is greater than zero), or empty (if [method get_bound_arguments_count] is less than or equal to zero). *)
    let get_bound_arguments =
    M.foreign_method "Callable" "get_bound_arguments" (M.Callable.typ @-> returning M.Array.typ)

    (** Returns the 32-bit hash value of this [Callable]'s object.
[b]Note:[/b] [Callable]s with equal content will always produce identical hash values. However, the reverse is not true. Returning identical hash values does [i]not[/i] imply the callables are equal, because different callables can have identical hash values due to hash collisions. The engine uses a 32-bit hash algorithm for [method hash]. *)
    let hash =
    M.foreign_method "Callable" "hash" (M.Callable.typ @-> returning M.Int.typ)

    (** Returns a copy of this [Callable] with one or more arguments bound, reading them from an array. When called, the bound arguments are passed [i]after[/i] the arguments supplied by [method call]. See also [method unbind].
[b]Note:[/b] When this method is chained with other similar methods, the order in which the argument list is modified is read from right to left. *)
    let bindv =
    M.foreign_method "Callable" "bindv" (M.Array.typ @-> M.Callable.typ @-> returning M.Callable.typ)

    (** Returns a copy of this [Callable] with a number of arguments unbound. In other words, when the new callable is called the last few arguments supplied by the user are ignored, according to [param argcount]. The remaining arguments are passed to the callable. This allows to use the original callable in a context that attempts to pass more arguments than this callable can handle, e.g. a signal with a fixed number of arguments. See also [method bind].
[b]Note:[/b] When this method is chained with other similar methods, the order in which the argument list is modified is read from right to left.
[codeblock]
func _ready():
    foo.unbind(1).call(1, 2) # Calls foo(1).
    foo.bind(3, 4).unbind(1).call(1, 2) # Calls foo(1, 3, 4), note that it does not change the arguments from bind.
[/codeblock] *)
    let unbind =
    M.foreign_method "Callable" "unbind" (M.Int.typ @-> M.Callable.typ @-> returning M.Callable.typ)

    (** Calls the method represented by this [Callable]. Arguments can be passed and should match the method's signature. *)
    let call =
    M.foreign_method "Callable" "call" (M.Variadic.typ @-> M.Callable.typ @-> returning M.Variant.typ)

    (** Calls the method represented by this [Callable] in deferred mode, i.e. at the end of the current frame. Arguments can be passed and should match the method's signature.
[codeblock]
func _ready():
    grab_focus.call_deferred()
[/codeblock]
[b]Note:[/b] Deferred calls are processed at idle time. Idle time happens mainly at the end of process and physics frames. In it, deferred calls will be run until there are none left, which means you can defer calls from other deferred calls and they'll still be run in the current idle time cycle. This means you should not call a method deferred from itself (or from a method called by it), as this causes infinite recursion the same way as if you had called the method directly.
See also [method Object.call_deferred]. *)
    let call_deferred =
    M.foreign_method "Callable" "call_deferred" (M.Variadic.typ @-> M.Callable.typ @-> returning M.Void.typ)

    (** Perform an RPC (Remote Procedure Call) on all connected peers. This is used for multiplayer and is normally not available, unless the function being called has been marked as [i]RPC[/i] (using [annotation @GDScript.@rpc] or [method Node.rpc_config]). Calling this method on unsupported functions will result in an error. See [method Node.rpc]. *)
    let rpc =
    M.foreign_method "Callable" "rpc" (M.Variadic.typ @-> M.Callable.typ @-> returning M.Void.typ)

    (** Perform an RPC (Remote Procedure Call) on a specific peer ID (see multiplayer documentation for reference). This is used for multiplayer and is normally not available unless the function being called has been marked as [i]RPC[/i] (using [annotation @GDScript.@rpc] or [method Node.rpc_config]). Calling this method on unsupported functions will result in an error. See [method Node.rpc_id]. *)
    let rpc_id =
    M.foreign_method "Callable" "rpc_id" (M.Int.typ @-> M.Variadic.typ @-> M.Callable.typ @-> returning M.Void.typ)

    (** Returns a copy of this [Callable] with one or more arguments bound. When called, the bound arguments are passed [i]after[/i] the arguments supplied by [method call]. See also [method unbind].
[b]Note:[/b] When this method is chained with other similar methods, the order in which the argument list is modified is read from right to left. *)
    let bind =
    M.foreign_method "Callable" "bind" (M.Variadic.typ @-> M.Callable.typ @-> returning M.Callable.typ)






    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_CALLABLE None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.Callable.typ @-> M.Callable.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if both [Callable]s invoke the same custom target. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_CALLABLE (Some GlobalEnum.VariantType._TYPE_CALLABLE) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.Callable.typ @-> M.Callable.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if both [Callable]s invoke different targets. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_CALLABLE (Some GlobalEnum.VariantType._TYPE_CALLABLE) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.Callable.typ @-> M.Callable.typ @-> M.Bool.typ @-> returning void))


    let _Callable_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_CALLABLE (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Callable.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _Callable_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_CALLABLE (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Callable.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))
    end

  module Signal = struct
    (** Returns [code]true[/code] if the signal's name does not exist in its object, or the object is not valid. *)
    let is_null =
    M.foreign_method "Signal" "is_null" (M.Signal.typ @-> returning M.Bool.typ)

    (** Returns the object emitting this signal. *)
    let get_object =
    M.foreign_method "Signal" "get_object" (M.Signal.typ @-> returning M.Object.typ)

    (** Returns the ID of the object emitting this signal (see [method Object.get_instance_id]). *)
    let get_object_id =
    M.foreign_method "Signal" "get_object_id" (M.Signal.typ @-> returning M.Int.typ)

    (** Returns the name of this signal. *)
    let get_name =
    M.foreign_method "Signal" "get_name" (M.Signal.typ @-> returning M.StringName.typ)

    (** Connects this signal to the specified [param callable]. Optional [param flags] can be also added to configure the connection's behavior (see [enum Object.ConnectFlags] constants). You can provide additional arguments to the connected [param callable] by using [method Callable.bind].
A signal can only be connected once to the same [Callable]. If the signal is already connected, returns [constant ERR_INVALID_PARAMETER] and pushes an error message, unless the signal is connected with [constant Object.CONNECT_REFERENCE_COUNTED]. To prevent this, use [method is_connected] first to check for existing connections.
[codeblock]
for button in $Buttons.get_children():
    button.pressed.connect(_on_pressed.bind(button))

func _on_pressed(button):
    print(button.name, "" was pressed"")
[/codeblock] *)
    let connect =
    M.foreign_method "Signal" "connect" (M.Callable.typ @-> M.Int.typ @-> M.Signal.typ @-> returning M.Int.typ)

    (** Disconnects this signal from the specified [Callable]. If the connection does not exist, generates an error. Use [method is_connected] to make sure that the connection exists. *)
    let disconnect =
    M.foreign_method "Signal" "disconnect" (M.Callable.typ @-> M.Signal.typ @-> returning M.Void.typ)

    (** Returns [code]true[/code] if the specified [Callable] is connected to this signal. *)
    let is_connected =
    M.foreign_method "Signal" "is_connected" (M.Callable.typ @-> M.Signal.typ @-> returning M.Bool.typ)

    (** Returns an [Array] of connections for this signal. Each connection is represented as a [Dictionary] that contains three entries:
- [code]signal[/code] is a reference to this signal;
- [code]callable[/code] is a reference to the connected [Callable];
- [code]flags[/code] is a combination of [enum Object.ConnectFlags]. *)
    let get_connections =
    M.foreign_method "Signal" "get_connections" (M.Signal.typ @-> returning M.Array.typ)

    (** Emits this signal. All [Callable]s connected to this signal will be triggered. This method supports a variable number of arguments, so parameters can be passed as a comma separated list. *)
    let emit =
    M.foreign_method "Signal" "emit" (M.Variadic.typ @-> M.Signal.typ @-> returning M.Void.typ)






    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_SIGNAL None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.Signal.typ @-> M.Signal.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if both signals share the same object and name. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_SIGNAL (Some GlobalEnum.VariantType._TYPE_SIGNAL) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.Signal.typ @-> M.Signal.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the signals do not share the same object and name. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_SIGNAL (Some GlobalEnum.VariantType._TYPE_SIGNAL) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.Signal.typ @-> M.Signal.typ @-> M.Bool.typ @-> returning void))


    let _Signal_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_SIGNAL (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Signal.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _Signal_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_SIGNAL (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Signal.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))
    end

  module Dictionary = struct
    (** Returns the number of entries in the dictionary. Empty dictionaries ([code]{ }[/code]) always return [code]0[/code]. See also [method is_empty]. *)
    let size =
    M.foreign_method "Dictionary" "size" (M.Dictionary.typ @-> returning M.Int.typ)

    (** Returns [code]true[/code] if the dictionary is empty (its size is [code]0[/code]). See also [method size]. *)
    let is_empty =
    M.foreign_method "Dictionary" "is_empty" (M.Dictionary.typ @-> returning M.Bool.typ)

    (** Clears the dictionary, removing all entries from it. *)
    let clear =
    M.foreign_method "Dictionary" "clear" (M.Dictionary.typ @-> returning M.Void.typ)

    (** Adds entries from [param dictionary] to this dictionary. By default, duplicate keys are not copied over, unless [param overwrite] is [code]true[/code].
[codeblocks]
[gdscript]
var dict = { ""item"": ""sword"", ""quantity"": 2 }
var other_dict = { ""quantity"": 15, ""color"": ""silver"" }

# Overwriting of existing keys is disabled by default.
dict.merge(other_dict)
print(dict)  # { ""item"": ""sword"", ""quantity"": 2, ""color"": ""silver"" }

# With overwriting of existing keys enabled.
dict.merge(other_dict, true)
print(dict)  # { ""item"": ""sword"", ""quantity"": 15, ""color"": ""silver"" }
[/gdscript]
[csharp]
var dict = new Godot.Collections.Dictionary
{
    [""item""] = ""sword"",
    [""quantity""] = 2,
};

var otherDict = new Godot.Collections.Dictionary
{
    [""quantity""] = 15,
    [""color""] = ""silver"",
};

// Overwriting of existing keys is disabled by default.
dict.Merge(otherDict);
GD.Print(dict); // { ""item"": ""sword"", ""quantity"": 2, ""color"": ""silver"" }

// With overwriting of existing keys enabled.
dict.Merge(otherDict, true);
GD.Print(dict); // { ""item"": ""sword"", ""quantity"": 15, ""color"": ""silver"" }
[/csharp]
[/codeblocks]
[b]Note:[/b] [method merge] is [i]not[/i] recursive. Nested dictionaries are considered as keys that can be overwritten or not depending on the value of [param overwrite], but they will never be merged together. *)
    let merge =
    M.foreign_method "Dictionary" "merge" (M.Dictionary.typ @-> M.Bool.typ @-> M.Dictionary.typ @-> returning M.Void.typ)

    (** Returns [code]true[/code] if the dictionary contains an entry with the given [param key].
[codeblocks]
[gdscript]
var my_dict = {
    ""Godot"" : 4,
    210 : null,
}

print(my_dict.has(""Godot"")) # Prints true
print(my_dict.has(210))     # Prints true
print(my_dict.has(4))       # Prints false
[/gdscript]
[csharp]
var myDict = new Godot.Collections.Dictionary
{
    { ""Godot"", 4 },
    { 210, default },
};

GD.Print(myDict.ContainsKey(""Godot"")); // Prints true
GD.Print(myDict.ContainsKey(210));     // Prints true
GD.Print(myDict.ContainsKey(4));       // Prints false
[/csharp]
[/codeblocks]
In GDScript, this is equivalent to the [code]in[/code] operator:
[codeblock]
if ""Godot"" in {""Godot"": 4}:
    print(""The key is here!"") # Will be printed.
[/codeblock]
[b]Note:[/b] This method returns [code]true[/code] as long as the [param key] exists, even if its corresponding value is [code]null[/code]. *)
    let has =
    M.foreign_method "Dictionary" "has" (M.Variant.typ @-> M.Dictionary.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if the dictionary contains all keys in the given [param keys] array.
[codeblock]
var data = {""width"" : 10, ""height"" : 20}
data.has_all([""height"", ""width""]) # Returns true
[/codeblock] *)
    let has_all =
    M.foreign_method "Dictionary" "has_all" (M.Array.typ @-> M.Dictionary.typ @-> returning M.Bool.typ)

    (** Finds and returns the first key whose associated value is equal to [param value], or [code]null[/code] if it is not found.
[b]Note:[/b] [code]null[/code] is also a valid key. If inside the dictionary, [method find_key] may give misleading results. *)
    let find_key =
    M.foreign_method "Dictionary" "find_key" (M.Variant.typ @-> M.Dictionary.typ @-> returning M.Variant.typ)

    (** Removes the dictionary entry by key, if it exists. Returns [code]true[/code] if the given [param key] existed in the dictionary, otherwise [code]false[/code].
[b]Note:[/b] Do not erase entries while iterating over the dictionary. You can iterate over the [method keys] array instead. *)
    let erase =
    M.foreign_method "Dictionary" "erase" (M.Variant.typ @-> M.Dictionary.typ @-> returning M.Bool.typ)

    (** Returns a hashed 32-bit integer value representing the dictionary contents.
[codeblocks]
[gdscript]
var dict1 = {""A"": 10, ""B"": 2}
var dict2 = {""A"": 10, ""B"": 2}

print(dict1.hash() == dict2.hash()) # Prints true
[/gdscript]
[csharp]
var dict1 = new Godot.Collections.Dictionary{{""A"", 10}, {""B"", 2}};
var dict2 = new Godot.Collections.Dictionary{{""A"", 10}, {""B"", 2}};

// Godot.Collections.Dictionary has no Hash() method. Use GD.Hash() instead.
GD.Print(GD.Hash(dict1) == GD.Hash(dict2)); // Prints true
[/csharp]
[/codeblocks]
[b]Note:[/b] Dictionaries with the same entries but in a different order will not have the same hash.
[b]Note:[/b] Dictionaries with equal hash values are [i]not[/i] guaranteed to be the same, because of hash collisions. On the contrary, dictionaries with different hash values are guaranteed to be different. *)
    let hash =
    M.foreign_method "Dictionary" "hash" (M.Dictionary.typ @-> returning M.Int.typ)

    (** Returns the list of keys in the dictionary. *)
    let keys =
    M.foreign_method "Dictionary" "keys" (M.Dictionary.typ @-> returning M.Array.typ)

    (** Returns the list of values in this dictionary. *)
    let values =
    M.foreign_method "Dictionary" "values" (M.Dictionary.typ @-> returning M.Array.typ)

    (** Creates and returns a new copy of the dictionary. If [param deep] is [code]true[/code], inner [Dictionary] and [Array] keys and values are also copied, recursively. *)
    let duplicate =
    M.foreign_method "Dictionary" "duplicate" (M.Bool.typ @-> M.Dictionary.typ @-> returning M.Dictionary.typ)

    (** Returns the corresponding value for the given [param key] in the dictionary. If the [param key] does not exist, returns [param default], or [code]null[/code] if the parameter is omitted. *)
    let get =
    M.foreign_method "Dictionary" "get" (M.Variant.typ @-> M.Variant.typ @-> M.Dictionary.typ @-> returning M.Variant.typ)

    (** Makes the dictionary read-only, i.e. disables modification of the dictionary's contents. Does not apply to nested content, e.g. content of nested dictionaries. *)
    let make_read_only =
    M.foreign_method "Dictionary" "make_read_only" (M.Dictionary.typ @-> returning M.Void.typ)

    (** Returns [code]true[/code] if the dictionary is read-only. See [method make_read_only]. Dictionaries are automatically read-only if declared with [code]const[/code] keyword. *)
    let is_read_only =
    M.foreign_method "Dictionary" "is_read_only" (M.Dictionary.typ @-> returning M.Bool.typ)






    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_DICTIONARY None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.Dictionary.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the two dictionaries contain the same keys and values. The order of the entries does not matter.
[b]Note:[/b] In C#, by convention, this operator compares by [b]reference[/b]. If you need to compare by value, iterate over both dictionaries. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_DICTIONARY (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.Dictionary.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if the two dictionaries do not contain the same keys and values. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_DICTIONARY (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.Dictionary.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _Dictionary_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_DICTIONARY (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Dictionary.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _Dictionary_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_DICTIONARY (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Dictionary.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))
    end

  module Array = struct
    (** Returns the number of elements in the array. *)
    let size =
    M.foreign_method "Array" "size" (M.Array.typ @-> returning M.Int.typ)

    (** Returns [code]true[/code] if the array is empty. *)
    let is_empty =
    M.foreign_method "Array" "is_empty" (M.Array.typ @-> returning M.Bool.typ)

    (** Clears the array. This is equivalent to using [method resize] with a size of [code]0[/code]. *)
    let clear =
    M.foreign_method "Array" "clear" (M.Array.typ @-> returning M.Void.typ)

    (** Returns a hashed 32-bit integer value representing the array and its contents.
[b]Note:[/b] [Array]s with equal content will always produce identical hash values. However, the reverse is not true. Returning identical hash values does [i]not[/i] imply the arrays are equal, because different arrays can have identical hash values due to hash collisions. *)
    let hash =
    M.foreign_method "Array" "hash" (M.Array.typ @-> returning M.Int.typ)

    (** Assigns elements of another [param array] into the array. Resizes the array to match [param array]. Performs type conversions if the array is typed. *)
    let assign =
    M.foreign_method "Array" "assign" (M.Array.typ @-> M.Array.typ @-> returning M.Void.typ)

    (** Appends an element at the end of the array. See also [method push_front]. *)
    let push_back =
    M.foreign_method "Array" "push_back" (M.Variant.typ @-> M.Array.typ @-> returning M.Void.typ)

    (** Adds an element at the beginning of the array. See also [method push_back].
[b]Note:[/b] On large arrays, this method is much slower than [method push_back] as it will reindex all the array's elements every time it's called. The larger the array, the slower [method push_front] will be. *)
    let push_front =
    M.foreign_method "Array" "push_front" (M.Variant.typ @-> M.Array.typ @-> returning M.Void.typ)

    (** Appends an element at the end of the array (alias of [method push_back]). *)
    let append =
    M.foreign_method "Array" "append" (M.Variant.typ @-> M.Array.typ @-> returning M.Void.typ)

    (** Appends another array at the end of this array.
[codeblock]
var array1 = [1, 2, 3]
var array2 = [4, 5, 6]
array1.append_array(array2)
print(array1) # Prints [1, 2, 3, 4, 5, 6].
[/codeblock] *)
    let append_array =
    M.foreign_method "Array" "append_array" (M.Array.typ @-> M.Array.typ @-> returning M.Void.typ)

    (** Resizes the array to contain a different number of elements. If the array size is smaller, elements are cleared, if bigger, new elements are [code]null[/code]. Returns [constant OK] on success, or one of the other [enum Error] values if the operation failed.
Calling [method resize] once and assigning the new values is faster than adding new elements one by one.
[b]Note:[/b] This method acts in-place and doesn't return a modified array. *)
    let resize =
    M.foreign_method "Array" "resize" (M.Int.typ @-> M.Array.typ @-> returning M.Int.typ)

    (** Inserts a new element at a given position in the array. The position must be valid, or at the end of the array ([code]pos == size()[/code]). Returns [constant OK] on success, or one of the other [enum Error] values if the operation failed.
[b]Note:[/b] This method acts in-place and doesn't return a modified array.
[b]Note:[/b] On large arrays, this method will be slower if the inserted element is close to the beginning of the array (index 0). This is because all elements placed after the newly inserted element have to be reindexed. *)
    let insert =
    M.foreign_method "Array" "insert" (M.Int.typ @-> M.Variant.typ @-> M.Array.typ @-> returning M.Int.typ)

    (** Removes an element from the array by index. If the index does not exist in the array, nothing happens. To remove an element by searching for its value, use [method erase] instead.
[b]Note:[/b] This method acts in-place and doesn't return a modified array.
[b]Note:[/b] On large arrays, this method will be slower if the removed element is close to the beginning of the array (index 0). This is because all elements placed after the removed element have to be reindexed.
[b]Note:[/b] [param position] cannot be negative. To remove an element relative to the end of the array, use [code]arr.remove_at(arr.size() - (i + 1))[/code]. To remove the last element from the array without returning the value, use [code]arr.resize(arr.size() - 1)[/code]. *)
    let remove_at =
    M.foreign_method "Array" "remove_at" (M.Int.typ @-> M.Array.typ @-> returning M.Void.typ)

    (** Assigns the given value to all elements in the array. This can typically be used together with [method resize] to create an array with a given size and initialized elements:
[codeblocks]
[gdscript]
var array = []
array.resize(10)
array.fill(0) # Initialize the 10 elements to 0.
[/gdscript]
[csharp]
var array = new Godot.Collections.Array();
array.Resize(10);
array.Fill(0); // Initialize the 10 elements to 0.
[/csharp]
[/codeblocks]
[b]Note:[/b] If [param value] is of a reference type ([Object]-derived, [Array], [Dictionary], etc.) then the array is filled with the references to the same object, i.e. no duplicates are created. *)
    let fill =
    M.foreign_method "Array" "fill" (M.Variant.typ @-> M.Array.typ @-> returning M.Void.typ)

    (** Removes the first occurrence of a value from the array. If the value does not exist in the array, nothing happens. To remove an element by index, use [method remove_at] instead.
[b]Note:[/b] This method acts in-place and doesn't return a modified array.
[b]Note:[/b] On large arrays, this method will be slower if the removed element is close to the beginning of the array (index 0). This is because all elements placed after the removed element have to be reindexed.
[b]Note:[/b] Do not erase entries while iterating over the array. *)
    let erase =
    M.foreign_method "Array" "erase" (M.Variant.typ @-> M.Array.typ @-> returning M.Void.typ)

    (** Returns the first element of the array. Prints an error and returns [code]null[/code] if the array is empty.
[b]Note:[/b] Calling this function is not the same as writing [code]array[0][/code]. If the array is empty, accessing by index will pause project execution when running from the editor. *)
    let front =
    M.foreign_method "Array" "front" (M.Array.typ @-> returning M.Variant.typ)

    (** Returns the last element of the array. Prints an error and returns [code]null[/code] if the array is empty.
[b]Note:[/b] Calling this function is not the same as writing [code]array[-1][/code]. If the array is empty, accessing by index will pause project execution when running from the editor. *)
    let back =
    M.foreign_method "Array" "back" (M.Array.typ @-> returning M.Variant.typ)

    (** Returns a random value from the target array. Prints an error and returns [code]null[/code] if the array is empty.
[codeblocks]
[gdscript]
var array: Array[int] = [1, 2, 3, 4]
print(array.pick_random())  # Prints either of the four numbers.
[/gdscript]
[csharp]
var array = new Godot.Collections.Array { 1, 2, 3, 4 };
GD.Print(array.PickRandom()); // Prints either of the four numbers.
[/csharp]
[/codeblocks] *)
    let pick_random =
    M.foreign_method "Array" "pick_random" (M.Array.typ @-> returning M.Variant.typ)

    (** Searches the array for a value and returns its index or [code]-1[/code] if not found. Optionally, the initial search index can be passed. *)
    let find =
    M.foreign_method "Array" "find" (M.Variant.typ @-> M.Int.typ @-> M.Array.typ @-> returning M.Int.typ)

    (** Searches the array in reverse order. Optionally, a start search index can be passed. If negative, the start index is considered relative to the end of the array. *)
    let rfind =
    M.foreign_method "Array" "rfind" (M.Variant.typ @-> M.Int.typ @-> M.Array.typ @-> returning M.Int.typ)

    (** Returns the number of times an element is in the array. *)
    let count =
    M.foreign_method "Array" "count" (M.Variant.typ @-> M.Array.typ @-> returning M.Int.typ)

    (** Returns [code]true[/code] if the array contains the given value.
[codeblocks]
[gdscript]
print([""inside"", 7].has(""inside"")) # True
print([""inside"", 7].has(""outside"")) # False
print([""inside"", 7].has(7)) # True
print([""inside"", 7].has(""7"")) # False
[/gdscript]
[csharp]
var arr = new Godot.Collections.Array { ""inside"", 7 };
// has is renamed to Contains
GD.Print(arr.Contains(""inside"")); // True
GD.Print(arr.Contains(""outside"")); // False
GD.Print(arr.Contains(7)); // True
GD.Print(arr.Contains(""7"")); // False
[/csharp]
[/codeblocks]
[b]Note:[/b] This is equivalent to using the [code]in[/code] operator as follows:
[codeblocks]
[gdscript]
# Will evaluate to `true`.
if 2 in [2, 4, 6, 8]:
    print(""Contains!"")
[/gdscript]
[csharp]
// As there is no ""in"" keyword in C#, you have to use Contains
var array = new Godot.Collections.Array { 2, 4, 6, 8 };
if (array.Contains(2))
{
    GD.Print(""Contains!"");
}
[/csharp]
[/codeblocks] *)
    let has =
    M.foreign_method "Array" "has" (M.Variant.typ @-> M.Array.typ @-> returning M.Bool.typ)

    (** Removes and returns the last element of the array. Returns [code]null[/code] if the array is empty, without printing an error message. See also [method pop_front]. *)
    let pop_back =
    M.foreign_method "Array" "pop_back" (M.Array.typ @-> returning M.Variant.typ)

    (** Removes and returns the first element of the array. Returns [code]null[/code] if the array is empty, without printing an error message. See also [method pop_back].
[b]Note:[/b] On large arrays, this method is much slower than [method pop_back] as it will reindex all the array's elements every time it's called. The larger the array, the slower [method pop_front] will be. *)
    let pop_front =
    M.foreign_method "Array" "pop_front" (M.Array.typ @-> returning M.Variant.typ)

    (** Removes and returns the element of the array at index [param position]. If negative, [param position] is considered relative to the end of the array. Leaves the array unchanged and returns [code]null[/code] if the array is empty or if it's accessed out of bounds. An error message is printed when the array is accessed out of bounds, but not when the array is empty.
[b]Note:[/b] On large arrays, this method can be slower than [method pop_back] as it will reindex the array's elements that are located after the removed element. The larger the array and the lower the index of the removed element, the slower [method pop_at] will be. *)
    let pop_at =
    M.foreign_method "Array" "pop_at" (M.Int.typ @-> M.Array.typ @-> returning M.Variant.typ)

    (** Sorts the array.
[b]Note:[/b] The sorting algorithm used is not [url=https://en.wikipedia.org/wiki/Sorting_algorithm#Stability]stable[/url]. This means that values considered equal may have their order changed when using [method sort].
[b]Note:[/b] Strings are sorted in alphabetical order (as opposed to natural order). This may lead to unexpected behavior when sorting an array of strings ending with a sequence of numbers. Consider the following example:
[codeblocks]
[gdscript]
var strings = [""string1"", ""string2"", ""string10"", ""string11""]
strings.sort()
print(strings) # Prints [string1, string10, string11, string2]
[/gdscript]
[csharp]
var strings = new Godot.Collections.Array { ""string1"", ""string2"", ""string10"", ""string11"" };
strings.Sort();
GD.Print(strings); // Prints [string1, string10, string11, string2]
[/csharp]
[/codeblocks]
To perform natural order sorting, you can use [method sort_custom] with [method String.naturalnocasecmp_to] as follows:
[codeblock]
var strings = [""string1"", ""string2"", ""string10"", ""string11""]
strings.sort_custom(func(a, b): return a.naturalnocasecmp_to(b) < 0)
print(strings) # Prints [string1, string2, string10, string11]
[/codeblock] *)
    let sort =
    M.foreign_method "Array" "sort" (M.Array.typ @-> returning M.Void.typ)

    (** Sorts the array using a custom method. The custom method receives two arguments (a pair of elements from the array) and must return either [code]true[/code] or [code]false[/code]. For two elements [code]a[/code] and [code]b[/code], if the given method returns [code]true[/code], element [code]b[/code] will be after element [code]a[/code] in the array.
[b]Note:[/b] The sorting algorithm used is not [url=https://en.wikipedia.org/wiki/Sorting_algorithm#Stability]stable[/url]. This means that values considered equal may have their order changed when using [method sort_custom].
[b]Note:[/b] You cannot randomize the return value as the heapsort algorithm expects a deterministic result. Randomizing the return value will result in unexpected behavior.
[codeblocks]
[gdscript]
func sort_ascending(a, b):
    if a[0] < b[0]:
        return true
    return false

func _ready():
    var my_items = [[5, ""Potato""], [9, ""Rice""], [4, ""Tomato""]]
    my_items.sort_custom(sort_ascending)
    print(my_items) # Prints [[4, Tomato], [5, Potato], [9, Rice]].

    # Descending, lambda version.
    my_items.sort_custom(func(a, b): return a[0] > b[0])
    print(my_items) # Prints [[9, Rice], [5, Potato], [4, Tomato]].
[/gdscript]
[csharp]
// There is no custom sort support for Godot.Collections.Array
[/csharp]
[/codeblocks] *)
    let sort_custom =
    M.foreign_method "Array" "sort_custom" (M.Callable.typ @-> M.Array.typ @-> returning M.Void.typ)

    (** Shuffles the array such that the items will have a random order. This method uses the global random number generator common to methods such as [method @GlobalScope.randi]. Call [method @GlobalScope.randomize] to ensure that a new seed will be used each time if you want non-reproducible shuffling. *)
    let shuffle =
    M.foreign_method "Array" "shuffle" (M.Array.typ @-> returning M.Void.typ)

    (** Finds the index of an existing value (or the insertion index that maintains sorting order, if the value is not yet present in the array) using binary search. Optionally, a [param before] specifier can be passed. If [code]false[/code], the returned index comes after all existing entries of the value in the array.
[codeblock]
var array = [""a"", ""b"", ""c"", ""c"", ""d"", ""e""]
print(array.bsearch(""c"", true))  # Prints 2, at the first matching element.
print(array.bsearch(""c"", false)) # Prints 4, after the last matching element, pointing to ""d"".
[/codeblock]
[b]Note:[/b] Calling [method bsearch] on an unsorted array results in unexpected behavior. *)
    let bsearch =
    M.foreign_method "Array" "bsearch" (M.Variant.typ @-> M.Bool.typ @-> M.Array.typ @-> returning M.Int.typ)

    (** Finds the index of an existing value (or the insertion index that maintains sorting order, if the value is not yet present in the array) using binary search and a custom comparison method. Optionally, a [param before] specifier can be passed. If [code]false[/code], the returned index comes after all existing entries of the value in the array. The custom method receives two arguments (an element from the array and the value searched for) and must return [code]true[/code] if the first argument is less than the second, and return [code]false[/code] otherwise.
[b]Note:[/b] The custom method must accept the two arguments in any order, you cannot rely on that the first argument will always be from the array.
[b]Note:[/b] Calling [method bsearch_custom] on an unsorted array results in unexpected behavior. *)
    let bsearch_custom =
    M.foreign_method "Array" "bsearch_custom" (M.Variant.typ @-> M.Callable.typ @-> M.Bool.typ @-> M.Array.typ @-> returning M.Int.typ)

    (** Reverses the order of the elements in the array. *)
    let reverse =
    M.foreign_method "Array" "reverse" (M.Array.typ @-> returning M.Void.typ)

    (** Returns a copy of the array.
If [param deep] is [code]true[/code], a deep copy is performed: all nested arrays and dictionaries are duplicated and will not be shared with the original array. If [code]false[/code], a shallow copy is made and references to the original nested arrays and dictionaries are kept, so that modifying a sub-array or dictionary in the copy will also impact those referenced in the source array. Note that any [Object]-derived elements will be shallow copied regardless of the [param deep] setting. *)
    let duplicate =
    M.foreign_method "Array" "duplicate" (M.Bool.typ @-> M.Array.typ @-> returning M.Array.typ)

    (** Returns the slice of the [Array], from [param begin] (inclusive) to [param end] (exclusive), as a new [Array].
The absolute value of [param begin] and [param end] will be clamped to the array size, so the default value for [param end] makes it slice to the size of the array by default (i.e. [code]arr.slice(1)[/code] is a shorthand for [code]arr.slice(1, arr.size())[/code]).
If either [param begin] or [param end] are negative, they will be relative to the end of the array (i.e. [code]arr.slice(0, -2)[/code] is a shorthand for [code]arr.slice(0, arr.size() - 2)[/code]).
If specified, [param step] is the relative index between source elements. It can be negative, then [param begin] must be higher than [param end]. For example, [code][0, 1, 2, 3, 4, 5].slice(5, 1, -2)[/code] returns [code][5, 3][/code].
If [param deep] is true, each element will be copied by value rather than by reference.
[b]Note:[/b] To include the first element when [param step] is negative, use [code]arr.slice(begin, -arr.size() - 1, step)[/code] (i.e. [code][0, 1, 2].slice(1, -4, -1)[/code] returns [code][1, 0][/code]). *)
    let slice =
    M.foreign_method "Array" "slice" (M.Int.typ @-> M.Int.typ @-> M.Int.typ @-> M.Bool.typ @-> M.Array.typ @-> returning M.Array.typ)

    (** Calls the provided [Callable] on each element in the array and returns a new array with the elements for which the method returned [code]true[/code].
The callable's method should take one [Variant] parameter (the current array element) and return a boolean value.
[codeblock]
func _ready():
    print([1, 2, 3].filter(remove_1)) # Prints [2, 3].
    print([1, 2, 3].filter(func(number): return number != 1)) # Same as above, but using lambda function.

func remove_1(number):
    return number != 1
[/codeblock]
See also [method any], [method all], [method map] and [method reduce]. *)
    let filter =
    M.foreign_method "Array" "filter" (M.Callable.typ @-> M.Array.typ @-> returning M.Array.typ)

    (** Calls the provided [Callable] for each element in the array and returns a new array filled with values returned by the method.
The callable's method should take one [Variant] parameter (the current array element) and can return any [Variant].
[codeblock]
func _ready():
    print([1, 2, 3].map(negate)) # Prints [-1, -2, -3].
    print([1, 2, 3].map(func(number): return -number)) # Same as above, but using lambda function.

func negate(number):
    return -number
[/codeblock]
See also [method filter], [method reduce], [method any] and [method all]. *)
    let map =
    M.foreign_method "Array" "map" (M.Callable.typ @-> M.Array.typ @-> returning M.Array.typ)

    (** Calls the provided [Callable] for each element in array and accumulates the result in [param accum].
The callable's method takes two arguments: the current value of [param accum] and the current array element. If [param accum] is [code]null[/code] (default value), the iteration will start from the second element, with the first one used as initial value of [param accum].
[codeblock]
func _ready():
    print([1, 2, 3].reduce(sum, 10)) # Prints 16.
    print([1, 2, 3].reduce(func(accum, number): return accum + number, 10)) # Same as above, but using lambda function.

func sum(accum, number):
    return accum + number
[/codeblock]
See also [method map], [method filter], [method any] and [method all]. *)
    let reduce =
    M.foreign_method "Array" "reduce" (M.Callable.typ @-> M.Variant.typ @-> M.Array.typ @-> returning M.Variant.typ)

    (** Calls the provided [Callable] on each element in the array and returns [code]true[/code] if the [Callable] returns [code]true[/code] for [i]one or more[/i] elements in the array. If the [Callable] returns [code]false[/code] for all elements in the array, this method returns [code]false[/code].
The callable's method should take one [Variant] parameter (the current array element) and return a boolean value.
[codeblock]
func _ready():
    print([6, 10, 6].any(greater_than_5))  # Prints True (3 elements evaluate to `true`).
    print([4, 10, 4].any(greater_than_5))  # Prints True (1 elements evaluate to `true`).
    print([4, 4, 4].any(greater_than_5))  # Prints False (0 elements evaluate to `true`).
    print([].any(greater_than_5))  # Prints False (0 elements evaluate to `true`).

    print([6, 10, 6].any(func(number): return number > 5))  # Prints True. Same as the first line above, but using lambda function.

func greater_than_5(number):
    return number > 5
[/codeblock]
See also [method all], [method filter], [method map] and [method reduce].
[b]Note:[/b] Unlike relying on the size of an array returned by [method filter], this method will return as early as possible to improve performance (especially with large arrays).
[b]Note:[/b] For an empty array, this method always returns [code]false[/code]. *)
    let any =
    M.foreign_method "Array" "any" (M.Callable.typ @-> M.Array.typ @-> returning M.Bool.typ)

    (** Calls the provided [Callable] on each element in the array and returns [code]true[/code] if the [Callable] returns [code]true[/code] for [i]all[/i] elements in the array. If the [Callable] returns [code]false[/code] for one array element or more, this method returns [code]false[/code].
The callable's method should take one [Variant] parameter (the current array element) and return a boolean value.
[codeblock]
func _ready():
    print([6, 10, 6].all(greater_than_5))  # Prints True (3/3 elements evaluate to `true`).
    print([4, 10, 4].all(greater_than_5))  # Prints False (1/3 elements evaluate to `true`).
    print([4, 4, 4].all(greater_than_5))  # Prints False (0/3 elements evaluate to `true`).
    print([].all(greater_than_5))  # Prints True (0/0 elements evaluate to `true`).

    print([6, 10, 6].all(func(number): return number > 5))  # Prints True. Same as the first line above, but using lambda function.

func greater_than_5(number):
    return number > 5
[/codeblock]
See also [method any], [method filter], [method map] and [method reduce].
[b]Note:[/b] Unlike relying on the size of an array returned by [method filter], this method will return as early as possible to improve performance (especially with large arrays).
[b]Note:[/b] For an empty array, this method [url=https://en.wikipedia.org/wiki/Vacuous_truth]always[/url] returns [code]true[/code]. *)
    let all =
    M.foreign_method "Array" "all" (M.Callable.typ @-> M.Array.typ @-> returning M.Bool.typ)

    (** Returns the maximum value contained in the array if all elements are of comparable types. If the elements can't be compared, [code]null[/code] is returned.
To find the maximum value using a custom comparator, you can use [method reduce]. In this example every array element is checked and the first maximum value is returned:
[codeblock]
func _ready():
    var arr = [Vector2(0, 1), Vector2(2, 0), Vector2(1, 1), Vector2(1, 0), Vector2(0, 2)]
    # In this example we compare the lengths.
    print(arr.reduce(func(max, val): return val if is_length_greater(val, max) else max))

func is_length_greater(a, b):
    return a.length() > b.length()
[/codeblock] *)
    let max =
    M.foreign_method "Array" "max" (M.Array.typ @-> returning M.Variant.typ)

    (** Returns the minimum value contained in the array if all elements are of comparable types. If the elements can't be compared, [code]null[/code] is returned.
See also [method max] for an example of using a custom comparator. *)
    let min =
    M.foreign_method "Array" "min" (M.Array.typ @-> returning M.Variant.typ)

    (** Returns [code]true[/code] if the array is typed. Typed arrays can only store elements of their associated type and provide type safety for the [code][][/code] operator. Methods of typed array still return [Variant]. *)
    let is_typed =
    M.foreign_method "Array" "is_typed" (M.Array.typ @-> returning M.Bool.typ)

    (** Returns [code]true[/code] if the array is typed the same as [param array]. *)
    let is_same_typed =
    M.foreign_method "Array" "is_same_typed" (M.Array.typ @-> M.Array.typ @-> returning M.Bool.typ)

    (** Returns the built-in type of the typed array as a [enum Variant.Type] constant. If the array is not typed, returns [constant TYPE_NIL]. *)
    let get_typed_builtin =
    M.foreign_method "Array" "get_typed_builtin" (M.Array.typ @-> returning M.Int.typ)

    (** Returns the [b]native[/b] class name of the typed array if the built-in type is [constant TYPE_OBJECT]. Otherwise, this method returns an empty string. *)
    let get_typed_class_name =
    M.foreign_method "Array" "get_typed_class_name" (M.Array.typ @-> returning M.StringName.typ)

    (** Returns the script associated with the typed array. This method returns a [Script] instance or [code]null[/code]. *)
    let get_typed_script =
    M.foreign_method "Array" "get_typed_script" (M.Array.typ @-> returning M.Variant.typ)

    (** Makes the array read-only, i.e. disabled modifying of the array's elements. Does not apply to nested content, e.g. content of nested arrays. *)
    let make_read_only =
    M.foreign_method "Array" "make_read_only" (M.Array.typ @-> returning M.Void.typ)

    (** Returns [code]true[/code] if the array is read-only. See [method make_read_only]. Arrays are automatically read-only if declared with [code]const[/code] keyword. *)
    let is_read_only =
    M.foreign_method "Array" "is_read_only" (M.Array.typ @-> returning M.Bool.typ)






    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_ARRAY None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.Array.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))


    let _Array_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_ARRAY (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Array.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))

    (** Compares the left operand [Array] against the [param right] [Array]. Returns [code]true[/code] if the sizes and contents of the arrays are equal, [code]false[/code] otherwise. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_ARRAY (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.Array.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))

    (** Compares the left operand [Array] against the [param right] [Array]. Returns [code]true[/code] if the sizes or contents of the arrays are [i]not[/i] equal, [code]false[/code] otherwise. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_ARRAY (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.Array.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))

    (** Performs a comparison for each index between the left operand [Array] and the [param right] [Array], considering the highest common index of both arrays for this comparison: Returns [code]true[/code] on the first occurrence of an element that is less, or [code]false[/code] if the element is greater. Note that depending on the type of data stored, this function may be recursive. If all elements are equal, it compares the length of both arrays and returns [code]false[/code] if the left operand [Array] has fewer elements, otherwise it returns [code]true[/code]. *)
    let (<) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_ARRAY (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_LESS
      (funptr (M.Array.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))

    (** Performs a comparison for each index between the left operand [Array] and the [param right] [Array], considering the highest common index of both arrays for this comparison: Returns [code]true[/code] on the first occurrence of an element that is less, or [code]false[/code] if the element is greater. Note that depending on the type of data stored, this function may be recursive. If all elements are equal, it compares the length of both arrays and returns [code]true[/code] if the left operand [Array] has the same number of elements or fewer, otherwise it returns [code]false[/code]. *)
    let (<=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_ARRAY (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_LESS_EQUAL
      (funptr (M.Array.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))

    (** Performs a comparison for each index between the left operand [Array] and the [param right] [Array], considering the highest common index of both arrays for this comparison: Returns [code]true[/code] on the first occurrence of an element that is greater, or [code]false[/code] if the element is less. Note that depending on the type of data stored, this function may be recursive. If all elements are equal, it compares the length of both arrays and returns [code]true[/code] if the [param right] [Array] has more elements, otherwise it returns [code]false[/code]. *)
    let (>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_ARRAY (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_GREATER
      (funptr (M.Array.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))

    (** Performs a comparison for each index between the left operand [Array] and the [param right] [Array], considering the highest common index of both arrays for this comparison: Returns [code]true[/code] on the first occurrence of an element that is greater, or [code]false[/code] if the element is less. Note that depending on the type of data stored, this function may be recursive. If all elements are equal, it compares the length of both arrays and returns [code]true[/code] if the [param right] [Array] has more or the same number of elements, otherwise it returns [code]false[/code]. *)
    let (>=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_ARRAY (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_GREATER_EQUAL
      (funptr (M.Array.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))

    (** Concatenates two [Array]s together, with the [param right] [Array] being added to the end of the [Array] specified in the left operand. For example, [code][1, 2] + [3, 4][/code] results in [code][1, 2, 3, 4][/code]. *)
    let (+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_ARRAY (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_ADD
      (funptr (M.Array.typ @-> M.Array.typ @-> M.Array.typ @-> returning void))


    let _Array_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_ARRAY (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.Array.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))
    end

  module PackedByteArray = struct
    (** Returns the number of elements in the array. *)
    let size =
    M.foreign_method "PackedByteArray" "size" (M.PackedByteArray.typ @-> returning M.Int.typ)

    (** Returns [code]true[/code] if the array is empty. *)
    let is_empty =
    M.foreign_method "PackedByteArray" "is_empty" (M.PackedByteArray.typ @-> returning M.Bool.typ)

    (** Changes the byte at the given index. *)
    let set =
    M.foreign_method "PackedByteArray" "set" (M.Int.typ @-> M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Void.typ)

    (** Appends an element at the end of the array. *)
    let push_back =
    M.foreign_method "PackedByteArray" "push_back" (M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Bool.typ)

    (** Appends an element at the end of the array (alias of [method push_back]). *)
    let append =
    M.foreign_method "PackedByteArray" "append" (M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Bool.typ)

    (** Appends a [PackedByteArray] at the end of this array. *)
    let append_array =
    M.foreign_method "PackedByteArray" "append_array" (M.PackedByteArray.typ @-> M.PackedByteArray.typ @-> returning M.Void.typ)

    (** Removes an element from the array by index. *)
    let remove_at =
    M.foreign_method "PackedByteArray" "remove_at" (M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Void.typ)

    (** Inserts a new element at a given position in the array. The position must be valid, or at the end of the array ([code]idx == size()[/code]). *)
    let insert =
    M.foreign_method "PackedByteArray" "insert" (M.Int.typ @-> M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Int.typ)

    (** Assigns the given value to all elements in the array. This can typically be used together with [method resize] to create an array with a given size and initialized elements. *)
    let fill =
    M.foreign_method "PackedByteArray" "fill" (M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Void.typ)

    (** Sets the size of the array. If the array is grown, reserves elements at the end of the array. If the array is shrunk, truncates the array to the new size. Calling [method resize] once and assigning the new values is faster than adding new elements one by one. *)
    let resize =
    M.foreign_method "PackedByteArray" "resize" (M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Int.typ)

    (** Clears the array. This is equivalent to using [method resize] with a size of [code]0[/code]. *)
    let clear =
    M.foreign_method "PackedByteArray" "clear" (M.PackedByteArray.typ @-> returning M.Void.typ)

    (** Returns [code]true[/code] if the array contains [param value]. *)
    let has =
    M.foreign_method "PackedByteArray" "has" (M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Bool.typ)

    (** Reverses the order of the elements in the array. *)
    let reverse =
    M.foreign_method "PackedByteArray" "reverse" (M.PackedByteArray.typ @-> returning M.Void.typ)

    (** Returns the slice of the [PackedByteArray], from [param begin] (inclusive) to [param end] (exclusive), as a new [PackedByteArray].
The absolute value of [param begin] and [param end] will be clamped to the array size, so the default value for [param end] makes it slice to the size of the array by default (i.e. [code]arr.slice(1)[/code] is a shorthand for [code]arr.slice(1, arr.size())[/code]).
If either [param begin] or [param end] are negative, they will be relative to the end of the array (i.e. [code]arr.slice(0, -2)[/code] is a shorthand for [code]arr.slice(0, arr.size() - 2)[/code]). *)
    let slice =
    M.foreign_method "PackedByteArray" "slice" (M.Int.typ @-> M.Int.typ @-> M.PackedByteArray.typ @-> returning M.PackedByteArray.typ)

    (** Sorts the elements of the array in ascending order. *)
    let sort =
    M.foreign_method "PackedByteArray" "sort" (M.PackedByteArray.typ @-> returning M.Void.typ)

    (** Finds the index of an existing value (or the insertion index that maintains sorting order, if the value is not yet present in the array) using binary search. Optionally, a [param before] specifier can be passed. If [code]false[/code], the returned index comes after all existing entries of the value in the array.
[b]Note:[/b] Calling [method bsearch] on an unsorted array results in unexpected behavior. *)
    let bsearch =
    M.foreign_method "PackedByteArray" "bsearch" (M.Int.typ @-> M.Bool.typ @-> M.PackedByteArray.typ @-> returning M.Int.typ)

    (** Creates a copy of the array, and returns it. *)
    let duplicate =
    M.foreign_method "PackedByteArray" "duplicate" (M.PackedByteArray.typ @-> returning M.PackedByteArray.typ)

    (** Searches the array for a value and returns its index or [code]-1[/code] if not found. Optionally, the initial search index can be passed. *)
    let find =
    M.foreign_method "PackedByteArray" "find" (M.Int.typ @-> M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Int.typ)

    (** Searches the array in reverse order. Optionally, a start search index can be passed. If negative, the start index is considered relative to the end of the array. *)
    let rfind =
    M.foreign_method "PackedByteArray" "rfind" (M.Int.typ @-> M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Int.typ)

    (** Returns the number of times an element is in the array. *)
    let count =
    M.foreign_method "PackedByteArray" "count" (M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Int.typ)

    (** Converts ASCII/Latin-1 encoded array to [String]. Fast alternative to [method get_string_from_utf8] if the content is ASCII/Latin-1 only. Unlike the UTF-8 function this function maps every byte to a character in the array. Multibyte sequences will not be interpreted correctly. For parsing user input always use [method get_string_from_utf8]. This is the inverse of [method String.to_ascii_buffer]. *)
    let get_string_from_ascii =
    M.foreign_method "PackedByteArray" "get_string_from_ascii" (M.PackedByteArray.typ @-> returning M.String.typ)

    (** Converts UTF-8 encoded array to [String]. Slower than [method get_string_from_ascii] but supports UTF-8 encoded data. Use this function if you are unsure about the source of the data. For user input this function should always be preferred. Returns empty string if source array is not valid UTF-8 string. This is the inverse of [method String.to_utf8_buffer]. *)
    let get_string_from_utf8 =
    M.foreign_method "PackedByteArray" "get_string_from_utf8" (M.PackedByteArray.typ @-> returning M.String.typ)

    (** Converts UTF-16 encoded array to [String]. If the BOM is missing, system endianness is assumed. Returns empty string if source array is not valid UTF-16 string. This is the inverse of [method String.to_utf16_buffer]. *)
    let get_string_from_utf16 =
    M.foreign_method "PackedByteArray" "get_string_from_utf16" (M.PackedByteArray.typ @-> returning M.String.typ)

    (** Converts UTF-32 encoded array to [String]. System endianness is assumed. Returns empty string if source array is not valid UTF-32 string. This is the inverse of [method String.to_utf32_buffer]. *)
    let get_string_from_utf32 =
    M.foreign_method "PackedByteArray" "get_string_from_utf32" (M.PackedByteArray.typ @-> returning M.String.typ)

    (** Converts wide character ([code]wchar_t[/code], UTF-16 on Windows, UTF-32 on other platforms) encoded array to [String]. Returns empty string if source array is not valid wide string. This is the inverse of [method String.to_wchar_buffer]. *)
    let get_string_from_wchar =
    M.foreign_method "PackedByteArray" "get_string_from_wchar" (M.PackedByteArray.typ @-> returning M.String.typ)

    (** Returns a hexadecimal representation of this array as a [String].
[codeblocks]
[gdscript]
var array = PackedByteArray([11, 46, 255])
print(array.hex_encode()) # Prints: 0b2eff
[/gdscript]
[csharp]
var array = new byte[] {11, 46, 255};
GD.Print(array.HexEncode()); // Prints: 0b2eff
[/csharp]
[/codeblocks] *)
    let hex_encode =
    M.foreign_method "PackedByteArray" "hex_encode" (M.PackedByteArray.typ @-> returning M.String.typ)

    (** Returns a new [PackedByteArray] with the data compressed. Set the compression mode using one of [enum FileAccess.CompressionMode]'s constants. *)
    let compress =
    M.foreign_method "PackedByteArray" "compress" (M.Int.typ @-> M.PackedByteArray.typ @-> returning M.PackedByteArray.typ)

    (** Returns a new [PackedByteArray] with the data decompressed. Set [param buffer_size] to the size of the uncompressed data. Set the compression mode using one of [enum FileAccess.CompressionMode]'s constants.
[b]Note:[/b] Decompression is not guaranteed to work with data not compressed by Godot, for example if data compressed with the deflate compression mode lacks a checksum or header. *)
    let decompress =
    M.foreign_method "PackedByteArray" "decompress" (M.Int.typ @-> M.Int.typ @-> M.PackedByteArray.typ @-> returning M.PackedByteArray.typ)

    (** Returns a new [PackedByteArray] with the data decompressed. Set the compression mode using one of [enum FileAccess.CompressionMode]'s constants. [b]This method only accepts brotli, gzip, and deflate compression modes.[/b]
This method is potentially slower than [method decompress], as it may have to re-allocate its output buffer multiple times while decompressing, whereas [method decompress] knows it's output buffer size from the beginning.
GZIP has a maximal compression ratio of 1032:1, meaning it's very possible for a small compressed payload to decompress to a potentially very large output. To guard against this, you may provide a maximum size this function is allowed to allocate in bytes via [param max_output_size]. Passing -1 will allow for unbounded output. If any positive value is passed, and the decompression exceeds that amount in bytes, then an error will be returned.
[b]Note:[/b] Decompression is not guaranteed to work with data not compressed by Godot, for example if data compressed with the deflate compression mode lacks a checksum or header. *)
    let decompress_dynamic =
    M.foreign_method "PackedByteArray" "decompress_dynamic" (M.Int.typ @-> M.Int.typ @-> M.PackedByteArray.typ @-> returning M.PackedByteArray.typ)

    (** Decodes a 8-bit unsigned integer number from the bytes starting at [param byte_offset]. Fails if the byte count is insufficient. Returns [code]0[/code] if a valid number can't be decoded. *)
    let decode_u8 =
    M.foreign_method "PackedByteArray" "decode_u8" (M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Int.typ)

    (** Decodes a 8-bit signed integer number from the bytes starting at [param byte_offset]. Fails if the byte count is insufficient. Returns [code]0[/code] if a valid number can't be decoded. *)
    let decode_s8 =
    M.foreign_method "PackedByteArray" "decode_s8" (M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Int.typ)

    (** Decodes a 16-bit unsigned integer number from the bytes starting at [param byte_offset]. Fails if the byte count is insufficient. Returns [code]0[/code] if a valid number can't be decoded. *)
    let decode_u16 =
    M.foreign_method "PackedByteArray" "decode_u16" (M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Int.typ)

    (** Decodes a 16-bit signed integer number from the bytes starting at [param byte_offset]. Fails if the byte count is insufficient. Returns [code]0[/code] if a valid number can't be decoded. *)
    let decode_s16 =
    M.foreign_method "PackedByteArray" "decode_s16" (M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Int.typ)

    (** Decodes a 32-bit unsigned integer number from the bytes starting at [param byte_offset]. Fails if the byte count is insufficient. Returns [code]0[/code] if a valid number can't be decoded. *)
    let decode_u32 =
    M.foreign_method "PackedByteArray" "decode_u32" (M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Int.typ)

    (** Decodes a 32-bit signed integer number from the bytes starting at [param byte_offset]. Fails if the byte count is insufficient. Returns [code]0[/code] if a valid number can't be decoded. *)
    let decode_s32 =
    M.foreign_method "PackedByteArray" "decode_s32" (M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Int.typ)

    (** Decodes a 64-bit unsigned integer number from the bytes starting at [param byte_offset]. Fails if the byte count is insufficient. Returns [code]0[/code] if a valid number can't be decoded. *)
    let decode_u64 =
    M.foreign_method "PackedByteArray" "decode_u64" (M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Int.typ)

    (** Decodes a 64-bit signed integer number from the bytes starting at [param byte_offset]. Fails if the byte count is insufficient. Returns [code]0[/code] if a valid number can't be decoded. *)
    let decode_s64 =
    M.foreign_method "PackedByteArray" "decode_s64" (M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Int.typ)

    (** Decodes a 16-bit floating point number from the bytes starting at [param byte_offset]. Fails if the byte count is insufficient. Returns [code]0.0[/code] if a valid number can't be decoded. *)
    let decode_half =
    M.foreign_method "PackedByteArray" "decode_half" (M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Float.typ)

    (** Decodes a 32-bit floating point number from the bytes starting at [param byte_offset]. Fails if the byte count is insufficient. Returns [code]0.0[/code] if a valid number can't be decoded. *)
    let decode_float =
    M.foreign_method "PackedByteArray" "decode_float" (M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Float.typ)

    (** Decodes a 64-bit floating point number from the bytes starting at [param byte_offset]. Fails if the byte count is insufficient. Returns [code]0.0[/code] if a valid number can't be decoded. *)
    let decode_double =
    M.foreign_method "PackedByteArray" "decode_double" (M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Float.typ)

    (** Returns [code]true[/code] if a valid [Variant] value can be decoded at the [param byte_offset]. Returns [code]false[/code] otherwise or when the value is [Object]-derived and [param allow_objects] is [code]false[/code]. *)
    let has_encoded_var =
    M.foreign_method "PackedByteArray" "has_encoded_var" (M.Int.typ @-> M.Bool.typ @-> M.PackedByteArray.typ @-> returning M.Bool.typ)

    (** Decodes a [Variant] from the bytes starting at [param byte_offset]. Returns [code]null[/code] if a valid variant can't be decoded or the value is [Object]-derived and [param allow_objects] is [code]false[/code]. *)
    let decode_var =
    M.foreign_method "PackedByteArray" "decode_var" (M.Int.typ @-> M.Bool.typ @-> M.PackedByteArray.typ @-> returning M.Variant.typ)

    (** Decodes a size of a [Variant] from the bytes starting at [param byte_offset]. Requires at least 4 bytes of data starting at the offset, otherwise fails. *)
    let decode_var_size =
    M.foreign_method "PackedByteArray" "decode_var_size" (M.Int.typ @-> M.Bool.typ @-> M.PackedByteArray.typ @-> returning M.Int.typ)

    (** Returns a copy of the data converted to a [PackedInt32Array], where each block of 4 bytes has been converted to a signed 32-bit integer (C++ [code]int32_t[/code]).
The size of the input array must be a multiple of 4 (size of 32-bit integer). The size of the new array will be [code]byte_array.size() / 4[/code].
If the original data can't be converted to signed 32-bit integers, the resulting data is undefined. *)
    let to_int32_array =
    M.foreign_method "PackedByteArray" "to_int32_array" (M.PackedByteArray.typ @-> returning M.PackedInt32Array.typ)

    (** Returns a copy of the data converted to a [PackedInt64Array], where each block of 8 bytes has been converted to a signed 64-bit integer (C++ [code]int64_t[/code], Godot [int]).
The size of the input array must be a multiple of 8 (size of 64-bit integer). The size of the new array will be [code]byte_array.size() / 8[/code].
If the original data can't be converted to signed 64-bit integers, the resulting data is undefined. *)
    let to_int64_array =
    M.foreign_method "PackedByteArray" "to_int64_array" (M.PackedByteArray.typ @-> returning M.PackedInt64Array.typ)

    (** Returns a copy of the data converted to a [PackedFloat32Array], where each block of 4 bytes has been converted to a 32-bit float (C++ [code skip-lint]float[/code]).
The size of the input array must be a multiple of 4 (size of 32-bit float). The size of the new array will be [code]byte_array.size() / 4[/code].
If the original data can't be converted to 32-bit floats, the resulting data is undefined. *)
    let to_float32_array =
    M.foreign_method "PackedByteArray" "to_float32_array" (M.PackedByteArray.typ @-> returning M.PackedFloat32Array.typ)

    (** Returns a copy of the data converted to a [PackedFloat64Array], where each block of 8 bytes has been converted to a 64-bit float (C++ [code]double[/code], Godot [float]).
The size of the input array must be a multiple of 8 (size of 64-bit double). The size of the new array will be [code]byte_array.size() / 8[/code].
If the original data can't be converted to 64-bit floats, the resulting data is undefined. *)
    let to_float64_array =
    M.foreign_method "PackedByteArray" "to_float64_array" (M.PackedByteArray.typ @-> returning M.PackedFloat64Array.typ)

    (** Encodes a 8-bit unsigned integer number (byte) at the index of [param byte_offset] bytes. The array must have at least 1 byte of space, starting at the offset. *)
    let encode_u8 =
    M.foreign_method "PackedByteArray" "encode_u8" (M.Int.typ @-> M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Void.typ)

    (** Encodes a 8-bit signed integer number (signed byte) at the index of [param byte_offset] bytes. The array must have at least 1 byte of space, starting at the offset. *)
    let encode_s8 =
    M.foreign_method "PackedByteArray" "encode_s8" (M.Int.typ @-> M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Void.typ)

    (** Encodes a 16-bit unsigned integer number as bytes at the index of [param byte_offset] bytes. The array must have at least 2 bytes of space, starting at the offset. *)
    let encode_u16 =
    M.foreign_method "PackedByteArray" "encode_u16" (M.Int.typ @-> M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Void.typ)

    (** Encodes a 16-bit signed integer number as bytes at the index of [param byte_offset] bytes. The array must have at least 2 bytes of space, starting at the offset. *)
    let encode_s16 =
    M.foreign_method "PackedByteArray" "encode_s16" (M.Int.typ @-> M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Void.typ)

    (** Encodes a 32-bit unsigned integer number as bytes at the index of [param byte_offset] bytes. The array must have at least 4 bytes of space, starting at the offset. *)
    let encode_u32 =
    M.foreign_method "PackedByteArray" "encode_u32" (M.Int.typ @-> M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Void.typ)

    (** Encodes a 32-bit signed integer number as bytes at the index of [param byte_offset] bytes. The array must have at least 4 bytes of space, starting at the offset. *)
    let encode_s32 =
    M.foreign_method "PackedByteArray" "encode_s32" (M.Int.typ @-> M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Void.typ)

    (** Encodes a 64-bit unsigned integer number as bytes at the index of [param byte_offset] bytes. The array must have at least 8 bytes of space, starting at the offset. *)
    let encode_u64 =
    M.foreign_method "PackedByteArray" "encode_u64" (M.Int.typ @-> M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Void.typ)

    (** Encodes a 64-bit signed integer number as bytes at the index of [param byte_offset] bytes. The array must have at least 8 bytes of space, starting at the offset. *)
    let encode_s64 =
    M.foreign_method "PackedByteArray" "encode_s64" (M.Int.typ @-> M.Int.typ @-> M.PackedByteArray.typ @-> returning M.Void.typ)

    (** Encodes a 16-bit floating point number as bytes at the index of [param byte_offset] bytes. The array must have at least 2 bytes of space, starting at the offset. *)
    let encode_half =
    M.foreign_method "PackedByteArray" "encode_half" (M.Int.typ @-> M.Float.typ @-> M.PackedByteArray.typ @-> returning M.Void.typ)

    (** Encodes a 32-bit floating point number as bytes at the index of [param byte_offset] bytes. The array must have at least 4 bytes of space, starting at the offset. *)
    let encode_float =
    M.foreign_method "PackedByteArray" "encode_float" (M.Int.typ @-> M.Float.typ @-> M.PackedByteArray.typ @-> returning M.Void.typ)

    (** Encodes a 64-bit floating point number as bytes at the index of [param byte_offset] bytes. The array must have at least 8 bytes of allocated space, starting at the offset. *)
    let encode_double =
    M.foreign_method "PackedByteArray" "encode_double" (M.Int.typ @-> M.Float.typ @-> M.PackedByteArray.typ @-> returning M.Void.typ)

    (** Encodes a [Variant] at the index of [param byte_offset] bytes. A sufficient space must be allocated, depending on the encoded variant's size. If [param allow_objects] is [code]false[/code], [Object]-derived values are not permitted and will instead be serialized as ID-only. *)
    let encode_var =
    M.foreign_method "PackedByteArray" "encode_var" (M.Int.typ @-> M.Variant.typ @-> M.Bool.typ @-> M.PackedByteArray.typ @-> returning M.Int.typ)






    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_BYTE_ARRAY None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.PackedByteArray.typ @-> M.PackedByteArray.typ @-> M.Bool.typ @-> returning void))


    let _PackedByteArray_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_BYTE_ARRAY (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.PackedByteArray.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _PackedByteArray_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_BYTE_ARRAY (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.PackedByteArray.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if contents of both arrays are the same, i.e. they have all equal bytes at the corresponding indices. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_BYTE_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_BYTE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.PackedByteArray.typ @-> M.PackedByteArray.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if contents of the arrays differ. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_BYTE_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_BYTE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.PackedByteArray.typ @-> M.PackedByteArray.typ @-> M.Bool.typ @-> returning void))

    (** Returns a new [PackedByteArray] with contents of [param right] added at the end of this array. For better performance, consider using [method append_array] instead. *)
    let (+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_BYTE_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_BYTE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_ADD
      (funptr (M.PackedByteArray.typ @-> M.PackedByteArray.typ @-> M.PackedByteArray.typ @-> returning void))
    end

  module PackedInt32Array = struct
    (** Returns the number of elements in the array. *)
    let size =
    M.foreign_method "PackedInt32Array" "size" (M.PackedInt32Array.typ @-> returning M.Int.typ)

    (** Returns [code]true[/code] if the array is empty. *)
    let is_empty =
    M.foreign_method "PackedInt32Array" "is_empty" (M.PackedInt32Array.typ @-> returning M.Bool.typ)

    (** Changes the integer at the given index. *)
    let set =
    M.foreign_method "PackedInt32Array" "set" (M.Int.typ @-> M.Int.typ @-> M.PackedInt32Array.typ @-> returning M.Void.typ)

    (** Appends a value to the array. *)
    let push_back =
    M.foreign_method "PackedInt32Array" "push_back" (M.Int.typ @-> M.PackedInt32Array.typ @-> returning M.Bool.typ)

    (** Appends an element at the end of the array (alias of [method push_back]). *)
    let append =
    M.foreign_method "PackedInt32Array" "append" (M.Int.typ @-> M.PackedInt32Array.typ @-> returning M.Bool.typ)

    (** Appends a [PackedInt32Array] at the end of this array. *)
    let append_array =
    M.foreign_method "PackedInt32Array" "append_array" (M.PackedInt32Array.typ @-> M.PackedInt32Array.typ @-> returning M.Void.typ)

    (** Removes an element from the array by index. *)
    let remove_at =
    M.foreign_method "PackedInt32Array" "remove_at" (M.Int.typ @-> M.PackedInt32Array.typ @-> returning M.Void.typ)

    (** Inserts a new integer at a given position in the array. The position must be valid, or at the end of the array ([code]idx == size()[/code]). *)
    let insert =
    M.foreign_method "PackedInt32Array" "insert" (M.Int.typ @-> M.Int.typ @-> M.PackedInt32Array.typ @-> returning M.Int.typ)

    (** Assigns the given value to all elements in the array. This can typically be used together with [method resize] to create an array with a given size and initialized elements. *)
    let fill =
    M.foreign_method "PackedInt32Array" "fill" (M.Int.typ @-> M.PackedInt32Array.typ @-> returning M.Void.typ)

    (** Sets the size of the array. If the array is grown, reserves elements at the end of the array. If the array is shrunk, truncates the array to the new size. Calling [method resize] once and assigning the new values is faster than adding new elements one by one. *)
    let resize =
    M.foreign_method "PackedInt32Array" "resize" (M.Int.typ @-> M.PackedInt32Array.typ @-> returning M.Int.typ)

    (** Clears the array. This is equivalent to using [method resize] with a size of [code]0[/code]. *)
    let clear =
    M.foreign_method "PackedInt32Array" "clear" (M.PackedInt32Array.typ @-> returning M.Void.typ)

    (** Returns [code]true[/code] if the array contains [param value]. *)
    let has =
    M.foreign_method "PackedInt32Array" "has" (M.Int.typ @-> M.PackedInt32Array.typ @-> returning M.Bool.typ)

    (** Reverses the order of the elements in the array. *)
    let reverse =
    M.foreign_method "PackedInt32Array" "reverse" (M.PackedInt32Array.typ @-> returning M.Void.typ)

    (** Returns the slice of the [PackedInt32Array], from [param begin] (inclusive) to [param end] (exclusive), as a new [PackedInt32Array].
The absolute value of [param begin] and [param end] will be clamped to the array size, so the default value for [param end] makes it slice to the size of the array by default (i.e. [code]arr.slice(1)[/code] is a shorthand for [code]arr.slice(1, arr.size())[/code]).
If either [param begin] or [param end] are negative, they will be relative to the end of the array (i.e. [code]arr.slice(0, -2)[/code] is a shorthand for [code]arr.slice(0, arr.size() - 2)[/code]). *)
    let slice =
    M.foreign_method "PackedInt32Array" "slice" (M.Int.typ @-> M.Int.typ @-> M.PackedInt32Array.typ @-> returning M.PackedInt32Array.typ)

    (** Returns a copy of the data converted to a [PackedByteArray], where each element have been encoded as 4 bytes.
The size of the new array will be [code]int32_array.size()  *  4[/code]. *)
    let to_byte_array =
    M.foreign_method "PackedInt32Array" "to_byte_array" (M.PackedInt32Array.typ @-> returning M.PackedByteArray.typ)

    (** Sorts the elements of the array in ascending order. *)
    let sort =
    M.foreign_method "PackedInt32Array" "sort" (M.PackedInt32Array.typ @-> returning M.Void.typ)

    (** Finds the index of an existing value (or the insertion index that maintains sorting order, if the value is not yet present in the array) using binary search. Optionally, a [param before] specifier can be passed. If [code]false[/code], the returned index comes after all existing entries of the value in the array.
[b]Note:[/b] Calling [method bsearch] on an unsorted array results in unexpected behavior. *)
    let bsearch =
    M.foreign_method "PackedInt32Array" "bsearch" (M.Int.typ @-> M.Bool.typ @-> M.PackedInt32Array.typ @-> returning M.Int.typ)

    (** Creates a copy of the array, and returns it. *)
    let duplicate =
    M.foreign_method "PackedInt32Array" "duplicate" (M.PackedInt32Array.typ @-> returning M.PackedInt32Array.typ)

    (** Searches the array for a value and returns its index or [code]-1[/code] if not found. Optionally, the initial search index can be passed. *)
    let find =
    M.foreign_method "PackedInt32Array" "find" (M.Int.typ @-> M.Int.typ @-> M.PackedInt32Array.typ @-> returning M.Int.typ)

    (** Searches the array in reverse order. Optionally, a start search index can be passed. If negative, the start index is considered relative to the end of the array. *)
    let rfind =
    M.foreign_method "PackedInt32Array" "rfind" (M.Int.typ @-> M.Int.typ @-> M.PackedInt32Array.typ @-> returning M.Int.typ)

    (** Returns the number of times an element is in the array. *)
    let count =
    M.foreign_method "PackedInt32Array" "count" (M.Int.typ @-> M.PackedInt32Array.typ @-> returning M.Int.typ)






    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_INT32_ARRAY None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.PackedInt32Array.typ @-> M.PackedInt32Array.typ @-> M.Bool.typ @-> returning void))


    let _PackedInt32Array_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_INT32_ARRAY (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.PackedInt32Array.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _PackedInt32Array_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_INT32_ARRAY (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.PackedInt32Array.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if contents of both arrays are the same, i.e. they have all equal ints at the corresponding indices. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_INT32_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_INT32_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.PackedInt32Array.typ @-> M.PackedInt32Array.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if contents of the arrays differ. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_INT32_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_INT32_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.PackedInt32Array.typ @-> M.PackedInt32Array.typ @-> M.Bool.typ @-> returning void))

    (** Returns a new [PackedInt32Array] with contents of [param right] added at the end of this array. For better performance, consider using [method append_array] instead. *)
    let (+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_INT32_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_INT32_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_ADD
      (funptr (M.PackedInt32Array.typ @-> M.PackedInt32Array.typ @-> M.PackedInt32Array.typ @-> returning void))
    end

  module PackedInt64Array = struct
    (** Returns the number of elements in the array. *)
    let size =
    M.foreign_method "PackedInt64Array" "size" (M.PackedInt64Array.typ @-> returning M.Int.typ)

    (** Returns [code]true[/code] if the array is empty. *)
    let is_empty =
    M.foreign_method "PackedInt64Array" "is_empty" (M.PackedInt64Array.typ @-> returning M.Bool.typ)

    (** Changes the integer at the given index. *)
    let set =
    M.foreign_method "PackedInt64Array" "set" (M.Int.typ @-> M.Int.typ @-> M.PackedInt64Array.typ @-> returning M.Void.typ)

    (** Appends a value to the array. *)
    let push_back =
    M.foreign_method "PackedInt64Array" "push_back" (M.Int.typ @-> M.PackedInt64Array.typ @-> returning M.Bool.typ)

    (** Appends an element at the end of the array (alias of [method push_back]). *)
    let append =
    M.foreign_method "PackedInt64Array" "append" (M.Int.typ @-> M.PackedInt64Array.typ @-> returning M.Bool.typ)

    (** Appends a [PackedInt64Array] at the end of this array. *)
    let append_array =
    M.foreign_method "PackedInt64Array" "append_array" (M.PackedInt64Array.typ @-> M.PackedInt64Array.typ @-> returning M.Void.typ)

    (** Removes an element from the array by index. *)
    let remove_at =
    M.foreign_method "PackedInt64Array" "remove_at" (M.Int.typ @-> M.PackedInt64Array.typ @-> returning M.Void.typ)

    (** Inserts a new integer at a given position in the array. The position must be valid, or at the end of the array ([code]idx == size()[/code]). *)
    let insert =
    M.foreign_method "PackedInt64Array" "insert" (M.Int.typ @-> M.Int.typ @-> M.PackedInt64Array.typ @-> returning M.Int.typ)

    (** Assigns the given value to all elements in the array. This can typically be used together with [method resize] to create an array with a given size and initialized elements. *)
    let fill =
    M.foreign_method "PackedInt64Array" "fill" (M.Int.typ @-> M.PackedInt64Array.typ @-> returning M.Void.typ)

    (** Sets the size of the array. If the array is grown, reserves elements at the end of the array. If the array is shrunk, truncates the array to the new size. Calling [method resize] once and assigning the new values is faster than adding new elements one by one. *)
    let resize =
    M.foreign_method "PackedInt64Array" "resize" (M.Int.typ @-> M.PackedInt64Array.typ @-> returning M.Int.typ)

    (** Clears the array. This is equivalent to using [method resize] with a size of [code]0[/code]. *)
    let clear =
    M.foreign_method "PackedInt64Array" "clear" (M.PackedInt64Array.typ @-> returning M.Void.typ)

    (** Returns [code]true[/code] if the array contains [param value]. *)
    let has =
    M.foreign_method "PackedInt64Array" "has" (M.Int.typ @-> M.PackedInt64Array.typ @-> returning M.Bool.typ)

    (** Reverses the order of the elements in the array. *)
    let reverse =
    M.foreign_method "PackedInt64Array" "reverse" (M.PackedInt64Array.typ @-> returning M.Void.typ)

    (** Returns the slice of the [PackedInt64Array], from [param begin] (inclusive) to [param end] (exclusive), as a new [PackedInt64Array].
The absolute value of [param begin] and [param end] will be clamped to the array size, so the default value for [param end] makes it slice to the size of the array by default (i.e. [code]arr.slice(1)[/code] is a shorthand for [code]arr.slice(1, arr.size())[/code]).
If either [param begin] or [param end] are negative, they will be relative to the end of the array (i.e. [code]arr.slice(0, -2)[/code] is a shorthand for [code]arr.slice(0, arr.size() - 2)[/code]). *)
    let slice =
    M.foreign_method "PackedInt64Array" "slice" (M.Int.typ @-> M.Int.typ @-> M.PackedInt64Array.typ @-> returning M.PackedInt64Array.typ)

    (** Returns a copy of the data converted to a [PackedByteArray], where each element have been encoded as 8 bytes.
The size of the new array will be [code]int64_array.size()  *  8[/code]. *)
    let to_byte_array =
    M.foreign_method "PackedInt64Array" "to_byte_array" (M.PackedInt64Array.typ @-> returning M.PackedByteArray.typ)

    (** Sorts the elements of the array in ascending order. *)
    let sort =
    M.foreign_method "PackedInt64Array" "sort" (M.PackedInt64Array.typ @-> returning M.Void.typ)

    (** Finds the index of an existing value (or the insertion index that maintains sorting order, if the value is not yet present in the array) using binary search. Optionally, a [param before] specifier can be passed. If [code]false[/code], the returned index comes after all existing entries of the value in the array.
[b]Note:[/b] Calling [method bsearch] on an unsorted array results in unexpected behavior. *)
    let bsearch =
    M.foreign_method "PackedInt64Array" "bsearch" (M.Int.typ @-> M.Bool.typ @-> M.PackedInt64Array.typ @-> returning M.Int.typ)

    (** Creates a copy of the array, and returns it. *)
    let duplicate =
    M.foreign_method "PackedInt64Array" "duplicate" (M.PackedInt64Array.typ @-> returning M.PackedInt64Array.typ)

    (** Searches the array for a value and returns its index or [code]-1[/code] if not found. Optionally, the initial search index can be passed. *)
    let find =
    M.foreign_method "PackedInt64Array" "find" (M.Int.typ @-> M.Int.typ @-> M.PackedInt64Array.typ @-> returning M.Int.typ)

    (** Searches the array in reverse order. Optionally, a start search index can be passed. If negative, the start index is considered relative to the end of the array. *)
    let rfind =
    M.foreign_method "PackedInt64Array" "rfind" (M.Int.typ @-> M.Int.typ @-> M.PackedInt64Array.typ @-> returning M.Int.typ)

    (** Returns the number of times an element is in the array. *)
    let count =
    M.foreign_method "PackedInt64Array" "count" (M.Int.typ @-> M.PackedInt64Array.typ @-> returning M.Int.typ)






    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_INT64_ARRAY None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.PackedInt64Array.typ @-> M.PackedInt64Array.typ @-> M.Bool.typ @-> returning void))


    let _PackedInt64Array_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_INT64_ARRAY (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.PackedInt64Array.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _PackedInt64Array_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_INT64_ARRAY (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.PackedInt64Array.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if contents of both arrays are the same, i.e. they have all equal ints at the corresponding indices. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_INT64_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_INT64_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.PackedInt64Array.typ @-> M.PackedInt64Array.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if contents of the arrays differ. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_INT64_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_INT64_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.PackedInt64Array.typ @-> M.PackedInt64Array.typ @-> M.Bool.typ @-> returning void))

    (** Returns a new [PackedInt64Array] with contents of [param right] added at the end of this array. For better performance, consider using [method append_array] instead. *)
    let (+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_INT64_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_INT64_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_ADD
      (funptr (M.PackedInt64Array.typ @-> M.PackedInt64Array.typ @-> M.PackedInt64Array.typ @-> returning void))
    end

  module PackedFloat32Array = struct
    (** Returns the number of elements in the array. *)
    let size =
    M.foreign_method "PackedFloat32Array" "size" (M.PackedFloat32Array.typ @-> returning M.Int.typ)

    (** Returns [code]true[/code] if the array is empty. *)
    let is_empty =
    M.foreign_method "PackedFloat32Array" "is_empty" (M.PackedFloat32Array.typ @-> returning M.Bool.typ)

    (** Changes the float at the given index. *)
    let set =
    M.foreign_method "PackedFloat32Array" "set" (M.Int.typ @-> M.Float.typ @-> M.PackedFloat32Array.typ @-> returning M.Void.typ)

    (** Appends an element at the end of the array. *)
    let push_back =
    M.foreign_method "PackedFloat32Array" "push_back" (M.Float.typ @-> M.PackedFloat32Array.typ @-> returning M.Bool.typ)

    (** Appends an element at the end of the array (alias of [method push_back]). *)
    let append =
    M.foreign_method "PackedFloat32Array" "append" (M.Float.typ @-> M.PackedFloat32Array.typ @-> returning M.Bool.typ)

    (** Appends a [PackedFloat32Array] at the end of this array. *)
    let append_array =
    M.foreign_method "PackedFloat32Array" "append_array" (M.PackedFloat32Array.typ @-> M.PackedFloat32Array.typ @-> returning M.Void.typ)

    (** Removes an element from the array by index. *)
    let remove_at =
    M.foreign_method "PackedFloat32Array" "remove_at" (M.Int.typ @-> M.PackedFloat32Array.typ @-> returning M.Void.typ)

    (** Inserts a new element at a given position in the array. The position must be valid, or at the end of the array ([code]idx == size()[/code]). *)
    let insert =
    M.foreign_method "PackedFloat32Array" "insert" (M.Int.typ @-> M.Float.typ @-> M.PackedFloat32Array.typ @-> returning M.Int.typ)

    (** Assigns the given value to all elements in the array. This can typically be used together with [method resize] to create an array with a given size and initialized elements. *)
    let fill =
    M.foreign_method "PackedFloat32Array" "fill" (M.Float.typ @-> M.PackedFloat32Array.typ @-> returning M.Void.typ)

    (** Sets the size of the array. If the array is grown, reserves elements at the end of the array. If the array is shrunk, truncates the array to the new size. Calling [method resize] once and assigning the new values is faster than adding new elements one by one. *)
    let resize =
    M.foreign_method "PackedFloat32Array" "resize" (M.Int.typ @-> M.PackedFloat32Array.typ @-> returning M.Int.typ)

    (** Clears the array. This is equivalent to using [method resize] with a size of [code]0[/code]. *)
    let clear =
    M.foreign_method "PackedFloat32Array" "clear" (M.PackedFloat32Array.typ @-> returning M.Void.typ)

    (** Returns [code]true[/code] if the array contains [param value].
[b]Note:[/b] [constant @GDScript.NAN] doesn't behave the same as other numbers. Therefore, the results from this method may not be accurate if NaNs are included. *)
    let has =
    M.foreign_method "PackedFloat32Array" "has" (M.Float.typ @-> M.PackedFloat32Array.typ @-> returning M.Bool.typ)

    (** Reverses the order of the elements in the array. *)
    let reverse =
    M.foreign_method "PackedFloat32Array" "reverse" (M.PackedFloat32Array.typ @-> returning M.Void.typ)

    (** Returns the slice of the [PackedFloat32Array], from [param begin] (inclusive) to [param end] (exclusive), as a new [PackedFloat32Array].
The absolute value of [param begin] and [param end] will be clamped to the array size, so the default value for [param end] makes it slice to the size of the array by default (i.e. [code]arr.slice(1)[/code] is a shorthand for [code]arr.slice(1, arr.size())[/code]).
If either [param begin] or [param end] are negative, they will be relative to the end of the array (i.e. [code]arr.slice(0, -2)[/code] is a shorthand for [code]arr.slice(0, arr.size() - 2)[/code]). *)
    let slice =
    M.foreign_method "PackedFloat32Array" "slice" (M.Int.typ @-> M.Int.typ @-> M.PackedFloat32Array.typ @-> returning M.PackedFloat32Array.typ)

    (** Returns a copy of the data converted to a [PackedByteArray], where each element have been encoded as 4 bytes.
The size of the new array will be [code]float32_array.size()  *  4[/code]. *)
    let to_byte_array =
    M.foreign_method "PackedFloat32Array" "to_byte_array" (M.PackedFloat32Array.typ @-> returning M.PackedByteArray.typ)

    (** Sorts the elements of the array in ascending order.
[b]Note:[/b] [constant @GDScript.NAN] doesn't behave the same as other numbers. Therefore, the results from this method may not be accurate if NaNs are included. *)
    let sort =
    M.foreign_method "PackedFloat32Array" "sort" (M.PackedFloat32Array.typ @-> returning M.Void.typ)

    (** Finds the index of an existing value (or the insertion index that maintains sorting order, if the value is not yet present in the array) using binary search. Optionally, a [param before] specifier can be passed. If [code]false[/code], the returned index comes after all existing entries of the value in the array.
[b]Note:[/b] Calling [method bsearch] on an unsorted array results in unexpected behavior.
[b]Note:[/b] [constant @GDScript.NAN] doesn't behave the same as other numbers. Therefore, the results from this method may not be accurate if NaNs are included. *)
    let bsearch =
    M.foreign_method "PackedFloat32Array" "bsearch" (M.Float.typ @-> M.Bool.typ @-> M.PackedFloat32Array.typ @-> returning M.Int.typ)

    (** Creates a copy of the array, and returns it. *)
    let duplicate =
    M.foreign_method "PackedFloat32Array" "duplicate" (M.PackedFloat32Array.typ @-> returning M.PackedFloat32Array.typ)

    (** Searches the array for a value and returns its index or [code]-1[/code] if not found. Optionally, the initial search index can be passed.
[b]Note:[/b] [constant @GDScript.NAN] doesn't behave the same as other numbers. Therefore, the results from this method may not be accurate if NaNs are included. *)
    let find =
    M.foreign_method "PackedFloat32Array" "find" (M.Float.typ @-> M.Int.typ @-> M.PackedFloat32Array.typ @-> returning M.Int.typ)

    (** Searches the array in reverse order. Optionally, a start search index can be passed. If negative, the start index is considered relative to the end of the array.
[b]Note:[/b] [constant @GDScript.NAN] doesn't behave the same as other numbers. Therefore, the results from this method may not be accurate if NaNs are included. *)
    let rfind =
    M.foreign_method "PackedFloat32Array" "rfind" (M.Float.typ @-> M.Int.typ @-> M.PackedFloat32Array.typ @-> returning M.Int.typ)

    (** Returns the number of times an element is in the array.
[b]Note:[/b] [constant @GDScript.NAN] doesn't behave the same as other numbers. Therefore, the results from this method may not be accurate if NaNs are included. *)
    let count =
    M.foreign_method "PackedFloat32Array" "count" (M.Float.typ @-> M.PackedFloat32Array.typ @-> returning M.Int.typ)






    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_FLOAT32_ARRAY None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.PackedFloat32Array.typ @-> M.PackedFloat32Array.typ @-> M.Bool.typ @-> returning void))


    let _PackedFloat32Array_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_FLOAT32_ARRAY (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.PackedFloat32Array.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _PackedFloat32Array_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_FLOAT32_ARRAY (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.PackedFloat32Array.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if contents of both arrays are the same, i.e. they have all equal floats at the corresponding indices. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_FLOAT32_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_FLOAT32_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.PackedFloat32Array.typ @-> M.PackedFloat32Array.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if contents of the arrays differ. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_FLOAT32_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_FLOAT32_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.PackedFloat32Array.typ @-> M.PackedFloat32Array.typ @-> M.Bool.typ @-> returning void))

    (** Returns a new [PackedFloat32Array] with contents of [param right] added at the end of this array. For better performance, consider using [method append_array] instead. *)
    let (+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_FLOAT32_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_FLOAT32_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_ADD
      (funptr (M.PackedFloat32Array.typ @-> M.PackedFloat32Array.typ @-> M.PackedFloat32Array.typ @-> returning void))
    end

  module PackedFloat64Array = struct
    (** Returns the number of elements in the array. *)
    let size =
    M.foreign_method "PackedFloat64Array" "size" (M.PackedFloat64Array.typ @-> returning M.Int.typ)

    (** Returns [code]true[/code] if the array is empty. *)
    let is_empty =
    M.foreign_method "PackedFloat64Array" "is_empty" (M.PackedFloat64Array.typ @-> returning M.Bool.typ)

    (** Changes the float at the given index. *)
    let set =
    M.foreign_method "PackedFloat64Array" "set" (M.Int.typ @-> M.Float.typ @-> M.PackedFloat64Array.typ @-> returning M.Void.typ)

    (** Appends an element at the end of the array. *)
    let push_back =
    M.foreign_method "PackedFloat64Array" "push_back" (M.Float.typ @-> M.PackedFloat64Array.typ @-> returning M.Bool.typ)

    (** Appends an element at the end of the array (alias of [method push_back]). *)
    let append =
    M.foreign_method "PackedFloat64Array" "append" (M.Float.typ @-> M.PackedFloat64Array.typ @-> returning M.Bool.typ)

    (** Appends a [PackedFloat64Array] at the end of this array. *)
    let append_array =
    M.foreign_method "PackedFloat64Array" "append_array" (M.PackedFloat64Array.typ @-> M.PackedFloat64Array.typ @-> returning M.Void.typ)

    (** Removes an element from the array by index. *)
    let remove_at =
    M.foreign_method "PackedFloat64Array" "remove_at" (M.Int.typ @-> M.PackedFloat64Array.typ @-> returning M.Void.typ)

    (** Inserts a new element at a given position in the array. The position must be valid, or at the end of the array ([code]idx == size()[/code]). *)
    let insert =
    M.foreign_method "PackedFloat64Array" "insert" (M.Int.typ @-> M.Float.typ @-> M.PackedFloat64Array.typ @-> returning M.Int.typ)

    (** Assigns the given value to all elements in the array. This can typically be used together with [method resize] to create an array with a given size and initialized elements. *)
    let fill =
    M.foreign_method "PackedFloat64Array" "fill" (M.Float.typ @-> M.PackedFloat64Array.typ @-> returning M.Void.typ)

    (** Sets the size of the array. If the array is grown, reserves elements at the end of the array. If the array is shrunk, truncates the array to the new size. Calling [method resize] once and assigning the new values is faster than adding new elements one by one. *)
    let resize =
    M.foreign_method "PackedFloat64Array" "resize" (M.Int.typ @-> M.PackedFloat64Array.typ @-> returning M.Int.typ)

    (** Clears the array. This is equivalent to using [method resize] with a size of [code]0[/code]. *)
    let clear =
    M.foreign_method "PackedFloat64Array" "clear" (M.PackedFloat64Array.typ @-> returning M.Void.typ)

    (** Returns [code]true[/code] if the array contains [param value].
[b]Note:[/b] [constant @GDScript.NAN] doesn't behave the same as other numbers. Therefore, the results from this method may not be accurate if NaNs are included. *)
    let has =
    M.foreign_method "PackedFloat64Array" "has" (M.Float.typ @-> M.PackedFloat64Array.typ @-> returning M.Bool.typ)

    (** Reverses the order of the elements in the array. *)
    let reverse =
    M.foreign_method "PackedFloat64Array" "reverse" (M.PackedFloat64Array.typ @-> returning M.Void.typ)

    (** Returns the slice of the [PackedFloat64Array], from [param begin] (inclusive) to [param end] (exclusive), as a new [PackedFloat64Array].
The absolute value of [param begin] and [param end] will be clamped to the array size, so the default value for [param end] makes it slice to the size of the array by default (i.e. [code]arr.slice(1)[/code] is a shorthand for [code]arr.slice(1, arr.size())[/code]).
If either [param begin] or [param end] are negative, they will be relative to the end of the array (i.e. [code]arr.slice(0, -2)[/code] is a shorthand for [code]arr.slice(0, arr.size() - 2)[/code]). *)
    let slice =
    M.foreign_method "PackedFloat64Array" "slice" (M.Int.typ @-> M.Int.typ @-> M.PackedFloat64Array.typ @-> returning M.PackedFloat64Array.typ)

    (** Returns a copy of the data converted to a [PackedByteArray], where each element have been encoded as 8 bytes.
The size of the new array will be [code]float64_array.size()  *  8[/code]. *)
    let to_byte_array =
    M.foreign_method "PackedFloat64Array" "to_byte_array" (M.PackedFloat64Array.typ @-> returning M.PackedByteArray.typ)

    (** Sorts the elements of the array in ascending order.
[b]Note:[/b] [constant @GDScript.NAN] doesn't behave the same as other numbers. Therefore, the results from this method may not be accurate if NaNs are included. *)
    let sort =
    M.foreign_method "PackedFloat64Array" "sort" (M.PackedFloat64Array.typ @-> returning M.Void.typ)

    (** Finds the index of an existing value (or the insertion index that maintains sorting order, if the value is not yet present in the array) using binary search. Optionally, a [param before] specifier can be passed. If [code]false[/code], the returned index comes after all existing entries of the value in the array.
[b]Note:[/b] Calling [method bsearch] on an unsorted array results in unexpected behavior.
[b]Note:[/b] [constant @GDScript.NAN] doesn't behave the same as other numbers. Therefore, the results from this method may not be accurate if NaNs are included. *)
    let bsearch =
    M.foreign_method "PackedFloat64Array" "bsearch" (M.Float.typ @-> M.Bool.typ @-> M.PackedFloat64Array.typ @-> returning M.Int.typ)

    (** Creates a copy of the array, and returns it. *)
    let duplicate =
    M.foreign_method "PackedFloat64Array" "duplicate" (M.PackedFloat64Array.typ @-> returning M.PackedFloat64Array.typ)

    (** Searches the array for a value and returns its index or [code]-1[/code] if not found. Optionally, the initial search index can be passed.
[b]Note:[/b] [constant @GDScript.NAN] doesn't behave the same as other numbers. Therefore, the results from this method may not be accurate if NaNs are included. *)
    let find =
    M.foreign_method "PackedFloat64Array" "find" (M.Float.typ @-> M.Int.typ @-> M.PackedFloat64Array.typ @-> returning M.Int.typ)

    (** Searches the array in reverse order. Optionally, a start search index can be passed. If negative, the start index is considered relative to the end of the array.
[b]Note:[/b] [constant @GDScript.NAN] doesn't behave the same as other numbers. Therefore, the results from this method may not be accurate if NaNs are included. *)
    let rfind =
    M.foreign_method "PackedFloat64Array" "rfind" (M.Float.typ @-> M.Int.typ @-> M.PackedFloat64Array.typ @-> returning M.Int.typ)

    (** Returns the number of times an element is in the array.
[b]Note:[/b] [constant @GDScript.NAN] doesn't behave the same as other numbers. Therefore, the results from this method may not be accurate if NaNs are included. *)
    let count =
    M.foreign_method "PackedFloat64Array" "count" (M.Float.typ @-> M.PackedFloat64Array.typ @-> returning M.Int.typ)






    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_FLOAT64_ARRAY None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.PackedFloat64Array.typ @-> M.PackedFloat64Array.typ @-> M.Bool.typ @-> returning void))


    let _PackedFloat64Array_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_FLOAT64_ARRAY (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.PackedFloat64Array.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _PackedFloat64Array_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_FLOAT64_ARRAY (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.PackedFloat64Array.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if contents of both arrays are the same, i.e. they have all equal doubles at the corresponding indices. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_FLOAT64_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_FLOAT64_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.PackedFloat64Array.typ @-> M.PackedFloat64Array.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if contents of the arrays differ. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_FLOAT64_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_FLOAT64_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.PackedFloat64Array.typ @-> M.PackedFloat64Array.typ @-> M.Bool.typ @-> returning void))

    (** Returns a new [PackedFloat64Array] with contents of [param right] added at the end of this array. For better performance, consider using [method append_array] instead. *)
    let (+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_FLOAT64_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_FLOAT64_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_ADD
      (funptr (M.PackedFloat64Array.typ @-> M.PackedFloat64Array.typ @-> M.PackedFloat64Array.typ @-> returning void))
    end

  module PackedStringArray = struct
    (** Returns the number of elements in the array. *)
    let size =
    M.foreign_method "PackedStringArray" "size" (M.PackedStringArray.typ @-> returning M.Int.typ)

    (** Returns [code]true[/code] if the array is empty. *)
    let is_empty =
    M.foreign_method "PackedStringArray" "is_empty" (M.PackedStringArray.typ @-> returning M.Bool.typ)

    (** Changes the [String] at the given index. *)
    let set =
    M.foreign_method "PackedStringArray" "set" (M.Int.typ @-> M.String.typ @-> M.PackedStringArray.typ @-> returning M.Void.typ)

    (** Appends a string element at end of the array. *)
    let push_back =
    M.foreign_method "PackedStringArray" "push_back" (M.String.typ @-> M.PackedStringArray.typ @-> returning M.Bool.typ)

    (** Appends an element at the end of the array (alias of [method push_back]). *)
    let append =
    M.foreign_method "PackedStringArray" "append" (M.String.typ @-> M.PackedStringArray.typ @-> returning M.Bool.typ)

    (** Appends a [PackedStringArray] at the end of this array. *)
    let append_array =
    M.foreign_method "PackedStringArray" "append_array" (M.PackedStringArray.typ @-> M.PackedStringArray.typ @-> returning M.Void.typ)

    (** Removes an element from the array by index. *)
    let remove_at =
    M.foreign_method "PackedStringArray" "remove_at" (M.Int.typ @-> M.PackedStringArray.typ @-> returning M.Void.typ)

    (** Inserts a new element at a given position in the array. The position must be valid, or at the end of the array ([code]idx == size()[/code]). *)
    let insert =
    M.foreign_method "PackedStringArray" "insert" (M.Int.typ @-> M.String.typ @-> M.PackedStringArray.typ @-> returning M.Int.typ)

    (** Assigns the given value to all elements in the array. This can typically be used together with [method resize] to create an array with a given size and initialized elements. *)
    let fill =
    M.foreign_method "PackedStringArray" "fill" (M.String.typ @-> M.PackedStringArray.typ @-> returning M.Void.typ)

    (** Sets the size of the array. If the array is grown, reserves elements at the end of the array. If the array is shrunk, truncates the array to the new size. Calling [method resize] once and assigning the new values is faster than adding new elements one by one. *)
    let resize =
    M.foreign_method "PackedStringArray" "resize" (M.Int.typ @-> M.PackedStringArray.typ @-> returning M.Int.typ)

    (** Clears the array. This is equivalent to using [method resize] with a size of [code]0[/code]. *)
    let clear =
    M.foreign_method "PackedStringArray" "clear" (M.PackedStringArray.typ @-> returning M.Void.typ)

    (** Returns [code]true[/code] if the array contains [param value]. *)
    let has =
    M.foreign_method "PackedStringArray" "has" (M.String.typ @-> M.PackedStringArray.typ @-> returning M.Bool.typ)

    (** Reverses the order of the elements in the array. *)
    let reverse =
    M.foreign_method "PackedStringArray" "reverse" (M.PackedStringArray.typ @-> returning M.Void.typ)

    (** Returns the slice of the [PackedStringArray], from [param begin] (inclusive) to [param end] (exclusive), as a new [PackedStringArray].
The absolute value of [param begin] and [param end] will be clamped to the array size, so the default value for [param end] makes it slice to the size of the array by default (i.e. [code]arr.slice(1)[/code] is a shorthand for [code]arr.slice(1, arr.size())[/code]).
If either [param begin] or [param end] are negative, they will be relative to the end of the array (i.e. [code]arr.slice(0, -2)[/code] is a shorthand for [code]arr.slice(0, arr.size() - 2)[/code]). *)
    let slice =
    M.foreign_method "PackedStringArray" "slice" (M.Int.typ @-> M.Int.typ @-> M.PackedStringArray.typ @-> returning M.PackedStringArray.typ)

    (** Returns a [PackedByteArray] with each string encoded as bytes. *)
    let to_byte_array =
    M.foreign_method "PackedStringArray" "to_byte_array" (M.PackedStringArray.typ @-> returning M.PackedByteArray.typ)

    (** Sorts the elements of the array in ascending order. *)
    let sort =
    M.foreign_method "PackedStringArray" "sort" (M.PackedStringArray.typ @-> returning M.Void.typ)

    (** Finds the index of an existing value (or the insertion index that maintains sorting order, if the value is not yet present in the array) using binary search. Optionally, a [param before] specifier can be passed. If [code]false[/code], the returned index comes after all existing entries of the value in the array.
[b]Note:[/b] Calling [method bsearch] on an unsorted array results in unexpected behavior. *)
    let bsearch =
    M.foreign_method "PackedStringArray" "bsearch" (M.String.typ @-> M.Bool.typ @-> M.PackedStringArray.typ @-> returning M.Int.typ)

    (** Creates a copy of the array, and returns it. *)
    let duplicate =
    M.foreign_method "PackedStringArray" "duplicate" (M.PackedStringArray.typ @-> returning M.PackedStringArray.typ)

    (** Searches the array for a value and returns its index or [code]-1[/code] if not found. Optionally, the initial search index can be passed. *)
    let find =
    M.foreign_method "PackedStringArray" "find" (M.String.typ @-> M.Int.typ @-> M.PackedStringArray.typ @-> returning M.Int.typ)

    (** Searches the array in reverse order. Optionally, a start search index can be passed. If negative, the start index is considered relative to the end of the array. *)
    let rfind =
    M.foreign_method "PackedStringArray" "rfind" (M.String.typ @-> M.Int.typ @-> M.PackedStringArray.typ @-> returning M.Int.typ)

    (** Returns the number of times an element is in the array. *)
    let count =
    M.foreign_method "PackedStringArray" "count" (M.String.typ @-> M.PackedStringArray.typ @-> returning M.Int.typ)






    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_STRING_ARRAY None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.PackedStringArray.typ @-> M.PackedStringArray.typ @-> M.Bool.typ @-> returning void))


    let _PackedStringArray_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_STRING_ARRAY (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.PackedStringArray.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _PackedStringArray_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_STRING_ARRAY (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.PackedStringArray.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if contents of both arrays are the same, i.e. they have all equal [String]s at the corresponding indices. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_STRING_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_STRING_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.PackedStringArray.typ @-> M.PackedStringArray.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if contents of the arrays differ. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_STRING_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_STRING_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.PackedStringArray.typ @-> M.PackedStringArray.typ @-> M.Bool.typ @-> returning void))

    (** Returns a new [PackedStringArray] with contents of [param right] added at the end of this array. For better performance, consider using [method append_array] instead. *)
    let (+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_STRING_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_STRING_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_ADD
      (funptr (M.PackedStringArray.typ @-> M.PackedStringArray.typ @-> M.PackedStringArray.typ @-> returning void))
    end

  module PackedVector2Array = struct
    (** Returns the number of elements in the array. *)
    let size =
    M.foreign_method "PackedVector2Array" "size" (M.PackedVector2Array.typ @-> returning M.Int.typ)

    (** Returns [code]true[/code] if the array is empty. *)
    let is_empty =
    M.foreign_method "PackedVector2Array" "is_empty" (M.PackedVector2Array.typ @-> returning M.Bool.typ)

    (** Changes the [Vector2] at the given index. *)
    let set =
    M.foreign_method "PackedVector2Array" "set" (M.Int.typ @-> M.Vector2.typ @-> M.PackedVector2Array.typ @-> returning M.Void.typ)

    (** Inserts a [Vector2] at the end. *)
    let push_back =
    M.foreign_method "PackedVector2Array" "push_back" (M.Vector2.typ @-> M.PackedVector2Array.typ @-> returning M.Bool.typ)

    (** Appends an element at the end of the array (alias of [method push_back]). *)
    let append =
    M.foreign_method "PackedVector2Array" "append" (M.Vector2.typ @-> M.PackedVector2Array.typ @-> returning M.Bool.typ)

    (** Appends a [PackedVector2Array] at the end of this array. *)
    let append_array =
    M.foreign_method "PackedVector2Array" "append_array" (M.PackedVector2Array.typ @-> M.PackedVector2Array.typ @-> returning M.Void.typ)

    (** Removes an element from the array by index. *)
    let remove_at =
    M.foreign_method "PackedVector2Array" "remove_at" (M.Int.typ @-> M.PackedVector2Array.typ @-> returning M.Void.typ)

    (** Inserts a new element at a given position in the array. The position must be valid, or at the end of the array ([code]idx == size()[/code]). *)
    let insert =
    M.foreign_method "PackedVector2Array" "insert" (M.Int.typ @-> M.Vector2.typ @-> M.PackedVector2Array.typ @-> returning M.Int.typ)

    (** Assigns the given value to all elements in the array. This can typically be used together with [method resize] to create an array with a given size and initialized elements. *)
    let fill =
    M.foreign_method "PackedVector2Array" "fill" (M.Vector2.typ @-> M.PackedVector2Array.typ @-> returning M.Void.typ)

    (** Sets the size of the array. If the array is grown, reserves elements at the end of the array. If the array is shrunk, truncates the array to the new size. Calling [method resize] once and assigning the new values is faster than adding new elements one by one. *)
    let resize =
    M.foreign_method "PackedVector2Array" "resize" (M.Int.typ @-> M.PackedVector2Array.typ @-> returning M.Int.typ)

    (** Clears the array. This is equivalent to using [method resize] with a size of [code]0[/code]. *)
    let clear =
    M.foreign_method "PackedVector2Array" "clear" (M.PackedVector2Array.typ @-> returning M.Void.typ)

    (** Returns [code]true[/code] if the array contains [param value].
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this method may not be accurate if NaNs are included. *)
    let has =
    M.foreign_method "PackedVector2Array" "has" (M.Vector2.typ @-> M.PackedVector2Array.typ @-> returning M.Bool.typ)

    (** Reverses the order of the elements in the array. *)
    let reverse =
    M.foreign_method "PackedVector2Array" "reverse" (M.PackedVector2Array.typ @-> returning M.Void.typ)

    (** Returns the slice of the [PackedVector2Array], from [param begin] (inclusive) to [param end] (exclusive), as a new [PackedVector2Array].
The absolute value of [param begin] and [param end] will be clamped to the array size, so the default value for [param end] makes it slice to the size of the array by default (i.e. [code]arr.slice(1)[/code] is a shorthand for [code]arr.slice(1, arr.size())[/code]).
If either [param begin] or [param end] are negative, they will be relative to the end of the array (i.e. [code]arr.slice(0, -2)[/code] is a shorthand for [code]arr.slice(0, arr.size() - 2)[/code]). *)
    let slice =
    M.foreign_method "PackedVector2Array" "slice" (M.Int.typ @-> M.Int.typ @-> M.PackedVector2Array.typ @-> returning M.PackedVector2Array.typ)

    (** Returns a [PackedByteArray] with each vector encoded as bytes. *)
    let to_byte_array =
    M.foreign_method "PackedVector2Array" "to_byte_array" (M.PackedVector2Array.typ @-> returning M.PackedByteArray.typ)

    (** Sorts the elements of the array in ascending order.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this method may not be accurate if NaNs are included. *)
    let sort =
    M.foreign_method "PackedVector2Array" "sort" (M.PackedVector2Array.typ @-> returning M.Void.typ)

    (** Finds the index of an existing value (or the insertion index that maintains sorting order, if the value is not yet present in the array) using binary search. Optionally, a [param before] specifier can be passed. If [code]false[/code], the returned index comes after all existing entries of the value in the array.
[b]Note:[/b] Calling [method bsearch] on an unsorted array results in unexpected behavior.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this method may not be accurate if NaNs are included. *)
    let bsearch =
    M.foreign_method "PackedVector2Array" "bsearch" (M.Vector2.typ @-> M.Bool.typ @-> M.PackedVector2Array.typ @-> returning M.Int.typ)

    (** Creates a copy of the array, and returns it. *)
    let duplicate =
    M.foreign_method "PackedVector2Array" "duplicate" (M.PackedVector2Array.typ @-> returning M.PackedVector2Array.typ)

    (** Searches the array for a value and returns its index or [code]-1[/code] if not found. Optionally, the initial search index can be passed.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this method may not be accurate if NaNs are included. *)
    let find =
    M.foreign_method "PackedVector2Array" "find" (M.Vector2.typ @-> M.Int.typ @-> M.PackedVector2Array.typ @-> returning M.Int.typ)

    (** Searches the array in reverse order. Optionally, a start search index can be passed. If negative, the start index is considered relative to the end of the array.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this method may not be accurate if NaNs are included. *)
    let rfind =
    M.foreign_method "PackedVector2Array" "rfind" (M.Vector2.typ @-> M.Int.typ @-> M.PackedVector2Array.typ @-> returning M.Int.typ)

    (** Returns the number of times an element is in the array.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this method may not be accurate if NaNs are included. *)
    let count =
    M.foreign_method "PackedVector2Array" "count" (M.Vector2.typ @-> M.PackedVector2Array.typ @-> returning M.Int.typ)






    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_VECTOR2_ARRAY None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.PackedVector2Array.typ @-> M.PackedVector2Array.typ @-> M.Bool.typ @-> returning void))




    let _PackedVector2Array_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_VECTOR2_ARRAY (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.PackedVector2Array.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _PackedVector2Array_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_VECTOR2_ARRAY (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.PackedVector2Array.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if contents of both arrays are the same, i.e. they have all equal [Vector2]s at the corresponding indices. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_VECTOR2_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_VECTOR2_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.PackedVector2Array.typ @-> M.PackedVector2Array.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if contents of the arrays differ. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_VECTOR2_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_VECTOR2_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.PackedVector2Array.typ @-> M.PackedVector2Array.typ @-> M.Bool.typ @-> returning void))

    (** Returns a new [PackedVector2Array] with contents of [param right] added at the end of this array. For better performance, consider using [method append_array] instead. *)
    let (+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_VECTOR2_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_VECTOR2_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_ADD
      (funptr (M.PackedVector2Array.typ @-> M.PackedVector2Array.typ @-> M.PackedVector2Array.typ @-> returning void))
    end

  module PackedVector3Array = struct
    (** Returns the number of elements in the array. *)
    let size =
    M.foreign_method "PackedVector3Array" "size" (M.PackedVector3Array.typ @-> returning M.Int.typ)

    (** Returns [code]true[/code] if the array is empty. *)
    let is_empty =
    M.foreign_method "PackedVector3Array" "is_empty" (M.PackedVector3Array.typ @-> returning M.Bool.typ)

    (** Changes the [Vector3] at the given index. *)
    let set =
    M.foreign_method "PackedVector3Array" "set" (M.Int.typ @-> M.Vector3.typ @-> M.PackedVector3Array.typ @-> returning M.Void.typ)

    (** Inserts a [Vector3] at the end. *)
    let push_back =
    M.foreign_method "PackedVector3Array" "push_back" (M.Vector3.typ @-> M.PackedVector3Array.typ @-> returning M.Bool.typ)

    (** Appends an element at the end of the array (alias of [method push_back]). *)
    let append =
    M.foreign_method "PackedVector3Array" "append" (M.Vector3.typ @-> M.PackedVector3Array.typ @-> returning M.Bool.typ)

    (** Appends a [PackedVector3Array] at the end of this array. *)
    let append_array =
    M.foreign_method "PackedVector3Array" "append_array" (M.PackedVector3Array.typ @-> M.PackedVector3Array.typ @-> returning M.Void.typ)

    (** Removes an element from the array by index. *)
    let remove_at =
    M.foreign_method "PackedVector3Array" "remove_at" (M.Int.typ @-> M.PackedVector3Array.typ @-> returning M.Void.typ)

    (** Inserts a new element at a given position in the array. The position must be valid, or at the end of the array ([code]idx == size()[/code]). *)
    let insert =
    M.foreign_method "PackedVector3Array" "insert" (M.Int.typ @-> M.Vector3.typ @-> M.PackedVector3Array.typ @-> returning M.Int.typ)

    (** Assigns the given value to all elements in the array. This can typically be used together with [method resize] to create an array with a given size and initialized elements. *)
    let fill =
    M.foreign_method "PackedVector3Array" "fill" (M.Vector3.typ @-> M.PackedVector3Array.typ @-> returning M.Void.typ)

    (** Sets the size of the array. If the array is grown, reserves elements at the end of the array. If the array is shrunk, truncates the array to the new size. Calling [method resize] once and assigning the new values is faster than adding new elements one by one. *)
    let resize =
    M.foreign_method "PackedVector3Array" "resize" (M.Int.typ @-> M.PackedVector3Array.typ @-> returning M.Int.typ)

    (** Clears the array. This is equivalent to using [method resize] with a size of [code]0[/code]. *)
    let clear =
    M.foreign_method "PackedVector3Array" "clear" (M.PackedVector3Array.typ @-> returning M.Void.typ)

    (** Returns [code]true[/code] if the array contains [param value].
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this method may not be accurate if NaNs are included. *)
    let has =
    M.foreign_method "PackedVector3Array" "has" (M.Vector3.typ @-> M.PackedVector3Array.typ @-> returning M.Bool.typ)

    (** Reverses the order of the elements in the array. *)
    let reverse =
    M.foreign_method "PackedVector3Array" "reverse" (M.PackedVector3Array.typ @-> returning M.Void.typ)

    (** Returns the slice of the [PackedVector3Array], from [param begin] (inclusive) to [param end] (exclusive), as a new [PackedVector3Array].
The absolute value of [param begin] and [param end] will be clamped to the array size, so the default value for [param end] makes it slice to the size of the array by default (i.e. [code]arr.slice(1)[/code] is a shorthand for [code]arr.slice(1, arr.size())[/code]).
If either [param begin] or [param end] are negative, they will be relative to the end of the array (i.e. [code]arr.slice(0, -2)[/code] is a shorthand for [code]arr.slice(0, arr.size() - 2)[/code]). *)
    let slice =
    M.foreign_method "PackedVector3Array" "slice" (M.Int.typ @-> M.Int.typ @-> M.PackedVector3Array.typ @-> returning M.PackedVector3Array.typ)

    (** Returns a [PackedByteArray] with each vector encoded as bytes. *)
    let to_byte_array =
    M.foreign_method "PackedVector3Array" "to_byte_array" (M.PackedVector3Array.typ @-> returning M.PackedByteArray.typ)

    (** Sorts the elements of the array in ascending order.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this method may not be accurate if NaNs are included. *)
    let sort =
    M.foreign_method "PackedVector3Array" "sort" (M.PackedVector3Array.typ @-> returning M.Void.typ)

    (** Finds the index of an existing value (or the insertion index that maintains sorting order, if the value is not yet present in the array) using binary search. Optionally, a [param before] specifier can be passed. If [code]false[/code], the returned index comes after all existing entries of the value in the array.
[b]Note:[/b] Calling [method bsearch] on an unsorted array results in unexpected behavior.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this method may not be accurate if NaNs are included. *)
    let bsearch =
    M.foreign_method "PackedVector3Array" "bsearch" (M.Vector3.typ @-> M.Bool.typ @-> M.PackedVector3Array.typ @-> returning M.Int.typ)

    (** Creates a copy of the array, and returns it. *)
    let duplicate =
    M.foreign_method "PackedVector3Array" "duplicate" (M.PackedVector3Array.typ @-> returning M.PackedVector3Array.typ)

    (** Searches the array for a value and returns its index or [code]-1[/code] if not found. Optionally, the initial search index can be passed.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this method may not be accurate if NaNs are included. *)
    let find =
    M.foreign_method "PackedVector3Array" "find" (M.Vector3.typ @-> M.Int.typ @-> M.PackedVector3Array.typ @-> returning M.Int.typ)

    (** Searches the array in reverse order. Optionally, a start search index can be passed. If negative, the start index is considered relative to the end of the array.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this method may not be accurate if NaNs are included. *)
    let rfind =
    M.foreign_method "PackedVector3Array" "rfind" (M.Vector3.typ @-> M.Int.typ @-> M.PackedVector3Array.typ @-> returning M.Int.typ)

    (** Returns the number of times an element is in the array.
[b]Note:[/b] Vectors with [constant @GDScript.NAN] elements don't behave the same as other vectors. Therefore, the results from this method may not be accurate if NaNs are included. *)
    let count =
    M.foreign_method "PackedVector3Array" "count" (M.Vector3.typ @-> M.PackedVector3Array.typ @-> returning M.Int.typ)






    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_VECTOR3_ARRAY None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.PackedVector3Array.typ @-> M.PackedVector3Array.typ @-> M.Bool.typ @-> returning void))




    let _PackedVector3Array_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_VECTOR3_ARRAY (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.PackedVector3Array.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _PackedVector3Array_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_VECTOR3_ARRAY (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.PackedVector3Array.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if contents of both arrays are the same, i.e. they have all equal [Vector3]s at the corresponding indices. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_VECTOR3_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_VECTOR3_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.PackedVector3Array.typ @-> M.PackedVector3Array.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if contents of the arrays differ. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_VECTOR3_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_VECTOR3_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.PackedVector3Array.typ @-> M.PackedVector3Array.typ @-> M.Bool.typ @-> returning void))

    (** Returns a new [PackedVector3Array] with contents of [param right] added at the end of this array. For better performance, consider using [method append_array] instead. *)
    let (+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_VECTOR3_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_VECTOR3_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_ADD
      (funptr (M.PackedVector3Array.typ @-> M.PackedVector3Array.typ @-> M.PackedVector3Array.typ @-> returning void))
    end

  module PackedColorArray = struct
    (** Returns the number of elements in the array. *)
    let size =
    M.foreign_method "PackedColorArray" "size" (M.PackedColorArray.typ @-> returning M.Int.typ)

    (** Returns [code]true[/code] if the array is empty. *)
    let is_empty =
    M.foreign_method "PackedColorArray" "is_empty" (M.PackedColorArray.typ @-> returning M.Bool.typ)

    (** Changes the [Color] at the given index. *)
    let set =
    M.foreign_method "PackedColorArray" "set" (M.Int.typ @-> M.Color.typ @-> M.PackedColorArray.typ @-> returning M.Void.typ)

    (** Appends a value to the array. *)
    let push_back =
    M.foreign_method "PackedColorArray" "push_back" (M.Color.typ @-> M.PackedColorArray.typ @-> returning M.Bool.typ)

    (** Appends an element at the end of the array (alias of [method push_back]). *)
    let append =
    M.foreign_method "PackedColorArray" "append" (M.Color.typ @-> M.PackedColorArray.typ @-> returning M.Bool.typ)

    (** Appends a [PackedColorArray] at the end of this array. *)
    let append_array =
    M.foreign_method "PackedColorArray" "append_array" (M.PackedColorArray.typ @-> M.PackedColorArray.typ @-> returning M.Void.typ)

    (** Removes an element from the array by index. *)
    let remove_at =
    M.foreign_method "PackedColorArray" "remove_at" (M.Int.typ @-> M.PackedColorArray.typ @-> returning M.Void.typ)

    (** Inserts a new element at a given position in the array. The position must be valid, or at the end of the array ([code]idx == size()[/code]). *)
    let insert =
    M.foreign_method "PackedColorArray" "insert" (M.Int.typ @-> M.Color.typ @-> M.PackedColorArray.typ @-> returning M.Int.typ)

    (** Assigns the given value to all elements in the array. This can typically be used together with [method resize] to create an array with a given size and initialized elements. *)
    let fill =
    M.foreign_method "PackedColorArray" "fill" (M.Color.typ @-> M.PackedColorArray.typ @-> returning M.Void.typ)

    (** Sets the size of the array. If the array is grown, reserves elements at the end of the array. If the array is shrunk, truncates the array to the new size. Calling [method resize] once and assigning the new values is faster than adding new elements one by one. *)
    let resize =
    M.foreign_method "PackedColorArray" "resize" (M.Int.typ @-> M.PackedColorArray.typ @-> returning M.Int.typ)

    (** Clears the array. This is equivalent to using [method resize] with a size of [code]0[/code]. *)
    let clear =
    M.foreign_method "PackedColorArray" "clear" (M.PackedColorArray.typ @-> returning M.Void.typ)

    (** Returns [code]true[/code] if the array contains [param value]. *)
    let has =
    M.foreign_method "PackedColorArray" "has" (M.Color.typ @-> M.PackedColorArray.typ @-> returning M.Bool.typ)

    (** Reverses the order of the elements in the array. *)
    let reverse =
    M.foreign_method "PackedColorArray" "reverse" (M.PackedColorArray.typ @-> returning M.Void.typ)

    (** Returns the slice of the [PackedColorArray], from [param begin] (inclusive) to [param end] (exclusive), as a new [PackedColorArray].
The absolute value of [param begin] and [param end] will be clamped to the array size, so the default value for [param end] makes it slice to the size of the array by default (i.e. [code]arr.slice(1)[/code] is a shorthand for [code]arr.slice(1, arr.size())[/code]).
If either [param begin] or [param end] are negative, they will be relative to the end of the array (i.e. [code]arr.slice(0, -2)[/code] is a shorthand for [code]arr.slice(0, arr.size() - 2)[/code]). *)
    let slice =
    M.foreign_method "PackedColorArray" "slice" (M.Int.typ @-> M.Int.typ @-> M.PackedColorArray.typ @-> returning M.PackedColorArray.typ)

    (** Returns a [PackedByteArray] with each color encoded as bytes. *)
    let to_byte_array =
    M.foreign_method "PackedColorArray" "to_byte_array" (M.PackedColorArray.typ @-> returning M.PackedByteArray.typ)

    (** Sorts the elements of the array in ascending order. *)
    let sort =
    M.foreign_method "PackedColorArray" "sort" (M.PackedColorArray.typ @-> returning M.Void.typ)

    (** Finds the index of an existing value (or the insertion index that maintains sorting order, if the value is not yet present in the array) using binary search. Optionally, a [param before] specifier can be passed. If [code]false[/code], the returned index comes after all existing entries of the value in the array.
[b]Note:[/b] Calling [method bsearch] on an unsorted array results in unexpected behavior. *)
    let bsearch =
    M.foreign_method "PackedColorArray" "bsearch" (M.Color.typ @-> M.Bool.typ @-> M.PackedColorArray.typ @-> returning M.Int.typ)

    (** Creates a copy of the array, and returns it. *)
    let duplicate =
    M.foreign_method "PackedColorArray" "duplicate" (M.PackedColorArray.typ @-> returning M.PackedColorArray.typ)

    (** Searches the array for a value and returns its index or [code]-1[/code] if not found. Optionally, the initial search index can be passed. *)
    let find =
    M.foreign_method "PackedColorArray" "find" (M.Color.typ @-> M.Int.typ @-> M.PackedColorArray.typ @-> returning M.Int.typ)

    (** Searches the array in reverse order. Optionally, a start search index can be passed. If negative, the start index is considered relative to the end of the array. *)
    let rfind =
    M.foreign_method "PackedColorArray" "rfind" (M.Color.typ @-> M.Int.typ @-> M.PackedColorArray.typ @-> returning M.Int.typ)

    (** Returns the number of times an element is in the array. *)
    let count =
    M.foreign_method "PackedColorArray" "count" (M.Color.typ @-> M.PackedColorArray.typ @-> returning M.Int.typ)






    let not =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_COLOR_ARRAY None  Godotcaml.GlobalEnum.VariantOperator._OP_NOT
      (funptr (M.PackedColorArray.typ @-> M.PackedColorArray.typ @-> M.Bool.typ @-> returning void))


    let _PackedColorArray_elem_Dictionary =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_COLOR_ARRAY (Some GlobalEnum.VariantType._TYPE_DICTIONARY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.PackedColorArray.typ @-> M.Dictionary.typ @-> M.Bool.typ @-> returning void))


    let _PackedColorArray_elem_Array =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_COLOR_ARRAY (Some GlobalEnum.VariantType._TYPE_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_IN
      (funptr (M.PackedColorArray.typ @-> M.Array.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if contents of both arrays are the same, i.e. they have all equal [Color]s at the corresponding indices. *)
    let (=) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_COLOR_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_COLOR_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_EQUAL
      (funptr (M.PackedColorArray.typ @-> M.PackedColorArray.typ @-> M.Bool.typ @-> returning void))

    (** Returns [code]true[/code] if contents of the arrays differ. *)
    let (<>) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_COLOR_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_COLOR_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_NOT_EQUAL
      (funptr (M.PackedColorArray.typ @-> M.PackedColorArray.typ @-> M.Bool.typ @-> returning void))

    (** Returns a new [PackedColorArray] with contents of [param right] added at the end of this array. For better performance, consider using [method append_array] instead. *)
    let (+) =
    M.foreign_operator GlobalEnum.VariantType._TYPE_PACKED_COLOR_ARRAY (Some GlobalEnum.VariantType._TYPE_PACKED_COLOR_ARRAY) Godotcaml.GlobalEnum.VariantOperator._OP_ADD
      (funptr (M.PackedColorArray.typ @-> M.PackedColorArray.typ @-> M.PackedColorArray.typ @-> returning void))
    end
  end

