use v6.c;

use Method::Also;

use NativeCall;

use WebKit::Raw::Types;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset WebKitWebsitePoliciesAncestry is export of Mu
  where WebKitWebsitePolicies | GObject;

class WebKit::Website::Policies {
  also does GLib::Roles::Object;

  has WebKitWebsitePolicies $!wwp is implementor;

  submethod BUILD ( :$wekit-website-pol ) {
    self.setWebKitWebsitePolicies($wekit-website-pol) if $wekit-website-pol
  }

  method setWebKitWebsitePolicies (WebKitWebsitePoliciesAncestry $_) {
    my $to-parent;

    $!wwp = do {
      when WebKitWebsitePolicies {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WebKitWebsitePolicies, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Webkit::Raw::Definitions::WebKitWebsitePolicies
    is also<WebKitWebsitePolicies>
  { $!wwp }

  multi method new (
    $wekit-website-pol where * ~~ WebKitWebsitePoliciesAncestry,

    :$ref = True
  ) {
    return unless $wekit-website-pol;

    my $o = self.bless( :$wekit-website-pol );
    $o.ref if $ref;
    $o;
  }
  multi method new ( *%a ) {
    my $webkit-web-pols = webkit_website_policies_new();

    my $o = $webkit-web-pols ?? self.bless( :$webkit-web-pols ) !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }

  # Type: AutoplayPolicy
  method autoplay ( :$enum = True ) is rw is g-property {
    my $gv = GLib::Value.new( WebKit::Enum::AutoplayPolicy.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('autoplay', $gv);
        my $v = $gv.enum;
        return $v unless $enum;
        WebKitAutoplayPolicyEnum($v);
      },
      STORE => -> $, Int() $val is copy {
        warn 'autoplay is a construct-only attribute'
      }
    );
  }

  method get_autoplay_policy ( :$enum = True ) is also<get-autoplay-policy> {
    my $p = webkit_website_policies_get_autoplay_policy($!wwp);
    return $p unless $enum;
    WebKitAutoplayPolicyEnum($p);
  }

}

### /usr/include/webkitgtk-6.0/webkit/WebKitWebsitePolicies.h

sub webkit_website_policies_get_autoplay_policy (
  WebKitWebsitePolicies $policies
)
  returns WebKitAutoplayPolicy
  is      native(webkit)
  is      export
{ * }

sub webkit_website_policies_new
  returns WebKitWebsitePolicies
  is      native(webkit)
  is      export
{ * }
