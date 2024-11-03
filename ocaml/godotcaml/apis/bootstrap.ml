module GlobalEnum0 = struct
  let to_ocaml (x : int) = x
  let of_ocaml (x : int) = x

  module Side = struct
    let is_bitfield = false

    type t = int

    (** Left side, usually used for [Control] or [StyleBox]-derived classes. *)
    let _SIDE_LEFT = 0

    (** Top side, usually used for [Control] or [StyleBox]-derived classes. *)
    let _SIDE_TOP = 1

    (** Right side, usually used for [Control] or [StyleBox]-derived classes. *)
    let _SIDE_RIGHT = 2

    (** Bottom side, usually used for [Control] or [StyleBox]-derived classes. *)
    let _SIDE_BOTTOM = 3
  end

  module Corner = struct
    let is_bitfield = false

    type t = int

    (** Top-left corner. *)
    let _CORNER_TOP_LEFT = 0

    (** Top-right corner. *)
    let _CORNER_TOP_RIGHT = 1

    (** Bottom-right corner. *)
    let _CORNER_BOTTOM_RIGHT = 2

    (** Bottom-left corner. *)
    let _CORNER_BOTTOM_LEFT = 3
  end

  module Orientation = struct
    let is_bitfield = false

    type t = int

    (** General vertical alignment, usually used for [Separator], [ScrollBar], [Slider], etc. *)
    let _VERTICAL = 1

    (** General horizontal alignment, usually used for [Separator], [ScrollBar], [Slider], etc. *)
    let _HORIZONTAL = 0
  end

  module ClockDirection = struct
    let is_bitfield = false

    type t = int

    (** Clockwise rotation. Used by some methods (e.g. [method Image.rotate_90]). *)
    let _CLOCKWISE = 0

    (** Counter-clockwise rotation. Used by some methods (e.g. [method Image.rotate_90]). *)
    let _COUNTERCLOCKWISE = 1
  end

  module HorizontalAlignment = struct
    let is_bitfield = false

    type t = int

    (** Horizontal left alignment, usually for text-derived classes. *)
    let _HORIZONTAL_ALIGNMENT_LEFT = 0

    (** Horizontal center alignment, usually for text-derived classes. *)
    let _HORIZONTAL_ALIGNMENT_CENTER = 1

    (** Horizontal right alignment, usually for text-derived classes. *)
    let _HORIZONTAL_ALIGNMENT_RIGHT = 2

    (** Expand row to fit width, usually for text-derived classes. *)
    let _HORIZONTAL_ALIGNMENT_FILL = 3
  end

  module VerticalAlignment = struct
    let is_bitfield = false

    type t = int

    (** Vertical top alignment, usually for text-derived classes. *)
    let _VERTICAL_ALIGNMENT_TOP = 0

    (** Vertical center alignment, usually for text-derived classes. *)
    let _VERTICAL_ALIGNMENT_CENTER = 1

    (** Vertical bottom alignment, usually for text-derived classes. *)
    let _VERTICAL_ALIGNMENT_BOTTOM = 2

    (** Expand rows to fit height, usually for text-derived classes. *)
    let _VERTICAL_ALIGNMENT_FILL = 3
  end

  module InlineAlignment = struct
    let is_bitfield = false

    type t = int

    (** Aligns the top of the inline object (e.g. image, table) to the position of the text specified by [code]INLINE_ALIGNMENT_TO_ * [/code] constant. *)
    let _INLINE_ALIGNMENT_TOP_TO = 0

    (** Aligns the center of the inline object (e.g. image, table) to the position of the text specified by [code]INLINE_ALIGNMENT_TO_ * [/code] constant. *)
    let _INLINE_ALIGNMENT_CENTER_TO = 1

    (** Aligns the baseline (user defined) of the inline object (e.g. image, table) to the position of the text specified by [code]INLINE_ALIGNMENT_TO_ * [/code] constant. *)
    let _INLINE_ALIGNMENT_BASELINE_TO = 3

    (** Aligns the bottom of the inline object (e.g. image, table) to the position of the text specified by [code]INLINE_ALIGNMENT_TO_ * [/code] constant. *)
    let _INLINE_ALIGNMENT_BOTTOM_TO = 2

    (** Aligns the position of the inline object (e.g. image, table) specified by [code]INLINE_ALIGNMENT_ * _TO[/code] constant to the top of the text. *)
    let _INLINE_ALIGNMENT_TO_TOP = 0

    (** Aligns the position of the inline object (e.g. image, table) specified by [code]INLINE_ALIGNMENT_ * _TO[/code] constant to the center of the text. *)
    let _INLINE_ALIGNMENT_TO_CENTER = 4

    (** Aligns the position of the inline object (e.g. image, table) specified by [code]INLINE_ALIGNMENT_ * _TO[/code] constant to the baseline of the text. *)
    let _INLINE_ALIGNMENT_TO_BASELINE = 8

    (** Aligns inline object (e.g. image, table) to the bottom of the text. *)
    let _INLINE_ALIGNMENT_TO_BOTTOM = 12

    (** Aligns top of the inline object (e.g. image, table) to the top of the text. Equivalent to [code]INLINE_ALIGNMENT_TOP_TO | INLINE_ALIGNMENT_TO_TOP[/code]. *)
    let _INLINE_ALIGNMENT_TOP = 0

    (** Aligns center of the inline object (e.g. image, table) to the center of the text. Equivalent to [code]INLINE_ALIGNMENT_CENTER_TO | INLINE_ALIGNMENT_TO_CENTER[/code]. *)
    let _INLINE_ALIGNMENT_CENTER = 5

    (** Aligns bottom of the inline object (e.g. image, table) to the bottom of the text. Equivalent to [code]INLINE_ALIGNMENT_BOTTOM_TO | INLINE_ALIGNMENT_TO_BOTTOM[/code]. *)
    let _INLINE_ALIGNMENT_BOTTOM = 14

    (** A bit mask for [code]INLINE_ALIGNMENT_ * _TO[/code] alignment constants. *)
    let _INLINE_ALIGNMENT_IMAGE_MASK = 3

    (** A bit mask for [code]INLINE_ALIGNMENT_TO_ * [/code] alignment constants. *)
    let _INLINE_ALIGNMENT_TEXT_MASK = 12
  end

  module EulerOrder = struct
    let is_bitfield = false

    type t = int

    (** Specifies that Euler angles should be in XYZ order. When composing, the order is X, Y, Z. When decomposing, the order is reversed, first Z, then Y, and X last. *)
    let _EULER_ORDER_XYZ = 0

    (** Specifies that Euler angles should be in XZY order. When composing, the order is X, Z, Y. When decomposing, the order is reversed, first Y, then Z, and X last. *)
    let _EULER_ORDER_XZY = 1

    (** Specifies that Euler angles should be in YXZ order. When composing, the order is Y, X, Z. When decomposing, the order is reversed, first Z, then X, and Y last. *)
    let _EULER_ORDER_YXZ = 2

    (** Specifies that Euler angles should be in YZX order. When composing, the order is Y, Z, X. When decomposing, the order is reversed, first X, then Z, and Y last. *)
    let _EULER_ORDER_YZX = 3

    (** Specifies that Euler angles should be in ZXY order. When composing, the order is Z, X, Y. When decomposing, the order is reversed, first Y, then X, and Z last. *)
    let _EULER_ORDER_ZXY = 4

    (** Specifies that Euler angles should be in ZYX order. When composing, the order is Z, Y, X. When decomposing, the order is reversed, first X, then Y, and Z last. *)
    let _EULER_ORDER_ZYX = 5
  end

  module Key = struct
    let is_bitfield = false

    type t = int

    (** Enum value which doesn't correspond to any key. This is used to initialize [enum Key] properties with a generic state. *)
    let _KEY_NONE = 0

    (** Keycodes with this bit applied are non-printable. *)
    let _KEY_SPECIAL = 4194304

    (** Escape key. *)
    let _KEY_ESCAPE = 4194305

    (** Tab key. *)
    let _KEY_TAB = 4194306

    (** Shift + Tab key. *)
    let _KEY_BACKTAB = 4194307

    (** Backspace key. *)
    let _KEY_BACKSPACE = 4194308

    (** Return key (on the main keyboard). *)
    let _KEY_ENTER = 4194309

    (** Enter key on the numeric keypad. *)
    let _KEY_KP_ENTER = 4194310

    (** Insert key. *)
    let _KEY_INSERT = 4194311

    (** Delete key. *)
    let _KEY_DELETE = 4194312

    (** Pause key. *)
    let _KEY_PAUSE = 4194313

    (** Print Screen key. *)
    let _KEY_PRINT = 4194314

    (** System Request key. *)
    let _KEY_SYSREQ = 4194315

    (** Clear key. *)
    let _KEY_CLEAR = 4194316

    (** Home key. *)
    let _KEY_HOME = 4194317

    (** End key. *)
    let _KEY_END = 4194318

    (** Left arrow key. *)
    let _KEY_LEFT = 4194319

    (** Up arrow key. *)
    let _KEY_UP = 4194320

    (** Right arrow key. *)
    let _KEY_RIGHT = 4194321

    (** Down arrow key. *)
    let _KEY_DOWN = 4194322

    (** Page Up key. *)
    let _KEY_PAGEUP = 4194323

    (** Page Down key. *)
    let _KEY_PAGEDOWN = 4194324

    (** Shift key. *)
    let _KEY_SHIFT = 4194325

    (** Control key. *)
    let _KEY_CTRL = 4194326

    (** Meta key. *)
    let _KEY_META = 4194327

    (** Alt key. *)
    let _KEY_ALT = 4194328

    (** Caps Lock key. *)
    let _KEY_CAPSLOCK = 4194329

    (** Num Lock key. *)
    let _KEY_NUMLOCK = 4194330

    (** Scroll Lock key. *)
    let _KEY_SCROLLLOCK = 4194331

    (** F1 key. *)
    let _KEY_F1 = 4194332

    (** F2 key. *)
    let _KEY_F2 = 4194333

    (** F3 key. *)
    let _KEY_F3 = 4194334

    (** F4 key. *)
    let _KEY_F4 = 4194335

    (** F5 key. *)
    let _KEY_F5 = 4194336

    (** F6 key. *)
    let _KEY_F6 = 4194337

    (** F7 key. *)
    let _KEY_F7 = 4194338

    (** F8 key. *)
    let _KEY_F8 = 4194339

    (** F9 key. *)
    let _KEY_F9 = 4194340

    (** F10 key. *)
    let _KEY_F10 = 4194341

    (** F11 key. *)
    let _KEY_F11 = 4194342

    (** F12 key. *)
    let _KEY_F12 = 4194343

    (** F13 key. *)
    let _KEY_F13 = 4194344

    (** F14 key. *)
    let _KEY_F14 = 4194345

    (** F15 key. *)
    let _KEY_F15 = 4194346

    (** F16 key. *)
    let _KEY_F16 = 4194347

    (** F17 key. *)
    let _KEY_F17 = 4194348

    (** F18 key. *)
    let _KEY_F18 = 4194349

    (** F19 key. *)
    let _KEY_F19 = 4194350

    (** F20 key. *)
    let _KEY_F20 = 4194351

    (** F21 key. *)
    let _KEY_F21 = 4194352

    (** F22 key. *)
    let _KEY_F22 = 4194353

    (** F23 key. *)
    let _KEY_F23 = 4194354

    (** F24 key. *)
    let _KEY_F24 = 4194355

    (** F25 key. Only supported on macOS and Linux due to a Windows limitation. *)
    let _KEY_F25 = 4194356

    (** F26 key. Only supported on macOS and Linux due to a Windows limitation. *)
    let _KEY_F26 = 4194357

    (** F27 key. Only supported on macOS and Linux due to a Windows limitation. *)
    let _KEY_F27 = 4194358

    (** F28 key. Only supported on macOS and Linux due to a Windows limitation. *)
    let _KEY_F28 = 4194359

    (** F29 key. Only supported on macOS and Linux due to a Windows limitation. *)
    let _KEY_F29 = 4194360

    (** F30 key. Only supported on macOS and Linux due to a Windows limitation. *)
    let _KEY_F30 = 4194361

    (** F31 key. Only supported on macOS and Linux due to a Windows limitation. *)
    let _KEY_F31 = 4194362

    (** F32 key. Only supported on macOS and Linux due to a Windows limitation. *)
    let _KEY_F32 = 4194363

    (** F33 key. Only supported on macOS and Linux due to a Windows limitation. *)
    let _KEY_F33 = 4194364

    (** F34 key. Only supported on macOS and Linux due to a Windows limitation. *)
    let _KEY_F34 = 4194365

    (** F35 key. Only supported on macOS and Linux due to a Windows limitation. *)
    let _KEY_F35 = 4194366

    (** Multiply ( * ) key on the numeric keypad. *)
    let _KEY_KP_MULTIPLY = 4194433

    (** Divide (/) key on the numeric keypad. *)
    let _KEY_KP_DIVIDE = 4194434

    (** Subtract (-) key on the numeric keypad. *)
    let _KEY_KP_SUBTRACT = 4194435

    (** Period (.) key on the numeric keypad. *)
    let _KEY_KP_PERIOD = 4194436

    (** Add (+) key on the numeric keypad. *)
    let _KEY_KP_ADD = 4194437

    (** Number 0 on the numeric keypad. *)
    let _KEY_KP_0 = 4194438

    (** Number 1 on the numeric keypad. *)
    let _KEY_KP_1 = 4194439

    (** Number 2 on the numeric keypad. *)
    let _KEY_KP_2 = 4194440

    (** Number 3 on the numeric keypad. *)
    let _KEY_KP_3 = 4194441

    (** Number 4 on the numeric keypad. *)
    let _KEY_KP_4 = 4194442

    (** Number 5 on the numeric keypad. *)
    let _KEY_KP_5 = 4194443

    (** Number 6 on the numeric keypad. *)
    let _KEY_KP_6 = 4194444

    (** Number 7 on the numeric keypad. *)
    let _KEY_KP_7 = 4194445

    (** Number 8 on the numeric keypad. *)
    let _KEY_KP_8 = 4194446

    (** Number 9 on the numeric keypad. *)
    let _KEY_KP_9 = 4194447

    (** Context menu key. *)
    let _KEY_MENU = 4194370

    (** Hyper key. (On Linux/X11 only). *)
    let _KEY_HYPER = 4194371

    (** Help key. *)
    let _KEY_HELP = 4194373

    (** Media back key. Not to be confused with the Back button on an Android device. *)
    let _KEY_BACK = 4194376

    (** Media forward key. *)
    let _KEY_FORWARD = 4194377

    (** Media stop key. *)
    let _KEY_STOP = 4194378

    (** Media refresh key. *)
    let _KEY_REFRESH = 4194379

    (** Volume down key. *)
    let _KEY_VOLUMEDOWN = 4194380

    (** Mute volume key. *)
    let _KEY_VOLUMEMUTE = 4194381

    (** Volume up key. *)
    let _KEY_VOLUMEUP = 4194382

    (** Media play key. *)
    let _KEY_MEDIAPLAY = 4194388

    (** Media stop key. *)
    let _KEY_MEDIASTOP = 4194389

    (** Previous song key. *)
    let _KEY_MEDIAPREVIOUS = 4194390

    (** Next song key. *)
    let _KEY_MEDIANEXT = 4194391

    (** Media record key. *)
    let _KEY_MEDIARECORD = 4194392

    (** Home page key. *)
    let _KEY_HOMEPAGE = 4194393

    (** Favorites key. *)
    let _KEY_FAVORITES = 4194394

    (** Search key. *)
    let _KEY_SEARCH = 4194395

    (** Standby key. *)
    let _KEY_STANDBY = 4194396

    (** Open URL / Launch Browser key. *)
    let _KEY_OPENURL = 4194397

    (** Launch Mail key. *)
    let _KEY_LAUNCHMAIL = 4194398

    (** Launch Media key. *)
    let _KEY_LAUNCHMEDIA = 4194399

    (** Launch Shortcut 0 key. *)
    let _KEY_LAUNCH0 = 4194400

    (** Launch Shortcut 1 key. *)
    let _KEY_LAUNCH1 = 4194401

    (** Launch Shortcut 2 key. *)
    let _KEY_LAUNCH2 = 4194402

    (** Launch Shortcut 3 key. *)
    let _KEY_LAUNCH3 = 4194403

    (** Launch Shortcut 4 key. *)
    let _KEY_LAUNCH4 = 4194404

    (** Launch Shortcut 5 key. *)
    let _KEY_LAUNCH5 = 4194405

    (** Launch Shortcut 6 key. *)
    let _KEY_LAUNCH6 = 4194406

    (** Launch Shortcut 7 key. *)
    let _KEY_LAUNCH7 = 4194407

    (** Launch Shortcut 8 key. *)
    let _KEY_LAUNCH8 = 4194408

    (** Launch Shortcut 9 key. *)
    let _KEY_LAUNCH9 = 4194409

    (** Launch Shortcut A key. *)
    let _KEY_LAUNCHA = 4194410

    (** Launch Shortcut B key. *)
    let _KEY_LAUNCHB = 4194411

    (** Launch Shortcut C key. *)
    let _KEY_LAUNCHC = 4194412

    (** Launch Shortcut D key. *)
    let _KEY_LAUNCHD = 4194413

    (** Launch Shortcut E key. *)
    let _KEY_LAUNCHE = 4194414

    (** Launch Shortcut F key. *)
    let _KEY_LAUNCHF = 4194415

    (** ""Globe"" key on Mac / iPad keyboard. *)
    let _KEY_GLOBE = 4194416

    (** ""On-screen keyboard"" key on iPad keyboard. *)
    let _KEY_KEYBOARD = 4194417

    (** 英数 key on Mac keyboard. *)
    let _KEY_JIS_EISU = 4194418

    (** かな key on Mac keyboard. *)
    let _KEY_JIS_KANA = 4194419

    (** Unknown key. *)
    let _KEY_UNKNOWN = 8388607

    (** Space key. *)
    let _KEY_SPACE = 32

    (** ! key. *)
    let _KEY_EXCLAM = 33

    (** "" key. *)
    let _KEY_QUOTEDBL = 34

    (** # key. *)
    let _KEY_NUMBERSIGN = 35

    (** $ key. *)
    let _KEY_DOLLAR = 36

    (** % key. *)
    let _KEY_PERCENT = 37

    (** & key. *)
    let _KEY_AMPERSAND = 38

    (** ' key. *)
    let _KEY_APOSTROPHE = 39

    (** ( key. *)
    let _KEY_PARENLEFT = 40

    (** ) key. *)
    let _KEY_PARENRIGHT = 41

    (**  *  key. *)
    let _KEY_ASTERISK = 42

    (** + key. *)
    let _KEY_PLUS = 43

    (** , key. *)
    let _KEY_COMMA = 44

    (** - key. *)
    let _KEY_MINUS = 45

    (** . key. *)
    let _KEY_PERIOD = 46

    (** / key. *)
    let _KEY_SLASH = 47

    (** Number 0 key. *)
    let _KEY_0 = 48

    (** Number 1 key. *)
    let _KEY_1 = 49

    (** Number 2 key. *)
    let _KEY_2 = 50

    (** Number 3 key. *)
    let _KEY_3 = 51

    (** Number 4 key. *)
    let _KEY_4 = 52

    (** Number 5 key. *)
    let _KEY_5 = 53

    (** Number 6 key. *)
    let _KEY_6 = 54

    (** Number 7 key. *)
    let _KEY_7 = 55

    (** Number 8 key. *)
    let _KEY_8 = 56

    (** Number 9 key. *)
    let _KEY_9 = 57

    (** : key. *)
    let _KEY_COLON = 58

    (** ; key. *)
    let _KEY_SEMICOLON = 59

    (** < key. *)
    let _KEY_LESS = 60

    (** = key. *)
    let _KEY_EQUAL = 61

    (** > key. *)
    let _KEY_GREATER = 62

    (** ? key. *)
    let _KEY_QUESTION = 63

    (** @ key. *)
    let _KEY_AT = 64

    (** A key. *)
    let _KEY_A = 65

    (** B key. *)
    let _KEY_B = 66

    (** C key. *)
    let _KEY_C = 67

    (** D key. *)
    let _KEY_D = 68

    (** E key. *)
    let _KEY_E = 69

    (** F key. *)
    let _KEY_F = 70

    (** G key. *)
    let _KEY_G = 71

    (** H key. *)
    let _KEY_H = 72

    (** I key. *)
    let _KEY_I = 73

    (** J key. *)
    let _KEY_J = 74

    (** K key. *)
    let _KEY_K = 75

    (** L key. *)
    let _KEY_L = 76

    (** M key. *)
    let _KEY_M = 77

    (** N key. *)
    let _KEY_N = 78

    (** O key. *)
    let _KEY_O = 79

    (** P key. *)
    let _KEY_P = 80

    (** Q key. *)
    let _KEY_Q = 81

    (** R key. *)
    let _KEY_R = 82

    (** S key. *)
    let _KEY_S = 83

    (** T key. *)
    let _KEY_T = 84

    (** U key. *)
    let _KEY_U = 85

    (** V key. *)
    let _KEY_V = 86

    (** W key. *)
    let _KEY_W = 87

    (** X key. *)
    let _KEY_X = 88

    (** Y key. *)
    let _KEY_Y = 89

    (** Z key. *)
    let _KEY_Z = 90

    (** [ key. *)
    let _KEY_BRACKETLEFT = 91

    (** \ key. *)
    let _KEY_BACKSLASH = 92

    (** ] key. *)
    let _KEY_BRACKETRIGHT = 93

    (** ^ key. *)
    let _KEY_ASCIICIRCUM = 94

    (** _ key. *)
    let _KEY_UNDERSCORE = 95

    (** ` key. *)
    let _KEY_QUOTELEFT = 96

    (** { key. *)
    let _KEY_BRACELEFT = 123

    (** | key. *)
    let _KEY_BAR = 124

    (** } key. *)
    let _KEY_BRACERIGHT = 125

    (** ~ key. *)
    let _KEY_ASCIITILDE = 126

    (** ¥ key. *)
    let _KEY_YEN = 165

    (** § key. *)
    let _KEY_SECTION = 167
  end

  module KeyModifierMask = struct
    let is_bitfield = true

    type t = int

    (** Key Code mask. *)
    let _KEY_CODE_MASK = 8388607

    (** Modifier key mask. *)
    let _KEY_MODIFIER_MASK = 532676608

    (** Automatically remapped to [constant KEY_META] on macOS and [constant KEY_CTRL] on other platforms, this mask is never set in the actual events, and should be used for key mapping only. *)
    let _KEY_MASK_CMD_OR_CTRL = 16777216

    (** Shift key mask. *)
    let _KEY_MASK_SHIFT = 33554432

    (** Alt or Option (on macOS) key mask. *)
    let _KEY_MASK_ALT = 67108864

    (** Command (on macOS) or Meta/Windows key mask. *)
    let _KEY_MASK_META = 134217728

    (** Control key mask. *)
    let _KEY_MASK_CTRL = 268435456

    (** Keypad key mask. *)
    let _KEY_MASK_KPAD = 536870912

    (** Group Switch key mask. *)
    let _KEY_MASK_GROUP_SWITCH = 1073741824
  end

  module MouseButton = struct
    let is_bitfield = false

    type t = int

    (** Enum value which doesn't correspond to any mouse button. This is used to initialize [enum MouseButton] properties with a generic state. *)
    let _MOUSE_BUTTON_NONE = 0

    (** Primary mouse button, usually assigned to the left button. *)
    let _MOUSE_BUTTON_LEFT = 1

    (** Secondary mouse button, usually assigned to the right button. *)
    let _MOUSE_BUTTON_RIGHT = 2

    (** Middle mouse button. *)
    let _MOUSE_BUTTON_MIDDLE = 3

    (** Mouse wheel scrolling up. *)
    let _MOUSE_BUTTON_WHEEL_UP = 4

    (** Mouse wheel scrolling down. *)
    let _MOUSE_BUTTON_WHEEL_DOWN = 5

    (** Mouse wheel left button (only present on some mice). *)
    let _MOUSE_BUTTON_WHEEL_LEFT = 6

    (** Mouse wheel right button (only present on some mice). *)
    let _MOUSE_BUTTON_WHEEL_RIGHT = 7

    (** Extra mouse button 1. This is sometimes present, usually to the sides of the mouse. *)
    let _MOUSE_BUTTON_XBUTTON1 = 8

    (** Extra mouse button 2. This is sometimes present, usually to the sides of the mouse. *)
    let _MOUSE_BUTTON_XBUTTON2 = 9
  end

  module MouseButtonMask = struct
    let is_bitfield = true

    type t = int

    (** Primary mouse button mask, usually for the left button. *)
    let _MOUSE_BUTTON_MASK_LEFT = 1

    (** Secondary mouse button mask, usually for the right button. *)
    let _MOUSE_BUTTON_MASK_RIGHT = 2

    (** Middle mouse button mask. *)
    let _MOUSE_BUTTON_MASK_MIDDLE = 4

    (** Extra mouse button 1 mask. *)
    let _MOUSE_BUTTON_MASK_MB_XBUTTON1 = 128

    (** Extra mouse button 2 mask. *)
    let _MOUSE_BUTTON_MASK_MB_XBUTTON2 = 256
  end

  module JoyButton = struct
    let is_bitfield = false

    type t = int

    (** An invalid game controller button. *)
    let _JOY_BUTTON_INVALID = -1

    (** Game controller SDL button A. Corresponds to the bottom action button: Sony Cross, Xbox A, Nintendo B. *)
    let _JOY_BUTTON_A = 0

    (** Game controller SDL button B. Corresponds to the right action button: Sony Circle, Xbox B, Nintendo A. *)
    let _JOY_BUTTON_B = 1

    (** Game controller SDL button X. Corresponds to the left action button: Sony Square, Xbox X, Nintendo Y. *)
    let _JOY_BUTTON_X = 2

    (** Game controller SDL button Y. Corresponds to the top action button: Sony Triangle, Xbox Y, Nintendo X. *)
    let _JOY_BUTTON_Y = 3

    (** Game controller SDL back button. Corresponds to the Sony Select, Xbox Back, Nintendo - button. *)
    let _JOY_BUTTON_BACK = 4

    (** Game controller SDL guide button. Corresponds to the Sony PS, Xbox Home button. *)
    let _JOY_BUTTON_GUIDE = 5

    (** Game controller SDL start button. Corresponds to the Sony Options, Xbox Menu, Nintendo + button. *)
    let _JOY_BUTTON_START = 6

    (** Game controller SDL left stick button. Corresponds to the Sony L3, Xbox L/LS button. *)
    let _JOY_BUTTON_LEFT_STICK = 7

    (** Game controller SDL right stick button. Corresponds to the Sony R3, Xbox R/RS button. *)
    let _JOY_BUTTON_RIGHT_STICK = 8

    (** Game controller SDL left shoulder button. Corresponds to the Sony L1, Xbox LB button. *)
    let _JOY_BUTTON_LEFT_SHOULDER = 9

    (** Game controller SDL right shoulder button. Corresponds to the Sony R1, Xbox RB button. *)
    let _JOY_BUTTON_RIGHT_SHOULDER = 10

    (** Game controller D-pad up button. *)
    let _JOY_BUTTON_DPAD_UP = 11

    (** Game controller D-pad down button. *)
    let _JOY_BUTTON_DPAD_DOWN = 12

    (** Game controller D-pad left button. *)
    let _JOY_BUTTON_DPAD_LEFT = 13

    (** Game controller D-pad right button. *)
    let _JOY_BUTTON_DPAD_RIGHT = 14

    (** Game controller SDL miscellaneous button. Corresponds to Xbox share button, PS5 microphone button, Nintendo Switch capture button. *)
    let _JOY_BUTTON_MISC1 = 15

    (** Game controller SDL paddle 1 button. *)
    let _JOY_BUTTON_PADDLE1 = 16

    (** Game controller SDL paddle 2 button. *)
    let _JOY_BUTTON_PADDLE2 = 17

    (** Game controller SDL paddle 3 button. *)
    let _JOY_BUTTON_PADDLE3 = 18

    (** Game controller SDL paddle 4 button. *)
    let _JOY_BUTTON_PADDLE4 = 19

    (** Game controller SDL touchpad button. *)
    let _JOY_BUTTON_TOUCHPAD = 20

    (** The number of SDL game controller buttons. *)
    let _JOY_BUTTON_SDL_MAX = 21

    (** The maximum number of game controller buttons supported by the engine. The actual limit may be lower on specific platforms:
- [b]Android:[/b] Up to 36 buttons.
- [b]Linux:[/b] Up to 80 buttons.
- [b]Windows[/b] and [b]macOS:[/b] Up to 128 buttons. *)
    let _JOY_BUTTON_MAX = 128
  end

  module JoyAxis = struct
    let is_bitfield = false

    type t = int

    (** An invalid game controller axis. *)
    let _JOY_AXIS_INVALID = -1

    (** Game controller left joystick x-axis. *)
    let _JOY_AXIS_LEFT_X = 0

    (** Game controller left joystick y-axis. *)
    let _JOY_AXIS_LEFT_Y = 1

    (** Game controller right joystick x-axis. *)
    let _JOY_AXIS_RIGHT_X = 2

    (** Game controller right joystick y-axis. *)
    let _JOY_AXIS_RIGHT_Y = 3

    (** Game controller left trigger axis. *)
    let _JOY_AXIS_TRIGGER_LEFT = 4

    (** Game controller right trigger axis. *)
    let _JOY_AXIS_TRIGGER_RIGHT = 5

    (** The number of SDL game controller axes. *)
    let _JOY_AXIS_SDL_MAX = 6

    (** The maximum number of game controller axes: OpenVR supports up to 5 Joysticks making a total of 10 axes. *)
    let _JOY_AXIS_MAX = 10
  end

  module MIDIMessage = struct
    let is_bitfield = false

    type t = int

    (** Does not correspond to any MIDI message. This is the default value of [member InputEventMIDI.message]. *)
    let _MIDI_MESSAGE_NONE = 0

    (** MIDI message sent when a note is released.
[b]Note:[/b] Not all MIDI devices send this message; some may send [constant MIDI_MESSAGE_NOTE_ON] with [member InputEventMIDI.velocity] set to [code]0[/code]. *)
    let _MIDI_MESSAGE_NOTE_OFF = 8

    (** MIDI message sent when a note is pressed. *)
    let _MIDI_MESSAGE_NOTE_ON = 9

    (** MIDI message sent to indicate a change in pressure while a note is being pressed down, also called aftertouch. *)
    let _MIDI_MESSAGE_AFTERTOUCH = 10

    (** MIDI message sent when a controller value changes. In a MIDI device, a controller is any input that doesn't play notes. These may include sliders for volume, balance, and panning, as well as switches and pedals. See the [url=https://en.wikipedia.org/wiki/General_MIDI#Controller_events]General MIDI specification[/url] for a small list. *)
    let _MIDI_MESSAGE_CONTROL_CHANGE = 11

    (** MIDI message sent when the MIDI device changes its current instrument (also called [i]program[/i] or [i]preset[/i]). *)
    let _MIDI_MESSAGE_PROGRAM_CHANGE = 12

    (** MIDI message sent to indicate a change in pressure for the whole channel. Some MIDI devices may send this instead of [constant MIDI_MESSAGE_AFTERTOUCH]. *)
    let _MIDI_MESSAGE_CHANNEL_PRESSURE = 13

    (** MIDI message sent when the value of the pitch bender changes, usually a wheel on the MIDI device. *)
    let _MIDI_MESSAGE_PITCH_BEND = 14

    (** MIDI system exclusive (SysEx) message. This type of message is not standardized and it's highly dependent on the MIDI device sending it.
[b]Note:[/b] Getting this message's data from [InputEventMIDI] is not implemented. *)
    let _MIDI_MESSAGE_SYSTEM_EXCLUSIVE = 240

    (** MIDI message sent every quarter frame to keep connected MIDI devices synchronized. Related to [constant MIDI_MESSAGE_TIMING_CLOCK].
[b]Note:[/b] Getting this message's data from [InputEventMIDI] is not implemented. *)
    let _MIDI_MESSAGE_QUARTER_FRAME = 241

    (** MIDI message sent to jump onto a new position in the current sequence or song.
[b]Note:[/b] Getting this message's data from [InputEventMIDI] is not implemented. *)
    let _MIDI_MESSAGE_SONG_POSITION_POINTER = 242

    (** MIDI message sent to select a sequence or song to play.
[b]Note:[/b] Getting this message's data from [InputEventMIDI] is not implemented. *)
    let _MIDI_MESSAGE_SONG_SELECT = 243

    (** MIDI message sent to request a tuning calibration. Used on analog synthesizers. Most modern MIDI devices do not need this message. *)
    let _MIDI_MESSAGE_TUNE_REQUEST = 246

    (** MIDI message sent 24 times after [constant MIDI_MESSAGE_QUARTER_FRAME], to keep connected MIDI devices synchronized. *)
    let _MIDI_MESSAGE_TIMING_CLOCK = 248

    (** MIDI message sent to start the current sequence or song from the beginning. *)
    let _MIDI_MESSAGE_START = 250

    (** MIDI message sent to resume from the point the current sequence or song was paused. *)
    let _MIDI_MESSAGE_CONTINUE = 251

    (** MIDI message sent to pause the current sequence or song. *)
    let _MIDI_MESSAGE_STOP = 252

    (** MIDI message sent repeatedly while the MIDI device is idle, to tell the receiver that the connection is alive. Most MIDI devices do not send this message. *)
    let _MIDI_MESSAGE_ACTIVE_SENSING = 254

    (** MIDI message sent to reset a MIDI device to its default state, as if it was just turned on. It should not be sent when the MIDI device is being turned on. *)
    let _MIDI_MESSAGE_SYSTEM_RESET = 255
  end

  module Error = struct
    let is_bitfield = false

    type t = int

    (** Methods that return [enum Error] return [constant OK] when no error occurred.
Since [constant OK] has value 0, and all other error constants are positive integers, it can also be used in boolean checks.
[b]Example:[/b]
[codeblock]
var error = method_that_returns_error()
if error != OK:
    printerr(""Failure!"")

# Or, alternatively:
if error:
    printerr(""Still failing!"")
[/codeblock]
[b]Note:[/b] Many functions do not return an error code, but will print error messages to standard output. *)
    let _OK = 0

    (** Generic error. *)
    let _FAILED = 1

    (** Unavailable error. *)
    let _ERR_UNAVAILABLE = 2

    (** Unconfigured error. *)
    let _ERR_UNCONFIGURED = 3

    (** Unauthorized error. *)
    let _ERR_UNAUTHORIZED = 4

    (** Parameter range error. *)
    let _ERR_PARAMETER_RANGE_ERROR = 5

    (** Out of memory (OOM) error. *)
    let _ERR_OUT_OF_MEMORY = 6

    (** File: Not found error. *)
    let _ERR_FILE_NOT_FOUND = 7

    (** File: Bad drive error. *)
    let _ERR_FILE_BAD_DRIVE = 8

    (** File: Bad path error. *)
    let _ERR_FILE_BAD_PATH = 9

    (** File: No permission error. *)
    let _ERR_FILE_NO_PERMISSION = 10

    (** File: Already in use error. *)
    let _ERR_FILE_ALREADY_IN_USE = 11

    (** File: Can't open error. *)
    let _ERR_FILE_CANT_OPEN = 12

    (** File: Can't write error. *)
    let _ERR_FILE_CANT_WRITE = 13

    (** File: Can't read error. *)
    let _ERR_FILE_CANT_READ = 14

    (** File: Unrecognized error. *)
    let _ERR_FILE_UNRECOGNIZED = 15

    (** File: Corrupt error. *)
    let _ERR_FILE_CORRUPT = 16

    (** File: Missing dependencies error. *)
    let _ERR_FILE_MISSING_DEPENDENCIES = 17

    (** File: End of file (EOF) error. *)
    let _ERR_FILE_EOF = 18

    (** Can't open error. *)
    let _ERR_CANT_OPEN = 19

    (** Can't create error. *)
    let _ERR_CANT_CREATE = 20

    (** Query failed error. *)
    let _ERR_QUERY_FAILED = 21

    (** Already in use error. *)
    let _ERR_ALREADY_IN_USE = 22

    (** Locked error. *)
    let _ERR_LOCKED = 23

    (** Timeout error. *)
    let _ERR_TIMEOUT = 24

    (** Can't connect error. *)
    let _ERR_CANT_CONNECT = 25

    (** Can't resolve error. *)
    let _ERR_CANT_RESOLVE = 26

    (** Connection error. *)
    let _ERR_CONNECTION_ERROR = 27

    (** Can't acquire resource error. *)
    let _ERR_CANT_ACQUIRE_RESOURCE = 28

    (** Can't fork process error. *)
    let _ERR_CANT_FORK = 29

    (** Invalid data error. *)
    let _ERR_INVALID_DATA = 30

    (** Invalid parameter error. *)
    let _ERR_INVALID_PARAMETER = 31

    (** Already exists error. *)
    let _ERR_ALREADY_EXISTS = 32

    (** Does not exist error. *)
    let _ERR_DOES_NOT_EXIST = 33

    (** Database: Read error. *)
    let _ERR_DATABASE_CANT_READ = 34

    (** Database: Write error. *)
    let _ERR_DATABASE_CANT_WRITE = 35

    (** Compilation failed error. *)
    let _ERR_COMPILATION_FAILED = 36

    (** Method not found error. *)
    let _ERR_METHOD_NOT_FOUND = 37

    (** Linking failed error. *)
    let _ERR_LINK_FAILED = 38

    (** Script failed error. *)
    let _ERR_SCRIPT_FAILED = 39

    (** Cycling link (import cycle) error. *)
    let _ERR_CYCLIC_LINK = 40

    (** Invalid declaration error. *)
    let _ERR_INVALID_DECLARATION = 41

    (** Duplicate symbol error. *)
    let _ERR_DUPLICATE_SYMBOL = 42

    (** Parse error. *)
    let _ERR_PARSE_ERROR = 43

    (** Busy error. *)
    let _ERR_BUSY = 44

    (** Skip error. *)
    let _ERR_SKIP = 45

    (** Help error. Used internally when passing [code]--version[/code] or [code]--help[/code] as executable options. *)
    let _ERR_HELP = 46

    (** Bug error, caused by an implementation issue in the method.
[b]Note:[/b] If a built-in method returns this code, please open an issue on [url=https://github.com/godotengine/godot/issues]the GitHub Issue Tracker[/url]. *)
    let _ERR_BUG = 47

    (** Printer on fire error (This is an easter egg, no built-in methods return this error code). *)
    let _ERR_PRINTER_ON_FIRE = 48
  end

  module PropertyHint = struct
    let is_bitfield = false

    type t = int

    (** The property has no hint for the editor. *)
    let _PROPERTY_HINT_NONE = 0

    (** Hints that an [int] or [float] property should be within a range specified via the hint string [code]""min,max""[/code] or [code]""min,max,step""[/code]. The hint string can optionally include [code]""or_greater""[/code] and/or [code]""or_less""[/code] to allow manual input going respectively above the max or below the min values.
[b]Example:[/b] [code]""-360,360,1,or_greater,or_less""[/code].
Additionally, other keywords can be included: [code]""exp""[/code] for exponential range editing, [code]""radians_as_degrees""[/code] for editing radian angles in degrees (the range values are also in degrees), [code]""degrees""[/code] to hint at an angle and [code]""hide_slider""[/code] to hide the slider. *)
    let _PROPERTY_HINT_RANGE = 1

    (** Hints that an [int] or [String] property is an enumerated value to pick in a list specified via a hint string.
The hint string is a comma separated list of names such as [code]""Hello,Something,Else""[/code]. Whitespaces are [b]not[/b] removed from either end of a name. For integer properties, the first name in the list has value 0, the next 1, and so on. Explicit values can also be specified by appending [code]:integer[/code] to the name, e.g. [code]""Zero,One,Three:3,Four,Six:6""[/code]. *)
    let _PROPERTY_HINT_ENUM = 2

    (** Hints that a [String] property can be an enumerated value to pick in a list specified via a hint string such as [code]""Hello,Something,Else""[/code].
Unlike [constant PROPERTY_HINT_ENUM], a property with this hint still accepts arbitrary values and can be empty. The list of values serves to suggest possible values. *)
    let _PROPERTY_HINT_ENUM_SUGGESTION = 3

    (** Hints that a [float] property should be edited via an exponential easing function. The hint string can include [code]""attenuation""[/code] to flip the curve horizontally and/or [code]""positive_only""[/code] to exclude in/out easing and limit values to be greater than or equal to zero. *)
    let _PROPERTY_HINT_EXP_EASING = 4

    (** Hints that a vector property should allow its components to be linked. For example, this allows [member Vector2.x] and [member Vector2.y] to be edited together. *)
    let _PROPERTY_HINT_LINK = 5

    (** Hints that an [int] property is a bitmask with named bit flags.
The hint string is a comma separated list of names such as [code]""Bit0,Bit1,Bit2,Bit3""[/code]. Whitespaces are [b]not[/b] removed from either end of a name. The first name in the list has value 1, the next 2, then 4, 8, 16 and so on. Explicit values can also be specified by appending [code]:integer[/code] to the name, e.g. [code]""A:4,B:8,C:16""[/code]. You can also combine several flags ([code]""A:4,B:8,AB:12,C:16""[/code]).
[b]Note:[/b] A flag value must be at least [code]1[/code] and at most [code]2  *  *  32 - 1[/code].
[b]Note:[/b] Unlike [constant PROPERTY_HINT_ENUM], the previous explicit value is not taken into account. For the hint [code]""A:16,B,C""[/code], A is 16, B is 2, C is 4. *)
    let _PROPERTY_HINT_FLAGS = 6

    (** Hints that an [int] property is a bitmask using the optionally named 2D render layers. *)
    let _PROPERTY_HINT_LAYERS_2D_RENDER = 7

    (** Hints that an [int] property is a bitmask using the optionally named 2D physics layers. *)
    let _PROPERTY_HINT_LAYERS_2D_PHYSICS = 8

    (** Hints that an [int] property is a bitmask using the optionally named 2D navigation layers. *)
    let _PROPERTY_HINT_LAYERS_2D_NAVIGATION = 9

    (** Hints that an [int] property is a bitmask using the optionally named 3D render layers. *)
    let _PROPERTY_HINT_LAYERS_3D_RENDER = 10

    (** Hints that an [int] property is a bitmask using the optionally named 3D physics layers. *)
    let _PROPERTY_HINT_LAYERS_3D_PHYSICS = 11

    (** Hints that an [int] property is a bitmask using the optionally named 3D navigation layers. *)
    let _PROPERTY_HINT_LAYERS_3D_NAVIGATION = 12

    (** Hints that an integer property is a bitmask using the optionally named avoidance layers. *)
    let _PROPERTY_HINT_LAYERS_AVOIDANCE = 37

    (** Hints that a [String] property is a path to a file. Editing it will show a file dialog for picking the path. The hint string can be a set of filters with wildcards like [code]"" * .png, * .jpg""[/code]. *)
    let _PROPERTY_HINT_FILE = 13

    (** Hints that a [String] property is a path to a directory. Editing it will show a file dialog for picking the path. *)
    let _PROPERTY_HINT_DIR = 14

    (** Hints that a [String] property is an absolute path to a file outside the project folder. Editing it will show a file dialog for picking the path. The hint string can be a set of filters with wildcards, like [code]"" * .png, * .jpg""[/code]. *)
    let _PROPERTY_HINT_GLOBAL_FILE = 15

    (** Hints that a [String] property is an absolute path to a directory outside the project folder. Editing it will show a file dialog for picking the path. *)
    let _PROPERTY_HINT_GLOBAL_DIR = 16

    (** Hints that a property is an instance of a [Resource]-derived type, optionally specified via the hint string (e.g. [code]""Texture2D""[/code]). Editing it will show a popup menu of valid resource types to instantiate. *)
    let _PROPERTY_HINT_RESOURCE_TYPE = 17

    (** Hints that a [String] property is text with line breaks. Editing it will show a text input field where line breaks can be typed. *)
    let _PROPERTY_HINT_MULTILINE_TEXT = 18

    (** Hints that a [String] property is an [Expression]. *)
    let _PROPERTY_HINT_EXPRESSION = 19

    (** Hints that a [String] property should show a placeholder text on its input field, if empty. The hint string is the placeholder text to use. *)
    let _PROPERTY_HINT_PLACEHOLDER_TEXT = 20

    (** Hints that a [Color] property should be edited without affecting its transparency ([member Color.a] is not editable). *)
    let _PROPERTY_HINT_COLOR_NO_ALPHA = 21

    (** Hints that the property's value is an object encoded as object ID, with its type specified in the hint string. Used by the debugger. *)
    let _PROPERTY_HINT_OBJECT_ID = 22

    (** If a property is [String], hints that the property represents a particular type (class). This allows to select a type from the create dialog. The property will store the selected type as a string.
If a property is [Array], hints the editor how to show elements. The [code]hint_string[/code] must encode nested types using [code]"":""[/code] and [code]""/""[/code].
[codeblocks]
[gdscript]
# Array of elem_type.
hint_string = ""%d:"" % [elem_type]
hint_string = ""%d/%d:%s"" % [elem_type, elem_hint, elem_hint_string]
# Two-dimensional array of elem_type (array of arrays of elem_type).
hint_string = ""%d:%d:"" % [TYPE_ARRAY, elem_type]
hint_string = ""%d:%d/%d:%s"" % [TYPE_ARRAY, elem_type, elem_hint, elem_hint_string]
# Three-dimensional array of elem_type (array of arrays of arrays of elem_type).
hint_string = ""%d:%d:%d:"" % [TYPE_ARRAY, TYPE_ARRAY, elem_type]
hint_string = ""%d:%d:%d/%d:%s"" % [TYPE_ARRAY, TYPE_ARRAY, elem_type, elem_hint, elem_hint_string]
[/gdscript]
[csharp]
// Array of elemType.
hintString = $""{elemType:D}:"";
hintString = $""{elemType:}/{elemHint:D}:{elemHintString}"";
// Two-dimensional array of elemType (array of arrays of elemType).
hintString = $""{Variant.Type.Array:D}:{elemType:D}:"";
hintString = $""{Variant.Type.Array:D}:{elemType:D}/{elemHint:D}:{elemHintString}"";
// Three-dimensional array of elemType (array of arrays of arrays of elemType).
hintString = $""{Variant.Type.Array:D}:{Variant.Type.Array:D}:{elemType:D}:"";
hintString = $""{Variant.Type.Array:D}:{Variant.Type.Array:D}:{elemType:D}/{elemHint:D}:{elemHintString}"";
[/csharp]
[/codeblocks]
Examples:
[codeblocks]
[gdscript]
hint_string = ""%d:"" % [TYPE_INT] # Array of integers.
hint_string = ""%d/%d:1,10,1"" % [TYPE_INT, PROPERTY_HINT_RANGE] # Array of integers (in range from 1 to 10).
hint_string = ""%d/%d:Zero,One,Two"" % [TYPE_INT, PROPERTY_HINT_ENUM] # Array of integers (an enum).
hint_string = ""%d/%d:Zero,One,Three:3,Six:6"" % [TYPE_INT, PROPERTY_HINT_ENUM] # Array of integers (an enum).
hint_string = ""%d/%d: * .png"" % [TYPE_STRING, PROPERTY_HINT_FILE] # Array of strings (file paths).
hint_string = ""%d/%d:Texture2D"" % [TYPE_OBJECT, PROPERTY_HINT_RESOURCE_TYPE] # Array of textures.

hint_string = ""%d:%d:"" % [TYPE_ARRAY, TYPE_FLOAT] # Two-dimensional array of floats.
hint_string = ""%d:%d/%d:"" % [TYPE_ARRAY, TYPE_STRING, PROPERTY_HINT_MULTILINE_TEXT] # Two-dimensional array of multiline strings.
hint_string = ""%d:%d/%d:-1,1,0.1"" % [TYPE_ARRAY, TYPE_FLOAT, PROPERTY_HINT_RANGE] # Two-dimensional array of floats (in range from -1 to 1).
hint_string = ""%d:%d/%d:Texture2D"" % [TYPE_ARRAY, TYPE_OBJECT, PROPERTY_HINT_RESOURCE_TYPE] # Two-dimensional array of textures.
[/gdscript]
[csharp]
hintString = $""{Variant.Type.Int:D}/{PropertyHint.Range:D}:1,10,1""; // Array of integers (in range from 1 to 10).
hintString = $""{Variant.Type.Int:D}/{PropertyHint.Enum:D}:Zero,One,Two""; // Array of integers (an enum).
hintString = $""{Variant.Type.Int:D}/{PropertyHint.Enum:D}:Zero,One,Three:3,Six:6""; // Array of integers (an enum).
hintString = $""{Variant.Type.String:D}/{PropertyHint.File:D}: * .png""; // Array of strings (file paths).
hintString = $""{Variant.Type.Object:D}/{PropertyHint.ResourceType:D}:Texture2D""; // Array of textures.

hintString = $""{Variant.Type.Array:D}:{Variant.Type.Float:D}:""; // Two-dimensional array of floats.
hintString = $""{Variant.Type.Array:D}:{Variant.Type.String:D}/{PropertyHint.MultilineText:D}:""; // Two-dimensional array of multiline strings.
hintString = $""{Variant.Type.Array:D}:{Variant.Type.Float:D}/{PropertyHint.Range:D}:-1,1,0.1""; // Two-dimensional array of floats (in range from -1 to 1).
hintString = $""{Variant.Type.Array:D}:{Variant.Type.Object:D}/{PropertyHint.ResourceType:D}:Texture2D""; // Two-dimensional array of textures.
[/csharp]
[/codeblocks]
[b]Note:[/b] The trailing colon is required for properly detecting built-in types. *)
    let _PROPERTY_HINT_TYPE_STRING = 23

    (** [i]Deprecated.[/i] This hint is not used anywhere and will be removed in the future. *)
    let _PROPERTY_HINT_NODE_PATH_TO_EDITED_NODE = 24

    (** Hints that an object is too big to be sent via the debugger. *)
    let _PROPERTY_HINT_OBJECT_TOO_BIG = 25

    (** Hints that the hint string specifies valid node types for property of type [NodePath]. *)
    let _PROPERTY_HINT_NODE_PATH_VALID_TYPES = 26

    (** Hints that a [String] property is a path to a file. Editing it will show a file dialog for picking the path for the file to be saved at. The dialog has access to the project's directory. The hint string can be a set of filters with wildcards like [code]"" * .png, * .jpg""[/code]. See also [member FileDialog.filters]. *)
    let _PROPERTY_HINT_SAVE_FILE = 27

    (** Hints that a [String] property is a path to a file. Editing it will show a file dialog for picking the path for the file to be saved at. The dialog has access to the entire filesystem. The hint string can be a set of filters with wildcards like [code]"" * .png, * .jpg""[/code]. See also [member FileDialog.filters]. *)
    let _PROPERTY_HINT_GLOBAL_SAVE_FILE = 28

    (** Hints that an [int] property is an object ID.
[i]Deprecated.[/i] This hint is not used anywhere and will be removed in the future. *)
    let _PROPERTY_HINT_INT_IS_OBJECTID = 29

    (** Hints that an [int] property is a pointer. Used by GDExtension. *)
    let _PROPERTY_HINT_INT_IS_POINTER = 30

    (** Hints that a property is an [Array] with the stored type specified in the hint string. *)
    let _PROPERTY_HINT_ARRAY_TYPE = 31

    (** Hints that a string property is a locale code. Editing it will show a locale dialog for picking language and country. *)
    let _PROPERTY_HINT_LOCALE_ID = 32

    (** Hints that a dictionary property is string translation map. Dictionary keys are locale codes and, values are translated strings. *)
    let _PROPERTY_HINT_LOCALIZABLE_STRING = 33

    (** Hints that a property is an instance of a [Node]-derived type, optionally specified via the hint string (e.g. [code]""Node2D""[/code]). Editing it will show a dialog for picking a node from the scene. *)
    let _PROPERTY_HINT_NODE_TYPE = 34

    (** Hints that a quaternion property should disable the temporary euler editor. *)
    let _PROPERTY_HINT_HIDE_QUATERNION_EDIT = 35

    (** Hints that a string property is a password, and every character is replaced with the secret character. *)
    let _PROPERTY_HINT_PASSWORD = 36

    (** Represents the size of the [enum PropertyHint] enum. *)
    let _PROPERTY_HINT_MAX = 38
  end

  module PropertyUsageFlags = struct
    let is_bitfield = true

    type t = int

    (** The property is not stored, and does not display in the editor. This is the default for non-exported properties. *)
    let _PROPERTY_USAGE_NONE = 0

    (** The property is serialized and saved in the scene file (default). *)
    let _PROPERTY_USAGE_STORAGE = 2

    (** The property is shown in the [EditorInspector] (default). *)
    let _PROPERTY_USAGE_EDITOR = 4

    (** The property is excluded from the class reference. *)
    let _PROPERTY_USAGE_INTERNAL = 8

    (** The property can be checked in the [EditorInspector]. *)
    let _PROPERTY_USAGE_CHECKABLE = 16

    (** The property is checked in the [EditorInspector]. *)
    let _PROPERTY_USAGE_CHECKED = 32

    (** Used to group properties together in the editor. See [EditorInspector]. *)
    let _PROPERTY_USAGE_GROUP = 64

    (** Used to categorize properties together in the editor. *)
    let _PROPERTY_USAGE_CATEGORY = 128

    (** Used to group properties together in the editor in a subgroup (under a group). See [EditorInspector]. *)
    let _PROPERTY_USAGE_SUBGROUP = 256

    (** The property is a bitfield, i.e. it contains multiple flags represented as bits. *)
    let _PROPERTY_USAGE_CLASS_IS_BITFIELD = 512

    (** The property does not save its state in [PackedScene]. *)
    let _PROPERTY_USAGE_NO_INSTANCE_STATE = 1024

    (** Editing the property prompts the user for restarting the editor. *)
    let _PROPERTY_USAGE_RESTART_IF_CHANGED = 2048

    (** The property is a script variable which should be serialized and saved in the scene file. *)
    let _PROPERTY_USAGE_SCRIPT_VARIABLE = 4096

    (** The property value of type [Object] will be stored even if its value is [code]null[/code]. *)
    let _PROPERTY_USAGE_STORE_IF_NULL = 8192

    (** If this property is modified, all inspector fields will be refreshed. *)
    let _PROPERTY_USAGE_UPDATE_ALL_IF_MODIFIED = 16384

    (** Signifies a default value from a placeholder script instance.
[i]Deprecated.[/i] This hint is not used anywhere and will be removed in the future. *)
    let _PROPERTY_USAGE_SCRIPT_DEFAULT_VALUE = 32768

    (** The property is an enum, i.e. it only takes named integer constants from its associated enumeration. *)
    let _PROPERTY_USAGE_CLASS_IS_ENUM = 65536

    (** If property has [code]nil[/code] as default value, its type will be [Variant]. *)
    let _PROPERTY_USAGE_NIL_IS_VARIANT = 131072

    (** The property is an array. *)
    let _PROPERTY_USAGE_ARRAY = 262144

    (** When duplicating a resource with [method Resource.duplicate], and this flag is set on a property of that resource, the property should always be duplicated, regardless of the [code]subresources[/code] bool parameter. *)
    let _PROPERTY_USAGE_ALWAYS_DUPLICATE = 524288

    (** When duplicating a resource with [method Resource.duplicate], and this flag is set on a property of that resource, the property should never be duplicated, regardless of the [code]subresources[/code] bool parameter. *)
    let _PROPERTY_USAGE_NEVER_DUPLICATE = 1048576

    (** The property is only shown in the editor if modern renderers are supported (the Compatibility rendering method is excluded). *)
    let _PROPERTY_USAGE_HIGH_END_GFX = 2097152

    (** The [NodePath] property will always be relative to the scene's root. Mostly useful for local resources. *)
    let _PROPERTY_USAGE_NODE_PATH_FROM_SCENE_ROOT = 4194304

    (** Use when a resource is created on the fly, i.e. the getter will always return a different instance. [ResourceSaver] needs this information to properly save such resources. *)
    let _PROPERTY_USAGE_RESOURCE_NOT_PERSISTENT = 8388608

    (** Inserting an animation key frame of this property will automatically increment the value, allowing to easily keyframe multiple values in a row. *)
    let _PROPERTY_USAGE_KEYING_INCREMENTS = 16777216

    (** When loading, the resource for this property can be set at the end of loading.
[i]Deprecated.[/i] This hint is not used anywhere and will be removed in the future. *)
    let _PROPERTY_USAGE_DEFERRED_SET_RESOURCE = 33554432

    (** When this property is a [Resource] and base object is a [Node], a resource instance will be automatically created whenever the node is created in the editor. *)
    let _PROPERTY_USAGE_EDITOR_INSTANTIATE_OBJECT = 67108864

    (** The property is considered a basic setting and will appear even when advanced mode is disabled. Used for project settings. *)
    let _PROPERTY_USAGE_EDITOR_BASIC_SETTING = 134217728

    (** The property is read-only in the [EditorInspector]. *)
    let _PROPERTY_USAGE_READ_ONLY = 268435456

    (** An export preset property with this flag contains confidential information and is stored separately from the rest of the export preset configuration. *)
    let _PROPERTY_USAGE_SECRET = 536870912

    (** Default usage (storage and editor). *)
    let _PROPERTY_USAGE_DEFAULT = 6

    (** Default usage but without showing the property in the editor (storage). *)
    let _PROPERTY_USAGE_NO_EDITOR = 2
  end

  module MethodFlags = struct
    let is_bitfield = true

    type t = int

    (** Flag for a normal method. *)
    let _METHOD_FLAG_NORMAL = 1

    (** Flag for an editor method. *)
    let _METHOD_FLAG_EDITOR = 2

    (** Flag for a constant method. *)
    let _METHOD_FLAG_CONST = 4

    (** Flag for a virtual method. *)
    let _METHOD_FLAG_VIRTUAL = 8

    (** Flag for a method with a variable number of arguments. *)
    let _METHOD_FLAG_VARARG = 16

    (** Flag for a static method. *)
    let _METHOD_FLAG_STATIC = 32

    (** Used internally. Allows to not dump core virtual methods (such as [method Object._notification]) to the JSON API. *)
    let _METHOD_FLAG_OBJECT_CORE = 64

    (** Default method flags (normal). *)
    let _METHOD_FLAGS_DEFAULT = 1
  end

  module VariantType = struct
    let is_bitfield = false

    type t = int

    (** Variable is [code]null[/code]. *)
    let _TYPE_NIL = 0

    (** Variable is of type [bool]. *)
    let _TYPE_BOOL = 1

    (** Variable is of type [int]. *)
    let _TYPE_INT = 2

    (** Variable is of type [float]. *)
    let _TYPE_FLOAT = 3

    (** Variable is of type [String]. *)
    let _TYPE_STRING = 4

    (** Variable is of type [Vector2]. *)
    let _TYPE_VECTOR2 = 5

    (** Variable is of type [Vector2i]. *)
    let _TYPE_VECTOR2I = 6

    (** Variable is of type [Rect2]. *)
    let _TYPE_RECT2 = 7

    (** Variable is of type [Rect2i]. *)
    let _TYPE_RECT2I = 8

    (** Variable is of type [Vector3]. *)
    let _TYPE_VECTOR3 = 9

    (** Variable is of type [Vector3i]. *)
    let _TYPE_VECTOR3I = 10

    (** Variable is of type [Transform2D]. *)
    let _TYPE_TRANSFORM2D = 11

    (** Variable is of type [Vector4]. *)
    let _TYPE_VECTOR4 = 12

    (** Variable is of type [Vector4i]. *)
    let _TYPE_VECTOR4I = 13

    (** Variable is of type [Plane]. *)
    let _TYPE_PLANE = 14

    (** Variable is of type [Quaternion]. *)
    let _TYPE_QUATERNION = 15

    (** Variable is of type [AABB]. *)
    let _TYPE_AABB = 16

    (** Variable is of type [Basis]. *)
    let _TYPE_BASIS = 17

    (** Variable is of type [Transform3D]. *)
    let _TYPE_TRANSFORM3D = 18

    (** Variable is of type [Projection]. *)
    let _TYPE_PROJECTION = 19

    (** Variable is of type [Color]. *)
    let _TYPE_COLOR = 20

    (** Variable is of type [StringName]. *)
    let _TYPE_STRING_NAME = 21

    (** Variable is of type [NodePath]. *)
    let _TYPE_NODE_PATH = 22

    (** Variable is of type [RID]. *)
    let _TYPE_RID = 23

    (** Variable is of type [Object]. *)
    let _TYPE_OBJECT = 24

    (** Variable is of type [Callable]. *)
    let _TYPE_CALLABLE = 25

    (** Variable is of type [Signal]. *)
    let _TYPE_SIGNAL = 26

    (** Variable is of type [Dictionary]. *)
    let _TYPE_DICTIONARY = 27

    (** Variable is of type [Array]. *)
    let _TYPE_ARRAY = 28

    (** Variable is of type [PackedByteArray]. *)
    let _TYPE_PACKED_BYTE_ARRAY = 29

    (** Variable is of type [PackedInt32Array]. *)
    let _TYPE_PACKED_INT32_ARRAY = 30

    (** Variable is of type [PackedInt64Array]. *)
    let _TYPE_PACKED_INT64_ARRAY = 31

    (** Variable is of type [PackedFloat32Array]. *)
    let _TYPE_PACKED_FLOAT32_ARRAY = 32

    (** Variable is of type [PackedFloat64Array]. *)
    let _TYPE_PACKED_FLOAT64_ARRAY = 33

    (** Variable is of type [PackedStringArray]. *)
    let _TYPE_PACKED_STRING_ARRAY = 34

    (** Variable is of type [PackedVector2Array]. *)
    let _TYPE_PACKED_VECTOR2_ARRAY = 35

    (** Variable is of type [PackedVector3Array]. *)
    let _TYPE_PACKED_VECTOR3_ARRAY = 36

    (** Variable is of type [PackedColorArray]. *)
    let _TYPE_PACKED_COLOR_ARRAY = 37

    (** Represents the size of the [enum Variant.Type] enum. *)
    let _TYPE_MAX = 38
  end

  module VariantOperator = struct
    let is_bitfield = false

    type t = int

    (** Equality operator ([code]==[/code]). *)
    let _OP_EQUAL = 0

    (** Inequality operator ([code]!=[/code]). *)
    let _OP_NOT_EQUAL = 1

    (** Less than operator ([code]<[/code]). *)
    let _OP_LESS = 2

    (** Less than or equal operator ([code]<=[/code]). *)
    let _OP_LESS_EQUAL = 3

    (** Greater than operator ([code]>[/code]). *)
    let _OP_GREATER = 4

    (** Greater than or equal operator ([code]>=[/code]). *)
    let _OP_GREATER_EQUAL = 5

    (** Addition operator ([code]+[/code]). *)
    let _OP_ADD = 6

    (** Subtraction operator ([code]-[/code]). *)
    let _OP_SUBTRACT = 7

    (** Multiplication operator ([code] * [/code]). *)
    let _OP_MULTIPLY = 8

    (** Division operator ([code]/[/code]). *)
    let _OP_DIVIDE = 9

    (** Unary negation operator ([code]-[/code]). *)
    let _OP_NEGATE = 10

    (** Unary plus operator ([code]+[/code]). *)
    let _OP_POSITIVE = 11

    (** Remainder/modulo operator ([code]%[/code]). *)
    let _OP_MODULE = 12

    (** Power operator ([code] *  * [/code]). *)
    let _OP_POWER = 13

    (** Left shift operator ([code]<<[/code]). *)
    let _OP_SHIFT_LEFT = 14

    (** Right shift operator ([code]>>[/code]). *)
    let _OP_SHIFT_RIGHT = 15

    (** Bitwise AND operator ([code]&[/code]). *)
    let _OP_BIT_AND = 16

    (** Bitwise OR operator ([code]|[/code]). *)
    let _OP_BIT_OR = 17

    (** Bitwise XOR operator ([code]^[/code]). *)
    let _OP_BIT_XOR = 18

    (** Bitwise NOT operator ([code]~[/code]). *)
    let _OP_BIT_NEGATE = 19

    (** Logical AND operator ([code]and[/code] or [code]&&[/code]). *)
    let _OP_AND = 20

    (** Logical OR operator ([code]or[/code] or [code]||[/code]). *)
    let _OP_OR = 21

    (** Logical XOR operator (not implemented in GDScript). *)
    let _OP_XOR = 22

    (** Logical NOT operator ([code]not[/code] or [code]![/code]). *)
    let _OP_NOT = 23

    (** Logical IN operator ([code]in[/code]). *)
    let _OP_IN = 24

    (** Represents the size of the [enum Variant.Operator] enum. *)
    let _OP_MAX = 25
  end
end

module BuiltinClassSize = struct
  module Float_32 = struct
    let _Nil = 0
    let bool = 1
    let int = 8
    let float = 8
    let _String = 4
    let _Vector2 = 8
    let _Vector2i = 8
    let _Rect2 = 16
    let _Rect2i = 16
    let _Vector3 = 12
    let _Vector3i = 12
    let _Transform2D = 24
    let _Vector4 = 16
    let _Vector4i = 16
    let _Plane = 16
    let _Quaternion = 16
    let _AABB = 24
    let _Basis = 36
    let _Transform3D = 48
    let _Projection = 64
    let _Color = 16
    let _StringName = 4
    let _NodePath = 4
    let _RID = 8
    let _Object = 4
    let _Callable = 16
    let _Signal = 16
    let _Dictionary = 4
    let _Array = 4
    let _PackedByteArray = 8
    let _PackedInt32Array = 8
    let _PackedInt64Array = 8
    let _PackedFloat32Array = 8
    let _PackedFloat64Array = 8
    let _PackedStringArray = 8
    let _PackedVector2Array = 8
    let _PackedVector3Array = 8
    let _PackedColorArray = 8
    let _Variant = 24
  end

  module Float_64 = struct
    let _Nil = 0
    let bool = 1
    let int = 8
    let float = 8
    let _String = 8
    let _Vector2 = 8
    let _Vector2i = 8
    let _Rect2 = 16
    let _Rect2i = 16
    let _Vector3 = 12
    let _Vector3i = 12
    let _Transform2D = 24
    let _Vector4 = 16
    let _Vector4i = 16
    let _Plane = 16
    let _Quaternion = 16
    let _AABB = 24
    let _Basis = 36
    let _Transform3D = 48
    let _Projection = 64
    let _Color = 16
    let _StringName = 8
    let _NodePath = 8
    let _RID = 8
    let _Object = 8
    let _Callable = 16
    let _Signal = 16
    let _Dictionary = 8
    let _Array = 8
    let _PackedByteArray = 16
    let _PackedInt32Array = 16
    let _PackedInt64Array = 16
    let _PackedFloat32Array = 16
    let _PackedFloat64Array = 16
    let _PackedStringArray = 16
    let _PackedVector2Array = 16
    let _PackedVector3Array = 16
    let _PackedColorArray = 16
    let _Variant = 24
  end

  module Double_32 = struct
    let _Nil = 0
    let bool = 1
    let int = 8
    let float = 8
    let _String = 4
    let _Vector2 = 16
    let _Vector2i = 8
    let _Rect2 = 32
    let _Rect2i = 16
    let _Vector3 = 24
    let _Vector3i = 12
    let _Transform2D = 48
    let _Vector4 = 32
    let _Vector4i = 16
    let _Plane = 32
    let _Quaternion = 32
    let _AABB = 48
    let _Basis = 72
    let _Transform3D = 96
    let _Projection = 128
    let _Color = 16
    let _StringName = 4
    let _NodePath = 4
    let _RID = 8
    let _Object = 4
    let _Callable = 16
    let _Signal = 16
    let _Dictionary = 4
    let _Array = 4
    let _PackedByteArray = 8
    let _PackedInt32Array = 8
    let _PackedInt64Array = 8
    let _PackedFloat32Array = 8
    let _PackedFloat64Array = 8
    let _PackedStringArray = 8
    let _PackedVector2Array = 8
    let _PackedVector3Array = 8
    let _PackedColorArray = 8
    let _Variant = 40
  end

  module Double_64 = struct
    let _Nil = 0
    let bool = 1
    let int = 8
    let float = 8
    let _String = 8
    let _Vector2 = 16
    let _Vector2i = 8
    let _Rect2 = 32
    let _Rect2i = 16
    let _Vector3 = 24
    let _Vector3i = 12
    let _Transform2D = 48
    let _Vector4 = 32
    let _Vector4i = 16
    let _Plane = 32
    let _Quaternion = 32
    let _AABB = 48
    let _Basis = 72
    let _Transform3D = 96
    let _Projection = 128
    let _Color = 16
    let _StringName = 8
    let _NodePath = 8
    let _RID = 8
    let _Object = 8
    let _Callable = 16
    let _Signal = 16
    let _Dictionary = 8
    let _Array = 8
    let _PackedByteArray = 16
    let _PackedInt32Array = 16
    let _PackedInt64Array = 16
    let _PackedFloat32Array = 16
    let _PackedFloat64Array = 16
    let _PackedStringArray = 16
    let _PackedVector2Array = 16
    let _PackedVector3Array = 16
    let _PackedColorArray = 16
    let _Variant = 40
  end
end
