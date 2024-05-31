use v6.c;

use WebKit::Raw::Types;
use WebKit::Raw::Website::DataManager;

use GLib::DateTime;
use GLib::GList;

use GLib::Roles::Implementor;

# cw: More than likely BOXED!

class WebKit::ITP::FirstParty {
  also does GLib::Roles::Implementor;

  has WebKitITPFirstParty $wi1p is implementor handles<p>;

  submethod BUILD ( :$webkit-itp-first ) {
    $!wi1p = $webkit-itp-first;
  }

  method WebKit::Raw::Definitions::WebKitITPFirstParty
  { $!wi1p }

  method new (WebKitITPFirstParty $webkit-itp-first) {
    return Nil unless $webkit-itp-first;

    self.bless( :$webkit-itp-first );
  }

  method get_domain {
    webkit_itp_first_party_get_domain($!wi1p);
  }

  method get_last_update_time (
    :$raw  = False,
    :$glib = False,
    :$raku = $glib.not
  ) {
    my $r = propReturnObject(
      webkit_itp_first_party_get_last_update_time($!wi1p),
      $raw,
      |GLib::DateTime.getTypePair
    );
    return $r if $glib;
    $r.DateTime;
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &webkit_itp_first_party_get_type, $n, $t );
  }

  method get_website_data_access_allowed {
    webkit_itp_first_party_get_website_data_access_allowed($!wi1p);
  }

  method ref {
    webkit_itp_first_party_ref($!wi1p);
    self;
  }

  method unref {
    webkit_itp_first_party_unref($!wi1p);
  }
}


class WebKit::ITP::ThirdParty {
  also does GLib::Roles::Implementor;

  has WebKitITPThirdParty $!wi3p is implementor handles<p>;

  submethod BUILD ( :$webkit-itp-third ) {
    $!wi3p = $webkit-itp-third;
  }

  method WebKit::Raw::Definitions::WebKitITPThirdParty
  { $!wi3p }

  method new (WebKitITPThirdParty $webkit-itp-third) {
    return Nil unless $webkit-itp-third;

    self.bless( :$webkit-itp-third );
  }

  method get_domain {
    webkit_itp_third_party_get_domain($!wi3p);
  }

  method get_first_parties ( :$raw = False, :gslist(:$glist) = False ) {
    returnGList(
      webkit_itp_third_party_get_first_parties($!wi3p),
      $raw,
      |WebKit::ITP::FirstParty.getTypePair
    );
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &webkit_itp_third_party_get_type, $n, $t );
  }

  method ref {
    webkit_itp_third_party_ref($!wi3p);
    self;
  }

  method unref {
    webkit_itp_third_party_unref($!wi3p);
  }

}
