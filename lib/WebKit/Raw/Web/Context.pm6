use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use WebKit::Raw::Definitions;
use WebKit::Raw::Enums;

unit package WebKit::Web::Context;

### /usr/include/webkitgtk-6.0/webkit/WebKitWebContext.h

sub webkit_web_context_add_path_to_sandbox (
  WebKitWebContext $context,
  Str              $path,
  gboolean         $read_only
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_context_get_cache_model (WebKitWebContext $context)
  returns WebKitCacheModel
  is      native(webkit)
  is      export
{ * }

sub webkit_web_context_get_default
  returns WebKitWebContext
  is      native(webkit)
  is      export
{ * }

sub webkit_web_context_get_geolocation_manager (WebKitWebContext $context)
  returns WebKitGeolocationManager
  is      native(webkit)
  is      export
{ * }

sub webkit_web_context_get_network_session_for_automation (
  WebKitWebContext $context
)
  returns WebKitNetworkSession
  is      native(webkit)
  is      export
{ * }

sub webkit_web_context_get_security_manager (WebKitWebContext $context)
  returns WebKitSecurityManager
  is      native(webkit)
  is      export
{ * }

sub webkit_web_context_get_spell_checking_enabled (WebKitWebContext $context)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_web_context_get_spell_checking_languages (WebKitWebContext $context)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_web_context_get_time_zone_override (WebKitWebContext $context)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_web_context_initialize_notification_permissions (
  WebKitWebContext $context,
  GList            $allowed_origins,
  GList            $disallowed_origins
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_context_is_automation_allowed (WebKitWebContext $context)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_web_context_new
  returns WebKitWebContext
  is      native(webkit)
  is      export
{ * }

sub webkit_web_context_register_uri_scheme (
  WebKitWebContext               $context,
  Str                            $scheme,
                                 &callback (WebKitURISchemeRequest, gpointer),
  gpointer                       $user_data,
                                 &user_data_destroy_func (gpointer)
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_context_send_message_to_all_extensions (
  WebKitWebContext  $context,
  WebKitUserMessage $message
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_context_set_automation_allowed (
  WebKitWebContext $context,
  gboolean         $allowed
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_context_set_cache_model (
  WebKitWebContext $context,
  WebKitCacheModel $cache_model
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_context_set_preferred_languages (
  WebKitWebContext $context,
  CArray[Str]      $languages
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_context_set_spell_checking_enabled (
  WebKitWebContext $context,
  gboolean         $enabled
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_context_set_spell_checking_languages (
  WebKitWebContext $context,
  CArray[Str]      $languages
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_context_set_web_process_extensions_directory (
  WebKitWebContext $context,
  Str              $directory
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_context_set_web_process_extensions_initialization_user_data (
  WebKitWebContext $context,
  GVariant         $user_data
)
  is      native(webkit)
  is      export
{ * }
