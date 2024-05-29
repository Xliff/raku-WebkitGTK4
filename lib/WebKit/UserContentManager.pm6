use v6.c;

use Method::Also;

use WebKit::Raw::Types:ver<4>;
use WebKit::Raw::UserContentManager:ver<4>;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset WebKitUserContentManagerAncestry is export of Mu
  where WebKitUserContentManager | GObject;

class WebKit::UserContentManager:ver<4> {
  also does GLib::Roles::Object;

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

# BOXED

class WebKit::Script::Message::Reply {
  also does GLib::Roles::Implementor;

  has WebKitScriptMessageReply $!wsmr is implementor;

  submethod BUILD ( :$webkit-script-reply ) {
    $!wsmr = $webkit-script-reply if $webkit-script-reply;
  }

  method new (WebKitScriptMessageReply $webkit-script-reply, :$ref = True) {
    my $o = $webkit-script-reply ?? self.bless( :$webkit-script-reply )
                                 !! Nil;

    $o.ref if $o && $ref;
    $o;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &webkit_script_message_reply_get_type,
      $n,
      $t
    );
  }

  method ref {
    webkit_script_message_reply_ref($!wsmr);
    self;
  }

  method return_error_message (Str() $error_message)
    is also<return-error-message>
  {
    webkit_script_message_reply_return_error_message($!wsmr, $error_message);
  }

  method return_value (JSCValue() $reply_value) is also<return-value> {
    webkit_script_message_reply_return_value($!wsmr, $reply_value);
  }

  method unref {
    webkit_script_message_reply_unref($!wsmr);
  }

}
