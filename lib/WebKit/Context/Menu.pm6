use v6.c;

use Method::Also;

use WebKit::Raw::Types:ver<4>;
use WebKit::Raw::Context::Menu:ver<4>;

use GLib::GList;
use JSON::GLib::Variant;
use WebKit::Content::Menu::Item:ver<4>;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset WebKitContextMenuAncestry is export of Mu
  where WebKitContextMenu | GObject;

class WebKit::Context::Menu {
  also does Iterable;
  also does Positional;
  also does GLib::Roles::Object;

  has WebKitContextMenu $!wcm is implementor;

  submethod BUILD ( :$webkit-context-menu ) {
    self.setWebKitContextMenu($webkit-context-menu) if $webkit-context-menu
  }

  method setWebKitContextMenu (WebKitContextMenuAncestry $_) {
    my $to-parent;

    $!wcm = do {
      when WebKitContextMenu {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WebKitContextMenu, $_);
      }
    }
    self!setObject($to-parent);
  }

  method WebKit::Raw::Definitions::WebKitContextMenu
    is also<WebKitContextMenu>
  { $!wcm }

  multi method new (
    $webkit-context-menu where * ~~ WebKitContextMenuAncestry,

    :$ref = True
  ) {
    return unless $webkit-context-menu;

    my $o = self.bless( :$webkit-context-menu );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $webkit-context-menu = webkit_context_menu_new();

    $webkit-context-menu ?? self.bless( :$webkit-context-menu ) !! Nil;
  }

  proto method new_with_items (|)
    is also<new-with-items>
  { * }

  multi method new_with_items (@items) {
    samewith( GLib::GList.new(@items, typed => WebKitContextMenuItem) );
  }
  multi method new_with_items (GList() $items) {
    my $webkit-context-menu = webkit_context_menu_new_with_items($items);

    $webkit-context-menu ?? self.bless( :$webkit-context-menu ) !! Nil;
  }

  method append (WebKitContextMenuItem() $item) {
    webkit_context_menu_append($!wcm, $item);
  }

  method first ( :$raw = False ) is also<head> {
    propReturnObject(
      webkit_context_menu_first($!wcm),
      $raw,
      |WebKit::Context::Menu::Item.getTypePair
    );
  }

  method get_event is also<get-event> {
    webkit_context_menu_get_event($!wcm);
  }

  method AT-POS (\k) {
    k < self.get_n_items ?? self.get_item_at_position(k) !! Nil;
  }
  method iterator {
    generate-iterator(
      self,
      sub      { self.get_n_items },
      sub (\k) { self.get_item_at_position(k) }
    );
  }
  method get_item_at_position (Int() $position, :$raw = False)
    is also<get-item-at-position>
  {
    my guint $p = $position;

    propReturnObject(
      webkit_context_menu_get_item_at_position($!wcm, $p),
      $raw,
      |WebKit::Context::Menu::Item.getTypePair
    );
  }

  method get_items ( :$raw = False, :$glist = False ) is also<get-items> {
    returnGList(
      webkit_context_menu_get_items($!wcm),
      $raw,
      $glist,
      |WebKit::Context::Menu::Item.getTypePair
    );
  }

  method get_n_items
    is also<
      get-n-items
      elems
    >
  {
    webkit_context_menu_get_n_items($!wcm);
  }

  method get_user_data ( :$raw = False, :$variant = False, :$json = False )
    is also<get-user-data>
  {
    my $o = returnVariant(
      webkit_context_menu_get_user_data($!wcm),
      :$raw,
      :$variant,
      :$json
    );
  }

  method insert (
    WebKitContextMenuItem() $item,
    Int()                   $position
  ) {
    my gint $p = $position;

    webkit_context_menu_insert($!wcm, $item, $p);
  }

  method last ( :$raw = False ) is also<tail> {
    propReturnObject(
      webkit_context_menu_last($!wcm),
      $raw,
      |WebKit::Context::Menu::Item.getTypePair
    );
  }

  method move_item (
    WebKitContextMenuItem() $item,
    Int()                   $position
  )
    is also<move-item>
  {
    my gint $p = $position;

    webkit_context_menu_move_item($!wcm, $item, $p);
  }

  method prepend (WebKitContextMenuItem() $item) {
    webkit_context_menu_prepend($!wcm, $item);
  }

  method remove (WebKitContextMenuItem() $item) {
    webkit_context_menu_remove($!wcm, $item);
  }

  method remove_all is also<remove-all> {
    webkit_context_menu_remove_all($!wcm);
  }

  method set_user_data (GVariant() $user_data) is also<set-user-data> {
    webkit_context_menu_set_user_data($!wcm, $user_data);
  }

}
