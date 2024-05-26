use v6.c;

use Method::Also;

use WebKit::Raw::Types;
use WebKit::Raw::URI::Response;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset WebKitURIResponseAncestry is export of Mu
  where WebKitURIResponse | GObject;

class WebKit::URI::Response {
  also does GLib::Roles::Object;

  has WebKitURIResponse $!wur is implementor;

  submethod BUILD ( :$webkit-uri-resp ) {
    self.setWebKitURIResponse($webkit-uri-resp) if $webkit-uri-resp
  }

  method setWebKitURIResponse (WebKitURIResponseAncestry $_) {
    my $to-parent;

    $!wur = do {
      when WebKitURIResponse {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WebKitURIResponse, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Webkit::Raw::Definitions::WebKitURIResponse
    is also<WebKitURIResponse>
  { $!wur }

  method new (
    $webkit-uri-resp where * ~~ WebKitURIResponseAncestry,

    :$ref = True
  ) {
    return unless $webkit-uri-resp;

    my $o = self.bless( :$webkit-uri-resp );
    $o.ref if $ref;
    $o;
  }

  method get_content_length is also<get-content-length> {
    webkit_uri_response_get_content_length($!wur);
  }

  method get_http_headers ( :$raw = False ) is also<get-http-headers> {
    propReturnObject(
      webkit_uri_response_get_http_headers($!wur),
      $raw,
      |SOUP::MessageHeaders.getTypePair
    );
  }

  method get_mime_type is also<get-mime-type> {
    webkit_uri_response_get_mime_type($!wur);
  }

  method get_status_code is also<get-status-code> {
    webkit_uri_response_get_status_code($!wur);
  }

  method get_suggested_filename is also<get-suggested-filename> {
    webkit_uri_response_get_suggested_filename($!wur);
  }

  method get_uri is also<get-uri> {
    webkit_uri_response_get_uri($!wur);
  }

}
