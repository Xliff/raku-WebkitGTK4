use v6.c;

use Method::Also;

use NativeCall;

use WebKit::Raw::Types;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset WebKitBackForwardListItemAncestry is export of Mu
  where WebKitBackForwardListItem | GObject;

class WebKit::BackForwardList::Item {
  also does GLib::Roles::Object;

  has WebKitBackForwardListItem $!wbfli is implementor;

  submethod BUILD ( :$webkit-bf-item ) {
    self.setWebKitBackForwardListItem($webkit-bf-item) if $webkit-bf-item
  }

  method setWebKitBackForwardListItem (WebKitBackForwardListItemAncestry $_) {
    my $to-parent;

    $!wbfli = do {
      when WebKitBackForwardListItem {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WebKitBackForwardListItem, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Webkit::Raw::Definitions::WebKitBackForwardListItem
    is also<WebKitBackForwardListItem>
  { $!wbfli }

  multi method new (
    $webkit-bf-item where * ~~ WebKitBackForwardListItemAncestry,

    :$ref = True
  ) {
    return unless $webkit-bf-item;

    my $o = self.bless( :$webkit-bf-item );
    $o.ref if $ref;
    $o;
  }

  method get_original_uri is also<get-original-uri> {
    webkit_back_forward_list_item_get_original_uri($!wbfli);
  }

  method get_title is also<get-title> {
    webkit_back_forward_list_item_get_title($!wbfli);
  }

  method get_uri is also<get-uri> {
    webkit_back_forward_list_item_get_uri($!wbfli);
  }

}

### /usr/include/webkitgtk-6.0/webkit/WebKitBackForwardListItem.h

sub webkit_back_forward_list_item_get_original_uri (
  WebKitBackForwardListItem $list_item
)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_back_forward_list_item_get_title (
  WebKitBackForwardListItem $list_item
)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_back_forward_list_item_get_uri (
  WebKitBackForwardListItem $list_item
)
  returns Str
  is      native(webkit)
  is      export
{ * }
