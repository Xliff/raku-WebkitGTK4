use v6.c;

use Method::Also;

use WebKit::Raw::Types:ver<4>;
use WebKit::Raw::UserContentManager:ver<4>;

use GLib::Roles::Implementor;
use GLib::Roles::Object;
use WebKit::Roles::Signals::UserContentManager;

our subset WebKitUserContentManagerAncestry is export of Mu
  where WebKitUserContentManager | GObject;

class WebKit::UserContentManager:ver<4> {
  also does GLib::Roles::Object;
  also does WebKit::Roles::Signals::UserContentManager;

  has WebKitUserContentManager $!wucm is implementor;

  submethod BUILD ( :$webkit-cont-mgr ) {
    self.setWebKitUserContentManager($webkit-cont-mgr) if $webkit-cont-mgr
  }

  method setWebKitUserContentManager (WebKitUserContentManagerAncestry $_) {
    my $to-parent;

    $!wucm = do {
      when WebKitUserContentManager {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WebKitUserContentManager, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Webkit::Raw::Definitions::WebKitUserContentManager
    is also<WebKitUserContentManager>
  { $!wucm }

  multi method new (
    $webkit-cont-mgr where * ~~ WebKitUserContentManagerAncestry,

    :$ref = True
  ) {
    return unless $webkit-cont-mgr;

    my $o = self.bless( :$webkit-cont-mgr );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $webkit-cont-mgr = webkit_user_content_manager_new();

    $webkit-cont-mgr ?? self.bless( :$webkit-cont-mgr ) !! Nil
  }

  # WebKitUserContentManager, JSCValue, gpointer --> void
  method Script-Message-Received {
    self.connect-script-message-received($!wucm);
  }

  # WebKitUserContentManager, JSCValue, WebKitScriptMessageReply, gpointer --> gboolean
  method Script-Message-With-Reply-Received {
    self.connect-script-message-with-reply-received($!wucm);
  }

  method add_filter (WebKitUserContentFilter() $filter) is also<add-filter> {
    webkit_user_content_manager_add_filter($!wucm, $filter);
  }

  method add_script (WebKitUserScript() $script) is also<add-script> {
    webkit_user_content_manager_add_script($!wucm, $script);
  }

  method add_style_sheet (WebKitUserStyleSheet() $stylesheet)
    is also<add-style-sheet>
  {
    webkit_user_content_manager_add_style_sheet($!wucm, $stylesheet);
  }

  method register_script_message_handler (
    Str() $name,
    Str() $world_name = Str
  )
    is also<register-script-message-handler>
  {
    webkit_user_content_manager_register_script_message_handler(
      $!wucm,
      $name,
      $world_name
    );
  }

  method register_script_message_handler_with_reply (
    Str() $name,
    Str() $world_name = Str
  )
    is also<register-script-message-handler-with-reply>
  {
    webkit_user_content_manager_register_script_message_handler_with_reply(
      $!wucm,
      $name,
      $world_name
    );
  }

  method remove_all_filters is also<remove-all-filters> {
    webkit_user_content_manager_remove_all_filters($!wucm);
  }

  method remove_all_scripts is also<remove-all-scripts> {
    webkit_user_content_manager_remove_all_scripts($!wucm);
  }

  method remove_all_style_sheets is also<remove-all-style-sheets> {
    webkit_user_content_manager_remove_all_style_sheets($!wucm);
  }

  method remove_filter (WebKitUserContentFilter() $filter)
    is also<remove-filter>
  {
    webkit_user_content_manager_remove_filter($!wucm, $filter);
  }

  method remove_filter_by_id (Str() $filter_id) is also<remove-filter-by-id> {
    webkit_user_content_manager_remove_filter_by_id($!wucm, $filter_id);
  }

  method remove_script (WebKitUserScript() $script) is also<remove-script> {
    webkit_user_content_manager_remove_script($!wucm, $script);
  }

  method remove_style_sheet (WebKitUserStyleSheet() $stylesheet)
    is also<remove-style-sheet>
  {
    webkit_user_content_manager_remove_style_sheet($!wucm, $stylesheet);
  }

  method unregister_script_message_handler (
    Str() $name,
    Str() $world_name = Str
  )
    is also<unregister-script-message-handler>
  {
    webkit_user_content_manager_unregister_script_message_handler(
      $!wucm,
      $name,
      $world_name
    );
  }

}
