use v6.c;

use Method::Also;

use WebKit::Raw::Types:ver<4>;
use WebKit::Raw::Geolocation::Manager:ver<4>;

use GLib::Roles::Object;
use GLib::Roles::Implementor;

our subset WebKitGeolocationManagerAncestry is export of Mu
  where WebKitGeolocationManager | GObject;

class WebKit::Geolocation::Manager:ver<4> {
  also does GLib::Roles::Object;

  has WebKitGeolocationManager $!wgm is implementor;

  submethod BUILD ( :$webkit-geo-mgr ) {
    self.setWebKitGeolocationManager($webkit-geo-mgr) if $webkit-geo-mgr
  }

  method setWebKitGeolocationManager (WebKitGeolocationManagerAncestry $_) {
    my $to-parent;

    $!wgm = do {
      when WebKitGeolocationManager {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WebKitGeolocationManager, $_);
      }
    }
    self!setObject($to-parent);
  }

  method WebKit::Raw::Definitions::WebKitGeolocationManager
    is also<WebKitGeolocationManager>
  { $!wgm }

  multi method new (
    $webkit-geo-mgr where * ~~ WebKitGeolocationManagerAncestry,

    :$ref = True
  ) {
    return unless $webkit-geo-mgr;

    my $o = self.bless( :$webkit-geo-mgr );
    $o.ref if $ref;
    $o;
  }

  # Type: gboolean
  method enable-high-accuracy is rw is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-high-accuracy', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'enable-high-accuracy does not allow writing'
      }
    );
  }

  method Start {
    self.connect($!wgm, 'start');
  }

  method Stop {
    self.connect($!wgm, 'stop');
  }

  method failed (Str() $error_message) {
    webkit_geolocation_manager_failed($!wgm, $error_message);
  }

  method get_enable_high_accuracy is also<get-enable-high-accuracy> {
    webkit_geolocation_manager_get_enable_high_accuracy($!wgm);
  }

  method update_position (Num() $position) is also<update-position> {
    my WebKitGeolocationPosition $p = $position;

    webkit_geolocation_manager_update_position($!wgm, $position);
  }

}
