use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use SOUP::Raw::Definitions;    # cw: Relaxes the 50 line limit, since not in ::Raw::Types
use WebKit::Raw::Definitions;

unit package WebKit::Raw::URI::Response;

### /usr/include/webkitgtk-6.0/webkit/WebKitURIResponse.h

sub webkit_uri_response_get_content_length (WebKitURIResponse $response)
  returns guint64
  is      native(webkit)
  is      export
{ * }

sub webkit_uri_response_get_http_headers (WebKitURIResponse $response)
  returns SoupMessageHeaders
  is      native(webkit)
  is      export
{ * }

sub webkit_uri_response_get_mime_type (WebKitURIResponse $response)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_uri_response_get_status_code (WebKitURIResponse $response)
  returns guint
  is      native(webkit)
  is      export
{ * }

sub webkit_uri_response_get_suggested_filename (WebKitURIResponse $response)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_uri_response_get_uri (WebKitURIResponse $response)
  returns Str
  is      native(webkit)
  is      export
{ * }
