use v6.c;

use Method::Also;

use WebKit::Raw::Types;
use WebKit::Raw::WindowProperties;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset WebKitWindowPropertiesAncestry is export of Mu
  where WebKitWindowProperties | GObject;

class WebKit::WindowProperties {
  also does GLib::Roles::Object;

  has WebKitWindowProperties $!wp is implementor;

  submethod BUILD ( :$webkit-window-props ) {
    self.setWebKitWindowProperties($webkit-window-props)
      if $webkit-window-props
  }

  method setWebKitWindowProperties (WebKitWindowPropertiesAncestry $_) {
    my $to-parent;

    $!wp = do {
      when WebKitWindowProperties {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WebKitWindowProperties, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Webkit::Raw::Definitions::WebKitWindowProperties
    is also<WebKitWindowProperties>
  { $!wp }

  method new (
    $webkit-window-props where * ~~ WebKitWindowPropertiesAncestry,

    :$ref = True
  ) {
    return unless $webkit-window-props;

    my $o = self.bless( :$webkit-window-props );
    $o.ref if $ref;
    $o;
  }

  method get_fullscreen
    is also<
      get-fullscreen
      fullscreen
    >
  {
    so webkit_window_properties_get_fullscreen($!wp);
  }

  proto method get_geometry (|)
    is also<
      get-geometry
      geometry
    >
  { * }

  multi method get_geometry {
    samewith(GdkRectangle.new);
  }
  multi method get_geometry (GdkRectangle() $geometry, :$raw = False) {
    webkit_window_properties_get_geometry($!wp, $geometry);
    return $geometry if $raw;
    propReturnObject($geometry, $raw, |GDK::Rectangle.getTypePair)
  }

  method get_locationbar_visible
    is also<
      get-locationbar-visible
      locationbar_visible
      locationbar-visible
    >
  {
    so webkit_window_properties_get_locationbar_visible($!wp);
  }

  method get_menubar_visible
    is also<
      get-menubar-visible
      menubar_visible
      menubar-visible
    >
  {
    so webkit_window_properties_get_menubar_visible($!wp);
  }

  method get_resizable
    is also<
      get-resizable
      resizable
    >
  {
    so webkit_window_properties_get_resizable($!wp);
  }

  method get_scrollbars_visible
    is also<
      get-scrollbars-visible
      scrollbars_visible
      scrollbars-visible
    >
  {
    so webkit_window_properties_get_scrollbars_visible($!wp);
  }

  method get_statusbar_visible
    is also<
      get-statusbar-visible
      statusbar_visible
      statusbar-visible
    >
  {
    so webkit_window_properties_get_statusbar_visible($!wp);
  }

  method get_toolbar_visible
    is also<
      get-toolbar-visible
      toolbar_visible
      toolbar-visible
    >
  {
    so webkit_window_properties_get_toolbar_visible($!wp);
  }

}
