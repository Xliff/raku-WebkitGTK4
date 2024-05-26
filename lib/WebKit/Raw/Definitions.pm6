use v6.c;

use NativeCall;

use GLib::Raw::Definitions;

use GLib::Roles::Pointers;

unit package WebKit::Raw::Definitions;

constant webkit is export = 'webkitgtk-6.0',v4;

class JSCValue                                    is export is repr<CPointer> does GLib::Roles::Pointers { }

constant WebKitEditorState is export := guint;

class WebKitBackForwardList                       is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitBackForwardListItem                   is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitDownload                              is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitFindController                        is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitInputMethodContext                    is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitNetworkSession                        is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitSettings                              is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitURIRequest                            is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitURIResponse                           is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitUserContentManager                    is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitUserMessage                           is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitWebContext                            is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitWebInspector                          is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitWebResource                           is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitWebView                               is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitWebViewSessionState                   is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitWebsitePolicies                       is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitWindowProperties                      is export is repr<CPointer> does GLib::Roles::Pointers { }
