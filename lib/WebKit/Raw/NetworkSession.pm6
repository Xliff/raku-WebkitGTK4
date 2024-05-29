use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GIO::Raw::Definitions;
use WebKit::Raw::Definitions:ver<4>;
use WebKit::Raw::Enums:ver<4>;

unit package WebKit::Raw::NetworkSession:ver<4>;

### /usr/include/webkitgtk-6.0/webkit/WebKitNetworkSession.h

sub webkit_network_session_allow_tls_certificate_for_host (
  WebKitNetworkSession $session,
  GTlsCertificate      $certificate,
  Str                  $host
)
  is      native(webkit)
  is      export
{ * }

sub webkit_network_session_download_uri (
  WebKitNetworkSession $session,
  Str                  $uri
)
  returns WebKitDownload
  is      native(webkit)
  is      export
{ * }

sub webkit_network_session_get_cookie_manager (
  WebKitNetworkSession $session
)
  returns WebKitCookieManager
  is      native(webkit)
  is      export
{ * }

sub webkit_network_session_get_default
  returns WebKitNetworkSession
  is      native(webkit)
  is      export
{ * }

sub webkit_network_session_get_itp_enabled (
  WebKitNetworkSession $session
)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_network_session_get_itp_summary (
  WebKitNetworkSession $session,
  GCancellable         $cancellable,
                       &callback (
                         WebKitNetworkSession,
                         GAsyncResult,
                         gpointer
                       ),
  gpointer             $user_data
)
  is      native(webkit)
  is      export
{ * }

sub webkit_network_session_get_itp_summary_finish (
  WebKitNetworkSession    $session,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns GList
  is      native(webkit)
  is      export
{ * }

sub webkit_network_session_get_persistent_credential_storage_enabled (
  WebKitNetworkSession $session
)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_network_session_get_tls_errors_policy (
  WebKitNetworkSession $session
)
  returns WebKitTLSErrorsPolicy
  is      native(webkit)
  is      export
{ * }

sub webkit_network_session_get_website_data_manager (
  WebKitNetworkSession $session
)
  returns WebKitWebsiteDataManager
  is      native(webkit)
  is      export
{ * }

sub webkit_network_session_is_ephemeral (WebKitNetworkSession $session)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_network_session_new (
  Str $data_directory,
  Str $cache_directory
)
  returns WebKitNetworkSession
  is      native(webkit)
  is      export
{ * }

sub webkit_network_session_new_ephemeral
  returns WebKitNetworkSession
  is      native(webkit)
  is      export
{ * }

sub webkit_network_session_prefetch_dns (
  WebKitNetworkSession $session,
  Str                  $hostname
)
  is      native(webkit)
  is      export
{ * }

sub webkit_network_session_set_itp_enabled (
  WebKitNetworkSession $session,
  gboolean             $enabled
)
  is      native(webkit)
  is      export
{ * }

sub webkit_network_session_set_memory_pressure_settings (
  WebKitMemoryPressureSettings $settings
)
  is      native(webkit)
  is      export
{ * }

sub webkit_network_session_set_persistent_credential_storage_enabled (
  WebKitNetworkSession $session,
  gboolean             $enabled
)
  is      native(webkit)
  is      export
{ * }

sub webkit_network_session_set_proxy_settings (
  WebKitNetworkSession       $session,
  WebKitNetworkProxyMode     $proxy_mode,
  WebKitNetworkProxySettings $proxy_settings
)
  is      native(webkit)
  is      export
{ * }

sub webkit_network_session_set_tls_errors_policy (
  WebKitNetworkSession  $session,
  WebKitTLSErrorsPolicy $policy
)
  is      native(webkit)
  is      export
{ * }
