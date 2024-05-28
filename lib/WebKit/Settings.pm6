use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use WebKit::Raw::Types;
use WebKit::Raw::Settings;

use WebKit::Feature;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset WebKitSettingsAncestry is export of Mu
  where WebKitSettings | GObject;

class WebKit::Settings {
  also does GLib::Roles::Object;

  has WebKitSettings $!ws is implementor;

  submethod BUILD ( :$webkit-settings ) {
    self.setWebKitSettings($webkit-settings) if $webkit-settings
  }

  method setWebKitSettings (WebKitSettingsAncestry $_) {
    my $to-parent;

    $!ws = do {
      when WebKitSettings {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WebKitSettings, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Webkit::Raw::Definitions::WebKitSettings
  { $!ws }

  multi method new (
    $webkit-settings where * ~~ WebKitSettingsAncestry,

    :$ref = True
  ) {
    return unless $webkit-settings;

    my $o = self.bless( :$webkit-settings );
    $o.ref if $ref;
    $o;
  }

  multi method new ( *%a ) {
    my $webkit-settings = webkit_settings_new();

    my $o = $webkit-settings ?? self.bless( :$webkit-settings ) !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }

  # Type: gboolean
  method allow-file-access-from-file-urls
    is rw
    is g-property
    is also<allow_file_access_from_file_urls>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('allow-file-access-from-file-urls', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('allow-file-access-from-file-urls', $gv);
      }
    );
  }

  # Type: gboolean
  method allow-modal-dialogs is rw is g-property is also<allow_modal_dialogs> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('allow-modal-dialogs', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('allow-modal-dialogs', $gv);
      }
    );
  }

  # Type: gboolean
  method allow-top-navigation-to-data-urls
    is rw
    is g-property
    is also<allow_top_navigation_to_data_urls>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('allow-top-navigation-to-data-urls', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('allow-top-navigation-to-data-urls', $gv);
      }
    );
  }

  # Type: gboolean
  method allow-universal-access-from-file-urls
    is rw
    is g-property
    is also<allow_universal_access_from_file_urls>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('allow-universal-access-from-file-urls', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('allow-universal-access-from-file-urls', $gv);
      }
    );
  }

  # Type: gboolean
  method auto-load-images is rw is g-property is also<auto_load_images> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('auto-load-images', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('auto-load-images', $gv);
      }
    );
  }

  # Type: gchar*
  method cursive-font-family
    is rw
    is g-property
    is also<cursive_font_family>
  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('cursive-font-family', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('cursive-font-family', $gv);
      }
    );
  }

  # Type: gchar*
  method default-charset is rw is g-property is also<default_charset> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('default-charset', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('default-charset', $gv);
      }
    );
  }

  # Type: gchar*
  method default-font-family is rw is g-property is also<default_font_family> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('default-font-family', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('default-font-family', $gv);
      }
    );
  }

  # Type: guint
  method default-font-size is rw is g-property is also<default_font_size> {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('default-font-size', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('default-font-size', $gv);
      }
    );
  }

  # Type: guint
  method default-monospace-font-size
    is rw
    is g-property
    is also<default_monospace_font_size>
  {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('default-monospace-font-size', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('default-monospace-font-size', $gv);
      }
    );
  }

  # Type: gboolean
  method disable-web-security
    is rw
    is g-property
    is also<disable_web_security>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('disable-web-security', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('disable-web-security', $gv);
      }
    );
  }

  # Type: gboolean
  method draw-compositing-indicators
    is rw
    is g-property
    is also<draw_compositing_indicators>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('draw-compositing-indicators', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('draw-compositing-indicators', $gv);
      }
    );
  }

  # Type: gboolean - Underscored due to name incompatibility
  method enable_2d_composijting_indicators is rw is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-2d-canvas-acceleration', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-2d-canvas-acceleration', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-back-forward-navigation-gestures
    is rw
    is g-property
    is also<enable_back_forward_navigation_gestures>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-back-forward-navigation-gestures', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-back-forward-navigation-gestures', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-caret-browsing
    is rw
    is g-property
    is also<enable_caret_browsing>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-caret-browsing', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-caret-browsing', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-developer-extras
    is rw
    is g-property
    is also<enable_developer_extras>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-developer-extras', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-developer-extras', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-dns-prefetching
    is rw
    is g-property
    is also<enable_dns_prefetching>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-dns-prefetching', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-dns-prefetching', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-encrypted-media
    is rw
    is g-property
    is also<enable_encrypted_media>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-encrypted-media', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-encrypted-media', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-fullscreen is rw is g-property is also<enable_fullscreen> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-fullscreen', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-fullscreen', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-html5-database
    is rw
    is g-property
    is also<enable_html5_database>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-html5-database', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-html5-database', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-html5-local-storage
    is rw
    is g-property
    is also<enable_html5_local_storage>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-html5-local-storage', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-html5-local-storage', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-hyperlink-auditing
    is rw
    is g-property
    is also<enable_hyperlink_auditing>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-hyperlink-auditing', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-hyperlink-auditing', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-javascript is rw is g-property is also<enable_javascript> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-javascript', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-javascript', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-javascript-markup
    is rw
    is g-property
    is also<enable_javascript_markup>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-javascript-markup', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-javascript-markup', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-media is rw is g-property is also<enable_media> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-media', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-media', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-media-capabilities
    is rw
    is g-property
    is also<enable_media_capabilities>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-media-capabilities', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-media-capabilities', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-media-stream is rw is g-property is also<enable_media_stream> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-media-stream', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-media-stream', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-mediasource is rw is g-property is also<enable_mediasource> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-mediasource', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-mediasource', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-mock-capture-devices
    is rw
    is g-property
    is also<enable_mock_capture_devices>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-mock-capture-devices', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-mock-capture-devices', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-offline-web-application-cache
    is rw
    is g-property
    is also<enable_offline_web_application_cache>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-offline-web-application-cache', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-offline-web-application-cache', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-page-cache is rw is g-property is also<enable_page_cache> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-page-cache', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-page-cache', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-resizable-text-areas
    is rw
    is g-property
    is also<enable_resizable_text_areas>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-resizable-text-areas', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-resizable-text-areas', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-site-specific-quirks
    is rw
    is g-property
    is also<enable_site_specific_quirks>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-site-specific-quirks', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-site-specific-quirks', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-smooth-scrolling
    is rw
    is g-property
    is also<enable_smooth_scrolling>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-smooth-scrolling', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-smooth-scrolling', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-spatial-navigation
    is rw
    is g-property
    is also<enable_spatial_navigation>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-spatial-navigation', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-spatial-navigation', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-tabs-to-links
    is rw
    is g-property
    is also<enable_tabs_to_links>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-tabs-to-links', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-tabs-to-links', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-webaudio is rw is g-property is also<enable_webaudio> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-webaudio', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-webaudio', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-webgl is rw is g-property is also<enable_webgl> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-webgl', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-webgl', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-webrtc is rw is g-property is also<enable_webrtc> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-webrtc', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-webrtc', $gv);
      }
    );
  }

  # Type: gboolean
  method enable-write-console-messages-to-stdout
    is rw
    is g-property
    is also<enable_write_console_messages_to_stdout>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-write-console-messages-to-stdout', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-write-console-messages-to-stdout', $gv);
      }
    );
  }

  # Type: gchar*
  method fantasy-font-family is rw is g-property is also<fantasy_font_family> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('fantasy-font-family', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('fantasy-font-family', $gv);
      }
    );
  }

  # Type: HardwareAccelerationPolicy
  method hardware-acceleration-policy ( :$enum = True )
    is rw
    is g-property
    is also<hardware_acceleration_policy>
  {
    my $gv = GLib::Value.new(
      WebKit::Enum::HardwareAccelerationPolicy.get_type
    );

    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('hardware-acceleration-policy', $gv);
        my $v = $gv.enum;
        return $v unless $enum;
        WebKitHardwareAccelerationPolicyEnum($v);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(WebKitHardwareAccelerationPolicy) = $val;
        self.prop_set('hardware-acceleration-policy', $gv);
      }
    );
  }

  # Type: gboolean
  method javascript-can-access-clipboard
    is rw
    is g-property
    is also<javascript_can_access_clipboard>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('javascript-can-access-clipboard', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('javascript-can-access-clipboard', $gv);
      }
    );
  }

  # Type: gboolean
  method javascript-can-open-windows-automatically
    is rw
    is g-property
    is also<javascript_can_open_windows_automatically>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('javascript-can-open-windows-automatically', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('javascript-can-open-windows-automatically', $gv);
      }
    );
  }

  # Type: gboolean
  method load-icons-ignoring-image-load-setting
    is rw
    is g-property
    is also<load_icons_ignoring_image_load_setting>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('load-icons-ignoring-image-load-setting', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('load-icons-ignoring-image-load-setting', $gv);
      }
    );
  }

  # Type: gchar*
  method media-content-types-requiring-hardware-support
    is rw
    is g-property
    is also<media_content_types_requiring_hardware_support>
  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('media-content-types-requiring-hardware-support', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('media-content-types-requiring-hardware-support', $gv);
      }
    );
  }

  # Type: gboolean
  method media-playback-allows-inline
    is rw
    is g-property
    is also<media_playback_allows_inline>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('media-playback-allows-inline', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('media-playback-allows-inline', $gv);
      }
    );
  }

  # Type: gboolean
  method media-playback-requires-user-gesture
    is rw
    is g-property
    is also<media_playback_requires_user_gesture>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('media-playback-requires-user-gesture', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('media-playback-requires-user-gesture', $gv);
      }
    );
  }

  # Type: guint
  method minimum-font-size is rw is g-property is also<minimum_font_size> {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('minimum-font-size', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('minimum-font-size', $gv);
      }
    );
  }

  # Type: gchar*
  method monospace-font-family
    is rw
    is g-property
    is also<monospace_font_family>
  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('monospace-font-family', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('monospace-font-family', $gv);
      }
    );
  }

  # Type: gchar*
  method pictograph-font-family
    is rw
    is g-property
    is also<pictograph_font_family>
  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('pictograph-font-family', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('pictograph-font-family', $gv);
      }
    );
  }

  # Type: gboolean
  method print-backgrounds is rw is g-property is also<print_backgrounds> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('print-backgrounds', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('print-backgrounds', $gv);
      }
    );
  }

  # Type: gchar*
  method sans-serif-font-family
    is rw
    is g-property
    is also<sans_serif_font_family>
  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('sans-serif-font-family', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('sans-serif-font-family', $gv);
      }
    );
  }

  # Type: gchar*
  method serif-font-family is rw is g-property is also<serif_font_family> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('serif-font-family', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('serif-font-family', $gv);
      }
    );
  }

  # Type: gchar*
  method user-agent is rw is g-property is also<user_agent> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('user-agent', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('user-agent', $gv);
      }
    );
  }

  # Type: gboolean
  method zoom-text-only is rw is g-property is also<zoom_text_only> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('zoom-text-only', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('zoom-text-only', $gv);
      }
    );
  }

  method font_size_to_pixels is also<font-size-to-pixels> {
    webkit_settings_font_size_to_pixels($!ws);
  }

  method font_size_to_points is also<font-size-to-points> {
    webkit_settings_font_size_to_points($!ws);
  }

  method get_all_features ( :$raw = False ) is also<get-all-features> {
    propReturnObject(
      webkit_settings_get_all_features(),
      $raw,
      |WebKit::Feature::List.getTypePair
    );
  }

  method get_allow_file_access_from_file_urls
    is also<get-allow-file-access-from-file-urls>
  {
    so webkit_settings_get_allow_file_access_from_file_urls($!ws);
  }

  method get_allow_modal_dialogs is also<get-allow-modal-dialogs> {
    so webkit_settings_get_allow_modal_dialogs($!ws);
  }

  method get_allow_top_navigation_to_data_urls
    is also<get-allow-top-navigation-to-data-urls>
  {
    so webkit_settings_get_allow_top_navigation_to_data_urls($!ws);
  }

  method get_allow_universal_access_from_file_urls
    is also<get-allow-universal-access-from-file-urls>
  {
    so webkit_settings_get_allow_universal_access_from_file_urls($!ws);
  }

  method get_auto_load_images is also<get-auto-load-images> {
    so webkit_settings_get_auto_load_images($!ws);
  }

  method get_cursive_font_family is also<get-cursive-font-family> {
    so webkit_settings_get_cursive_font_family($!ws);
  }

  method get_default_charset is also<get-default-charset> {
    webkit_settings_get_default_charset($!ws);
  }

  method get_default_font_family is also<get-default-font-family> {
    webkit_settings_get_default_font_family($!ws);
  }

  method get_default_font_size is also<get-default-font-size> {
    webkit_settings_get_default_font_size($!ws);
  }

  method get_default_monospace_font_size
    is also<get-default-monospace-font-size>
  {
    webkit_settings_get_default_monospace_font_size($!ws);
  }

  method get_development_features ( :$raw = False )
    is also<get-development-features>
  {
    propReturnObject(
      webkit_settings_get_development_features(),
      $raw,
      |WebKit::Feature::List.getTypePair
    );
  }

  method get_disable_web_security is also<get-disable-web-security> {
    so webkit_settings_get_disable_web_security($!ws);
  }

  method get_draw_compositing_indicators
    is also<get-draw-compositing-indicators>
  {
    so webkit_settings_get_draw_compositing_indicators($!ws);
  }

  method get_enable_back_forward_navigation_gestures
    is also<get-enable-back-forward-navigation-gestures>
  {
    so webkit_settings_get_enable_back_forward_navigation_gestures($!ws);
  }

  method get_enable_caret_browsing is also<get-enable-caret-browsing> {
    so webkit_settings_get_enable_caret_browsing($!ws);
  }

  method get_enable_developer_extras is also<get-enable-developer-extras> {
    so webkit_settings_get_enable_developer_extras($!ws);
  }

  method get_enable_dns_prefetching is also<get-enable-dns-prefetching> {
    so webkit_settings_get_enable_dns_prefetching($!ws);
  }

  method get_enable_encrypted_media is also<get-enable-encrypted-media> {
    so webkit_settings_get_enable_encrypted_media($!ws);
  }

  method get_enable_fullscreen is also<get-enable-fullscreen> {
    so webkit_settings_get_enable_fullscreen($!ws);
  }

  method get_enable_html5_database is also<get-enable-html5-database> {
    so webkit_settings_get_enable_html5_database($!ws);
  }

  method get_enable_html5_local_storage
    is also<get-enable-html5-local-storage>
  {
    so webkit_settings_get_enable_html5_local_storage($!ws);
  }

  method get_enable_hyperlink_auditing
    is also<get-enable-hyperlink-auditing>
  {
    so webkit_settings_get_enable_hyperlink_auditing($!ws);
  }

  method get_enable_javascript is also<get-enable-javascript> {
    so webkit_settings_get_enable_javascript($!ws);
  }

  method get_enable_javascript_markup is also<get-enable-javascript-markup> {
    so webkit_settings_get_enable_javascript_markup($!ws);
  }

  method get_enable_media is also<get-enable-media> {
    so webkit_settings_get_enable_media($!ws);
  }

  method get_enable_media_capabilities is also<get-enable-media-capabilities> {
    so webkit_settings_get_enable_media_capabilities($!ws);
  }

  method get_enable_media_stream is also<get-enable-media-stream> {
    so webkit_settings_get_enable_media_stream($!ws);
  }

  method get_enable_mediasource is also<get-enable-mediasource> {
    so webkit_settings_get_enable_mediasource($!ws);
  }

  method get_enable_mock_capture_devices
    is also<get-enable-mock-capture-devices>
  {
    so webkit_settings_get_enable_mock_capture_devices($!ws);
  }

  method get_enable_offline_web_application_cache
    is also<get-enable-offline-web-application-cache>
  {
    so webkit_settings_get_enable_offline_web_application_cache($!ws);
  }

  method get_enable_page_cache is also<get-enable-page-cache> {
    so webkit_settings_get_enable_page_cache($!ws);
  }

  method get_enable_resizable_text_areas
    is also<get-enable-resizable-text-areas>
  {
    so webkit_settings_get_enable_resizable_text_areas($!ws);
  }

  method get_enable_site_specific_quirks
    is also<get-enable-site-specific-quirks>
  {
    so webkit_settings_get_enable_site_specific_quirks($!ws);
  }

  method get_enable_smooth_scrolling is also<get-enable-smooth-scrolling> {
    so webkit_settings_get_enable_smooth_scrolling($!ws);
  }

  method get_enable_spatial_navigation is also<get-enable-spatial-navigation> {
    so webkit_settings_get_enable_spatial_navigation($!ws);
  }

  method get_enable_tabs_to_links is also<get-enable-tabs-to-links> {
    so webkit_settings_get_enable_tabs_to_links($!ws);
  }

  method get_enable_webaudio is also<get-enable-webaudio> {
    so webkit_settings_get_enable_webaudio($!ws);
  }

  method get_enable_webgl is also<get-enable-webgl> {
    so webkit_settings_get_enable_webgl($!ws);
  }

  method get_enable_webrtc is also<get-enable-webrtc> {
    so webkit_settings_get_enable_webrtc($!ws);
  }

  method get_enable_write_console_messages_to_stdout
    is also<get-enable-write-console-messages-to-stdout>
  {
    so webkit_settings_get_enable_write_console_messages_to_stdout($!ws);
  }

  method get_experimental_features ( :$raw = False )
    is also<get-experimental-features>
  {
    propReturnObject(
      webkit_settings_get_experimental_features(),
      $raw,
      |WebKit::Feature::List.getTypePair
    );
  }

  method get_fantasy_font_family is also<get-fantasy-font-family> {
    webkit_settings_get_fantasy_font_family($!ws);
  }

  method get_feature_enabled (WebKitFeature() $feature)
    is also<get-feature-enabled>
  {
    so webkit_settings_get_feature_enabled($!ws, $feature);
  }

  method get_hardware_acceleration_policy
    is also<get-hardware-acceleration-policy>
  {
    webkit_settings_get_hardware_acceleration_policy($!ws);
  }

  method get_javascript_can_access_clipboard
    is also<get-javascript-can-access-clipboard>
  {
    so webkit_settings_get_javascript_can_access_clipboard($!ws);
  }

  method get_javascript_can_open_windows_automatically
    is also<get-javascript-can-open-windows-automatically>
  {
    so webkit_settings_get_javascript_can_open_windows_automatically($!ws);
  }

  method get_load_icons_ignoring_image_load_setting
    is also<get-load-icons-ignoring-image-load-setting>
  {
    so webkit_settings_get_load_icons_ignoring_image_load_setting($!ws);
  }

  method get_media_content_types_requiring_hardware_support
    is also<get-media-content-types-requiring-hardware-support>
  {
    so webkit_settings_get_media_content_types_requiring_hardware_support($!ws);
  }

  method get_media_playback_allows_inline
    is also<get-media-playback-allows-inline>
  {
    so webkit_settings_get_media_playback_allows_inline($!ws);
  }

  method get_media_playback_requires_user_gesture
    is also<get-media-playback-requires-user-gesture>
  {
    so webkit_settings_get_media_playback_requires_user_gesture($!ws);
  }

  method get_minimum_font_size
    is also<get-minimum-font-size>
  {
    webkit_settings_get_minimum_font_size($!ws);
  }

  method get_monospace_font_family is also<get-monospace-font-family> {
    webkit_settings_get_monospace_font_family($!ws);
  }

  method get_pictograph_font_family is also<get-pictograph-font-family> {
    webkit_settings_get_pictograph_font_family($!ws);
  }

  method get_print_backgrounds is also<get-print-backgrounds> {
    so webkit_settings_get_print_backgrounds($!ws);
  }

  method get_sans_serif_font_family is also<get-sans-serif-font-family> {
    webkit_settings_get_sans_serif_font_family($!ws);
  }

  method get_serif_font_family is also<get-serif-font-family> {
    webkit_settings_get_serif_font_family($!ws);
  }

  method get_user_agent is also<get-user-agent> {
    webkit_settings_get_user_agent($!ws);
  }

  method get_zoom_text_only is also<get-zoom-text-only> {
    webkit_settings_get_zoom_text_only($!ws);
  }

  method set_allow_file_access_from_file_urls (Int() $allowed)
    is also<set-allow-file-access-from-file-urls>
  {
    my gboolean $a = $allowed.so.Int;

    webkit_settings_set_allow_file_access_from_file_urls($!ws, $a);
  }

  method set_allow_modal_dialogs (Int() $allowed)
    is also<set-allow-modal-dialogs>
  {
    my gboolean $a = $allowed.so.Int;

    webkit_settings_set_allow_modal_dialogs($!ws, $a);
  }

  method set_allow_top_navigation_to_data_urls (Int() $allowed)
    is also<set-allow-top-navigation-to-data-urls>
  {
    my gboolean $a = $allowed.so.Int;

    webkit_settings_set_allow_top_navigation_to_data_urls($!ws, $a);
  }

  method set_allow_universal_access_from_file_urls (Int() $allowed)
    is also<set-allow-universal-access-from-file-urls>
  {
    my gboolean $a = $allowed.so.Int;

    webkit_settings_set_allow_universal_access_from_file_urls($!ws, $a);
  }

  method set_auto_load_images (Int() $enabled) is also<set-auto-load-images> {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_auto_load_images($!ws, $e);
  }

  method set_cursive_font_family (Str() $cursive_font_family)
    is also<set-cursive-font-family>
  {
    webkit_settings_set_cursive_font_family($!ws, $cursive_font_family);
  }

  method set_default_charset (Str() $default_charset)
    is also<set-default-charset>
  {
    webkit_settings_set_default_charset($!ws, $default_charset);
  }

  method set_default_font_family (Str() $default_font_family)
    is also<set-default-font-family>
  {
    webkit_settings_set_default_font_family($!ws, $default_font_family);
  }

  method set_default_font_size (Int() $font_size)
    is also<set-default-font-size>
  {
    my guint32 $f = $font_size;

    webkit_settings_set_default_font_size($!ws, $f);
  }

  method set_default_monospace_font_size (Int() $font_size)
    is also<set-default-monospace-font-size>
  {
    my guint32 $f = $font_size;

    webkit_settings_set_default_monospace_font_size($!ws, $f);
  }

  method set_disable_web_security (Int() $disabled)
    is also<set-disable-web-security>
  {
    my gboolean $d = $disabled.so.Int;

    webkit_settings_set_disable_web_security($!ws, $d);
  }

  method set_draw_compositing_indicators (Int() $enabled)
    is also<set-draw-compositing-indicators>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_draw_compositing_indicators($!ws, $e);
  }

  method set_enable_back_forward_navigation_gestures (Int() $enabled)
    is also<set-enable-back-forward-navigation-gestures>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_back_forward_navigation_gestures($!ws, $e);
  }

  method set_enable_caret_browsing (Int() $enabled)
    is also<set-enable-caret-browsing>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_caret_browsing($!ws, $e);
  }

  method set_enable_developer_extras (Int() $enabled)
    is also<set-enable-developer-extras>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_developer_extras($!ws, $e);
  }

  method set_enable_dns_prefetching (Int() $enabled)
    is also<set-enable-dns-prefetching>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_dns_prefetching($!ws, $e);
  }

  method set_enable_encrypted_media (Int() $enabled)
    is also<set-enable-encrypted-media>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_encrypted_media($!ws, $e);
  }

  method set_enable_fullscreen (Int() $enabled)
    is also<set-enable-fullscreen>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_fullscreen($!ws, $e);
  }

  method set_enable_html5_database (Int() $enabled)
    is also<set-enable-html5-database>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_html5_database($!ws, $e);
  }

  method set_enable_html5_local_storage (Int() $enabled)
    is also<set-enable-html5-local-storage>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_html5_local_storage($!ws, $e);
  }

  method set_enable_hyperlink_auditing (Int() $enabled)
    is also<set-enable-hyperlink-auditing>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_hyperlink_auditing($!ws, $e);
  }

  method set_enable_javascript (Int() $enabled)
    is also<set-enable-javascript>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_javascript($!ws, $e);
  }

  method set_enable_javascript_markup (Int() $enabled)
    is also<set-enable-javascript-markup>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_javascript_markup($!ws, $e);
  }

  method set_enable_media (Int() $enabled) is also<set-enable-media> {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_media($!ws, $e);
  }

  method set_enable_media_capabilities (Int() $enabled)
    is also<set-enable-media-capabilities>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_media_capabilities($!ws, $e);
  }

  method set_enable_media_stream (Int() $enabled)
    is also<set-enable-media-stream>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_media_stream($!ws, $e);
  }

  method set_enable_mediasource (Int() $enabled)
    is also<set-enable-mediasource>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_mediasource($!ws, $e);
  }

  method set_enable_mock_capture_devices (Int() $enabled)
    is also<set-enable-mock-capture-devices>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_mock_capture_devices($!ws, $e);
  }

  method set_enable_offline_web_application_cache (Int() $enabled)
    is also<set-enable-offline-web-application-cache>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_offline_web_application_cache($!ws, $e);
  }

  method set_enable_page_cache (Int() $enabled)
    is also<set-enable-page-cache>


  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_page_cache($!ws, $e);
  }

  method set_enable_resizable_text_areas (Int() $enabled)
    is also<set-enable-resizable-text-areas>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_resizable_text_areas($!ws, $e);
  }

  method set_enable_site_specific_quirks (Int() $enabled)
    is also<set-enable-site-specific-quirks>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_site_specific_quirks($!ws, $e);
  }

  method set_enable_smooth_scrolling (Int() $enabled)
    is also<set-enable-smooth-scrolling>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_smooth_scrolling($!ws, $e);
  }

  method set_enable_spatial_navigation (Int() $enabled)
    is also<set-enable-spatial-navigation>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_spatial_navigation($!ws, $e);
  }

  method set_enable_tabs_to_links (Int() $enabled)
    is also<set-enable-tabs-to-links>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_tabs_to_links($!ws, $e);
  }

  method set_enable_webaudio (Int() $enabled)
    is also<set-enable-webaudio>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_webaudio($!ws, $e);
  }

  method set_enable_webgl (Int() $enabled)
    is also<set-enable-webgl>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_webgl($!ws, $e);
  }

  method set_enable_webrtc (Int() $enabled) is also<set-enable-webrtc> {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_webrtc($!ws, $e);
  }

  method set_enable_write_console_messages_to_stdout (Int() $enabled)
    is also<set-enable-write-console-messages-to-stdout>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_enable_write_console_messages_to_stdout($!ws, $e);
  }

  method set_fantasy_font_family (Str() $fantasy_font_family)
    is also<set-fantasy-font-family>
  {
    webkit_settings_set_fantasy_font_family($!ws, $fantasy_font_family);
  }

  method set_feature_enabled (WebKitFeature() $feature, Int() $enabled)
    is also<set-feature-enabled>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_feature_enabled($!ws, $feature, $e);
  }

  method set_hardware_acceleration_policy (Int() $policy)
    is also<set-hardware-acceleration-policy>
  {
    my WebKitHardwareAccelerationPolicy $p = $policy;

    webkit_settings_set_hardware_acceleration_policy($!ws, $p);
  }

  method set_javascript_can_access_clipboard (Int() $enabled)
    is also<set-javascript-can-access-clipboard>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_javascript_can_access_clipboard($!ws, $e);
  }

  method set_javascript_can_open_windows_automatically (Int() $enabled)
    is also<set-javascript-can-open-windows-automatically>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_javascript_can_open_windows_automatically($!ws, $e);
  }

  method set_load_icons_ignoring_image_load_setting (Int() $enabled)
    is also<set-load-icons-ignoring-image-load-setting>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_load_icons_ignoring_image_load_setting($!ws, $e);
  }

  method set_media_content_types_requiring_hardware_support (
    Str() $content_types
  )
    is also<set-media-content-types-requiring-hardware-support>
  {
    webkit_settings_set_media_content_types_requiring_hardware_support(
      $!ws,
      $content_types
    );
  }

  method set_media_playback_allows_inline (Int() $enabled)
    is also<set-media-playback-allows-inline>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_media_playback_allows_inline($!ws, $e);
  }

  method set_media_playback_requires_user_gesture (Int() $enabled)
    is also<set-media-playback-requires-user-gesture>
  {
    my gboolean $e = $enabled.so.Int;

    webkit_settings_set_media_playback_requires_user_gesture($!ws, $e);
  }

  method set_minimum_font_size (Int() $font_size)
    is also<set-minimum-font-size>
  {
    my guint32 $f = $font_size;

    webkit_settings_set_minimum_font_size($!ws, $f);
  }

  method set_monospace_font_family (Str() $monospace_font_family)
    is also<set-monospace-font-family>
  {
    webkit_settings_set_monospace_font_family(
      $!ws,
      $monospace_font_family
    );
  }

  method set_pictograph_font_family (Str() $pictograph_font_family)
    is also<set-pictograph-font-family>
  {
    webkit_settings_set_pictograph_font_family(
      $!ws,
      $pictograph_font_family
    );
  }

  method set_print_backgrounds (Int() $print_backgrounds)
    is also<set-print-backgrounds>
  {
    my gboolean $p = $print_backgrounds.so.Int;

    webkit_settings_set_print_backgrounds($!ws, $p);
  }

  method set_sans_serif_font_family (Str() $sans_serif_font_family)
    is also<set-sans-serif-font-family>
  {
    webkit_settings_set_sans_serif_font_family($!ws, $sans_serif_font_family);
  }

  method set_serif_font_family (Str() $serif_font_family)
    is also<set-serif-font-family>
  {
    webkit_settings_set_serif_font_family($!ws, $serif_font_family);
  }

  method set_user_agent (Str() $user_agent) is also<set-user-agent> {
    webkit_settings_set_user_agent($!ws, $user_agent);
  }

  method set_user_agent_with_application_details (
    Str() $application_name,
    Str() $application_version
  )
    is also<set-user-agent-with-application-details>
  {
    webkit_settings_set_user_agent_with_application_details(
      $!ws,
      $application_name,
      $application_version
    );
  }

  method set_zoom_text_only (Int() $zoom_text_only)
    is also<set-zoom-text-only>
  {
    my gboolean $z = $zoom_text_only.so.Int;

    webkit_settings_set_zoom_text_only($!ws, $z);
  }

}
