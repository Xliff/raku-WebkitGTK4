use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use WebKit::Raw::Definitions;

unit package WebKit::Raw::GeolocationManager:ver<4>;

### /usr/include/webkitgtk-6.0/webkit/WebKitGeolocationManager.h

sub webkit_geolocation_manager_failed (
  WebKitGeolocationManager $manager,
  Str                      $error_message
)
  is      native(webkit)
  is      export
{ * }

sub webkit_geolocation_manager_get_enable_high_accuracy (
  WebKitGeolocationManager $manager
)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_geolocation_manager_update_position (
  WebKitGeolocationManager  $manager,
  WebKitGeolocationPosition $position
)
  is      native(webkit)
  is      export
{ * }

sub webkit_geolocation_position_copy (WebKitGeolocationPosition $position)
  returns WebKitGeolocationPosition
  is      native(webkit)
  is      export
{ * }

sub webkit_geolocation_position_free (WebKitGeolocationPosition $position)
  is      native(webkit)
  is      export
{ * }

sub webkit_geolocation_position_get_type
  returns GType
  is      native(webkit)
  is      export
{ * }

sub webkit_geolocation_position_new (
  gdouble $latitude,
  gdouble $longitude,
  gdouble $accuracy
)
  returns WebKitGeolocationPosition
  is      native(webkit)
  is      export
{ * }

sub webkit_geolocation_position_set_altitude (
  WebKitGeolocationPosition $position,
  gdouble                   $altitude
)
  is      native(webkit)
  is      export
{ * }

sub webkit_geolocation_position_set_altitude_accuracy (
  WebKitGeolocationPosition $position,
  gdouble                   $altitude_accuracy
)
  is      native(webkit)
  is      export
{ * }

sub webkit_geolocation_position_set_heading (
  WebKitGeolocationPosition $position,
  gdouble                   $heading
)
  is      native(webkit)
  is      export
{ * }

sub webkit_geolocation_position_set_speed (
  WebKitGeolocationPosition $position,
  gdouble                   $speed
)
  is      native(webkit)
  is      export
{ * }

sub webkit_geolocation_position_set_timestamp (
  WebKitGeolocationPosition $position,
  guint64                   $timestamp
)
  is      native(webkit)
  is      export
{ * }
