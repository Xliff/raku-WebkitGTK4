use v6.c;

use NativeCall;
use Method::Also;

use WebKit::Raw::Types;
use WebKit::Raw::Web::Context;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset WebKitWebContextAncestry is export of Mu
  where WebKitWebContext | GObject;

class WebKit::Web::Context {
  also does GLib::Roles::Object;

  has WebKitWebContext $!wwc is implementor;

  submethod BUILD ( :$webkit-web-ctx ) {
    self.setWebKitWebContext($webkit-web-ctx) if $webkit-web-ctx
  }

  method setWebKitWebContext (WebKitWebContextAncestry $_) {
    my $to-parent;

    $!wwc = do {
      when WebKitWebContext {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WebKitWebContext, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Webkit::Raw::Definitions::WebKitWebContext
    is also<WebKitWebContext>
  { $!wwc }

  multi method new (
    $webkit-web-ctx where * ~~ WebKitWebContextAncestry,

    :$ref = True
  ) {
    return unless $webkit-web-ctx;

    my $o = self.bless( :$webkit-web-ctx );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $webkit-web-ctx = webkit_web_context_new();

    $webkit-web-ctx ?? self.bless( :$webkit-web-ctx ) !! Nil;
  }

  method get_default is also<get-default> {
    my $webkit-web-ctx = webkit_web_context_get_default();

    $webkit-web-ctx ?? self.bless( :$webkit-web-ctx ) !! Nil;
  }

  method add_path_to_sandbox (Str() $path, Int() $read_only)
    is also<add-path-to-sandbox>
  {
    my gboolean $r = $read_only.so.Int;

    webkit_web_context_add_path_to_sandbox($!wwc, $path, $r);
  }

  method get_cache_model ( :$enum = True ) is also<get-cache-model> {
    my $m = webkit_web_context_get_cache_model($!wwc);
    return $m unless $enum;
    WebKitCacheModelEnum($m);
  }

  method get_geolocation_manager ( :$raw = False )
    is also<get-geolocation-manager>
  {
    propReturnObject(
      webkit_web_context_get_geolocation_manager($!wwc),
      $raw,
      |WebKit::GeolocationManager.getTypePair
    );
  }

  method get_network_session_for_automation ( :$raw = False )
    is also<get-network-session-for-automation>
  {
    propReturnObject(
      webkit_web_context_get_network_session_for_automation($!wwc),
      $raw,
      |WebKit::NetworkSession.getTypePair
    );
  }

  method get_security_manager ( :$raw = False ) is also<get-security-manager> {
    propReturnObject(
      webkit_web_context_get_security_manager($!wwc),
      $raw,
      |WebKit::SecurityManager.getTypePair
    );
  }

  method get_spell_checking_enabled is also<get-spell-checking-enabled> {
    so webkit_web_context_get_spell_checking_enabled($!wwc);
  }

  method get_spell_checking_languages ( :$raw = False )
    is also<get-spell-checking-languages>
  {
    my $ca = webkit_web_context_get_spell_checking_languages($!wwc);
    return $ca if $raw;
    CStringArrayToArray($ca);
  }

  method get_time_zone_override is also<get-time-zone-override> {
    so webkit_web_context_get_time_zone_override($!wwc);
  }

  proto method initialize_notification_permissions (|)
    is also<initialize-notification-permissions>
  { * }

  multi method initialize_notification_permissions (@allowed, @disallowed) {
    samewith(
      newCArray(WebKitSecurityOrigin, @allowed),
      newCArray(WebKitSecurityOrigin, @disallowed)
    );
  }
  multi method initialize_notification_permissions (
    GList() $allowed_origins,
    GList() $disallowed_origins
  ) {
    webkit_web_context_initialize_notification_permissions(
      $!wwc,
      $allowed_origins,
      $disallowed_origins
    );
  }

  method is_automation_allowed is also<is-automation-allowed> {
    webkit_web_context_is_automation_allowed($!wwc);
  }

  my %DC := %DEFAULT-CALLBACKS;

  method register_uri_scheme (
    Str()          $scheme,
                   &callback,
    gpointer       $user_data              = gpointer,
                   &user_data_destroy_func = %DC<GDestroyNotify>
  )
    is also<register-uri-scheme>
  {
    webkit_web_context_register_uri_scheme(
      $!wwc,
      $scheme,
      &callback,
      $user_data,
      &user_data_destroy_func
    );
  }

  method send_message_to_all_extensions (WebKitUserMessage() $message)
    is also<send-message-to-all-extensions>
  {
    webkit_web_context_send_message_to_all_extensions($!wwc, $message);
  }

  method set_automation_allowed (Int() $allowed)
    is also<set-automation-allowed>
  {
    my gboolean $a = $allowed.so.Int;

    webkit_web_context_set_automation_allowed($!wwc, $a);
  }

  method set_cache_model (Int() $cache_model) is also<set-cache-model> {
    my WebKitCacheModel $c = $cache_model;

    webkit_web_context_set_cache_model($!wwc, $c);
  }

  proto method set_preferred_languages (|)
    is also<set-preferred-languages>
  { * }

  multi method set_preferred_languages (@langs) {
    samewith( newCArray(Str, @langs) );
  }
  multi method set_preferred_languages (CArray[Str] $languages) {
    webkit_web_context_set_preferred_languages($!wwc, $languages);
  }

  method set_spell_checking_enabled (Int() $enabled)
    is also<set-spell-checking-enabled>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_web_context_set_spell_checking_enabled($!wwc, $enabled);
  }

  proto method set_spell_checking_languages (|)
    is also<set-spell-checking-languages>
  { * }

  multi method set_spell_checking_languages (@langs) {
    samewith( newCArray(Str, @langs) );
  }
  multi method set_spell_checking_languages (CArray[Str] $languages) {
    webkit_web_context_set_spell_checking_languages($!wwc, $languages);
  }

  method set_web_process_extensions_directory (Str() $directory)
    is also<set-web-process-extensions-directory>
  {
    webkit_web_context_set_web_process_extensions_directory(
      $!wwc,
      $directory
    );
  }

  method set_web_process_extensions_initialization_user_data (
    GVariant() $user_data
  )
    is also<set-web-process-extensions-initialization-user-data>
  {
    webkit_web_context_set_web_process_extensions_initialization_user_data(
      $!wwc,
      $user_data
    );
  }

}
