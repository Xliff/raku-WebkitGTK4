use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use WebKit::Raw::Definitions;



### /usr/include/webkitgtk-6.0/webkit/WebKitWebResource.h

sub webkit_web_resource_get_data (
  WebKitWebResource   $resource,
  GCancellable        $cancellable,
  GAsyncReadyCallback $callback,
  gpointer            $user_data
) 
  is      native(webkit)
  is      export
{ * }

sub webkit_web_resource_get_data_finish (
  WebKitWebResource       $resource,
  GAsyncResult            $result,
  gsize                   $length,
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

