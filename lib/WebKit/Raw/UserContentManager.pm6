use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use WebKit::Raw::Definitions;
use WebKit::Raw::Enums;

unit package WebKit::Raw::UserContentManager;

### /usr/include/webkitgtk-6.0/webkit/WebKitUserContentManager.h

sub webkit_user_content_manager_add_filter (
  WebKitUserContentManager $manager,
  WebKitUserContentFilter  $filter
)
  is      native(webkit)
  is      export
{ * }

sub webkit_user_content_manager_add_script (
  WebKitUserContentManager $manager,
  WebKitUserScript         $script
)
  is      native(webkit)
  is      export
{ * }

sub webkit_user_content_manager_add_style_sheet (
  WebKitUserContentManager $manager,
  WebKitUserStyleSheet     $stylesheet
)
  is      native(webkit)
  is      export
{ * }

sub webkit_user_content_manager_new
  returns WebKitUserContentManager
  is      native(webkit)
  is      export
{ * }

sub webkit_user_content_manager_register_script_message_handler (
  WebKitUserContentManager $manager,
  Str                      $name,
  Str                      $world_name
)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_user_content_manager_register_script_message_handler_with_reply (
  WebKitUserContentManager $manager,
  Str                      $name,
  Str                      $world_name
)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_user_content_manager_remove_all_filters (
  WebKitUserContentManager $manager
)
  is      native(webkit)
  is      export
{ * }

sub webkit_user_content_manager_remove_all_scripts (
  WebKitUserContentManager $manager
)
  is      native(webkit)
  is      export
{ * }

sub webkit_user_content_manager_remove_all_style_sheets (
  WebKitUserContentManager $manager
)
  is      native(webkit)
  is      export
{ * }

sub webkit_user_content_manager_remove_filter (
  WebKitUserContentManager $manager,
  WebKitUserContentFilter  $filter
)
  is      native(webkit)
  is      export
{ * }

sub webkit_user_content_manager_remove_filter_by_id (
  WebKitUserContentManager $manager,
  Str                      $filter_id
)
  is      native(webkit)
  is      export
{ * }

sub webkit_user_content_manager_remove_script (
  WebKitUserContentManager $manager,
  WebKitUserScript         $script
)
  is      native(webkit)
  is      export
{ * }

sub webkit_user_content_manager_remove_style_sheet (
  WebKitUserContentManager $manager,
  WebKitUserStyleSheet     $stylesheet
)
  is      native(webkit)
  is      export
{ * }

sub webkit_user_content_manager_unregister_script_message_handler (
  WebKitUserContentManager $manager,
  Str                      $name,
  Str                      $world_name
)
  is      native(webkit)
  is      export
{ * }

sub webkit_script_message_reply_get_type
  returns GType
  is      native(webkit)
  is      export
{ * }

sub webkit_script_message_reply_ref (
  WebKitScriptMessageReply $script_message_reply
)
  returns WebKitScriptMessageReply
  is      native(webkit)
  is      export
{ * }

sub webkit_script_message_reply_return_error_message (
  WebKitScriptMessageReply $script_message_reply,
  Str                      $error_message
)
  is      native(webkit)
  is      export
{ * }

sub webkit_script_message_reply_return_value (
  WebKitScriptMessageReply $script_message_reply,
  JSCValue                 $reply_value
)
  is      native(webkit)
  is      export
{ * }

sub webkit_script_message_reply_unref (
  WebKitScriptMessageReply $script_message_reply
)
  is      native(webkit)
  is      export
{ * }
