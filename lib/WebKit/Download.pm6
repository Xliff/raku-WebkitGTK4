use v6.c;

use Method::Also;

use WebKit::Raw::Types;
use WebKit::Raw::Download;

use WebKit::URI::Response:ver<4>;
use WebKit::URI::Request:ver<4>;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset WebKitDownloadAncestry is export of Mu
  where WebKitDownload | GObject;

class WebKit::Download:ver<4> {
  also does GLib::Roles::Object;

  has WebKitDownload $!wd is implementor;

  submethod BUILD ( :$webkit-download ) {
    self.setWebKitDownload($webkit-download) if $webkit-download
  }

  method setWebKitDownload (WebKitDownloadAncestry $_) {
    my $to-parent;

    $!wd = do {
      when WebKitDownload {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WebKitDownload, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Webkit::Raw::Definitions::WebKitDownload
    is also<WebKitDownload>
  { $!wd }

  method new (
    $webkit-download where * ~~ WebKitDownloadAncestry,

    :$ref = True
  ) {
    return unless $webkit-download;

    my $o = self.bless( :$webkit-download );
    $o.ref if $ref;
    $o;
  }

  # Type: boolean
  method allow-overwrite is also<allow_overwrite> is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('allow-overwrite', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('allow-overwrite', $gv);
      }
    );
  }

  # Type: string
  method destination is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('destination', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        warn 'destination does not allow writing'
      }
    );
  }

  # Type: double
  method estimated-progress
    is also<estimated_progress>
    is rw
    is g-property
  {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('estimated-progress', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        warn 'estimated-progress does not allow writing'
      }
    );
  }

  # Type: WebKitUriResponse
  method response ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( WebKit::URI::Response.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('response', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |WebKit::URI::Response.getTypePair
        );
      },
      STORE => -> $,  $val is copy {
        warn 'response does not allow writing'
      }
    );
  }

  method Created-Destination {
    self.connect-string($!wd, 'created-destination');
  }

  method Decide-Destination {
    self.connect-string($!wd, 'decide-destination');
  }

  method Failed {
    self.connect-error($!wd, 'failed');
  }

  method Finished {
    self.connect($!wd, 'finished');
  }

  method Received-Data {
    self.connect-ulong($!wd, 'received-data');
  }

  method cancel {
    webkit_download_cancel($!wd);
  }

  method get_allow_overwrite
    is also<get-allow-overwrite>
  {
    so webkit_download_get_allow_overwrite($!wd);
  }

  method get_destination
    is also<get-destination>
  {
    webkit_download_get_destination($!wd);
  }

  method get_elapsed_time
    is also<
      get-elapsed-time
      elapsed_time
      elapsed-time
    >
  {
    webkit_download_get_elapsed_time($!wd);
  }

  method get_estimated_progress
    is also<get-estimated-progress>
  {
    webkit_download_get_estimated_progress($!wd);
  }

  method get_received_data_length
    is also<
      get-received-data-length
      received_data_length
      received-data-length
      data_length
      data-length
    >
  {
    webkit_download_get_received_data_length($!wd);
  }

  method get_request ( :$raw = False )
    is also<
      get-request
      request
    >
  {
    propReturnObject(
      webkit_download_get_request($!wd),
      $raw,
      |WebKit::URI::Request.getTypePair
    )
  }

  method get_response ( :$raw = False )
    is also<get-response>
  {
    propReturnObject(
      webkit_download_get_response($!wd),
      $raw,
      |WebKit::URI::Response.getTypePair
    )
  }

  method get_web_view ( :$raw = False )
    is also<
      get-web-view
      web_view
      web-view
    >
  {
    propReturnObject(
      webkit_download_get_web_view($!wd),
      $raw,
      |::('WebKit::Web::View').getTypePair
    );
  }

  method set_allow_overwrite (Int() $allowed) is also<set-allow-overwrite> {
    my gboolean $a = $allowed.so.Int;

    webkit_download_set_allow_overwrite($!wd, $a);
  }

  method set_destination (Str() $destination) is also<set-destination> {
    webkit_download_set_destination($!wd, $destination);
  }

}
