use v6.c;

use GLib::Object::Type;

use WebKit::TypeManifest;

unit package WebKit::Builder:ver<4>;

INIT {
  REGISTER-GOBJECT-TYPES( WebKit::TypeManifest.manifest )
}
