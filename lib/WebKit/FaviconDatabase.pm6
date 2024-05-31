use v6.c;

use Method::Also;
use NativeCall;

use GLib::Raw::Traits;
use WebKit::Raw::Types:ver<4>;
use WebKit::Raw::FaviconDatabase:ver<4>;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset WebKitFaviconDatabaseAncestry is export of Mu
  where WebKitFaviconDatabase | GObject;

class WebKit::FaviconDatabase:ver<4> {
  also does GLib::Roles::Object;

  has WebKitFaviconDatabase $!wfd is implementor;

  submethod BUILD ( :$webkit-fav-db ) {
    self.setWebKitFaviconDatabase($webkit-fav-db) if $webkit-fav-db
  }

  method setWebKitFaviconDatabase (WebKitFaviconDatabaseAncestry $_) {
    my $to-parent;

    $!wfd = do {
      when WebKitFaviconDatabase {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WebKitFaviconDatabase, $_);
      }
    }
    self!setObject($to-parent);
  }

  method WebKit::Raw::Definitions::WebKitFaviconDatabase
    is also<WebKitFaviconDatabase>
  { $!wfd }

  multi method new (
    $webkit-fav-db where * ~~ WebKitFaviconDatabaseAncestry,

    :$ref = True
  ) {
    return unless $webkit-fav-db;

    my $o = self.bless( :$webkit-fav-db );
    $o.ref if $ref;
    $o;
  }

  method clear {
    webkit_favicon_database_clear($!wfd);
  }

  method error_quark is static is also<error-quark> {
    webkit_favicon_database_error_quark();
  }

  proto method get_favicon (|)
    is also<get-favicon>
  { * }

  multi method get_favicon (
     $page_uri,
     &callback,
     $user_data   = gpointer,
    :$cancellable = GCancellable,
    :$raw         = False
  ) {
    samewith(
       $page_uri,
       $cancellable,
       &callback,
       $user_data,
      :$raw
    );
  }
  multi method get_favicon (
    Str()           $page_uri,
    GCancellable()  $cancellable,
                    &callback,
    gpointer        $user_data    = gpointer,
                   :$raw          = False
  ) {
    my &ucb = $raw
      ?? &callback
      !! sub ($, $r is copy, $p) {
        $r = GIO::AsyncResult($r);
        &callback(self, $r, $p)
      }

    webkit_favicon_database_get_favicon(
      $!wfd,
      $page_uri,
      $cancellable,
      &ucb,
      $user_data
    );
  }

  method get_favicon_finish (
    GAsyncResult()           $result,
    CArray[Pointer[GError]]  $error   = gerror,
                            :$raw     = False
  )
    is also<get-favicon-finish>
  {
    clear_error;
    my $t = webkit_favicon_database_get_favicon_finish(
      $!wfd,
      $result,
      $error
    );
    set_error($error);
    propReturnObject($t, $raw, |GDK::Texture.getTypePair)
  }

  method get_favicon_uri (Str() $page_uri) is also<get-favicon-uri> {
    webkit_favicon_database_get_favicon_uri($!wfd, $page_uri);
  }

}
