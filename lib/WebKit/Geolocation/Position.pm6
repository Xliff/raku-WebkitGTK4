use v6.c;

use Method::Also;

use WebKit::Raw::Types:ver<4>;
use WebKit::Raw::Geolocation::Manager:ver<4>;

use GLib::Roles::Implementor;

class WebKit::Geolocation::Position:ver<4> {
  also does GLib::Roles::Implementor;

  has WebKitGeolocationPosition $!wgp is implementor;

  submethod BUILD ( :$webkit-geo-pos ) {
    $!wgp = $webkit-geo-pos if $webkit-geo-pos;
  }

  method WebKit::Raw::Definitions::WebKitGeolocationPosition
    is also<WebKitGeolocationPosition>
  { $!wgp }

  multi method new (WebKitGeolocationPosition $webkit-geo-pos) {
    $webkit-geo-pos ?? self.bless( :$webkit-geo-pos ) !! Nil;
  }
  multi method new (
    Num() $latitude,
    Num() $longitude,
    Num() $accuracy
  ) {
    my gdouble ($lat, $long, $a) = ($latitude, $longitude, $accuracy);

    my $webkit-geo-pos = webkit_geolocation_position_new($lat, $long, $a);

    $webkit-geo-pos ?? self.bless( :$webkit-geo-pos ) !! Nil;
  }

  method set_altitude (Num() $altitude) is also<set-altitude> {
    my gdouble $a = $altitude;

    webkit_geolocation_position_set_altitude($!wgp, $a);
  }

  method copy ( :$raw = False ) {
    propReturnObject(
      webkit_geolocation_position_copy($!wgp),
      $raw,
      |self.getTypePair,
      :!ref
    );
  }

  method free {
    webkit_geolocation_position_free($!wgp);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &webkit_geolocation_position_get_type,
      $n,
      $t
    )
  }

  method set_altitude_accuracy (Num() $altitude_accuracy)
    is also<set-altitude-accuracy>
  {
    my gdouble $a = $altitude_accuracy;

    webkit_geolocation_position_set_altitude_accuracy($!wgp, $a);
  }

  method set_heading (Num() $heading) is also<set-heading> {
    my gdouble $h = $heading;

    webkit_geolocation_position_set_heading($!wgp, $h);
  }

  method set_speed (Num() $speed) is also<set-speed> {
    my gdouble $s = $speed;

    webkit_geolocation_position_set_speed($!wgp, $s);
  }

  method set_timestamp (Num() $timestamp) is also<set-timestamp> {
    my guint64 $t = $timestamp;

    webkit_geolocation_position_set_timestamp($!wgp, $t);
  }

}
