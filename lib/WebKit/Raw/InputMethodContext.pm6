use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GDK::Raw::Structs:ver<4>;
use GDK::Raw::Definitions:ver<4>;
use WebKit::Raw::Definitions;
use WebKit::Raw::Enums;

unit package WebKit::Raw::InputMethodContext;

### /usr/include/webkitgtk-6.0/webkit/WebKitInputMethodContext.h

sub webkit_input_method_context_filter_key_event (
  WebKitInputMethodContext $context,
  GdkEvent                 $key_event
)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_input_method_context_get_input_hints (
  WebKitInputMethodContext $context
)
  returns WebKitInputHints
  is      native(webkit)
  is      export
{ * }

sub webkit_input_method_context_get_input_purpose (
  WebKitInputMethodContext $context
)
  returns WebKitInputPurpose
  is      native(webkit)
  is      export
{ * }

sub webkit_input_method_context_get_preedit (
  WebKitInputMethodContext $context,
  CArray[Str]              $text,
  CArray[Pointer[GList]]   $underlines,
  guint                    $cursor_offset is rw
)
  is      native(webkit)
  is      export
{ * }

sub webkit_input_method_context_notify_cursor_area (
  WebKitInputMethodContext $context,
  gint                     $x,
  gint                     $y,
  gint                     $width,
  gint                     $height
)
  is      native(webkit)
  is      export
{ * }

sub webkit_input_method_context_notify_focus_in (
  WebKitInputMethodContext $context
)
  is      native(webkit)
  is      export
{ * }

sub webkit_input_method_context_notify_focus_out (
  WebKitInputMethodContext $context
)
  is      native(webkit)
  is      export
{ * }

sub webkit_input_method_context_notify_surrounding (
  WebKitInputMethodContext $context,
  Str                      $text,
  gint                     $length,
  guint                    $cursor_index,
  guint                    $selection_index
)
  is      native(webkit)
  is      export
{ * }

sub webkit_input_method_context_reset (WebKitInputMethodContext $context)
  is      native(webkit)
  is      export
{ * }

sub webkit_input_method_context_set_enable_preedit (
  WebKitInputMethodContext $context,
  gboolean                 $enabled
)
  is      native(webkit)
  is      export
{ * }

sub webkit_input_method_context_set_input_hints (
  WebKitInputMethodContext $context,
  WebKitInputHints         $hints
)
  is      native(webkit)
  is      export
{ * }

sub webkit_input_method_context_set_input_purpose (
  WebKitInputMethodContext $context,
  WebKitInputPurpose       $purpose
)
  is      native(webkit)
  is      export
{ * }

sub webkit_input_method_underline_copy (WebKitInputMethodUnderline $underline)
  returns WebKitInputMethodUnderline
  is      native(webkit)
  is      export
{ * }

sub webkit_input_method_underline_free (WebKitInputMethodUnderline $underline)
  is      native(webkit)
  is      export
{ * }

sub webkit_input_method_underline_get_type
  returns GType
  is      native(webkit)
  is      export
{ * }

sub webkit_input_method_underline_new (
  guint $start_offset,
  guint $end_offset
)
  returns WebKitInputMethodUnderline
  is      native(webkit)
  is      export
{ * }

sub webkit_input_method_underline_set_color (
  WebKitInputMethodUnderline $underline,
  GdkRGBA                    $rgba
)
  is      native(webkit)
  is      export
{ * }
