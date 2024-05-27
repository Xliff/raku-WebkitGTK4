use v6.c;

use NativeCall;
use Method::Also;

use WebKit::Raw::Types:ver<4>;
use WebKit::URI::Response:ver<4>;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset WebKitWebResourceAncestry is export of Mu
  where WebKitWebResource | GObject;

class WebKit::Web::Resource {
  also does GLib::Roles::Object;

  has WebKitWebResource $!wwr is implementor;

  submethod BUILD ( :$webkit-web-r ) {
    self.setWebKitWebResource($webkit-web-r) if $webkit-web-r
  }

  method setWebKitWebResource (WebKitWebResourceAncestry $_) {
    my $to-parent;

    $!wwr = do {
      when WebKitWebResource {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WebKitWebResource, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Webkit::Raw::Definitions::WebKitWebResource
    is also<WebKitWebResource>
  { $!wwr }

  multi method new (
    $webkit-web-r where * ~~ WebKitWebResourceAncestry,

    :$ref = True
  ) {
    return unless $webkit-web-r;

    my $o = self.bless( :$webkit-web-r );
    $o.ref if $ref;
    $o;
  }

  proto method get_data (|)
    is also<get-data>
  { * }

  multi method get_data (
    &callback,
    $user_data   = gpointer,
   :$cancellable = GCancellable
  ) {
    samewith(
      $cancellable,
      &callback,
      $user_data
    );
  }
  multi method get_data (
    GCancellable() $cancellable,
                   &callback,
    gpointer       $user_data
  ) {
    webkit_web_resource_get_data($!wwr, $cancellable, &callback, $user_data);
  }

  proto method get_data_finish (|)
    is also<get-data-finish>
  { * }

  multi method get_data_finish ($result, $error, :$all = False) {
    samewith($result, $, $error, :$all);
  }
  multi method get_data_finish (
    GAsyncResult             $result,
                             $length  is rw,
    CArray[Pointer[GError]]  $error,
                            :$all            = False

  ) {
    my gsize $l = 0;

    my $d = webkit_web_resource_get_data_finish($!wwr, $result, $l, $error);
    $length = $l;
    $all.not ?? $d !! ($d, $l);
  }

  method get_response ( :$raw = False ) is also<get-response> {
    propReturnObject(
      webkit_web_resource_get_response($!wwr),
      $raw,
      |WebKit::URI::Response.getTypePair
    );
  }

  method get_uri is also<get-uri> {
    webkit_web_resource_get_uri($!wwr);
  }

}

### /usr/include/webkitgtk-6.0/webkit/WebKitWebResource.h

sub webkit_web_resource_get_data (
  WebKitWebResource   $resource,
  GCancellable        $cancellable,
                      &callback (WebKitWebResource, GAsyncResult, gpointer),
  gpointer            $user_data
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_resource_get_data_finish (
  WebKitWebResource       $resource,
  GAsyncResult            $result,
  gsize                   $length    is rw,
  CArray[Pointer[GError]] $error
)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_web_resource_get_response (WebKitWebResource $resource)
  returns WebKitURIResponse
  is      native(webkit)
  is      export
{ * }

sub webkit_web_resource_get_uri (WebKitWebResource $resource)
  returns Str
  is      native(webkit)
  is      export
{ * }
