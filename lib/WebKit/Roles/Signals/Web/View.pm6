use v6.c;

use NativeCall;

use WebKit::Raw::Types;

use WebKit::HitTestResult:ver<4>;

use GLib::Object::Supplyish;

role WebKit::Roles::Signals::Web::View {
  has %!signals-wv;

  # WebKitWebView, WebKitAuthenticationRequest, gpointer --> gboolean
  method connect-authenticate (
     $obj,
     $signal    = 'authenticate',
     &handler?,
    :$raw       = False
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-authenticate($obj, $signal,
        -> $, $wkar, $p {
          CATCH {
            default { .message.say; 𝒮.note($_) }
          }

          # Insert object code HERE!
          unless $raw {
          }

          𝒮.emit( [self, $wkar, $p] );
        },
        Pointer, 0
      );
      [ create-signal-supply(𝒮, %!signals-wv, $signal), $obj, $hid ];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitContextMenu, WebKitHitTestResult, gpointer --> gboolean
  method connect-context-menu (
     $obj,
     $signal    = 'context-menu',
     &handler?,
    :$raw       = False
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-context-menu($obj, $signal,
        -> $, $wkcm, $wkhtr, $p {
          CATCH {
            default { .message.say; 𝒮.note($_) }
          }

          # Insert object code HERE!
          unless $raw {

          }

          𝒮.emit( [self, $wkcm, $wkhtr, $p] );
        },
        Pointer, 0
      );
      [ create-signal-supply(𝒮, %!signals-wv, $signal), $obj, $hid ];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitNavigationAction, gpointer --> GtkWidget
  method connect-create (
     $obj,
     $signal    = 'create',
     &handler?,
    :$raw       = False
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-create($obj, $signal,
        -> $, $wkna, $p {
          CATCH {
            default { .message.say; 𝒮.note($_) }
          }

          # Insert object code HERE!
          unless $raw {
          }

          𝒮.emit( [self, $wkna, $p] );
        },
        Pointer, 0
      );
      [ create-signal-supply(𝒮, %!signals-wv, $signal), $obj, $hid ];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitPolicyDecision, WebKitPolicyDecisionType, gpointer --> gboolean
  method connect-decide-policy (
     $obj,
     $signal    = 'decide-policy',
     &handler?,
    :$raw       = False
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-decide-policy($obj, $signal,
        -> $, $wkpd, $wkpdt, $p {
          CATCH {
            default { .message.say; 𝒮.note($_) }
          }

          # Insert object code HERE!
          unless $raw {
          }

          𝒮.emit( [self, $wkpd, $wkpdt, $p] );
        },
        Pointer, 0
      );
      [ create-signal-supply(𝒮, %!signals-wv, $signal), $obj, $hid ];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitInsecureContentEvent, gpointer --> void
  method connect-insecure-content-detected (
     $obj,
     $signal    = 'insecure-content-detected',
     &handler?,
    :$raw       = False
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-insecure-content-detected($obj, $signal,
        -> $, $wkice, $p {
          CATCH {
            default { .message.say; 𝒮.note($_) }
          }

          # Insert object code HERE!
          unless $raw {
          }

          𝒮.emit( [self, $wkice, $p] );
        },
        Pointer, 0
      );
      [ create-signal-supply(𝒮, %!signals-wv, $signal), $obj, $hid ];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitLoadEvent, gpointer --> void
  method connect-load-changed (
     $obj,
     $signal    = 'load-changed',
     &handler?,
    :$raw       = False
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-load-changed($obj, $signal,
        -> $, $wkle, $p {
          CATCH {
            default { .message.say; 𝒮.note($_) }
          }

          # Insert object code HERE!
          unless $raw {
          }

          𝒮.emit( [self, $wkle, $p] );
        },
        Pointer, 0
      );
      [ create-signal-supply(𝒮, %!signals-wv, $signal), $obj, $hid ];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitLoadEvent, Str, GError, gpointer --> gboolean
  method connect-load-failed (
     $obj,
     $signal    = 'load-failed',
     &handler?,
    :$raw       = False
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-load-failed($obj, $signal,
        -> $, $wkle, $c, $G, $p {
          CATCH {
            default { .message.say; 𝒮.note($_) }
          }

          # Insert object code HERE!
          unless $raw {
          }

          𝒮.emit( [self, $wkle, $c, $G, $p] );
        },
        Pointer, 0
      );
      [ create-signal-supply(𝒮, %!signals-wv, $signal), $obj, $hid ];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, Str, GTlsCertificate, GTlsCertificateFlags, gpointer --> gboolean
  method connect-load-failed-with-tls-errors (
     $obj,
     $signal    = 'load-failed-with-tls-errors',
     &handler?,
    :$raw       = False
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-load-failed-with-tls-errors($obj, $signal,
        -> $, $c, $tc, $tcf, $p {
          CATCH {
            default { .message.say; 𝒮.note($_) }
          }

          # Insert object code HERE!
          unless $raw {
          }

          𝒮.emit( [self, $c, $tc, $tcf, $p] );
        },
        Pointer, 0
      );
      [ create-signal-supply(𝒮, %!signals-wv, $signal), $obj, $hid ];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitHitTestResult, guint, gpointer --> void
  method connect-mouse-target-changed (
     $obj,
     $signal    = 'mouse-target-changed',
     &handler?,
    :$raw       = False
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-mouse-target-changed($obj, $signal,
        -> $, $wkhtr is copy, $u, $p {
          CATCH {
            default { .message.say; 𝒮.note($_) }
          }

          unless $raw {
            $wkhtr = WebKit::HitTestResult.new($wkhtr);
          }

          𝒮.emit( [self, $wkhtr, $u, $p] );
        },
        Pointer, 0
      );
      [ create-signal-supply(𝒮, %!signals-wv, $signal), $obj, $hid ];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitPermissionRequest, gpointer --> gboolean
  method connect-permission-request (
     $obj,
     $signal    = 'permission-request',
     &handler?,
    :$raw       = False
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-permission-request($obj, $signal,
        -> $, $wkpr, $p {
          CATCH {
            default { .message.say; 𝒮.note($_) }
          }

          # Insert object code HERE!
          unless $raw {
          }

          𝒮.emit( [self, $wkpr, $p] );
        },
        Pointer, 0
      );
      [ create-signal-supply(𝒮, %!signals-wv, $signal), $obj, $hid ];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitPrintOperation, gpointer --> gboolean
  method connect-print (
     $obj,
     $signal    = 'print',
     &handler?,
    :$raw       = False
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-print($obj, $signal,
        -> $, $wkpo, $p {
          CATCH {
            default { .message.say; 𝒮.note($_) }
          }

          # Insert object code HERE!
          unless $raw {
          }

          𝒮.emit( [self, $wkpo, $p] );
        },
        Pointer, 0
      );
      [ create-signal-supply(𝒮, %!signals-wv, $signal), $obj, $hid ];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitPermissionStateQuery, gpointer --> gboolean
  method connect-query-permission-state (
     $obj,
     $signal    = 'query-permission-state',
     &handler?,
    :$raw       = False
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-query-permission-state($obj, $signal,
        -> $, $wkpsq, $p {
          CATCH {
            default { .message.say; 𝒮.note($_) }
          }

          # Insert object code HERE!
          unless $raw {
          }

          𝒮.emit( [self, $wkpsq, $p] );
        },
        Pointer, 0
      );
      [ create-signal-supply(𝒮, %!signals-wv, $signal), $obj, $hid ];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitWebResource, WebKitURIRequest, gpointer --> void
  method connect-resource-load-started (
     $obj,
     $signal    = 'resource-load-started',
     &handler?,
    :$raw       = False
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-resource-load-started($obj, $signal,
        -> $, $wkwr, $wku, $p {
          CATCH {
            default { .message.say; 𝒮.note($_) }
          }

          # Insert object code HERE!
          unless $raw {
          }

          𝒮.emit( [self, $wkwr, $wku, $p] );
        },
        Pointer, 0
      );
      [ create-signal-supply(𝒮, %!signals-wv, $signal), $obj, $hid ];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitColorChooserRequest, gpointer --> gboolean
  method connect-run-color-chooser (
     $obj,
     $signal    = 'run-color-chooser',
     &handler?,
    :$raw       = False
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-run-color-chooser($obj, $signal,
        -> $, $wkccr, $p {
          CATCH {
            default { .message.say; 𝒮.note($_) }
          }

          # Insert object code HERE!
          unless $raw {
          }

          𝒮.emit( [self, $wkccr, $p] );
        },
        Pointer, 0
      );
      [ create-signal-supply(𝒮, %!signals-wv, $signal), $obj, $hid ];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitFileChooserRequest, gpointer --> gboolean
  method connect-run-file-chooser (
     $obj,
     $signal    = 'run-file-chooser',
     &handler?,
    :$raw       = False
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-run-file-chooser($obj, $signal,
        -> $, $wkfcr, $p {
          CATCH {
            default { .message.say; 𝒮.note($_) }
          }

          # Insert object code HERE!
          unless $raw {
          }

          𝒮.emit( [self, $wkfcr, $p] );
        },
        Pointer, 0
      );
      [ create-signal-supply(𝒮, %!signals-wv, $signal), $obj, $hid ];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitScriptDialog, gpointer --> gboolean
  method connect-script-dialog (
     $obj,
     $signal    = 'script-dialog',
     &handler?,
    :$raw       = False
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-script-dialog($obj, $signal,
        -> $, $wksd, $p {
          CATCH {
            default { .message.say; 𝒮.note($_) }
          }

          # Insert object code HERE!
          unless $raw {
          }

          𝒮.emit( [self, $wksd, $p] );
        },
        Pointer, 0
      );
      [ create-signal-supply(𝒮, %!signals-wv, $signal), $obj, $hid ];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitNotification, gpointer --> gboolean
  method connect-show-notification (
     $obj,
     $signal    = 'show-notification',
     &handler?,
    :$raw       = False
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-show-notification($obj, $signal,
        -> $, $wkn, $p {
          CATCH {
            default { .message.say; 𝒮.note($_) }
          }

          # Insert object code HERE!
          unless $raw {
          }

          𝒮.emit( [self, $wkn, $p] );
        },
        Pointer, 0
      );
      [ create-signal-supply(𝒮, %!signals-wv, $signal), $obj, $hid ];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitOptionMenu, GdkRectangle, gpointer --> gboolean
  method connect-show-option-menu (
     $obj,
     $signal    = 'show-option-menu',
     &handler?,
    :$raw       = False
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-show-option-menu($obj, $signal,
        -> $, $wkom, $gr, $p {
          CATCH {
            default { .message.say; 𝒮.note($_) }
          }

          # Insert object code HERE!
          unless $raw {
          }

          𝒮.emit( [self, $wkom, $gr, $p] );
        },
        Pointer, 0
      );
      [ create-signal-supply(𝒮, %!signals-wv, $signal), $obj, $hid ];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitFormSubmissionRequest, gpointer --> void
  method connect-submit-form (
     $obj,
     $signal    = 'submit-form',
     &handler?,
    :$raw       = False
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-submit-form($obj, $signal,
        -> $, $wkfsr, $p {
          CATCH {
            default { .message.say; 𝒮.note($_) }
          }

          # Insert object code HERE!
          unless $raw {
          }

          𝒮.emit( [self, $wkfsr, $p] );
        },
        Pointer, 0
      );
      [ create-signal-supply(𝒮, %!signals-wv, $signal), $obj, $hid ];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitUserMessage, gpointer --> gboolean
  method connect-user-message-received (
     $obj,
     $signal    = 'user-message-received',
     &handler?,
    :$raw       = False
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-user-message-received($obj, $signal,
        -> $, $wkum, $p {
          CATCH {
            default { .message.say; 𝒮.note($_) }
          }

          # Insert object code HERE!
          unless $raw {
          }

          𝒮.emit( [self, $wkum, $p] );
        },
        Pointer, 0
      );
      [ create-signal-supply(𝒮, %!signals-wv, $signal), $obj, $hid ];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitWebProcessTerminationReason, gpointer --> void
  method connect-web-process-terminated (
     $obj,
     $signal    = 'web-process-terminated',
     &handler?,
    :$raw       = False
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-web-process-terminated($obj, $signal,
        -> $, $wkwptr, $p {
          CATCH {
            default { .message.say; 𝒮.note($_) }
          }

          # Insert object code HERE!
          unless $raw {
          }

          𝒮.emit( [self, $wkwptr, $p] );
        },
        Pointer, 0
      );
      [ create-signal-supply(𝒮, %!signals-wv, $signal), $obj, $hid ];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

}

# WebKitWebView, WebKitAuthenticationRequest, gpointer --> gboolean
sub g-connect-authenticate (
  Pointer $app,
  Str     $name,
          &handler (
            WebKitWebView,
            WebKitAuthenticationRequest,
            gpointer
            --> gboolean
          ),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native(gobject)
  is      symbol('g_signal_connect_object')
{ * }

# WebKitWebView, WebKitContextMenu, WebKitHitTestResult, gpointer --> gboolean
sub g-connect-context-menu (
  Pointer $app,
  Str     $name,
          &handler (
            WebKitWebView,
            WebKitContextMenu,
            WebKitHitTestResult,
            gpointer
            --> gboolean
          ),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native(gobject)
  is      symbol('g_signal_connect_object')
{ * }

# WebKitWebView, WebKitNavigationAction, gpointer --> GtkWidget
sub g-connect-create (
  Pointer $app,
  Str     $name,
          &handler (
            WebKitWebView,
            WebKitNavigationAction,
            gpointer
            --> GtkWidget
          ),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native(gobject)
  is      symbol('g_signal_connect_object')
{ * }

# WebKitWebView, WebKitPolicyDecision, WebKitPolicyDecisionType, gpointer --> gboolean
sub g-connect-decide-policy (
  Pointer $app,
  Str     $name,
          &handler (
            WebKitWebView,
            WebKitPolicyDecision,
            WebKitPolicyDecisionType,
            gpointer
            --> gboolean
          ),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native(gobject)
  is      symbol('g_signal_connect_object')
{ * }

# WebKitWebView, WebKitInsecureContentEvent, gpointer --> void
sub g-connect-insecure-content-detected (
  Pointer $app,
  Str     $name,
          &handler (WebKitWebView, WebKitInsecureContentEvent, gpointer),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native(gobject)
  is      symbol('g_signal_connect_object')
{ * }

# WebKitWebView, WebKitLoadEvent, gpointer --> void
sub g-connect-load-changed (
  Pointer $app,
  Str     $name,
          &handler (WebKitWebView, WebKitLoadEvent, gpointer),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native(gobject)
  is      symbol('g_signal_connect_object')
{ * }

# WebKitWebView, WebKitLoadEvent, Str, GError, gpointer --> gboolean
sub g-connect-load-failed (
  Pointer $app,
  Str     $name,
          &handler (
            WebKitWebView,
            WebKitLoadEvent,
            Str,
            GError,
            gpointer
            --> gboolean
          ),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native(gobject)
  is      symbol('g_signal_connect_object')
{ * }

# WebKitWebView, Str, GTlsCertificate, GTlsCertificateFlags, gpointer --> gboolean
sub g-connect-load-failed-with-tls-errors (
  Pointer $app,
  Str     $name,
          &handler (
            WebKitWebView,
            Str,
            GTlsCertificate,
            GTlsCertificateFlags,
            gpointer
            --> gboolean
          ),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native(gobject)
  is      symbol('g_signal_connect_object')
{ * }

# WebKitWebView, WebKitHitTestResult, guint, gpointer --> void
sub g-connect-mouse-target-changed (
  Pointer $app,
  Str     $name,
          &handler (WebKitWebView, WebKitHitTestResult, guint, gpointer),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native(gobject)
  is      symbol('g_signal_connect_object')
{ * }

# WebKitWebView, WebKitPermissionRequest, gpointer --> gboolean
sub g-connect-permission-request (
  Pointer $app,
  Str     $name,
          &handler (
            WebKitWebView,
            WebKitPermissionRequest,
            gpointer
            --> gboolean
          ),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native(gobject)
  is      symbol('g_signal_connect_object')
{ * }

# WebKitWebView, WebKitPrintOperation, gpointer --> gboolean
sub g-connect-print (
  Pointer $app,
  Str     $name,
          &handler (
            WebKitWebView,
            WebKitPrintOperation,
            gpointer
            --> gboolean
          ),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native(gobject)
  is      symbol('g_signal_connect_object')
{ * }

# WebKitWebView, WebKitPermissionStateQuery, gpointer --> gboolean
sub g-connect-query-permission-state (
  Pointer $app,
  Str     $name,
          &handler (
            WebKitWebView,
            WebKitPermissionStateQuery,
            gpointer
            --> gboolean
          ),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native(gobject)
  is      symbol('g_signal_connect_object')
{ * }

# WebKitWebView, WebKitWebResource, WebKitURIRequest, gpointer --> void
sub g-connect-resource-load-started (
  Pointer $app,
  Str     $name,
          &handler (
            WebKitWebView,
            WebKitWebResource,
            WebKitURIRequest,
            gpointer
          ),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native(gobject)
  is      symbol('g_signal_connect_object')
{ * }

# WebKitWebView, WebKitColorChooserRequest, gpointer --> gboolean
sub g-connect-run-color-chooser (
  Pointer $app,
  Str     $name,
          &handler (
            WebKitWebView,
            WebKitColorChooserRequest,
            gpointer
            --> gboolean
          ),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native(gobject)
  is      symbol('g_signal_connect_object')
{ * }

# WebKitWebView, WebKitFileChooserRequest, gpointer --> gboolean
sub g-connect-run-file-chooser (
  Pointer $app,
  Str     $name,
          &handler (
            WebKitWebView,
            WebKitFileChooserRequest,
            gpointer
            --> gboolean
          ),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native(gobject)
  is      symbol('g_signal_connect_object')
{ * }

# WebKitWebView, WebKitScriptDialog, gpointer --> gboolean
sub g-connect-script-dialog (
  Pointer $app,
  Str     $name,
          &handler (WebKitWebView, WebKitScriptDialog, gpointer --> gboolean),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native(gobject)
  is      symbol('g_signal_connect_object')
{ * }

# WebKitWebView, WebKitNotification, gpointer --> gboolean
sub g-connect-show-notification (
  Pointer $app,
  Str     $name,
          &handler (WebKitWebView, WebKitNotification, gpointer --> gboolean),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native(gobject)
  is      symbol('g_signal_connect_object')
{ * }

# WebKitWebView, WebKitOptionMenu, GdkRectangle, gpointer --> gboolean
sub g-connect-show-option-menu (
  Pointer $app,
  Str     $name,
          &handler (
            WebKitWebView,
            WebKitOptionMenu,
            GdkRectangle,
            gpointer
            --> gboolean
          ),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native(gobject)
  is      symbol('g_signal_connect_object')
{ * }

# WebKitWebView, WebKitFormSubmissionRequest, gpointer --> void
sub g-connect-submit-form (
  Pointer $app,
  Str     $name,
          &handler (WebKitWebView, WebKitFormSubmissionRequest, gpointer),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native(gobject)
  is      symbol('g_signal_connect_object')
{ * }

# WebKitWebView, WebKitUserMessage, gpointer --> gboolean
sub g-connect-user-message-received (
  Pointer $app,
  Str     $name,
          &handler (
            WebKitWebView,
            WebKitUserMessage,
            gpointer
            --> gboolean
          ),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native(gobject)
  is      symbol('g_signal_connect_object')
{ * }

# WebKitWebView, WebKitWebProcessTerminationReason, gpointer --> void
sub g-connect-web-process-terminated (
  Pointer $app,
  Str     $name,
          &handler (
            WebKitWebView,
            WebKitWebProcessTerminationReason,
            gpointer
          ),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native(gobject)
  is      symbol('g_signal_connect_object')
{ * }
