use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GDK::Raw::Definitions:ver<4>;
use WebKit::Raw::Definitions:ver<4>;

unit package WebKit::Raw::Context::Menu;

### /usr/include/webkitgtk-6.0/webkit/WebKitContextMenu.h

sub webkit_context_menu_append (
  WebKitContextMenu     $menu,
  WebKitContextMenuItem $item
)
  is      native(webkit)
  is      export
{ * }

sub webkit_context_menu_first (WebKitContextMenu $menu)
  returns WebKitContextMenuItem
  is      native(webkit)
  is      export
{ * }

sub webkit_context_menu_get_event (WebKitContextMenu $menu)
  returns GdkEvent
  is      native(webkit)
  is      export
{ * }

sub webkit_context_menu_get_item_at_position (
  WebKitContextMenu $menu,
  guint             $position
)
  returns WebKitContextMenuItem
  is      native(webkit)
  is      export
{ * }

sub webkit_context_menu_get_items (WebKitContextMenu $menu)
  returns GList
  is      native(webkit)
  is      export
{ * }

sub webkit_context_menu_get_n_items (WebKitContextMenu $menu)
  returns guint
  is      native(webkit)
  is      export
{ * }

sub webkit_context_menu_get_user_data (WebKitContextMenu $menu)
  returns GVariant
  is      native(webkit)
  is      export
{ * }

sub webkit_context_menu_insert (
  WebKitContextMenu     $menu,
  WebKitContextMenuItem $item,
  gint                  $position
)
  is      native(webkit)
  is      export
{ * }

sub webkit_context_menu_last (WebKitContextMenu $menu)
  returns WebKitContextMenuItem
  is      native(webkit)
  is      export
{ * }

sub webkit_context_menu_move_item (
  WebKitContextMenu     $menu,
  WebKitContextMenuItem $item,
  gint                  $position
)
  is      native(webkit)
  is      export
{ * }

sub webkit_context_menu_new
  returns WebKitContextMenu
  is      native(webkit)
  is      export
{ * }

sub webkit_context_menu_new_with_items (GList $items)
  returns WebKitContextMenu
  is      native(webkit)
  is      export
{ * }

sub webkit_context_menu_prepend (
  WebKitContextMenu     $menu,
  WebKitContextMenuItem $item
)
  is      native(webkit)
  is      export
{ * }

sub webkit_context_menu_remove (
  WebKitContextMenu     $menu,
  WebKitContextMenuItem $item
)
  is      native(webkit)
  is      export
{ * }

sub webkit_context_menu_remove_all (WebKitContextMenu $menu)
  is      native(webkit)
  is      export
{ * }

sub webkit_context_menu_set_user_data (
  WebKitContextMenu $menu,
  GVariant          $user_data
)
  is      native(webkit)
  is      export
{ * }
