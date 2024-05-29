use v6.c;

use Method::Also;

use NativeCall;

use WebKit::Raw::Types:ver<4>;
use SOUP::Raw::Definitions;
use WebKit::Raw::CookieManager:ver<4>;

use GLib::GList;
use SOUP::Cookie;

use GLib::Roles::Implementor;
use GLib::Roles::Object;


our subset WebKitCookieManagerAncestry is export of Mu
  where WebKitCookieManager | GObject;

class WebKit::CookieManager {
  also does GLib::Roles::Object;

  has WebKitCookieManager $!wcm is implementor;

  submethod BUILD ( :$webkit-cookie-man ) {
    self.setWebKitCookieManager($webkit-cookie-man) if $webkit-cookie-man
  }

  method setWebKitCookieManager (WebKitCookieManagerAncestry $_) {
    my $to-parent;

    $!wcm = do {
      when WebKitCookieManager {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WebKitCookieManager, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Webkit::Raw::Definitions::WebKitCookieManager
    is also<WebKitCookieManager>
  { $!wcm }

  method new (
    $webkit-cookie-man where * ~~ WebKitCookieManagerAncestry,

    :$ref = True
  ) {
    return unless $webkit-cookie-man;

    my $o = self.bless( :$webkit-cookie-man );
    $o.ref if $ref;
    $o;
  }

  method Changed {
    self.connect($!wcm, 'changed');
  }

  proto method add_cookie (|)
    is also<add-cookie>
  { * }

  multi method add_cookie (
     $cookie,
     &callback    = Callable,
     $user_data   = gpointer,
    :$cancellable = GCancellable
  ) {
    samewith(
      $cookie,
      $cancellable,
      &callback,
      $user_data
    )
  }
  multi method add_cookie (
    SoupCookie()    $cookie,
    GCancellable()  $cancellable,
                    &callback,
    gpointer        $user_data    = gpointer,
                   :$raw          = False

  ) {
    my &ucb = &callback;
    &ucb = sub ($, $c is copy, $p) {
      $c = GIO::AsyncResult.new($c);
      &callback(self, $c, $p);
    } if $raw;

    webkit_cookie_manager_add_cookie(
      $!wcm,
      $cookie,
      $cancellable,
      &ucb,
      $user_data
    );
  }

  method add_cookie_finish (
    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error    = gerror
  )
    is also<add-cookie-finish>
  {
    clear_error;
    my $rv = webkit_cookie_manager_add_cookie_finish($!wcm, $result, $error);
    set_error($error);
    $rv;
  }

  proto method delete_cookie (|)
    is also<delete-cookie>
  { * }

  multi method delete_cookie (
     $cookie,
     &callback    = Callable,
     $user_data   = gpointer,
    :$cancellable = GCancellable
  ) {
    samewith(
      $cookie,
      $cancellable,
      &callback,
      $user_data
    )
  }
  multi method delete_cookie (
    SoupCookie()     $cookie,
    GCancellable()   $cancellable,
                     &callback,
    gpointer         $user_data    = gpointer,
                    :$raw          = False
  ) {
    my &ucb = &callback;
    &ucb = sub ($, $c is copy, $p) {
      $c = GIO::AsyncResult.new($c);
      &callback(self, $c, $p);
    } if $raw && &callback;

    webkit_cookie_manager_delete_cookie(
      $!wcm,
      $cookie,
      $cancellable,
      &ucb,
      $user_data
    );
  }

  method delete_cookie_finish (
    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error
  )
    is also<delete-cookie-finish>
  {
    clear_error;
    my $rv = webkit_cookie_manager_delete_cookie_finish(
      $!wcm,
      $result,
      $error
    );
    set_error($error);
    $rv;
  }

  method get_accept_policy (
    GCancellable()  $cancellable,
                    &callback,
    gpointer        $user_data    = gpointer,
                   :$raw          = False
  )
    is also<get-accept-policy>
  {
    my &ucb = &callback;
    &ucb = sub ($, $c is copy, $p) {
      $c = GIO::AsyncResult.new($c);
      &callback(self, $c, $p);
    } if $raw;

    webkit_cookie_manager_get_accept_policy(
      $!wcm,
      $cancellable,
      &ucb,
      $user_data
    );
  }

  method get_accept_policy_finish (
    GAsyncResult()           $result,
    CArray[Pointer[GError]]  $error   = gerror,
                            :$enum    = True
  )
    is also<get-accept-policy-finish>
  {
    clear_error;
    my $p = webkit_cookie_manager_get_accept_policy_finish(
      $!wcm,
      $result,
      $error
    );
    set_error($error);
    return $p unless $enum;
    WebKitCookieAcceptPolicyEnum($p);
  }

  proto method get_all_cookies (|)
    is also<get-all-cookies>
  { * }

  multi method get_all_cookies (
    &callback    = Callable,
    $user_data   = gpointer,
   :$cancellable = GCancellable
  ) {
    samewith($cancellable, &callback, $user_data);
  }
  multi method get_all_cookies (
    GCancellable()  $cancellable,
                    &callback,
    gpointer        $user_data    = gpointer,
                   :$raw          = False
  ) {
    my &ucb = &callback;
    &ucb = sub ($, $c is copy, $p) {
      $c = GIO::AsyncResult.new($c);
      &callback(self, $c, $p);
    } if $raw && &callback;

    webkit_cookie_manager_get_all_cookies(
      $!wcm,
      $cancellable,
      &ucb,
      $user_data
    );
  }

  method get_all_cookies_finish (
    GAsyncResult()           $result,
    CArray[Pointer[GError]]  $error          = gerror,
                            :$raw            = False,
                            :gslist(:$glist) = False
  )
    is also<get-all-cookies-finish>
  {
    clear_error;
    my $l = webkit_cookie_manager_get_all_cookies_finish(
      $!wcm,
      $result,
      $error
    );
    set_error($error);
    returnGList($l, $raw, $glist, |SOUP::Cookie.getTypePair);
  }

  proto method get_cookies (|)
    is also<get-cookies>
  { * }

  multi method get_cookies (
     $uri,
     &callback    = Callable,
     $user_data   = gpointer,
    :$cancellable = GCancellable
  ) {
    samewith($uri, $cancellable, &callback, $user_data);
  }
  multi method get_cookies (
    Str()         $uri,
    GCancellable  $cancellable,
                  &callback,
    gpointer      $user_data = gpointer,
                 :$raw       = False
  ) {
    my &ucb = &callback;
    &ucb = sub ($, $c is copy, $p) {
      $c = GIO::AsyncResult.new($c);
      &callback(self, $c, $p);
    } if $raw && &callback;

    webkit_cookie_manager_get_cookies(
      $!wcm,
      $uri,
      $cancellable,
      &ucb,
      $user_data
    );
  }

  method get_cookies_finish (
    GAsyncResult()           $result,
    CArray[Pointer[GError]]  $error   = gerror,
                            :$raw     = False,
                            :$glist   = False
  )
    is also<get-cookies-finish>
  {
    clear_error;
    my $l = webkit_cookie_manager_get_cookies_finish($!wcm, $result, $error);
    set_error($error);
    returnGList($l, $raw, $glist, |SOUP::Cookie.getTypePair)
  }

  proto method replace_cookies (|)
    is also<replace-cookies>
  { * }

  multi method replace_cookies (
     @cookies,
     &callback     = Callable,
     $user_data    = gpointer,
    :$cancellable  = GCancellable
  ) {
    samewith(
      GLib::GList.new(@cookies, typed => SoupCookie),
      $cancellable,
      &callback,
      $user_data
    );
  }
  multi method replace_cookies (
    GList()         $cookies,
    GCancellable()  $cancellable,
                    &callback,
    gpointer        $user_data    = gpointer,
                   :$raw          = False
  ) {
    my &ucb = &callback;
    &ucb = sub ($, $c is copy, $p) {
      $c = GIO::AsyncResult.new($c);
      &callback(self, $c, $p);
    } if $raw && &callback;

    webkit_cookie_manager_replace_cookies(
      $!wcm,
      $cookies,
      $cancellable,
      &ucb,
      $user_data
    );
  }

  method replace_cookies_finish (
    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error    = gerror
  )
    is also<replace-cookies-finish>
  {
    clear_error;
    my $rv = so webkit_cookie_manager_replace_cookies_finish(
      $!wcm,
      $result,
      $error
    );
    set_error($error);
    $rv;
  }

  method set_accept_policy (Int() $policy) is also<set-accept-policy> {
    my WebKitCookieAcceptPolicy $p = $policy;

    webkit_cookie_manager_set_accept_policy($!wcm, $p);
  }

  method set_persistent_storage (Str() $filename, Int() $storage) is also<set-persistent-storage> {
    my WebKitCookiePersistentStorage $s = $storage;

    webkit_cookie_manager_set_persistent_storage($!wcm, $filename, $s);
  }

}
