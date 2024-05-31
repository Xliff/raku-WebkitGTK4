use v6.c;

use NativeCall;

use WebKit::Raw::Types;

use GLib::Object::Supplyish;

use WebKit::ScriptMessageReply;

role WebKit::Roles::Signals::UserContentManager {
  has %!signals-wucm;

  # WebKitUserContentManager, JSCValue, gpointer --> void
  method connect-script-message-received (
     $obj,
     $signal    is copy = 'script-message-received',
     &handler?,
    :$detail,
    :$raw       = False
  ) {
    my $hid;
    $signal ~= "::{ $detail }" if $detail;

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
    :$detail,

    :$raw       = False
  ) {
    my $hid;

    $signal ~= "::{ $detail }" if $detail;
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

}

# WebKitUserContentManager, JSCValue, gpointer --> void
sub g-connect-script-message-received (
  Pointer $app,
  Str     $name,
          &handler (WebKitUserContentManager, JSCValue, gpointer),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native(gobject)
  is      symbol('g_signal_connect_object')
{ * }

# WebKitUserContentManager, JSCValue, WebKitScriptMessageReply, gpointer --> gboolean
sub g-connect-script-message-with-reply-received (
  Pointer $app,
  Str     $name,
          &handler (WebKitUserContentManager, JSCValue, WebKitScriptMessageReply, gpointer --> gboolean),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native(gobject)
  is      symbol('g_signal_connect_object')
{ * }
