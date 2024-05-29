use v6.c;

use NativeCall;

use WebKit::Raw::Types;
use GDK::Raw::Events:ver<4>;
use WebKit::Raw::InputMethodContext;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

class WebKit::InputMethod::Underline {
  has WebKitInputMethodUnderline $!wimu is implementor;

  submethod BUILD ( :$webkit-input-u ) {
    $!wimu = $webkit-input-u if $webkit-input-u;
  }

  method Webkit::Raw::Definitions::WebKitInputMethodUnderline
    is also<WebKitInputMethodUnderline>
  { $!wimu }

  multi method new (
    WebKitInputMethodUnderline  $webkit-input-u,
                               :$ref             = True
  ) {
    my $o = $webkit-input-u ?? self.bless( :$webkit-input-u ) !! Nil;
    $o.ref if $ref;
    $o;
  }
  multi method new (Int() $start_offset, Int() $end_offset) {
    my guint ($s, $e) = ($start_offset, $end_offset);

    my $webkit-input-u = webkit_input_method_underline_new($s, $e);

    $webkit-input-u ?? self.bless( :$webkit-input-u ) !! Nil;
  }

  method copy ( :$raw = False ) {
    propReturnObject(
      webkit_input_method_underline_copy($!wimu),
      $raw,
      |self.getTypePair,
      :!ref
    )
  }

  method free {
    webkit_input_method_underline_free($!wimu);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &webkit_input_method_underline_get_type,
      $n,
      $t
    );
  }

  method set_color (GdkRGBA() $rgba) {
    webkit_input_method_underline_set_color($!wimu, $rgba);
  }

}

our subset WebKitInputMethodContextAncestry is export of Mu
  where WebKitInputMethodContext | GObject;

class WebKit::InputMethodContext {
  also does GLib::Roles::Object;

  has WebKitInputMethodContext $!wimc is implementor;

  submethod BUILD ( :$webkit-input-context ) {
    self.setWebKitInputMethodContext($webkit-input-context)
      if $webkit-input-context
  }

  method setWebKitInputMethodContext (WebKitInputMethodContextAncestry $_) {
    my $to-parent;

    $!wimc = do {
      when WebKitInputMethodContext {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WebKitInputMethodContext, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Webkit::Raw::Definitions::WebKitInputMethodContext
    is also<WebKitInputMethodContext>
  { $!wimc }

  multi method new (
    $webkit-input-context where * ~~ WebKitInputMethodContextAncestry,

    :$ref = True
  ) {
    return unless $webkit-input-context;

    my $o = self.bless( :$webkit-input-context );
    $o.ref if $ref;
    $o;
  }

  # Type: InputHints
  method input-hints ( :enum(:$flags) = True ) is rw is g-property {
    my $gv = GLib::Value.new( WebKit::Flags::InputHints.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('input-hints', $gv);
        my $h = $gv.enum;
        return $h unless $flags;
        getFlags(WebKitInputHintsEnum, $h);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(WebKitInputHintsEnum) = $val;
        self.prop_set('input-hints', $gv);
      }
    );
  }

  # Type: InputPurpose
  method input-purpose ( :$enum = True ) is rw is g-property {
    my $gv = GLib::Value.new( WebKit::Enum::InputPurpose.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('input-purpose', $gv);
        my $v = $gv.enum;
        return $v unless $enum;
        WebKitInputPurposeEnum($v);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(WebKitInputPurpose) = $val;
        self.prop_set('input-purpose', $gv);
      }
    );
  }

  method Committed {
    self.connect-string($!wimc, 'committed');
  }

  method Delete-Surrouding {
    self.connect-intuint($!wimc, 'delete-surrounding');
  }

  method Preedit-Changed {
    self.connect($!wimc, 'preedit-changed');
  }

  method Preedit-Finished {
    self.connect($!wimc, 'preedit-finished');
  }

  method Preedit-Started {
    self.connect($!wimc, 'preedit-started');
  }

  method filter_key_event (GdkEvent() $key-event) {
    if gdk_event_get_event_type($key-event) !=
       (GDK_KEY_PRESS, GDK_KEY_RELEASE).any
    {
      warn "Not a Key Event in .filter_key_event";
      return Nil;
    }
    so webkit_input_method_context_filter_key_event($!wimc, $key-event);
  }

  method get_input_hints ( :enum(:$flags) = True ) {
    my $h = webkit_input_method_context_get_input_hints($!wimc);
    return $h unless $flags;
    getFlags(WebKitInputHintsEnum, $h);
  }

  method get_input_purpose ( :flags(:$enum) = True ) {
    my $p = webkit_input_method_context_get_input_purpose($!wimc);
    return $p unless $enum;
    WebKitInputPurposeEnum($p);
  }

  proto method get_preedit (|)
  { * }

  multi method get_preedit ( :$raw = False, :$glist = False ) {
    samewith( newCArray(Str), newCArray(GList), $, :$raw, :$glist );
  }
  multi method get_preedit (
    CArray[Str]             $text,
    CArray[Pointer[GList]]  $underlines,
                            $cursor_offset is rw,
                           :$raw                 = False,
                           :$glist               = False
  ) {
    my guint $c = 0;

    webkit_input_method_context_get_preedit(
      $!wimc,
      $text,
      $underlines,
      $c
    );
    $cursor_offset = 0;

    (
      $raw ?? $text !! CStringArrayToArray($text);
      propReturnObject(
        ppr($underlines),
        $raw,
        |WebKit::InputMethod::Underline.getTypePair
      ),
      $cursor_offset
    );
  }

  method notify_cursor_area (
    Int() $x,
    Int() $y,
    Int() $width,
    Int() $height
  ) {
    my gint ($xx, $yy, $w, $h) = ($x, $y, $width, $height);

    webkit_input_method_context_notify_cursor_area($!wimc, $xx, $yy, $w, $h);
  }

  method notify_focus_in {
    webkit_input_method_context_notify_focus_in($!wimc);
  }

  method notify_focus_out {
    webkit_input_method_context_notify_focus_out($!wimc);
  }

  method notify_surrounding (
    Str() $text,
    Int() $length,
    Int() $cursor_index,
    Int() $selection_index
  ) {
    my gint   $l      = $length;
    my guint ($c, $s) = ($cursor_index, $selection_index);

    webkit_input_method_context_notify_surrounding($!wimc, $text, $l, $c, $s);
  }

  method reset {
    webkit_input_method_context_reset($!wimc);
  }

  method set_enable_preedit (Int() $enabled) {
    my gboolean $e = $enabled.so.Int;

    webkit_input_method_context_set_enable_preedit($!wimc, $enabled);
  }

  method set_input_hints (Int() $hints) {
    my WebKitInputHints $h = $hints;

    webkit_input_method_context_set_input_hints($!wimc, $h);
  }

  method set_input_purpose (Int() $purpose) {
    my WebKitInputPurpose $p = $purpose;

    webkit_input_method_context_set_input_purpose($!wimc, $p);
  }

}
