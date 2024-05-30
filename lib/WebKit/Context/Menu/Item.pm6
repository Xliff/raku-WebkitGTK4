use v6.c;

use Method::Also;

use WebKit::Raw::Types:ver<4>;
use WebKit::Raw::Context::Menu::Item:ver<4>;


use GLib::Roles::Implementor;
use GLib::Roles::Object;
use GIO::Roles::Action;

our subset WebKitContextMenuItemAncestry is export of Mu
  where WebKitContextMenuItem | GObject;

class WebKit::Context::Menu::Item:ver<4> {
  also does GLib::Roles::Object;

  has WebKitContextMenuItem $!wcmi is implementor;

  submethod BUILD ( :$webkit-context-item ) {
    self.setWebKitContextMenuItem($webkit-context-item)
      if $webkit-context-item
  }

  method setWebKitContextMenuItem (WebKitContextMenuItemAncestry $_) {
    my $to-parent;

    $!wcmi = do {
      when WebKitContextMenuItem {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WebKitContextMenuItem, $_);
      }
    }
    self!setObject($to-parent);
  }

  method WebKit::Raw::Definitions::WebKitContextMenuItem
    is also<WebKitContextMenuItem>
  { $!wcmi }

  multi method new ($_, :$ref = True) {
    do {
      when WebKitContextMenuItemAncestry {
        my $webkit-context-item = $_;

        return unless $webkit-context-item;

        my $o = self.bless( :$webkit-context-item );
        $o.ref if $ref;
        $o;
      }

      when WebKitContextMenuAction {
        self.new_from_gaction($_);
      }

      when .^can('WebKitContextMenuAction') {
        self.new_from_gaction( .WebKitContextMenuAction );
      }

      default {
        X::GLib::InvalidType.new(
          message => "Invalid argument of type '{
                      .^name }' passed to { self.^name }.new"
        ).throw;
      }
    }
  }

  multi method new ($action, $label, $target) {
    self.new_from_gaction($action, $label, $target);
  }
  method new_from_gaction (
    GAction()  $action,
    Str()      $label,
    GVariant() $target
  )
    is also<new-from-gaction>
  {
    my $webkit-context-item = webkit_context_menu_item_new_from_gaction(
      $action,
      $label,
      $target
    );

    $webkit-context-item ?? self.bless( :$webkit-context-item ) !! Nil;
  }

  method new_from_stock_action (Int() $action) is also<new-from-stock-action> {
    my WebKitContextMenuAction $a = $action;

    my $webkit-context-item =
      webkit_context_menu_item_new_from_stock_action($a);

    $webkit-context-item ?? self.bless( :$webkit-context-item ) !! Nil;
  }

  multi method new ($action, $label) {
    self.new_from_stock_action_with_label($action, $label);
  }
  method new_from_stock_action_with_label (Int() $action, Str() $label)
    is also<new-from-stock-action-with-label>
  {
    my WebKitContextMenuAction $a = $action;

    my &c = &webkit_context_menu_item_new_from_stock_action_with_label;

    my $webkit-context-item = c($!wcmi, $a, $label);

    $webkit-context-item ?? self.bless( :$webkit-context-item ) !! Nil;
  }

  multi method new ( :s(:sep(:$separator)) is required ) {
    self.new_separator;
  }
  method new_separator is also<new-separator> {
    my $webkit-context-item = webkit_context_menu_item_new_separator();

    $webkit-context-item ?? self.bless( :$webkit-context-item ) !! Nil;
  }

  method new_with_submenu (Str() $label, WebKitContextMenu() $submenu)
    is also<new-with-submenu>
  {
    my $webkit-context-item = webkit_context_menu_item_new_with_submenu(
      $label,
      $submenu
    );
  }

  method get_gaction ( :$raw = False ) is also<get-gaction> {
    propReturnObject(
      webkit_context_menu_item_get_gaction($!wcmi),
      $raw,
      |GIO::Action.getTypePair
    );
  }

  method get_stock_action ( :$enum = False ) is also<get-stock-action> {
    my $a = webkit_context_menu_item_get_stock_action($!wcmi);
    return $a unless $enum;
    WebKitContextMenuAction($a);
  }

  method get_submenu ( :$raw = False ) is also<get-submenu> {
    propReturnObject(
      webkit_context_menu_item_get_submenu($!wcmi),
      $raw,
      |::('WebKit::Context::Menu').getTypePair
    );
  }

  method is_separator is also<is-separator> {
    so webkit_context_menu_item_is_separator($!wcmi);
  }

  method set_submenu (WebKitContextMenu() $submenu) is also<set-submenu> {
    webkit_context_menu_item_set_submenu($!wcmi, $submenu);
  }

}
