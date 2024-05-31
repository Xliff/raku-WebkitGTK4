use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GIO::Raw::Definitions;
use GDK::Raw::Definitions:ver<4>;
use WebKit::Raw::Definitions:ver<4>;

unit package WebKit::Raw::WebKitFaviconDatabase;

### /usr/include/webkitgtk-6.0/webkit/WebKitFaviconDatabase.h

sub webkit_favicon_database_clear (WebKitFaviconDatabase $database)
  is      native(webkit)
  is      export
{ * }

sub webkit_favicon_database_error_quark
  returns GQuark
  is      native(webkit)
  is      export
{ * }

sub webkit_favicon_database_get_favicon (
  WebKitFaviconDatabase $database,
  Str                   $page_uri,
  GCancellable          $cancellable,
                        &callback (
                          WebKitFaviconDatabase,
                          GAsyncResult,
                          gpointer
                        ),
  gpointer              $user_data
)
  is      native(webkit)
  is      export
{ * }

sub webkit_favicon_database_get_favicon_finish (
  WebKitFaviconDatabase   $database,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns GdkTexture
  is      native(webkit)
  is      export
{ * }

sub webkit_favicon_database_get_favicon_uri (
  WebKitFaviconDatabase $database,
  Str                   $page_uri
)
  returns Str
  is      native(webkit)
  is      export
{ * }
