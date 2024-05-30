use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GIO::Raw::Definitions;
use WebKit::Raw::Definitions;
use WebKit::Raw::Enums;

unit package WebKit::Raw::Context::Menu::Item;

### /usr/include/webkitgtk-6.0/webkit/WebKitContextMenuItem.h

sub webkit_context_menu_item_get_gaction (WebKitContextMenuItem $item)
  returns GAction
  is      native(webkit)
  is      export
{ * }

sub webkit_context_menu_item_get_stock_action (WebKitContextMenuItem $item)
  returns WebKitContextMenuAction
  is      native(webkit)
  is      export
{ * }

sub webkit_context_menu_item_get_submenu (WebKitContextMenuItem $item)
  returns WebKitContextMenu
  is      native(webkit)
  is      export
{ * }

sub webkit_context_menu_item_is_separator (WebKitContextMenuItem $item)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_context_menu_item_new_from_gaction (
  GAction  $action,
  Str      $label,
  GVariant $target
)
  returns WebKitContextMenuItem
  is      native(webkit)
  is      export
{ * }

sub webkit_context_menu_item_new_from_stock_action (
  WebKitContextMenuAction $action
)
  returns WebKitContextMenuItem
  is      native(webkit)
  is      export
{ * }

sub webkit_context_menu_item_new_from_stock_action_with_label (
  WebKitContextMenuAction $action,
  Str                     $label
)
  returns WebKitContextMenuItem
  is      native(webkit)
  is      export
{ * }

sub webkit_context_menu_item_new_separator
  returns WebKitContextMenuItem
  is      native(webkit)
  is      export
{ * }

sub webkit_context_menu_item_new_with_submenu (
  Str               $label,
  WebKitContextMenu $submenu
)
  returns WebKitContextMenuItem
  is      native(webkit)
  is      export
{ * }

sub webkit_context_menu_item_set_submenu (
  WebKitContextMenuItem $item,
  WebKitContextMenu     $submenu
)
  is      native(webkit)
  is      export
{ * }
