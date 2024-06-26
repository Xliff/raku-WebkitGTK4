use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use WebKit::Raw::Definitions;

# BETCH!
unit package WebKit::Raw::HitTestResult;

### /usr/include/webkitgtk-6.0/webkit/WebKitHitTestResult.h

sub webkit_hit_test_result_context_is_editable (
  WebKitHitTestResult $hit_test_result
)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_hit_test_result_context_is_image (
  WebKitHitTestResult $hit_test_result
)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_hit_test_result_context_is_link (
  WebKitHitTestResult $hit_test_result
)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_hit_test_result_context_is_media (
  WebKitHitTestResult $hit_test_result
)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_hit_test_result_context_is_scrollbar (
  WebKitHitTestResult $hit_test_result
)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_hit_test_result_context_is_selection (
  WebKitHitTestResult $hit_test_result
)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_hit_test_result_get_context (
  WebKitHitTestResult $hit_test_result
)
  returns guint
  is      native(webkit)
  is      export
{ * }

sub webkit_hit_test_result_get_image_uri (
  WebKitHitTestResult $hit_test_result
)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_hit_test_result_get_link_label (
  WebKitHitTestResult $hit_test_result
)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_hit_test_result_get_link_title (
  WebKitHitTestResult $hit_test_result
)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_hit_test_result_get_link_uri (
  WebKitHitTestResult $hit_test_result
)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_hit_test_result_get_media_uri (
  WebKitHitTestResult $hit_test_result
)
  returns Str
  is      native(webkit)
  is      export
{ * }
