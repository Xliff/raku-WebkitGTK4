use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use WebKit::Raw::Definitions;

unit package WebKit::Raw::Security::Origin;

### /usr/include/webkitgtk-6.0/webkit/WebKitSecurityOrigin.h

sub webkit_security_origin_get_host (WebKitSecurityOrigin $origin)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_security_origin_get_port (WebKitSecurityOrigin $origin)
  returns guint16
  is      native(webkit)
  is      export
{ * }

sub webkit_security_origin_get_protocol (WebKitSecurityOrigin $origin)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_security_origin_get_type
  returns GType
  is      native(webkit)
  is      export
{ * }

sub webkit_security_origin_new (
  Str     $protocol,
  Str     $host,
  guint16 $port
)
  returns WebKitSecurityOrigin
  is      native(webkit)
  is      export
{ * }

sub webkit_security_origin_new_for_uri (Str $uri)
  returns WebKitSecurityOrigin
  is      native(webkit)
  is      export
{ * }

sub webkit_security_origin_ref (WebKitSecurityOrigin $origin)
  returns WebKitSecurityOrigin
  is      native(webkit)
  is      export
{ * }

sub webkit_security_origin_to_string (WebKitSecurityOrigin $origin)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_security_origin_unref (WebKitSecurityOrigin $origin)
  is      native(webkit)
  is      export
{ * }
