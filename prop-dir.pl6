#!/usr/bin/env perl6
use v6.c;
use lib <scripts .>;

use ScriptConfig;

use LWP::Simple;
#use Mojo::DOM:from<Perl5>;
use DOM::Tiny;

sub indent ($s, $n) {
  $s.lines.map({ (' ' x $n) ~ $_ }).join("\n");
}

my @really-strings = <
  char      gchar
  uchar     guchar
  chararray gchararray
  unichar
  char*     gchar*
  string    gstring
>;

my @gtypes = <
  boolean
  int      uint
  long     ulong
  int64    uint64
  double
  float
  string
  pointer
>;

sub resolve-type ($_) {
  do {
    when 'gboolean' | 'boolean' { $*co = 'Int()'; 'G_TYPE_BOOLEAN' }
    when 'gint'     | 'int'     { $*co = 'Int()'; 'G_TYPE_INT'     }
    when 'gint64'   | 'int64'   { $*co = 'Int()'; 'G_TYPE_INT64'   }
    when 'guint64'  | 'uint64'  { $*co = 'Int()'; 'G_TYPE_UINT64'  }
    when 'guint'    | 'uint'    { $*co = 'Int()'; 'G_TYPE_UINT'    }
    when 'glong'    | 'long'    { $*co = 'Int()'; 'G_TYPE_LONG'    }
    when 'gulong'   | 'ulong'   { $*co = 'Int()'; 'G_TYPE_ULONG'   }
    when 'gdouble'  | 'double'  { $*co = 'Num()'; 'G_TYPE_DOUBLE'  }
    when 'gfloat'   | 'float'   { $*co = 'Num()'; 'G_TYPE_FLOAT'   }

    when 'gpointer' | 'pointer' {                 'G_TYPE_POINTER' }

    when @really-strings.any    { $*co = 'Str()'; 'G_TYPE_STRING'  }

    default {
      '-type-'
    }
  }
}

sub get-dir {
  my $dir = %config<gtkdoc-dir> // %config<include-dir>;

  die 'Could not find proper directory!' unless $dir;

  $dir.IO.dir
}

sub MAIN ( $control ) {
  my (%props);

  for get-dir[] {
    next unless .basename.starts-with("property.{ $control }");

    my $dom  = DOM::Tiny.parse( .slurp );
    my $name = $dom.find('h1').head.text.split(':').tail.trim;
    my $tr   = $dom.find('.docblock table tr');

    my %attr;
    for $tr[] {
      if .children.elems == 2 {
        %attr{ .children.head.text( :recursive ).trim } = .children.tail;
      }
    }

    for 'Readable', 'Writable', 'Construct only' {
      %attr{$_} = %attr{$_}.all-text.trim eq 'yes'
    }

    my $c  = %attr<Type:>;
    my $tt = $c.find('a');

    $tt = $tt.head<href>.split('.').head if $tt;

    my $t  = $c.find('code');
       $t  = $t.head.text.subst(%config<prefix>, '') if $t;

    $*ERR.say: "Found { $name } / { $t } { $tt ?? "({ $tt })" !! '' }...";

    my ($*co, %c, $gtype);

    my $i = ' ' x 6;

    given $tt {
      when 'enum' {
        $*co = 'Int()';
        $gtype = "{ %config<prefix> }::Enum::{ $t }.get_type";

        %c<read> = qq:to/READ/.&indent(6) if %attr<Readable>;
          self.prop_get('{ $name }', \$gv);
          my \$v = \$gv.enum;
          return \$v unless \$enum;
          { $t }Enum(\$v);
          READ

        %c<write> = qq:to/WRITE/.&indent(6) if %attr<Writable>;
          \$gv.valueFromEnum({ $t }) = \$val;
          self.prop_set(\'{ $name }\', \$gv);
          WRITE
      }

      when 'class' {
        $*co = $t ~ '()';
        my $ot = "{ %config<prefix> }::{ $t }";
        $gtype = "{ $ot }.get_type";

        %c<read> = qq:to/READ/.&indent(6) if %attr<Readable>;
          self.prop_get('{ $name }', \$gv);
          propReturnObject(
            \$gv.object,
            \$raw,
            |{ $ot }.getTypePair
          );
          READ

        %c<write> = qq:to/WRITE/.&indent(6) if %attr<Writable>;
          \$gv.object = \$val;
          self.prop_set(\'{ $name }\', \$gv);
          WRITE
      }

      default {
        $gtype = resolve-type($t);

        my $u = S/^ 'g'// given $t;
        if $u eq @really-strings.any {
          $u = 'string';
        }

        %c<read> = qq:to/PROP/.&indent(6) if %attr<Readable>;
          self.prop_get('{ $name }', \$gv);
          \$gv.{ $u };
          PROP

        %c<write> = qq:to/PROP/.&indent(6) if %attr<Writable>;
          \$gv.{ $u } = \$val;
          self.prop_set(\'{ $name }\', \$gv);
          PROP
      }
    }

    %c<write> = "warn '{ $name } is a construct-only attribute'".&indent(6)
      if %attr{'Construct only'};

    %c<write> //= "warn '{ $name } does not allow writing'".&indent(6);

    my $raw = '';
    $raw = '( :$raw = False ) ' if $tt eq 'class';
    $raw = '( :$enum = True ) ' if $tt eq 'enum';
    %props{$name} = qq:to/PROP/;
      # Type: { $t }
      method { $name } { $raw }is rw is g-property \{
        my \$gv = GLib::Value.new( { $gtype } );
        Proxy.new(
          FETCH => sub (\$) \{
      { %c<read> // '' }
          \},
          STORE => -> \$, { $*co // '' } \$val is copy \{
      { %c<write> // '' }
          \}
        );
      \}
      PROP
  }

  .value.say for %props.pairs.sort( *.key )[];

}
