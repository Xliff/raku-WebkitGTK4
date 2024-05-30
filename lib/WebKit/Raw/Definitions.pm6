use v6.c;

use NativeCall;

use GLib::Raw::Definitions;

use GLib::Roles::Pointers;

unit package WebKit::Raw::Definitions;

constant webkit is export = 'webkitgtk-6.0',v4;

sub WebKit4-Distribution is export is DistributionProvider {
  $?DISTRIBUTION;
}

class JSCValue                                    is export is repr<CPointer> does GLib::Roles::Pointers { }

constant WebKitEditorState is export := guint;

class WebKitAuthenticationRequest                 is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitBackForwardList                       is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitBackForwardListItem                   is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitColorChooserRequest                   is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitContextMenu                           is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitCookieManager                         is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitCredential                            is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitDownload                              is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitFaviconDatabase                       is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitFeature                               is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitFeatureList                           is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitFileChooserRequest                    is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitFindController                        is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitFormSubmissionRequest                 is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitGeolocationManager                    is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitHitTestResult                         is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitInputMethodContext                    is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitInputMethodUnderline                  is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitITPFirstParty                         is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitITPThirdParty                         is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitMemoryPressureSettings                is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitNavigationAction                      is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitNetworkProxySettings                  is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitNetworkSession                        is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitNotification                          is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitOptionMenu                            is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitPermissionRequest                     is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitPermissionStateQuery                  is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitPrintOperation                        is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitPolicyDecision                        is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitScriptDialog                          is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitScriptMessageReply                    is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitSecurityManager                       is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitSecurityOrigin                        is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitSettings                              is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitURIRequest                            is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitURIResponse                           is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitURISchemeRequest                      is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitUserContentFilter                     is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitUserContentManager                    is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitUserMessage                           is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitUserScript                            is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitUserStyleSheet                        is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitWebContext                            is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitWebInspector                          is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitWebResource                           is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitWebsiteDataManager                    is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitWebsitePolicies                       is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitWebView                               is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitWebViewSessionState                   is export is repr<CPointer> does GLib::Roles::Pointers { }
class WebKitWindowProperties                      is export is repr<CPointer> does GLib::Roles::Pointers { }
