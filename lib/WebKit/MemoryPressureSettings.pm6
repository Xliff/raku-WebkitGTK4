use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use WebKit::Raw::Types:ver<4>;
use WebKit::Raw::MemoryPressureSettings:ver<4>;

use GLib::Roles::Implementor;

class WebKit::MemoryPressureSettings:ver<4> {
  also does GLib::Roles::Implementor;

  has WebKitMemoryPressureSettings $!wmps is implementor;

  submethod BUILD ( :$webkit-mem-set ) {
    $!wmps = $webkit-mem-set if $webkit-mem-set;
  }

  method WebKit::Raw::Definitions::WebKitMemoryPressureSettings
    is also<WebKitMemoryPressureSettings>
  { $!wmps }

  method new {
    my $webkit-mem-set = webkit_memory_pressure_settings_new();

    $webkit-mem-set ?? self.bless( :$webkit-mem-set ) !! Nil;
  }

  method conservative_threshold is rw is g-pseudo-property
    is also<conservative-threshold>
  {
    Proxy.new:
      FETCH => -> $     { self.get_conservative_threshold    },
      STORE => -> $, \v { self.set_conservative_threshold(v) }
  }

  method kill_threshold is rw is g-pseudo-property is also<kill-threshold> {
    Proxy.new:
      FETCH => -> $     { self.get_kill_threshold    },
      STORE => -> $, \v { self.set_kill_threshold(v) }
  }

  method memory_limit is rw is g-pseudo-property is also<memory-limit> {
    Proxy.new:
      FETCH => -> $     { self.get_memory_limit    },
      STORE => -> $, \v { self.set_memory_limit(v) }
  }

  method poll_interval is rw is g-pseudo-property is also<poll-interval> {
    Proxy.new:
      FETCH => -> $     { self.get_poll_interval    },
      STORE => -> $, \v { self.set_poll_interval(v) }
  }

  method strict_threshold
    is rw
    is g-pseudo-property
    is also<strict-threshold>
  {
    Proxy.new:
      FETCH => -> $     { self.get_strict_threshold    },
      STORE => -> $, \v { self.set_strict_threshold(v) }
  }

  method copy ( :$raw = False ) {
    propReturnObject(
      webkit_memory_pressure_settings_copy($!wmps),
      $raw,
      |self.getTypePair
    );
  }

  method free {
    webkit_memory_pressure_settings_free($!wmps);
  }

  method get_conservative_threshold is also<get-conservative-threshold> {
    webkit_memory_pressure_settings_get_conservative_threshold($!wmps);
  }

  method get_kill_threshold is also<get-kill-threshold> {
    webkit_memory_pressure_settings_get_kill_threshold($!wmps);
  }

  method get_memory_limit is also<get-memory-limit> {
    webkit_memory_pressure_settings_get_memory_limit($!wmps);
  }

  method get_poll_interval is also<get-poll-interval> {
    webkit_memory_pressure_settings_get_poll_interval($!wmps);
  }

  method get_strict_threshold is also<get-strict-threshold> {
    webkit_memory_pressure_settings_get_strict_threshold($!wmps);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &webkit_memory_pressure_settings_get_type,
      $n,
      $t
    );
  }

  method set_conservative_threshold (Num() $value)
    is also<set-conservative-threshold>
  {
    my gdouble $v = $value;

    webkit_memory_pressure_settings_set_conservative_threshold($!wmps, $v);
  }

  method set_kill_threshold (Num() $value) is also<set-kill-threshold> {
    my gdouble $v = $value;

    webkit_memory_pressure_settings_set_kill_threshold($!wmps, $v);
  }

  method set_memory_limit (Num() $memory_limit) is also<set-memory-limit> {
    my guint $m = $memory_limit;

    webkit_memory_pressure_settings_set_memory_limit($!wmps, $m);
  }

  method set_poll_interval (Num() $value) is also<set-poll-interval> {
    my gdouble $v = $value;

    webkit_memory_pressure_settings_set_poll_interval($!wmps, $v);
  }

  method set_strict_threshold (Num() $value) is also<set-strict-threshold> {
    my gdouble $v = $value;

    webkit_memory_pressure_settings_set_strict_threshold($!wmps, $v);
  }

}
