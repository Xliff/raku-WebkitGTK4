use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use SOUP::Raw::Definitions;
use GIO::Raw::Definitions;
use WebKit::Raw::Definitions;
use WebKit::Raw::Enums;

unit package WebKit::Raw::CookieManager;

### /usr/include/webkitgtk-6.0/webkit/WebKitCookieManager.h

sub webkit_cookie_manager_add_cookie (
  WebKitCookieManager $cookie_manager,
  SoupCookie          $cookie,
  GCancellable        $cancellable,
                      &callback (
                        WebKitCookieManager,
                        GAsyncResult,
                        gpointer
                      ),
  gpointer            $user_data
)
  is      native(webkit)
  is      export
{ * }

sub webkit_cookie_manager_add_cookie_finish (
  WebKitCookieManager     $cookie_manager,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_cookie_manager_delete_cookie (
  WebKitCookieManager $cookie_manager,
  SoupCookie          $cookie,
  GCancellable        $cancellable,
                      &callback (
                        WebKitCookieManager,
                        GAsyncResult,
                        gpointer
                      ),
  gpointer            $user_data
)
  is      native(webkit)
  is      export
{ * }

sub webkit_cookie_manager_delete_cookie_finish (
  WebKitCookieManager     $cookie_manager,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_cookie_manager_get_accept_policy (
  WebKitCookieManager $cookie_manager,
  GCancellable        $cancellable,
                      &callback (
                        WebKitCookieManager,
                        GAsyncResult,
                        gpointer
                      ),
  gpointer            $user_data
)
  is      native(webkit)
  is      export
{ * }

sub webkit_cookie_manager_get_accept_policy_finish (
  WebKitCookieManager     $cookie_manager,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns WebKitCookieAcceptPolicy
  is      native(webkit)
  is      export
{ * }

sub webkit_cookie_manager_get_all_cookies (
  WebKitCookieManager $cookie_manager,
  GCancellable        $cancellable,
                      &callback (
                        WebKitCookieManager,
                        GAsyncResult,
                        gpointer
                      ),
  gpointer            $user_data
)
  is      native(webkit)
  is      export
{ * }

sub webkit_cookie_manager_get_all_cookies_finish (
  WebKitCookieManager     $cookie_manager,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns GList
  is      native(webkit)
  is      export
{ * }

sub webkit_cookie_manager_get_cookies (
  WebKitCookieManager $cookie_manager,
  Str                 $uri,
  GCancellable        $cancellable,
                      &callback (
                        WebKitCookieManager,
                        GAsyncResult,
                        gpointer
                      ),
  gpointer            $user_data
)
  is      native(webkit)
  is      export
{ * }

sub webkit_cookie_manager_get_cookies_finish (
  WebKitCookieManager     $cookie_manager,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns GList
  is      native(webkit)
  is      export
{ * }

sub webkit_cookie_manager_replace_cookies (
  WebKitCookieManager $cookie_manager,
  GList               $cookies,
  GCancellable        $cancellable,
                      &callback (
                        WebKitCookieManager,
                        GAsyncResult,
                        gpointer
                      ),
  gpointer            $user_data
)
  is      native(webkit)
  is      export
{ * }

sub webkit_cookie_manager_replace_cookies_finish (
  WebKitCookieManager     $cookie_manager,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_cookie_manager_set_accept_policy (
  WebKitCookieManager      $cookie_manager,
  WebKitCookieAcceptPolicy $policy
)
  is      native(webkit)
  is      export
{ * }

sub webkit_cookie_manager_set_persistent_storage (
  WebKitCookieManager           $cookie_manager,
  Str                           $filename,
  WebKitCookiePersistentStorage $storage
)
  is      native(webkit)
  is      export
{ * }
