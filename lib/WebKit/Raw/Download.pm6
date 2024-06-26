use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use WebKit::Raw::Definitions;

unit package WebKit::Raw::Download;

### /usr/include/webkitgtk-6.0/webkit/WebKitDownload.h

sub webkit_download_cancel (WebKitDownload $download)
  is      native(webkit)
  is      export
{ * }

sub webkit_download_get_allow_overwrite (WebKitDownload $download)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_download_get_destination (WebKitDownload $download)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_download_get_elapsed_time (WebKitDownload $download)
  returns gdouble
  is      native(webkit)
  is      export
{ * }

sub webkit_download_get_estimated_progress (WebKitDownload $download)
  returns gdouble
  is      native(webkit)
  is      export
{ * }

sub webkit_download_get_received_data_length (WebKitDownload $download)
  returns guint64
  is      native(webkit)
  is      export
{ * }

sub webkit_download_get_request (WebKitDownload $download)
  returns WebKitURIRequest
  is      native(webkit)
  is      export
{ * }

sub webkit_download_get_response (WebKitDownload $download)
  returns WebKitURIResponse
  is      native(webkit)
  is      export
{ * }

sub webkit_download_get_web_view (WebKitDownload $download)
  returns WebKitWebView
  is      native(webkit)
  is      export
{ * }

sub webkit_download_set_allow_overwrite (
  WebKitDownload $download,
  gboolean       $allowed
)
  is      native(webkit)
  is      export
{ * }

sub webkit_download_set_destination (
  WebKitDownload $download,
  Str            $destination
)
  is      native(webkit)
  is      export
{ * }
