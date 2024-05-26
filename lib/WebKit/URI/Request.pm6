use v6.c;

use NativeCall;

use SOUP::Raw::Definitions;
use WebKit::Raw::Types;

use SOUP::MessageHeaders;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

class WebKit::URI::Request {
  also does GLib::Roles::Object;

  has WebKitURIRequest $!wur is implementor;

  multi method new (Str() $uri) {
    my $webkit-uri-req = webkit_uri_request_new($uri);

    $webkit-uri-req ?? self.bless( :$webkit-uri-req ) !! Nil;
  }

  method get_http_headers ( :$raw = False ) {
    propReturnObject(
      webkit_uri_request_get_http_headers($!wur),
      $raw,
      |Soup::Message::Headers.getTypePair
    );
  }

  method get_http_method {
    webkit_uri_request_get_http_method($!wur);
  }

  method get_uri {
    webkit_uri_request_get_uri($!wur);
  }

  method set_uri (
    WebKitURIRequest() $request,
    Str()              $uri
  ) {
    webkit_uri_request_set_uri($!wur, $uri);
  }

}

### /usr/include/webkitgtk-6.0/webkit/WebKitURIRequest.h

sub webkit_uri_request_get_http_headers (WebKitURIRequest $request)
  returns SoupMessageHeaders
  is      native(webkit)
  is      export
{ * }

sub webkit_uri_request_get_http_method (WebKitURIRequest $request)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_uri_request_get_uri (WebKitURIRequest $request)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_uri_request_new (Str $uri)
  returns WebKitURIRequest
  is      native(webkit)
  is      export
{ * }

sub webkit_uri_request_set_uri (
  WebKitURIRequest $request,
  Str              $uri
)
  is      native(webkit)
  is      export
{ * }
