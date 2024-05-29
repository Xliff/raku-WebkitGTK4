use v6.c;

use NativeCall;
use Method::Also;

use WebKit::Raw::Types:ver<4>;
use WebKit::Raw::NetworkSession:ver<4>;

use GLib::GList;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset WebKitNetworkSessionAncestry is export of Mu
  where WebKitNetworkSession | GObject;

class WebKit::NetworkSession {
  also does GLib::Roles::Object;

  has WebKitNetworkSession $!wns is implementor;

  submethod BUILD ( :$webkit-net-sess ) {
    self.setWebKitNetworkSession($webkit-net-sess) if $webkit-net-sess
  }

  method setWebKitNetworkSession (WebKitNetworkSessionAncestry $_) {
    my $to-parent;

    $!wns = do {
      when WebKitNetworkSession {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WebKitNetworkSession, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Webkit::Raw::Definitions::WebKitNetworkSession
    is also<WebKitNetworkSession>
  { $!wns }

  multi method new (
    $webkit-net-sess where * ~~ WebKitNetworkSessionAncestry,

    :$ref = True
  ) {
    return unless $webkit-net-sess;

    my $o = self.bless( :$webkit-net-sess );
    $o.ref if $ref;
    $o;
  }

  multi method new (
    Str() $data_directory,
    Str() $cache_directory = $data_directory
  ) {
    my $webkit-net-sess = webkit_network_session_new(
      $data_directory,
      $cache_directory
    );

    $webkit-net-sess ?? self.bless( :$webkit-net-sess ) !! Nil;
  }

  method new_ephemeral is also<new-ephemeral> {
    my $webkit-net-sess = webkit_network_session_new_ephemeral();

    $webkit-net-sess ?? self.bless( :$webkit-net-sess ) !! Nil;
  }

  method get_default is also<get-default> {
    my $webkit-net-sess = webkit_network_session_get_default();

    $webkit-net-sess ?? self.bless( :$webkit-net-sess ) !! Nil;
  }


  method allow_tls_certificate_for_host (
    GTlsCertificate() $certificate,
    Str()             $host
  )
    is also<allow-tls-certificate-for-host>
  {
    webkit_network_session_allow_tls_certificate_for_host(
      $!wns,
      $certificate,
      $host
    );
  }

  method download_uri (Str() $uri) is also<download-uri> {
    webkit_network_session_download_uri($!wns, $uri);
  }

  method get_cookie_manager ( :$raw = False ) is also<get-cookie-manager> {
    propReturnObject(
      webkit_network_session_get_cookie_manager($!wns),
      $raw,
      |WebKit::CookieManager.getTypePair
    );
  }

  method get_itp_enabled is also<get-itp-enabled> {
    so webkit_network_session_get_itp_enabled($!wns);
  }

  proto method get_itp_summary (|)
    is also<get-itp-summary>
  { * }

  multi method get_itp_summary (
                    &callback,
    gpointer        $user_data     = gpointer,
    GCancellable() :$cancellable
  ) {
    samewith(
      $cancellable,
      &callback,
      $user_data
    );
  }
  multi method get_itp_summary (
    GCancellable() $cancellable,
                   &callback,
    gpointer       $user_data     = gpointer
  ) {
    webkit_network_session_get_itp_summary(
      $!wns,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method get_itp_summary_finish (
    GAsyncResult()           $result,
    CArray[Pointer[GError]]  $error          = gerror,
                            :$raw            = False,
                            :gslist(:$glist) = False
  )
    is also<get-itp-summary-finish>
  {
    clear_error;
    my $l = webkit_network_session_get_itp_summary_finish(
      $!wns,
      $result,
      $error
    );
    set_error($error);
    returnGList($l, $raw, $glist, |WebKit::WebKitITPThirdParty.getTypePair)
  }

  method get_persistent_credential_storage_enabled
    is also<get-persistent-credential-storage-enabled>
  {
    so webkit_network_session_get_persistent_credential_storage_enabled($!wns);
  }

  method get_tls_errors_policy ( :$enum = True )
    is also<get-tls-errors-policy>
  {
    my $p = webkit_network_session_get_tls_errors_policy($!wns);
    return $p unless $enum;
    WebKitTLSErrorsPolicyEnum($p);
  }

  method get_website_data_manager ( :$raw = False )
    is also<get-website-data-manager>
  {
    propReturnObject(
      webkit_network_session_get_website_data_manager($!wns),
      $raw,
      |WebKit::Website::DataManager.getTypePair
    );
  }

  method is_ephemeral is also<is-ephemeral> {
    so webkit_network_session_is_ephemeral($!wns);
  }

  method prefetch_dns (Str() $hostname) is also<prefetch-dns> {
    webkit_network_session_prefetch_dns($!wns, $hostname);
  }

  method set_itp_enabled (Int() $enabled) is also<set-itp-enabled> {
    my gboolean $e = $enabled.so.Int;

    webkit_network_session_set_itp_enabled($!wns, $e);
  }

  method set_memory_pressure_settings (
    WebKitMemoryPressureSettings() $settings
  )
    is also<set-memory-pressure-settings>
  {
    webkit_network_session_set_memory_pressure_settings($!wns, $settings);
  }

  method set_persistent_credential_storage_enabled (Int() $enabled)
    is also<set-persistent-credential-storage-enabled>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_network_session_set_persistent_credential_storage_enabled(
      $!wns,
      $e
    );
  }

  method set_proxy_settings (
    Int()                        $proxy_mode,
    WebKitNetworkProxySettings() $proxy_settings
  )
    is also<set-proxy-settings>
  {
    my WebKitNetworkProxyMode $p = $proxy_mode;

    webkit_network_session_set_proxy_settings($!wns, $p, $proxy_settings);
  }

  method set_tls_errors_policy (
    WebKitTLSErrorsPolicy $policy
  )
    is also<set-tls-errors-policy>
  {
    webkit_network_session_set_tls_errors_policy($!wns, $policy);
  }

}
