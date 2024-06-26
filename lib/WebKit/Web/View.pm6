use v6.c;

use Method::Also;
use NativeCall;

use GLib::Raw::Traits;
use WebKit::Raw::Types:ver<4>;
use WebKit::Raw::Web::View:ver<4>;

use GIO::TlsCertificate;
use GDK::RGBA:ver<4>;
use GDK::Texture:ver<4>;
use GTK::Widget:ver<4>;
use WebKit::Download:ver<4>;
use WebKit::BackForwardList:ver<4>;
use WebKit::Web::Inspector:ver<4>;
use WebKit::WindowProperties:ver<4>;

use GLib::Roles::Implementor;
use WebKit::Roles::Signals::Web::View;

our subset WebKitWebViewAncestry is export of Mu
  where WebKitWebView | GtkWidgetAncestry;

class WebKit::Web::View:ver<4> is GTK::Widget:ver<4> {
  also does WebKit::Roles::Signals::Web::View;

  has WebKitWebView $!wv is implementor;

  submethod BUILD ( :$webkit-web-view ) {
    self.setWebKitWebView($webkit-web-view) if $webkit-web-view
  }

  method setWebKitWebView (WebKitWebViewAncestry $_) {
    my $to-parent;

    $!wv = do {
      when WebKitWebView {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WebKitWebView, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Webkit::Raw::Definitions::WebKitWebView
    is also<WebKitWebView>
  { $!wv }

  multi method new (
    $webkit-web-view where * ~~ WebKitWebViewAncestry,

    :$ref = True
  ) {
    return unless $webkit-web-view;

    my $o = self.bless( :$webkit-web-view );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $webkit-web-view = webkit_web_view_new();

    $webkit-web-view ?? self.bless( :$webkit-web-view ) !! Nil;
  }

  # Type: AutomationBrowsingContextPresentation
  method automation-presentation-type ( :$enum = True ) is rw is g-property {
    my $gv = GLib::Value.new( WebKit::Enum::AutomationBrowsingContextPresentation.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('automation-presentation-type', $gv);
        my $v = $gv.enum;
        return $v unless $enum;
        WebKitAutomationBrowsingContextPresentationEnum($v);
      },
      STORE => -> $, Int() $val is copy {
        warn 'automation-presentation-type is a construct-only attribute'
      }
    );
  }

  # Type: MediaCaptureState
  method camera-capture-state ( :$enum = True ) is rw is g-property {
    my $gv = GLib::Value.new( WebKit::Enum::MediaCaptureState.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('camera-capture-state', $gv);
        my $v = $gv.enum;
        return $v unless $enum;
        WebKitMediaCaptureStateEnum($v);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(WebKitMediaCaptureState) = $val;
        self.prop_set('camera-capture-state', $gv);
      }
    );
  }

  # Type: gchar*
  method default-content-security-policy is rw is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('default-content-security-policy', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        warn 'default-content-security-policy is a construct-only attribute'
      }
    );
  }

  # Type: MediaCaptureState
  method display-capture-state ( :$enum = True ) is rw is g-property {
    my $gv = GLib::Value.new( WebKit::Enum::MediaCaptureState.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('display-capture-state', $gv);
        my $v = $gv.enum;
        return $v unless $enum;
        WebKitMediaCaptureStateEnum($v);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(WebKitMediaCaptureState) = $val;
        self.prop_set('display-capture-state', $gv);
      }
    );
  }

  # Type: gboolean
  method editable is rw is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('editable', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('editable', $gv);
      }
    );
  }

  # Type: gdouble
  method estimated-load-progress is rw is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('estimated-load-progress', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        warn 'estimated-load-progress does not allow writing'
      }
    );
  }

  # Type: GdkTexture
  method favicon ( :$raw = False ) is rw is g-property {
    my $gv = GLib::Value.new( GDK::Texture.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('favicon', $gv);
        propReturnObject(
          $gv.object;
          $raw,
          |GDK::Texture.getTypePair
        );
      },
      STORE => -> $,  $val is copy {
        warn 'favicon does not allow writing'
      }
    );
  }


  proto method is_controlled_by_automation (|)
    is also<is-controlled-by-automation>
  { * }

  # Type: gboolean
  multi method is_controlled_by_automation is rw is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('is-controlled-by-automation', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'is-controlled-by-automation is a construct-only attribute'
      }
    );
  }


  proto method is_loading (|)
    is also<is-loading>
  { * }

  # Type: gboolean
  multi method is_loading is rw is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('is-loading', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'is-loading does not allow writing'
      }
    );
  }

  # Type: gboolean
  method is-muted is rw is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('is-muted', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('is-muted', $gv);
      }
    );
  }

  proto method is_playing_audio
    is also<is-playing-audio>
  { * }

  # Type: gboolean
  multi method is_playing_audio is rw is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('is-playing-audio', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'is-playing-audio does not allow writing'
      }
    );
  }

  # Type: gboolean
  method is-web-process-responsive is rw is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('is-web-process-responsive', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'is-web-process-responsive does not allow writing'
      }
    );
  }

  # Type: MediaCaptureState
  method microphone-capture-state ( :$enum = True ) is rw is g-property {
    my $gv = GLib::Value.new( WebKit::Enum::MediaCaptureState.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('microphone-capture-state', $gv);
        my $v = $gv.enum;
        return $v unless $enum;
        WebKitMediaCaptureStateEnum($v);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(WebKitMediaCaptureState) = $val;
        self.prop_set('microphone-capture-state', $gv);
      }
    );
  }

  # Type: NetworkSession
  method network-session ( :$raw = False ) is rw is g-property {
    my $gv = GLib::Value.new( WebKit::NetworkSession.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('network-session', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |WebKit::NetworkSession.getTypePair
        );
      },
      STORE => -> $, $val is copy {
        warn 'network-session is a construct-only attribute'
      }
    );
  }

  # Type: guint64
  method page-id is rw is g-property {
    my $gv = GLib::Value.new( G_TYPE_UINT64 );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('page-id', $gv);
        $gv.uint64;
      },
      STORE => -> $, $val is copy {
        warn 'page-id does not allow writing'
      }
    );
  }

  # Type: WebView
  method related-view ( :$raw = False ) is rw is g-property {
    my $gv = GLib::Value.new( WebKit::WebView.get_type );
    Proxy.new(
      FETCH => sub ($) {

      },
      STORE => -> $, $val is copy {
        warn 'related-view is a construct-only attribute'
      }
    );
  }

  # Type: Settings
  method settings ( :$raw = False ) is rw is g-property {
    my $gv = GLib::Value.new( WebKit::Settings.get_type );
    Proxy.new(
      FETCH => sub ($) {

      },
      STORE => -> $, $val is copy {
        $gv.object = $val;
        self.prop_set('settings', $gv);
      }
    );
  }

  # Type: gchar*
  method title is rw is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('title', $gv);
        $gv.string;
      },
      STORE => -> $, $val is copy {
        warn 'title does not allow writing'
      }
    );
  }

  # Type: gchar*
  method uri is rw is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('uri', $gv);
        $gv.string;
      },
      STORE => -> $, $val is copy {
        warn 'uri does not allow writing'
      }
    );
  }

  # Type: UserContentManager
  method user-content-manager ( :$raw = False ) is rw is g-property {
    my $gv = GLib::Value.new( WebKit::UserContentManager.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('user-content-manager', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |WebKit::UserContentManager.getTypePair
        );
      },
      STORE => -> $, $val is copy {
        warn 'user-content-manager is a construct-only attribute'
      }
    );
  }

  # Type: WebContext
  method web-context ( :$raw = False ) is rw is g-property {
    my $gv = GLib::Value.new( WebKit::WebContext.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('web-context', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |WebKit::WebContext.getTypePair
        );
      },
      STORE => -> $, $val is copy {
        warn 'web-context is a construct-only attribute'
      }
    );
  }

  # Type: WebExtensionMode
  method web-extension-mode ( :$enum = True ) is rw is g-property {
    my $gv = GLib::Value.new( WebKit::Enum::WebExtensionMode.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('web-extension-mode', $gv);
        my $v = $gv.enum;
        return $v unless $enum;
        WebKitWebExtensionModeEnum($v);
      },
      STORE => -> $, $val is copy {
        warn 'web-extension-mode is a construct-only attribute'
      }
    );
  }

  # Type: WebsitePolicies
  method website-policies ( :$raw = False ) is rw is g-property {
    my $gv = GLib::Value.new( WebKit::WebsitePolicies.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('website-policies', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |WebKit::Website::Policies.getTypePair
        );
      },
      STORE => -> $, $val is copy {
        warn 'website-policies is a construct-only attribute'
      }
    );
  }

  # Type: gdouble
  method zoom-level is rw is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('zoom-level', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('zoom-level', $gv);
      }
    );
  }

  # WebKitWebView, WebKitAuthenticationRequest, gpointer --> gboolean
  method Authenticate {
    self.connect-authenticate($!wv);
  }

  # WebKitWebView, gpointer --> void
  method Close {
    self.connect($!wv, 'close');
  }

  # WebKitWebView, WebKitContextMenu, WebKitHitTestResult, gpointer --> gboolean
  method Context-Menu {
    self.connect-context-menu($!wv);
  }

  # WebKitWebView, gpointer --> void
  method Context-Menu-Dismissed {
    self.connect($!wv, 'context-menu-dismissed');
  }

  # WebKitWebView, WebKitNavigationAction, gpointer --> GtkWidget
  method Create {
    self.connect-create($!wv);
  }

  # WebKitWebView, WebKitPolicyDecision, WebKitPolicyDecisionType, gpointer --> gboolean
  method Decide-Policy {
    self.connect-decide-policy($!wv);
  }

  # WebKitWebView, gpointer --> gboolean
  method Enter-Fullscreen {
    self.connect($!wv, 'enter-fullscreen');
  }

  # WebKitWebView, WebKitInsecureContentEvent, gpointer --> void
  method Insecure-Content-Detected {
    self.connect-insecure-content-detected($!wv);
  }

  # WebKitWebView, gpointer --> gboolean
  method Leave-Fullscreen {
    self.connect($!wv, 'leave-fullscreen');
  }

  # WebKitWebView, WebKitLoadEvent, gpointer --> void
  method Load-Changed {
    self.connect-load-changed($!wv);
  }

  # WebKitWebView, WebKitLoadEvent, Str, GError, gpointer --> gboolean
  method Load-Failed {
    self.connect-load-failed($!wv);
  }

  # WebKitWebView, Str, GTlsCertificate, GTlsCertificateFlags, gpointer --> gboolean
  method Load-Failed-With-Tls-Errors {
    self.connect-load-failed-with-tls-errors($!wv);
  }

  # WebKitWebView, WebKitHitTestResult, guint, gpointer --> void
  method Mouse-Target-Changed {
    self.connect-mouse-target-changed($!wv);
  }

  # WebKitWebView, WebKitPermissionRequest, gpointer --> gboolean
  method Permission-Request {
    self.connect-permission-request($!wv);
  }

  # WebKitWebView, WebKitPrintOperation, gpointer --> gboolean
  method Print {
    self.connect-print($!wv);
  }

  # WebKitWebView, WebKitPermissionStateQuery, gpointer --> gboolean
  method Query-Permission-State {
    self.connect-query-permission-state($!wv);
  }

  # WebKitWebView, gpointer --> void
  method Ready-To-Show {
    self.connect($!wv, 'ready-to-show');
  }

  # WebKitWebView, WebKitWebResource, WebKitURIRequest, gpointer --> void
  method Resource-Load-Started {
    self.connect-resource-load-started($!wv);
  }

  # WebKitWebView, gpointer --> void
  method Run-As-Modal {
    self.connect($!wv, 'run-as-modal');
  }

  # WebKitWebView, WebKitColorChooserRequest, gpointer --> gboolean
  method Run-Color-Chooser {
    self.connect-run-color-chooser($!wv);
  }

  # WebKitWebView, WebKitFileChooserRequest, gpointer --> gboolean
  method Run-File-Chooser {
    self.connect-run-file-chooser($!wv);
  }

  # WebKitWebView, WebKitScriptDialog, gpointer --> gboolean
  method Script-Dialog {
    self.connect-script-dialog($!wv);
  }

  # WebKitWebView, WebKitNotification, gpointer --> gboolean
  method Show-Notification {
    self.connect-show-notification($!wv);
  }

  # WebKitWebView, WebKitOptionMenu, GdkRectangle, gpointer --> gboolean
  method Show-Option-Menu {
    self.connect-show-option-menu($!wv);
  }

  # WebKitWebView, WebKitFormSubmissionRequest, gpointer --> void
  method Submit-Form {
    self.connect-submit-form($!wv);
  }

  # WebKitWebView, WebKitUserMessage, gpointer --> gboolean
  method User-Message-Received {
    self.connect-user-message-received($!wv);
  }

  # WebKitWebView, WebKitWebProcessTerminationReason, gpointer --> void
  method Web-Process-Terminated {
    self.connect-web-process-terminated($!wv);
  }

  proto method call_async_javascript_function (|)
    is also<call-async-javascript-function>
  { * }

  multi method call_async_javascript_function (
    Str()           $body,
    gpointer        $user_data                      = gpointer,
    Int()          :l(:$length)                     = -1,
    GVariant()     :a(:$arguments)                  = GVariant,
    Str()          :name(:world-name(:$world_name)) = Str,
    Str()          :uri(:source-uri(:$source_uri))  = Str,
    GCancellable() :$cancellable                    = GCancellable,
                   :&callback                       = Callable
  ) {
    samewith(
      $body,
      $length,
      $arguments,
      $world_name,
      $source_uri,
      $cancellable,
      &callback,
      $user_data
    );
  }

  multi method call_async_javascript_function (
    Str()               $body,
    Int()               $length,
    GVariant()          $arguments,
    Str()               $world_name,
    Str()               $source_uri,
    GCancellable()      $cancellable,
                        &callback,
    gpointer            $user_data
  ) {
    my gssize $l = $length;

    webkit_web_view_call_async_javascript_function(
      $!wv,
      $body,
      $l,
      $arguments,
      $world_name,
      $source_uri,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method call_async_javascript_function_finish (
    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error    = gerror
  )
    is also<call-async-javascript-function-finish>
  {
    clear_error;
    my $rv = webkit_web_view_call_async_javascript_function_finish(
      $!wv,
      $result,
      $error
    );
    set_error($error);
    $rv;
  }

  proto method can_execute_editing_command (|)
    is also<can-execute-editing-command>
  { * }

  multi method can_execute_editing_command (
    Str()            $command,
                     &callback    = Callable,
    gpointer         $user_data   = gpointer,
    GCancellable()  :$cancellable = GCancellable
  ) {
    samewith(
      $command,
      $cancellable,
      &callback,
      $user_data
    );
  }
  multi method can_execute_editing_command (
    Str()           $command,
    GCancellable()  $cancellable,
                    &callback,
    gpointer        $user_data     = gpointer
  ) {
    webkit_web_view_can_execute_editing_command(
      $!wv,
      $command,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method can_execute_editing_command_finish (
    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error   = gerror
  )
    is also<can-execute-editing-command-finish>
  {
    clear_error;
    my $rv = webkit_web_view_can_execute_editing_command_finish(
      $!wv,
      $result,
      $error
    );
    set_error($error);
    $rv;
  }

  method can_go_back is also<can-go-back> {
    so webkit_web_view_can_go_back($!wv);
  }

  method can_go_forward is also<can-go-forward> {
    so webkit_web_view_can_go_forward($!wv);
  }

  method can_show_mime_type (Str() $mime_type) is also<can-show-mime-type> {
    so webkit_web_view_can_show_mime_type($!wv, $mime_type);
  }

  method download_uri (Str() $uri, :$raw = False) is also<download-uri> {
    propReturnObject(
      webkit_web_view_download_uri($!wv, $uri),
      $raw,
      |WebKit::Download.getTypePair
    );
  }

  proto method evaluate_javascript (|)
  { * }

  multi method evaluate_javascript (
    Str()            $script,
    Int()           :l(:$length)                     = -1,
    Str()           :name(:world-name(:$world_name)) = Str,
    Str()           :uri(:source-uri(:$source_uri))  = Str,
    GCancellable()  :$cancellable                    = GCancellable,
                    :&callback                       = Callable,
    gpointer        :data(:$user_data)               = gpointer
  ) {
    samewith(
      $script,
      $length,
      $world_name,
      $source_uri,
      $cancellable,
      &callback,
      $user_data
    );
  }
  multi method evaluate_javascript (
    Str()           $script,
    Int()           $length,
    Str()           $world_name,
    Str()           $source_uri,
    GCancellable()  $cancellable,
                    &callback,
    gpointer        $user_data    = gpointer
  )
    is also<evaluate-javascript>
  {
    my gssize $l = $length;

    webkit_web_view_evaluate_javascript(
      $!wv,
      $script,
      $length,
      $world_name,
      $source_uri,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method evaluate_javascript_finish (
    GAsyncResult()           $result,
    CArray[Pointer[GError]]  $error,
                            :$raw     = False
  )
    is also<evaluate-javascript-finish>
  {
    clear_error;
    my $v = webkit_web_view_evaluate_javascript_finish(
      $!wv,
      $result,
      $error
    );
    set_error($error);
    propReturnObject($v, $raw, |JSC::Value.getTypePair)
  }

  method execute_editing_command (Str() $command)
    is also<execute-editing-command>
  {
    webkit_web_view_execute_editing_command($!wv, $command);
  }

  method execute_editing_command_with_argument (
    Str() $command,
    Str() $argument
  )
    is also<execute-editing-command-with-argument>
  {
    webkit_web_view_execute_editing_command_with_argument(
      $!wv,
      $command,
      $argument
    );
  }

  method get_automation_presentation_type
    is also<get-automation-presentation-type>
  {
    webkit_web_view_get_automation_presentation_type($!wv);
  }

  method get_back_forward_list ( :$raw = False )
    is also<get-back-forward-list>
  {
    propReturnObject(
      webkit_web_view_get_back_forward_list($!wv),
      $raw,
      |WebKit::BackwardForwardList.getTypePair
    );
  }

  proto method get_background_color (|)
    is also<get-background-color>
  { * }

  multi method get_background_color {
    samewith(GdkRGBA.new);
  }
  multi method get_background_color (GdkRGBA() $rgba, :$raw = False) {
    webkit_web_view_get_background_color($!wv, $rgba);
    return $rgba if $raw,
    propReturnObject($rgba, False, |GDK::RGBA.getTypePair);
  }

  method get_camera_capture_state ( :$enum = True )
    is also<get-camera-capture-state>
  {
    my $s = webkit_web_view_get_camera_capture_state($!wv);
    return $s unless $enum;
    WebKitMediaCaptureStateEnum($s);
  }

  method get_context ( :$raw = False ) is also<get-context> {
    propReturnObject(
      webkit_web_view_get_context($!wv),
      $raw,
      |WebKit::Context.getTypePair
    );
  }

  method get_custom_charset is also<get-custom-charset> {
    webkit_web_view_get_custom_charset($!wv);
  }

  method get_default_content_security_policy
    is also<get-default-content-security-policy>
  {
    webkit_web_view_get_default_content_security_policy($!wv);
  }

  method get_display_capture_state ( :$enum = True )
    is also<get-display-capture-state>
  {
    my $s = webkit_web_view_get_display_capture_state($!wv);
    return $s unless $enum;
    WebKitMediaCaptureStateEnum($s);
  }

  method get_editor_state ( :$raw = False ) is also<get-editor-state> {
    propReturnObject(
      webkit_web_view_get_editor_state($!wv),
      $raw,
      |WebKit::Editor::State.getTypePair
    );
  }

  method get_estimated_load_progress is also<get-estimated-load-progress> {
    webkit_web_view_get_estimated_load_progress($!wv);
  }

  method get_favicon ( :$raw = False ) is also<get-favicon> {
    propReturnObject(
      webkit_web_view_get_favicon($!wv),
      $raw,
      |GDK::Texture.getTypePair
    );
  }

  method get_find_controller ( :$raw = False ) is also<get-find-controller> {
    propReturnObject(
      webkit_web_view_get_find_controller($!wv),
      $raw,
      |WebKit::FindController.getTypePair
    );
  }

  method get_input_method_context ( :$raw = False )
    is also<get-input-method-context>
  {
    propReturnObject(
      webkit_web_view_get_input_method_context($!wv),
      $raw,
      |WebKit::InputMethodContext.getTypePair
    );
  }

  method get_inspector ( :$raw = False ) is also<get-inspector> {
    propReturnObject(
      webkit_web_view_get_inspector($!wv),
      $raw,
      |WebKit::Inspector.getTypePair
    );
  }

  method get_is_muted is also<get-is-muted> {
    so webkit_web_view_get_is_muted($!wv);
  }

  method get_is_web_process_responsive
    is also<get-is-web-process-responsive>
  {
    so webkit_web_view_get_is_web_process_responsive($!wv);
  }

  method get_main_resource ( :$raw = False ) is also<get-main-resource> {
    propReturnObject(
      webkit_web_view_get_main_resource($!wv),
      $raw,
      |WebKit::Web::Resource.getTypePair
    );
  }

  method get_microphone_capture_state ( :$enum = False )
    is also<get-microphone-capture-state>
  {
    my $s = webkit_web_view_get_microphone_capture_state($!wv);
    return $s unless $enum;
    WebKitMediaCaptureStateEnum($s);
  }

  method get_network_session ( :$raw = False ) is also<get-network-session> {
    propReturnObject(
      webkit_web_view_get_network_session($!wv),
      $raw,
      |WebKit::NetworkSession.getTypePair
    );
  }

  method get_page_id is also<get-page-id> {
    webkit_web_view_get_page_id($!wv);
  }

  method get_session_state ( :$enum = True ) is also<get-session-state> {
    my $s = webkit_web_view_get_session_state($!wv);
    return $s unless $enum;
    WebKitWeb::ViewSessionState($s);
  }

  method get_settings ( :$raw = False ) is also<get-settings> {
    propReturnObject(
      webkit_web_view_get_settings($!wv),
      $raw,
      |WebKit::Settings.getTypePair
    );
  }

  method get_snapshot (
    Int()          $region,
    Int()          $options,
    GCancellable() $cancellable,
                   &callback,
    gpointer       $user_data    = gpointer
  )
    is also<get-snapshot>
  {
    my WebKitSnapshotRegion  $r = $region;
    my WebKitSnapshotOptions $o = $options;

    webkit_web_view_get_snapshot(
      $!wv,
      $r,
      $o,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method get_snapshot_finish (
    GAsyncResult()           $result,
    CArray[Pointer[GError]]  $error   = gerror,
                            :$raw     =  False
  )
    is also<get-snapshot-finish>
  {
    clear_error;
    my $t = webkit_web_view_get_snapshot_finish($!wv, $result, $error);
    set_error($error);
    propReturnObject($t, $raw, |GDK::Texture.getTypePair);
  }

  method get_title is also<get-title> {
    webkit_web_view_get_title($!wv);
  }

  proto method get_tls_info (|)
    is also<get-tls-info>
  { * }

  multi method get_tls_info {
    samewith( newCArray(GTlsCertificate), $ );
  }
  multi method get_tls_info (
    CArray[GTlsCertificate]  $certificate,
                             $errors       is rw,
                            :$all                = False,
                            :$raw                = False
  ) {
    my GTlsCertificateFlags $e = 0;

    webkit_web_view_get_tls_info($!wv, $certificate, $e);
    $errors = $e;

    my $c = propReturnObject(
      ppr($certificate),
      $raw,
      |GIO::TlsCertificate.getTypePair
    );

    $all.not ?? $c !! ($c, $errors);
  }

  method get_uri is also<get-uri> {
    webkit_web_view_get_uri($!wv);
  }

  method get_user_content_manager ( :$raw = False )
    is also<get-user-content-manager>
  {
    propReturnObject(
      webkit_web_view_get_user_content_manager($!wv),
      $raw,
      |WebKit::User::ContentManager.getTypePair
    );
  }

  method get_web_extension_mode ( :$enum = True )
    is also<get-web-extension-mode>
  {
    my $m = webkit_web_view_get_web_extension_mode($!wv);
    return $m unless $enum;
    WebKitWebExtensionModeEnum($m);
  }

  method get_website_policies ( :$raw = False )
    is also<get-website-policies>
  {
    propReturnObject(
      webkit_web_view_get_website_policies($!wv),
      $raw,
      |WebKit::WebSite::Policies.getTypePair
    );
  }

  method get_window_properties ( :$raw = False )
    is also<get-window-properties>
  {
    propReturnObject(
      webkit_web_view_get_window_properties($!wv),
      $raw,
      |WebKit::WindowProperties.getTypePair
    );
  }

  method get_zoom_level is also<get-zoom-level> {
    webkit_web_view_get_zoom_level($!wv);
  }

  method go_back is also<go-back> {
    webkit_web_view_go_back($!wv);
  }

  method go_forward is also<go-forward> {
    webkit_web_view_go_forward($!wv);
  }

  method go_to_back_forward_list_item (
    WebKitBackForwardListItem() $list_item
  )
    is also<go-to-back-forward-list-item>
  {
    webkit_web_view_go_to_back_forward_list_item($!wv, $list_item);
  }

  multi method is_controlled_by_automation ( :m(:$method) is required ) {
    so webkit_web_view_is_controlled_by_automation($!wv);
  }

  method is_editable is also<is-editable> {
    so webkit_web_view_is_editable($!wv);
  }

  multi method is_loading ( :m(:$method) is required ) {
    so webkit_web_view_is_loading($!wv);
  }

  multi method is_playing_audio ( :m(:$method) is required ) {
    so webkit_web_view_is_playing_audio($!wv);
  }

  method load_alternate_html (
    Str() $content,
    Str() $content_uri,
    Str() $base_uri
  )
    is also<load-alternate-html>
  {
    webkit_web_view_load_alternate_html(
      $!wv,
      $content,
      $content_uri,
      $base_uri
    );
  }

  method load_bytes (
    GBytes()        $bytes,
    Str()           $mime_type,
    Str()           $encoding,
    Str()           $base_uri
  )
    is also<load-bytes>
  {
    webkit_web_view_load_bytes(
      $!wv,
      $bytes,
      $mime_type,
      $encoding,
      $base_uri
    );
  }

  method load_html (Str() $content, Str() $base_uri) is also<load-html> {
    webkit_web_view_load_html($!wv, $content, $base_uri);
  }

  method load_plain_text (Str() $plain_text) is also<load-plain-text> {
    webkit_web_view_load_plain_text($!wv, $plain_text);
  }

  method load_request (WebKitURIRequest() $request) is also<load-request> {
    webkit_web_view_load_request($!wv, $request);
  }

  method load_uri (Str() $uri) is also<load-uri> {
    webkit_web_view_load_uri($!wv, $uri);
  }

  method reload {
    webkit_web_view_reload($!wv);
  }

  method reload_bypass_cache is also<reload-bypass-cache> {
    webkit_web_view_reload_bypass_cache($!wv);
  }

  method restore_session_state (Int() $state)
    is also<restore-session-state>
  {
    my WebKitWebViewSessionState $s = $state;

    webkit_web_view_restore_session_state($!wv, $s);
  }

  multi method save (
    Int()         $save_mode   = WEBKIT_SAVE_MODE_MHTML,
    GCancellable :$cancellable = GCancellable,
                 :&callback    = Callable,
    gpointer     :$user_data   = gpointer
  ) {
    samewith(
      $save_mode,
      $cancellable,
      &callback,
      $user_data
    )
  }
  multi method save (
    Int()        $save_mode,
    GCancellable $cancellable,
                 &callback,
    gpointer     $user_data
  ) {
    my WebKitSaveMode $s = $save_mode;
    webkit_web_view_save($!wv, $s, $cancellable, &callback, $user_data);
  }

  method save_finish (
    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error    = gerror
  )
    is also<save-finish>
  {
    clear_error;
    my $rv = webkit_web_view_save_finish($!wv, $result, $error);
    set_error($error);
    $rv;
  }

  proto method save_to_file (|)
    is also<save-to-file>
  { * }

  multi method save_to_file (
    GFile()         $file,
    Int()           $save_mode                    = WEBKIT_SAVE_MODE_MHTML,
    GCancellable() :$cancellable                  = GCancellable,
                   :&callback                     = Callable,
    gpointer       :data(:user-data(:$user_data)) = gpointer
  ) {
    samewith(
      $file,
      $save_mode,
      $cancellable,
      &callback,
      $user_data
    );
  }
  multi method save_to_file (
    GFile()        $file,
    Int()          $save_mode,
    GCancellable() $cancellable,
                   &callback,
    gpointer       $user_data    = gpointer
  ) {
    my WebKitSaveMode $s = $save_mode;

    webkit_web_view_save_to_file(
      $!wv,
      $file,
      $save_mode,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method save_to_file_finish (
    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error   = gerror
  )
    is also<save-to-file-finish>
  {
    clear_error
    my $rv = webkit_web_view_save_to_file_finish($!wv, $result, $error);
    set_error($error);
    $rv;
  }

  proto method send_message_to_page (|)
    is also<send-message-to-page>
  { * }

  multi method send_message_to_page (
    WebKitUserMessage()  $message,
    GCancellable()      :$cancellable = GCancellable,
                        :&callback    = Callable,
    gpointer            :$user_data   = gpointer
  ) {
    samewith(
      $message,
      $cancellable,
      &callback,
      $user_data
    );
  }
  multi method send_message_to_page (
    WebKitUserMessage() $message,
    GCancellable()      $cancellable,
                        &callback,
    gpointer            $user_data    = gpointer
  ) {
    webkit_web_view_send_message_to_page(
      $!wv,
      $message,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method send_message_to_page_finish (
    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error   = gerror
  )
    is also<send-message-to-page-finish>
  {
    clear_error;
    my $rv = webkit_web_view_send_message_to_page_finish(
      $!wv,
      $result,
      $error
    );
    set_error($error);
    $rv;
  }

  method set_background_color (GdkRGBA() $rgba)
    is also<set-background-color>
  {
    webkit_web_view_set_background_color($!wv, $rgba);
  }

  method set_camera_capture_state (Int() $state)
    is also<set-camera-capture-state>
  {
    my WebKitMediaCaptureState $s = $state;

    webkit_web_view_set_camera_capture_state($!wv, $s);
  }

  proto method set_cors_allowlist (|)
    is also<set-cors-allowlist>
  { * }

  multi method set_cors_allowlist (@list) {
    samewith( newCArray(Str, @list) );
  }
  multi method set_cors_allowlist (CArray[Str] $allowlist) {
    webkit_web_view_set_cors_allowlist($!wv, $allowlist);
  }

  method set_custom_charset (Str() $charset) is also<set-custom-charset> {
    webkit_web_view_set_custom_charset($!wv, $charset);
  }

  method set_display_capture_state (Int() $state)
    is also<set-display-capture-state>
  {
    my WebKitMediaCaptureState $s = $state;

    webkit_web_view_set_display_capture_state($!wv, $s);
  }

  method set_editable (Int() $editable) is also<set-editable> {
    my gboolean $e = $editable.so.Int;

    webkit_web_view_set_editable($!wv, $editable);
  }

  method set_input_method_context (Int() $context)
    is also<set-input-method-context>
  {
    my WebKitInputMethodContext $c = $context;

    webkit_web_view_set_input_method_context($!wv, $c);
  }

  method set_is_muted (Int() $muted) is also<set-is-muted> {
    my gboolean $m = $muted.so.Int;

    webkit_web_view_set_is_muted($!wv, $muted);
  }

  method set_microphone_capture_state (Int() $state)
    is also<set-microphone-capture-state>
  {
    my WebKitMediaCaptureState $s = $state;

    webkit_web_view_set_microphone_capture_state($!wv, $s);
  }

  method set_settings (WebKitSettings() $settings) is also<set-settings> {
    webkit_web_view_set_settings($!wv, $settings);
  }

  method set_zoom_level (Num() $zoom_level) is also<set-zoom-level> {
    my gdouble $z = $zoom_level;

    webkit_web_view_set_zoom_level($!wv, $z);
  }

  method stop_loading is also<stop-loading> {
    webkit_web_view_stop_loading($!wv);
  }

  method terminate_web_process is also<terminate-web-process> {
    webkit_web_view_terminate_web_process($!wv);
  }

  method try_close is also<try-close> {
    webkit_web_view_try_close($!wv);
  }

}
