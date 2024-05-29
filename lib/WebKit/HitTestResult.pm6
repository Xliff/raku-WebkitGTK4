use v6.c;

use Method::Also;

use WebKit::Raw::Types;
use WebKit::Raw::HitTestResult;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset WebKitHitTestResultAncestry is export of Mu
  where WebKitHitTestResult | GObject;

class WebKit::HitTestResult {
  also does GLib::Roles::Object;

  has WebKitHitTestResult $!whtr is implementor;

  has $!context;

  submethod BUILD ( :$webkit-hit-result ) {
    self.setWebKitHitTestResult($webkit-hit-result) if $webkit-hit-result
  }

  method setWebKitHitTestResult (WebKitHitTestResultAncestry $_) {
    my $to-parent;

    $!whtr = do {
      when WebKitHitTestResult {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WebKitHitTestResult, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Webkit::Raw::Definitions::WebKitHitTestResult
    is also<WebKitHitTestResult>
  { $!whtr }

  method new (
    $webkit-hit-result where * ~~ WebKitHitTestResultAncestry,

    :$ref = True
  ) {
    return unless $webkit-hit-result;

    my $o = self.bless( :$webkit-hit-result );
    $o.ref if $ref;
    $o;
  }

  # Type: guint
  multi method context ( :enum(:$flags) = True ) is rw is g-property {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('context', $gv);
        my $c = $gv.flags;
        return $c unless $flags;
        getFlags(WebKitHitTestResultContext, $c);
      },
      STORE => -> $, Int() $val is copy {
        warn 'context is a construct-only attribute'
      }
    );
  }

  # Type: gchar*
  method image-uri is rw is g-property is also<image_uri> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('image-uri', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        warn 'image-uri is a construct-only attribute'
      }
    );
  }

  # Type: gchar*
  method link-label is rw is g-property is also<link_label> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('link-label', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        warn 'link-label is a construct-only attribute'
      }
    );
  }

  # Type: gchar*
  method link-title is rw is g-property is also<link_title> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('link-title', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        warn 'link-title is a construct-only attribute'
      }
    );
  }

  # Type: gchar*
  method link-uri is rw is g-property is also<link_uri> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('link-uri', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        warn 'link-uri is a construct-only attribute'
      }
    );
  }

  # Type: gchar*
  method media-uri is rw is g-property is also<media_uri> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('media-uri', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        warn 'media-uri is a construct-only attribute'
      }
    );
  }

  multi method context ( :o(:obj($object)) is required where *.so ) {
    my $s = self;

    unless $!context {
      $!context = (

        class :: {

          method flags {
            $s.get_context;
          }

          method is_editable is also<is-editable> {
            webkit_hit_test_result_context_is_editable($s);
          }

          method is_image is also<is-image> {
            webkit_hit_test_result_context_is_image($s);
          }

          method is_link is also<is-link> {
            webkit_hit_test_result_context_is_link($s);
          }

          method is_media is also<is-media> {
            webkit_hit_test_result_context_is_media($s);
          }

          method is_scrollbar is also<is-scrollbar> {
            webkit_hit_test_result_context_is_scrollbar($s);
          }

          method is_selection is also<is-selection> {
            webkit_hit_test_result_context_is_selection($s);
          }
        }

      ).new;
    }
    $!context;
  }

  method get_context ( :enum(:$flags) = True ) is also<get-context> {
    my $c = webkit_hit_test_result_get_context($!whtr),
    return $c unless $flags;
    getFlags(WebKitHitTestResultContext, $c);
  }

  method get_image_uri is also<get-image-uri> {
    webkit_hit_test_result_get_image_uri($!whtr);
  }

  method get_link_label is also<get-link-label> {
    webkit_hit_test_result_get_link_label($!whtr);
  }

  method get_link_title is also<get-link-title> {
    webkit_hit_test_result_get_link_title($!whtr);
  }

  method get_link_uri is also<get-link-uri> {
    webkit_hit_test_result_get_link_uri($!whtr);
  }

  method get_media_uri is also<get-media-uri> {
    webkit_hit_test_result_get_media_uri($!whtr);
  }

}
