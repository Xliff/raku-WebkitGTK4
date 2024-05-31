use v6.c;

use Method::Also;

use WebKit::Raw::Types:ver<4>;
use WebKit::Raw::Navigation::Action:ver<4>;

use GLib::Roles::Implementor;

# STRUCT!

class WebKit::Navigation::Action {
  also does GLib::Roles::Implementor;

  has WebKitNavigationAction $!wna is implementor;

  submethod BUILD ( :$webkit-nav-act ) {
    $!wna = $webkit-nav-act if $webkit-nav-act;
  }

  method WebKit::Raw::Definitions::WebKitNavigationAction
    is also<WebKitNavigationAction>
  { $!wna }

  method new (WebKitNavigationAction $webkit-nav-act) {
    $webkit-nav-act ?? self.bless( :$webkit-nav-act ) !! Nil;
  }

  method copy ( :$raw = False ) {
    propReturnObject(
      webkit_navigation_action_copy($!wna),
      $raw,
      |self.getTypePair,
    )
  }

  method free {
    webkit_navigation_action_free($!wna);
  }

  method get_frame_name is also<get-frame-name> {
    webkit_navigation_action_get_frame_name($!wna);
  }

  method get_modifiers is also<get-modifiers> {
    webkit_navigation_action_get_modifiers($!wna);
  }

  method get_mouse_button is also<get-mouse-button> {
    webkit_navigation_action_get_mouse_button($!wna);
  }

  method get_navigation_type ( :$enum = False ) is also<get-navigation-type> {
    my $t = webkit_navigation_action_get_navigation_type($!wna);
    return $t unless $enum;
    WebKitNavigationTypeEnum($t);
  }

  method get_request ( :$raw = False ) is also<get-request> {
    propReturnObject(
      webkit_navigation_action_get_request($!wna),
      $raw,
      |WebKit::URI::Request.getTypePair
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &webkit_navigation_action_get_type,
      $n,
      $t
    );
  }

  method is_redirect is also<is-redirect> {
    so webkit_navigation_action_is_redirect($!wna);
  }

  method is_user_gesture is also<is-user-gesture> {
    so webkit_navigation_action_is_user_gesture($!wna);
  }

}
