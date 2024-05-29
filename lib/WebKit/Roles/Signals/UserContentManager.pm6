use v6.c;

use NativeCall;

use WebKit::Raw::Types;

use WebKit::ScriptMessageReply;

role WebKit::Roles::Signals::UserContentManager {
  has %!signals-wucm;

  # WebKitUserContentManager, JSCValue, gpointer --> void
  method connect-script-message-received (
     $obj,
     $signal    = 'script-message-received',
     &handler?,
    :$raw       = False
  ) {
    my $hid;
    %!signals-wucm{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-script-message-received($obj, $signal,
        -> $, $J is copy, $p {
          CATCH {
            default { .message.say; 𝒮.note($_) }
          }

          unless $raw {
            $J = JSC::Value.new($J);
          }

          𝒮.emit( [self, $J, $p] );
        },
        Pointer, 0
      );
      [ create-signal-supply(𝒮.Supply, $obj, $signal), $obj, $hid ];
    };
    %!signals-wucm{$signal}[0].tap(&handler) with &handler;
    %!signals-wucm{$signal}[0];
  }

  # WebKitUserContentManager, JSCValue, WebKitScriptMessageReply, gpointer --> gboolean
  method connect-script-message-with-reply-received (
     $obj,
     $signal    = 'script-message-with-reply-received',
     &handler?,
    :$raw       = False
  ) {
    my $hid;
    %!signals-wucm{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-script-message-with-reply-received($obj, $signal,
        -> $, $J is copy, $wksmr is copy, $p {
          CATCH {
            default { .message.say; 𝒮.note($_) }
          }

          unless $raw {
            $J     = JSC::Value.new($J);
            $wksmr = WebKit::ScriptMessageReply.new($wksmr);
          }

          𝒮.emit( [self, $J, $wksmr, $p] );
        },
        Pointer, 0
      );
      [ create-signal-supply(𝒮.Supply, $obj, $signal), $obj, $hid ];
    };
    %!signals-wucm{$signal}[0].tap(&handler) with &handler;
    %!signals-wucm{$signal}[0];
  }
