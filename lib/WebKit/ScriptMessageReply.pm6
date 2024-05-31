use v6.c;

use Method::Also;

use WebKit::Raw::Types;
use WebKit::Raw::UserContentManager;

use GLib::Roles::Implementor;

# BOXED

class WebKit::ScriptMessageReply {
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
