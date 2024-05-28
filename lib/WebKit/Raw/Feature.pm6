use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use WebKit::Raw::Definitions;
use WebKit::Raw::Enums;

unit package WebKit::Raw::Feature;

### /usr/include/webkitgtk-6.0/webkit/WebKitFeature.h

sub webkit_feature_get_category (WebKitFeature $feature)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_feature_get_default_value (WebKitFeature $feature)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_feature_get_details (WebKitFeature $feature)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_feature_get_identifier (WebKitFeature $feature)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_feature_get_name (WebKitFeature $feature)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_feature_get_status (WebKitFeature $feature)
  returns WebKitFeatureStatus
  is      native(webkit)
  is      export
{ * }

sub webkit_feature_get_type
  returns GType
  is      native(webkit)
  is      export
{ * }

sub webkit_feature_list_get (
  WebKitFeatureList $feature_list,
  gsize             $index
)
  returns WebKitFeature
  is      native(webkit)
  is      export
{ * }

sub webkit_feature_list_get_length (WebKitFeatureList $feature_list)
  returns gsize
  is      native(webkit)
  is      export
{ * }

sub webkit_feature_list_get_type
  returns GType
  is      native(webkit)
  is      export
{ * }

sub webkit_feature_list_ref (WebKitFeatureList $feature_list)
  returns WebKitFeatureList
  is      native(webkit)
  is      export
{ * }

sub webkit_feature_list_unref (WebKitFeatureList $feature_list)
  is      native(webkit)
  is      export
{ * }

sub webkit_feature_ref (WebKitFeature $feature)
  returns WebKitFeature
  is      native(webkit)
  is      export
{ * }

sub webkit_feature_unref (WebKitFeature $feature)
  is      native(webkit)
  is      export
{ * }
