use v6.c;

use WebKit::Raw::Types:ver<4>;

use GTK::Application:ver<4>;
use GTK::Box:ver<4>;
use GTK::CssProvider:ver<4>;
use GTK::Statusbar:ver<4>;
use WebKit::HitTestResult:ver<4>;
use WebKit::Web::View:ver<4>;

my $a = GTK::Application.new(
  title => 'org.genex.p6-browser', width => 1200, height => 1024
);

my (%cids, $tc);
sub update_statusbar($s, $wv, $hit, $m, $ud) {
  state $last_s = 0;

  if $hit.context-object.is-link {
    with $tc { $tc.cancel; $tc = Nil; }
    my $k = $hit.get_link_uri;
    $k = $k.substr(0, 63) ~ '…';
    %cids{$k} //= $last_s = $s.get_context_id($k);
    $s.push($last_s, $k);
  } else {
    $s.remove_all($last_s) with $last_s;
    $tc = $*SCHEDULER.cue({
      $s.remove_all($_) for %cids.values;
      %cids = (); $tc = Nil;
    }, in => 0.2);
  }
}

$a.activate.tap: SUB {
  my $c  = GTK::CssProvider.new( pod => $=pod );
  my $s  = GTK::Statusbar.new;
  my $b  = GTK::Box.new-vbox;
  my $wv = WebKit::Web::View.new;

  $s.margins = 0;
  $wv.Mouse-Target-Changed.tap: sub ( *@a ) {
    update_statusbar($s, |@a)
  }

  $b.pack_start($wv, True, True);
  $b.pack_end($s, False);
  $a.window.add($b);
  $a.window.title = 'Perl6 Browser';

  $wv.load_uri("http://slashdot.org/");
  $a.window.show_all;
}

$a.run;

=begin css
statusbar { font-size: 14px; }
=end css
