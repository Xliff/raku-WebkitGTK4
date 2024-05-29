use v6.c;

use Method::Also;

use WebKit::Raw::Types;
use WebKit::Raw::FindController;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset WebKitFindControllerAncestry is export of Mu
  where WebKitFindController | GObject;

class WebKit::FindController {
  also does GLib::Roles::Object;

  has WebKitFindController $!wfc is implementor;

  submethod BUILD ( :$webkit-find-control ) {
    self.setWebKitFindController($webkit-find-control) if $webkit-find-control
  }

  method setWebKitFindController (WebKitFindControllerAncestry $_) {
    my $to-parent;

    $!wfc = do {
      when WebKitFindController {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WebKitFindController, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Webkit::Raw::Definitions::WebKitFindController
    is also<WebKitFindController>
  { $!wfc }

  method new (
    $webkit-find-control where * ~~ WebKitFindControllerAncestry,

    :$ref = True
  ) {
    return unless $webkit-find-control;

    my $o = self.bless( :$webkit-find-control );
    $o.ref if $ref;
    $o;
  }

  method count_matches (
    Str() $search_text,
    Int() $find_options,
    Int() $max_match_count
  )
    is also<count-matches>
  {
    my guint32 $f = $find_options;
    my guint   $m = $max_match_count;

    webkit_find_controller_count_matches($!wfc, $search_text, $f, $m);
  }

  method get_max_match_count is also<get-max-match-count> {
    webkit_find_controller_get_max_match_count($!wfc);
  }

  method get_options ( :enum(:$flags) = True ) is also<get-options> {
    my $o = webkit_find_controller_get_options($!wfc);
    return $o unless $flags;
    getFlags(WebKitFindOptionsEnum, $o);
  }

  method get_search_text is also<get-search-text> {
    webkit_find_controller_get_search_text($!wfc);
  }

  method get_web_view is also<get-web-view> {
    webkit_find_controller_get_web_view($!wfc);
  }

  method search (
    Str() $search_text,
    Int() $find_options,
    Int() $max_match_count
  ) {
    my guint32 $f = $find_options;
    my guint   $m = $max_match_count;

    webkit_find_controller_search($!wfc, $search_text, $f, $m);
  }

  method search_finish is also<search-finish> {
    webkit_find_controller_search_finish($!wfc);
  }

  method search_next is also<search-next> {
    webkit_find_controller_search_next($!wfc);
  }

  method search_previous is also<search-previous> {
    webkit_find_controller_search_previous($!wfc);
  }

}
