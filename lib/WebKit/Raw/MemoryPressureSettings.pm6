use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use WebKit::Raw::Definitions;

unit package WebKit::Raw::MemoryPressureSettings;

### /usr/include/webkitgtk-6.0/webkit/WebKitMemoryPressureSettings.h

sub webkit_memory_pressure_settings_copy (WebKitMemoryPressureSettings $settings)
  returns WebKitMemoryPressureSettings
  is      native(webkit)
  is      export
{ * }

sub webkit_memory_pressure_settings_free (WebKitMemoryPressureSettings $settings)
  is      native(webkit)
  is      export
{ * }

sub webkit_memory_pressure_settings_get_conservative_threshold (
  WebKitMemoryPressureSettings $settings
)
  returns gdouble
  is      native(webkit)
  is      export
{ * }

sub webkit_memory_pressure_settings_get_kill_threshold (
  WebKitMemoryPressureSettings $settings
)
  returns gdouble
  is      native(webkit)
  is      export
{ * }

sub webkit_memory_pressure_settings_get_memory_limit (
  WebKitMemoryPressureSettings $settings
)
  returns guint
  is      native(webkit)
  is      export
{ * }

sub webkit_memory_pressure_settings_get_poll_interval (
  WebKitMemoryPressureSettings $settings
)
  returns gdouble
  is      native(webkit)
  is      export
{ * }

sub webkit_memory_pressure_settings_get_strict_threshold (
  WebKitMemoryPressureSettings $settings
)
  returns gdouble
  is      native(webkit)
  is      export
{ * }

sub webkit_memory_pressure_settings_get_type
  returns GType
  is      native(webkit)
  is      export
{ * }

sub webkit_memory_pressure_settings_new
  returns WebKitMemoryPressureSettings
  is      native(webkit)
  is      export
{ * }

sub webkit_memory_pressure_settings_set_conservative_threshold (
  WebKitMemoryPressureSettings $settings,
  gdouble                      $value
)
  is      native(webkit)
  is      export
{ * }

sub webkit_memory_pressure_settings_set_kill_threshold (
  WebKitMemoryPressureSettings $settings,
  gdouble                      $value
)
  is      native(webkit)
  is      export
{ * }

sub webkit_memory_pressure_settings_set_memory_limit (
  WebKitMemoryPressureSettings $settings,
  guint                        $memory_limit
)
  is      native(webkit)
  is      export
{ * }

sub webkit_memory_pressure_settings_set_poll_interval (
  WebKitMemoryPressureSettings $settings,
  gdouble                      $value
)
  is      native(webkit)
  is      export
{ * }

sub webkit_memory_pressure_settings_set_strict_threshold (
  WebKitMemoryPressureSettings $settings,
  gdouble                      $value
)
  is      native(webkit)
  is      export
{ * }
