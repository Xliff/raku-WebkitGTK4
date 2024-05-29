use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use WebKit::Raw::Definitions;

unit package WebKit::Raw::FindController;

### /usr/include/webkitgtk-6.0/webkit/WebKitFindController.h

sub webkit_find_controller_count_matches (
  WebKitFindController $find_controller,
  Str                  $search_text,
  guint32              $find_options,
  guint                $max_match_count
)
  is      native(webkit)
  is      export
{ * }

sub webkit_find_controller_get_max_match_count (
  WebKitFindController $find_controller
)
  returns guint
  is      native(webkit)
  is      export
{ * }

sub webkit_find_controller_get_options (WebKitFindController $find_controller)
  returns guint32
  is      native(webkit)
  is      export
{ * }

sub webkit_find_controller_get_search_text (
  WebKitFindController $find_controller
)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_find_controller_get_web_view (WebKitFindController $find_controller)
  returns WebKitWebView
  is      native(webkit)
  is      export
{ * }

sub webkit_find_controller_search (
  WebKitFindController $find_controller,
  Str                  $search_text,
  guint32              $find_options,
  guint                $max_match_count
)
  is      native(webkit)
  is      export
{ * }

sub webkit_find_controller_search_finish (
  WebKitFindController $find_controller
)
  is      native(webkit)
  is      export
{ * }

sub webkit_find_controller_search_next (WebKitFindController $find_controller)
  is      native(webkit)
  is      export
{ * }

sub webkit_find_controller_search_previous (
  WebKitFindController $find_controller
)
  is      native(webkit)
  is      export
{ * }
