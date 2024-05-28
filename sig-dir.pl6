#!/usr/bin/env perl6
use v6.c;

use lib <scripts .>;

use ScriptConfig;

use LWP::Simple;
#use Mojo::DOM:from<Perl5>;
use DOM::Tiny;

sub get-dir {
  my $dir = %config<gtkdoc-dir> // %config<include-dir>;

  die 'Could not find proper directory!' unless $dir;

  $dir.IO.dir
}

sub MAIN ( $control, $var = '$!w' ) {
  my (%signals, %roles, %defs);

  for get-dir[] {
    next unless .basename.starts-with("signal.{ $control }");

    my $dom  = DOM::Tiny.parse( .slurp );
    my $name = $dom.find('h1').head.text.split('::').tail.trim;
    my $rt   = $dom.find('.docblock span:nth-child(2)').head.text.trim;

    $*ERR.say: "Found { $name }...";

    my $types = $dom.find('.docblock code div.highlight span.n').Array;
    $types .= splice(1, $types.elems) if $rt && $rt ne 'void';
    my @params;
    for 1, 3, 5 ... ∞ {
      last unless $_ < $types.elems;

      @params.push: $types[$_].text;
    }

    my $comment = "# { @params.join(', ') } --> { $rt }";

    %signals{$name} = qq:to/SIG/;
      { $comment }
      method { $name.split('-').map( *.lc.tc ).join('-') } \{
        self.connect-{ $name }({ $var });
      \}
      SIG

    my $role-var = $var.substr(2);

    my %bv;
    my @ap;
    for @params {
      my $v = $_;
      $v = $v.substr(1) if $v.starts-with('g');

      $v ~~ / (\w)[ <[a..z]>+(<[A..Z]>) ]+ /;

      my $vv = $/[0]
        ?? "{ $/[0].Str.lc }{ $/[1] ?? $/[1].map( *.Str.lc ).join !! '' }"
        !! $v.comb.head;

      $vv ~= %bv{$vv}.succ if %bv{$vv};
      %bv{$vv}++;
      @ap.push: '$' ~ $vv;
    }
    my $pl = @ap.skip(1).join(', ');

    %roles{$name} = qq:to/ROLE/;
      { $comment }
      method connect-{ $name } (
         \$obj,
         \$signal    = '{ $name }',
         \&handler?,
        :\$raw       = False
      ) \{
        my \$hid;
        \%!signals-{ $role-var }\{\$signal\} //= do \{
          my \\𝒮 = Supplier.new;
          \$hid = g-connect-{ $name }(\$obj, \$signal,
            -> \$, { $pl } \{
              CATCH \{
                default \{ .message.say; 𝒮.note(\$_) \}
              \}

              # Insert object code HERE!
              unless \$raw \{
              \}

              𝒮.emit( [self, { $pl }] );
            },
            Pointer, 0
          );
          [ create-signal-supply(𝒮.Supply, \$obj, \$signal), \$obj, \$hid ];
        \};
        \%!signals-{ $role-var }\{\$signal\}[0].tap(\&handler) with \&handler;
        \%!signals-{ $role-var }\{\$signal\}[0];
      \}
      ROLE

    %defs{$name} = qq:to/DEF/
      { $comment }
      sub g-connect-{ $name } (
        Pointer \$app,
        Str     \$name,
                \&handler ({ @params.join(', ') }{
                  $rt ne 'void' ?? " --> { $rt }" !! '' }),
        Pointer \$data,
        uint32  \$flags
      )
        returns uint64
        is      native(gobject)
        is      symbol('g_signal_connect_object')
      \{ * \}
      DEF
  }

  for %signals, %roles, %defs {
    .value.say for .pairs.sort( *.key )[];
  }

}
