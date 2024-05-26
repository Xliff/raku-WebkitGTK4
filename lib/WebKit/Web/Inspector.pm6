use v6.c;

use Method::Also;

use WebKit::Raw::Types;
use WebKit::Raw::Web::Inspector;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset WebKitWebInspectorAncestry is export of Mu
  where WebKitWebInspector | GObject;

class WebKit::WebInspector {
  also does GLib::Roles::Object;

  has WebKitWebInspector $!wi is implementor;

  submethod BUILD ( :$webkit-web-ins ) {
    self.setWebKitWebInspector($webkit-web-ins) if $webkit-web-ins
  }

  method setWebKitWebInspector (WebKitWebInspectorAncestry $_) {
    my $to-parent;

    $!wi = do {
      when WebKitWebInspector {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WebKitWebInspector, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Webkit::Raw::Definitions::WebKitWebInspector
    is also<WebKitWebInspector>
  { $!wi }

  method new (
    $webkit-web-ins where * ~~ WebKitWebInspectorAncestry,

    :$ref = True
  ) {
    return unless $webkit-web-ins;

    my $o = self.bless( :$webkit-web-ins );
    $o.ref if $ref;
    $o;
  }

  method attach {
    webkit_web_inspector_attach($!wi);
  }

  method close {
    webkit_web_inspector_close($!wi);
  }

  method detach {
    webkit_web_inspector_detach($!wi);
  }

  method get_attached_height
    is also<
      get-attached-height
      attached_height
      attached-height
    >
  {
    webkit_web_inspector_get_attached_height($!wi);
  }

  method get_can_attach
    is also<
      get-can-attach
      can_attach
      can-attach
    >
  {
    so webkit_web_inspector_get_can_attach($!wi);
  }

  method get_inspected_uri
    is also<
      get-inspected-uri
      inspected_uri
      inspected-uri
    >
  {
    webkit_web_inspector_get_inspected_uri($!wi);
  }

  method get_web_view ( :$raw = False )
    is also<
      get-web-view
      web_view
      web-view
    >
  {
    propReturnObject(
      webkit_web_inspector_get_web_view($!wi),
      :$raw,
      |::('WebKit::Web::View').getTypePair
    );
  }

  method is_attached is also<is-attached> {
    webkit_web_inspector_is_attached($!wi);
  }

  method show {
    webkit_web_inspector_show($!wi);
  }

}
