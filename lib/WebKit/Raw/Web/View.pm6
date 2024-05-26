use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GDK::Raw::Definitions:ver<4>;
use GDK::Raw::Structs:ver<4>;
use GIO::Raw::Definitions;
use GIO::Raw::Enums;
use GIO::Raw::Structs;
use WebKit::Raw::Definitions;
use WebKit::Raw::Enums;

unit package WebKit::Raw::WebView:ver<4>;

### /usr/include/webkitgtk-6.0/webkit/WebKitWebView.h

sub webkit_web_view_call_async_javascript_function (
  WebKitWebView       $web_view,
  Str                 $body,
  gssize              $length,
  GVariant            $arguments,
  Str                 $world_name,
  Str                 $source_uri,
  GCancellable        $cancellable,
                      &callback (WebKitWebView, GAsyncResult, gpointer),
  gpointer            $user_data
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_call_async_javascript_function_finish (
  WebKitWebView           $web_view,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns JSCValue
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_can_execute_editing_command (
  WebKitWebView       $web_view,
  Str                 $command,
  GCancellable        $cancellable,
                      &callback (WebKitWebView, GAsyncResult, gpointer),
  gpointer            $user_data
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_can_execute_editing_command_finish (
  WebKitWebView           $web_view,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_can_go_back (WebKitWebView $web_view)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_can_go_forward (WebKitWebView $web_view)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_can_show_mime_type (
  WebKitWebView $web_view,
  Str           $mime_type
)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_download_uri (
  WebKitWebView $web_view,
  Str           $uri
)
  returns WebKitDownload
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_evaluate_javascript (
  WebKitWebView       $web_view,
  Str                 $script,
  gssize              $length,
  Str                 $world_name,
  Str                 $source_uri,
  GCancellable        $cancellable,
                      &callback (WebKitWebView, GAsyncResult, gpointer),
  gpointer            $user_data
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_evaluate_javascript_finish (
  WebKitWebView           $web_view,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns JSCValue
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_execute_editing_command (
  WebKitWebView $web_view,
  Str           $command
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_execute_editing_command_with_argument (
  WebKitWebView $web_view,
  Str           $command,
  Str           $argument
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_automation_presentation_type (WebKitWebView $web_view)
  returns WebKitAutomationBrowsingContextPresentation
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_back_forward_list (WebKitWebView $web_view)
  returns WebKitBackForwardList
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_background_color (
  WebKitWebView $web_view,
  GdkRGBA       $rgba
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_camera_capture_state (WebKitWebView $web_view)
  returns WebKitMediaCaptureState
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_context (WebKitWebView $web_view)
  returns WebKitWebContext
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_custom_charset (WebKitWebView $web_view)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_default_content_security_policy (WebKitWebView $web_view)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_display_capture_state (WebKitWebView $web_view)
  returns WebKitMediaCaptureState
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_editor_state (WebKitWebView $web_view)
  returns WebKitEditorState
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_estimated_load_progress (WebKitWebView $web_view)
  returns gdouble
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_favicon (WebKitWebView $web_view)
  returns GdkTexture
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_find_controller (WebKitWebView $web_view)
  returns WebKitFindController
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_input_method_context (WebKitWebView $web_view)
  returns WebKitInputMethodContext
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_inspector (WebKitWebView $web_view)
  returns WebKitWebInspector
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_is_muted (WebKitWebView $web_view)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_is_web_process_responsive (WebKitWebView $web_view)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_main_resource (WebKitWebView $web_view)
  returns WebKitWebResource
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_microphone_capture_state (WebKitWebView $web_view)
  returns WebKitMediaCaptureState
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_network_session (WebKitWebView $web_view)
  returns WebKitNetworkSession
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_page_id (WebKitWebView $web_view)
  returns guint64
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_session_state (WebKitWebView $web_view)
  returns WebKitWebViewSessionState
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_settings (WebKitWebView $web_view)
  returns WebKitSettings
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_snapshot (
  WebKitWebView         $web_view,
  WebKitSnapshotRegion  $region,
  WebKitSnapshotOptions $options,
  GCancellable          $cancellable,
                        &callback (WebKitWebView, GAsyncResult, gpointer),
  gpointer              $user_data
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_snapshot_finish (
  WebKitWebView           $web_view,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns GdkTexture
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_title (WebKitWebView $web_view)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_tls_info (
  WebKitWebView           $web_view,
  CArray[GTlsCertificate] $certificate,
  GTlsCertificateFlags    $errors        is rw
)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_uri (WebKitWebView $web_view)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_user_content_manager (WebKitWebView $web_view)
  returns WebKitUserContentManager
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_web_extension_mode (WebKitWebView $web_view)
  returns WebKitWebExtensionMode
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_website_policies (WebKitWebView $web_view)
  returns WebKitWebsitePolicies
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_window_properties (WebKitWebView $web_view)
  returns WebKitWindowProperties
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_get_zoom_level (WebKitWebView $web_view)
  returns gdouble
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_go_back (WebKitWebView $web_view)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_go_forward (WebKitWebView $web_view)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_go_to_back_forward_list_item (
  WebKitWebView             $web_view,
  WebKitBackForwardListItem $list_item
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_is_controlled_by_automation (WebKitWebView $web_view)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_is_editable (WebKitWebView $web_view)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_is_loading (WebKitWebView $web_view)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_is_playing_audio (WebKitWebView $web_view)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_load_alternate_html (
  WebKitWebView $web_view,
  Str           $content,
  Str           $content_uri,
  Str           $base_uri
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_load_bytes (
  WebKitWebView $web_view,
  GBytes        $bytes,
  Str           $mime_type,
  Str           $encoding,
  Str           $base_uri
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_load_html (
  WebKitWebView $web_view,
  Str           $content,
  Str           $base_uri
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_load_plain_text (
  WebKitWebView $web_view,
  Str           $plain_text
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_load_request (
  WebKitWebView    $web_view,
  WebKitURIRequest $request
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_load_uri (
  WebKitWebView $web_view,
  Str           $uri
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_new
  returns WebKitWebView
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_reload (WebKitWebView $web_view)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_reload_bypass_cache (WebKitWebView $web_view)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_restore_session_state (
  WebKitWebView             $web_view,
  WebKitWebViewSessionState $state
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_save (
  WebKitWebView       $web_view,
  WebKitSaveMode      $save_mode,
  GCancellable        $cancellable,
                      &callback (WebKitWebView, GAsyncResult, gpointer),
  gpointer            $user_data
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_save_finish (
  WebKitWebView           $web_view,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns GInputStream
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_save_to_file (
  WebKitWebView  $web_view,
  GFile          $file,
  WebKitSaveMode $save_mode,
  GCancellable   $cancellable,
                 &callback (WebKitWebView, GAsyncResult, gpointer),
  gpointer       $user_data
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_save_to_file_finish (
  WebKitWebView           $web_view,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_send_message_to_page (
  WebKitWebView     $web_view,
  WebKitUserMessage $message,
  GCancellable      $cancellable,
                    &callback (WebKitWebView, GAsyncResult, gpointer),
  gpointer          $user_data
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_send_message_to_page_finish (
  WebKitWebView           $web_view,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns WebKitUserMessage
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_set_background_color (
  WebKitWebView $web_view,
  GdkRGBA       $rgba
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_set_camera_capture_state (
  WebKitWebView           $web_view,
  WebKitMediaCaptureState $state
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_set_cors_allowlist (
  WebKitWebView $web_view,
  CArray[Str]   $allowlist
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_set_custom_charset (
  WebKitWebView $web_view,
  Str           $charset
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_set_display_capture_state (
  WebKitWebView           $web_view,
  WebKitMediaCaptureState $state
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_set_editable (
  WebKitWebView $web_view,
  gboolean      $editable
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_set_input_method_context (
  WebKitWebView            $web_view,
  WebKitInputMethodContext $context
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_set_is_muted (
  WebKitWebView $web_view,
  gboolean      $muted
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_set_microphone_capture_state (
  WebKitWebView           $web_view,
  WebKitMediaCaptureState $state
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_set_settings (
  WebKitWebView  $web_view,
  WebKitSettings $settings
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_set_zoom_level (
  WebKitWebView $web_view,
  gdouble       $zoom_level
)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_stop_loading (WebKitWebView $web_view)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_terminate_web_process (WebKitWebView $web_view)
  is      native(webkit)
  is      export
{ * }

sub webkit_web_view_try_close (WebKitWebView $web_view)
  is      native(webkit)
  is      export
{ * }
