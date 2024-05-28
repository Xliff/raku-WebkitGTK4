use v6.c;

use Method::Also;

use GLib::Raw::Types;
use WebKit::Raw::Types;
use WebKit::Raw::Feature;

use GLib::Roles::Implementor;

# ALL BOXED

class WebKit::Feature {
  also does GLib::Roles::Implementor;

  has WebKitFeature $!wf is implementor;

  submethod BUILD ( :$webkit-feature ) {
    $!wf = $webkit-feature if $webkit-feature;
  }

  method WebKit::Raw::Definitions::WebKitFeature
    is also<WebKitFeature>
  { $!wf }

  method new (WebKitFeature $webkit-feature) {
    $webkit-feature ?? self.bless( :$webkit-feature ) !! Nil;
  }

  method get_category
    is also<
      get-category
      category
    >
  {
    webkit_feature_get_category($!wf);
  }

  method get_default_value
    is also<
      get-default-value
      default_value
      default-value
    >
  {
    webkit_feature_get_default_value($!wf);
  }

  method get_details
    is also<
      get-details
      details
    >
  {
    webkit_feature_get_details($!wf);
  }

  method get_identifier
    is also<
      get-identifier
      identifier
    >
  {
    webkit_feature_get_identifier($!wf);
  }

  method get_name
    is also<
      get-name
      name
    >
  {
    webkit_feature_get_name($!wf);
  }

  method get_status ( :$enum = True )
    is also<
      get-status
      status
    >
  {
    my $s = webkit_feature_get_status($!wf);
    return $s unless $enum;
    WebKitFeatureStatusEnum($s);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &webkit_feature_get_type, $n, $t );
  }

  method ref {
    webkit_feature_ref($!wf);
    self;
  }

  method unref {
    webkit_feature_unref($!wf);
  }

}

class WebKit::Feature::List {
  also does GLib::Roles::Implementor;
  also does Positional;

  has WebKitFeatureList $!wfl is implementor;

  submethod BUILD ( :$webkit-feature-list ) {
    $!wfl = $webkit-feature-list if $webkit-feature-list;
  }

  method new (WebKitFeatureList $webkit-feature-list) {
    $webkit-feature-list ?? self.bless( :$webkit-feature-list ) !! Nil;
  }

  method WebKit::Raw::Definitions::WebKitFeatureList
    is also<WebKitFeatureList>
  { $!wfl }

  method AT-POS (\k) {
    k < self.get_length ?? self.get(k) !! Nil;
  }

  method get (Int() $index, :$raw = False) {
    my gsize $i = $index;

    propReturnObject(
      webkit_feature_list_get($!wfl, $i),
      $raw,
      |WebKit::Feature.getTypePair
    );
  }

  method get_length
    is also<
      get-length
      length
      elems
    >
  {
    webkit_feature_list_get_length($!wfl);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &webkit_feature_list_get_type, $n, $t );
  }

  method ref {
    webkit_feature_list_ref($!wfl);
    self
  }

  method unref {
    webkit_feature_list_unref($!wfl);
  }

}
