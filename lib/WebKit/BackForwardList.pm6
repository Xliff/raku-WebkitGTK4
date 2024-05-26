use v6.c;

use Method::Also;

use WebKit::Raw::Types;
use WebKit::Raw::BackForwardList;

use GLib::GList;
use WebKit::BackForwardList::Item:ver<4>;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset WebKitBackForwardListAncestry is export of Mu
  where WebKitBackForwardList | GObject;

class WebKit::BackFowardList:ver<4> {
  also does GLib::Roles::Object;

  has WebKitBackForwardList $!wbfl is implementor;

  submethod BUILD ( :$webkit-bf-list ) {
    self.setWebKitBackForwardList($webkit-bf-list) if $webkit-bf-list
  }

  method setWebKitBackForwardList (WebKitBackForwardListAncestry $_) {
    my $to-parent;

    $!wbfl = do {
      when WebKitBackForwardList {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WebKitBackForwardList, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Webkit::Raw::Definitions::WebKitBackForwardList
    is also<WebKitBackForwardList>
  { $!wbfl }

  multi method new (
    $webkit-bf-list where * ~~ WebKitBackForwardListAncestry,

    :$ref = True
  ) {
    return unless $webkit-bf-list;

    my $o = self.bless( :$webkit-bf-list );
    $o.ref if $ref;
    $o;
  }

  method get_back_item ( :$raw = False ) is also<get-back-item> {
    propReturnObject(
      webkit_back_forward_list_get_back_item($!wbfl),
      $raw,
      |WebKit::BackForwardList::Item.getTypePair
    );
  }

  method get_back_list ( :$raw = False, :gslist(:$glist) )
    is also<get-back-list>
  {
    returnGList(
      webkit_back_forward_list_get_back_list($!wbfl),
      $raw,
      $glist,
      |WebKit::BackForwardList::Item.getTypePair
    );
  }

  method get_back_list_with_limit (
    Int()  $limit,
          :$raw            = False,
          :gslist(:$glist) = False
  )
    is also<get-back-list-with-limit>
  {
    my guint $l = $limit;

    returnGList(
      webkit_back_forward_list_get_back_list_with_limit($!wbfl, $l),
      $raw,
      $glist,
      |WebKit::BackForwardList::Item.getTypePair
    );
  }

  method get_current_item ( :$raw = False ) is also<get-current-item> {
    propReturnObject(
      webkit_back_forward_list_get_current_item($!wbfl),
      $raw,
      |WebKit::BackForwardList::Item.getTypePair
    );
  }

  method get_forward_item ( :$raw = False ) is also<get-forward-item> {
    propReturnObject(
      webkit_back_forward_list_get_forward_item($!wbfl),
      $raw,
      |WebKit::BackForwardList::Item.getTypePair
    );
  }

  method get_forward_list ( :$raw = False )  is also<get-forward-list> {
    propReturnObject(
      webkit_back_forward_list_get_forward_list($!wbfl),
      $raw,
      |WebKit::BackForwardList::Item.getTypePair
    );
  }

  method get_forward_list_with_limit (Int() $limit, :$raw = False)
    is also<get-forward-list-with-limit>
  {
    my guint $l = $limit;

    propReturnObject(
      webkit_back_forward_list_get_forward_list_with_limit($!wbfl, $limit);
      $raw,
      |WebKit::BackForwardList::Item.getTypePair
    );
  }

  method get_length
    is also<get-length>
  {
    webkit_back_forward_list_get_length($!wbfl);
  }

  method get_nth_item (Int() $index, :$raw = False)
    is also<get-nth-item>
  {
    my gint $i = $index;

    propReturnObject(
      webkit_back_forward_list_get_nth_item($!wbfl, $i),
      $raw,
      |WebKit::BackForwardList::Item.getTypePair
    );
  }

}
