use v6.c;

use Method::Also;

use NativeCall;

use WebKit::Raw::Types;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset WebKitEditorStateAncestry is export of Mu
  where WebKitEditorState | GObject;

class WebKit::EditorState {
  also does GLib::Roles::Object;

  has WebKitEditorState $!wes is implementor;

  submethod BUILD ( :$webkit-editor-state ) {
    self.setWebKitEditorState($webkit-editor-state) if $webkit-editor-state
  }

  method setWebKitEditorState (WebKitEditorStateAncestry $_) {
    my $to-parent;

    $!wes = do {
      when WebKitEditorState {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WebKitEditorState, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Webkit::Raw::Definitions::WebKitEditorState
    is also<WebKitEditorState>
  { $!wes }

  multi method new (
    $webkit-editor-state where * ~~ WebKitEditorStateAncestry,

    :$ref = True
  ) {
    return unless $webkit-editor-state;

    my $o = self.bless( :$webkit-editor-state );
    $o.ref if $ref;
    $o;
  }

  # Type: guint
  method typing-attributes is rw is g-property is also<typing_attributes> {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('typing-attributes', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        warn 'typing-attributes does not allow writing'
      }
    );
  }

  method Changed {
    self.connect($!wes, 'changed');
  }

  method get_typing_attributes is also<get-typing-attributes> {
    webkit_editor_state_get_typing_attributes($!wes);
  }

  method is_copy_available is also<is-copy-available> {
    so webkit_editor_state_is_copy_available($!wes);
  }

  method is_cut_available is also<is-cut-available> {
    so webkit_editor_state_is_cut_available($!wes);
  }

  method is_paste_available is also<is-paste-available> {
    so webkit_editor_state_is_paste_available($!wes);
  }

  method is_redo_available is also<is-redo-available> {
    so webkit_editor_state_is_redo_available($!wes);
  }

  method is_undo_available is also<is-undo-available> {
    so webkit_editor_state_is_undo_available($!wes);
  }

}

### /usr/include/webkitgtk-6.0/webkit/WebKitEditorState.h

sub webkit_editor_state_get_typing_attributes (WebKitEditorState $editor_state)
  returns guint
  is      native(webkit)
  is      export
{ * }

sub webkit_editor_state_is_copy_available (WebKitEditorState $editor_state)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_editor_state_is_cut_available (WebKitEditorState $editor_state)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_editor_state_is_paste_available (WebKitEditorState $editor_state)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_editor_state_is_redo_available (WebKitEditorState $editor_state)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_editor_state_is_undo_available (WebKitEditorState $editor_state)
  returns uint32
  is      native(webkit)
  is      export
{ * }
