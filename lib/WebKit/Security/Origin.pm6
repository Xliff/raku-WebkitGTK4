use v6.c;

use Method::Also;

use WebKit::Raw::Types;
use WebKit::Raw::Security::Origin;

use GLib::Roles::Implementor;

class WebKit::Security::Origin {
  has WebKitSecurityOrigin $!wso is implementor;

  submethod BUILD ( :$webkit-sec-orig ) {
    $!wso = $webkit-sec-orig;
  }

  method WebKit::Raw::Definitions::WebKitSecurityOrigin
    is also<WebKitSecurityOrigin>
  { $!wso }

  method new (Str() $protocol, Str() $host, Int() $port) {
    my guint16 $p = $port;

    my $webkit-sec-orig = webkit_security_origin_new($!wso, $host, $p);

    $webkit-sec-orig ?? self.bless( :$webkit-sec-orig ) !! Nil;
  }

  method new_for_uri (Str() $uri) is also<new-for-uri> {
    my $webkit-sec-orig = webkit_security_origin_new_for_uri($uri);

    $webkit-sec-orig ?? self.bless( :$webkit-sec-orig ) !! Nil;
  }

  method get_host
    is also<
      get-host
      host
    >
  {
    webkit_security_origin_get_host($!wso);
  }

  method get_port
    is also<
      get-port
      port
    >
  {
    webkit_security_origin_get_port($!wso);
  }

  method get_protocol
    is also<
      get-protocol
      protocol
    >
  {
    webkit_security_origin_get_protocol($!wso);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &webkit_security_origin_get_type, $n, $t );
  }

  method ref {
    webkit_security_origin_ref($!wso);
    self;
  }

  method to_string is also<to-string> {
    webkit_security_origin_to_string($!wso);
  }

  method unref {
    webkit_security_origin_unref($!wso);
  }

}
