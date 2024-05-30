use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GIO::Raw::Definitions;
use WebKit::Raw::Definitions;
use WebKit::Raw::Enums;

unit package WebKit::Raw::Credential;

### /usr/include/webkitgtk-6.0/webkit/WebKitCredential.h

sub webkit_credential_copy (WebKitCredential $credential)
  returns WebKitCredential
  is      native(webkit)
  is      export
{ * }

sub webkit_credential_free (WebKitCredential $credential)
  is      native(webkit)
  is      export
{ * }

sub webkit_credential_get_certificate (WebKitCredential $credential)
  returns GTlsCertificate
  is      native(webkit)
  is      export
{ * }

sub webkit_credential_get_password (WebKitCredential $credential)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_credential_get_persistence (WebKitCredential $credential)
  returns WebKitCredentialPersistence
  is      native(webkit)
  is      export
{ * }

sub webkit_credential_get_type
  returns GType
  is      native(webkit)
  is      export
{ * }

sub webkit_credential_get_username (WebKitCredential $credential)
  returns Str
  is      native(webkit)
  is      export
{ * }

sub webkit_credential_has_password (WebKitCredential $credential)
  returns uint32
  is      native(webkit)
  is      export
{ * }

sub webkit_credential_new (
  Str                         $username,
  Str                         $password,
  WebKitCredentialPersistence $persistence
)
  returns WebKitCredential
  is      native(webkit)
  is      export
{ * }

sub webkit_credential_new_for_certificate (
  GTlsCertificate             $certificate,
  WebKitCredentialPersistence $persistence
)
  returns WebKitCredential
  is      native(webkit)
  is      export
{ * }

sub webkit_credential_new_for_certificate_pin (
  Str                         $pin,
  WebKitCredentialPersistence $persistence
)
  returns WebKitCredential
  is      native(webkit)
  is      export
{ * }
