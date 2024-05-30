use v6.c;

use Method::Also;

use WebKit::Raw::Types;
use WebKit::Raw::Credential;

use GLib::Roles::Implementor;

# BOXED

class WebKit::Credential {
  also does GLib::Roles::Implementor;

  has WebKitCredential $!wc;

  submethod BUILD ( :$webkit-cred ) {
    $!wc = $webkit-cred if $webkit-cred;
  }

  method WebKit::Raw::Definitions::WebKitCredential
    is also<WebKitCredential>
  { $!wc }

  method new (
    Str() $username,
    Str() $password,
    Int() $persistence
  ) {
    my WebKitCredentialPersistence $p = $persistence;

    my $webkit-cred = webkit_credential_new($username, $password, $p);

    $webkit-cred ?? self.bless( :$webkit-cred ) !! Nil;
  }

  method new_for_certificate (
    GTlsCertificate() $certificate,
    Int()             $persistence
  )
    is also<new-for-certificate>
  {
    my WebKitCredentialPersistence $p = $persistence;

    my $webkit-cred = webkit_credential_new_for_certificate(
      $certificate,
      $p
    );

    $webkit-cred ?? self.bless( :$webkit-cred ) !! Nil;
  }

  method new_for_certificate_pin (Str() $pin, Int() $persistence)
    is also<new-for-certificate-pin>
  {
    my WebKitCredentialPersistence $p = $persistence;

    my $webkit-cred = webkit_credential_new_for_certificate_pin($pin, $p);

    $webkit-cred ?? self.bless( :$webkit-cred ) !! Nil;
  }

  method copy ( :$raw = False ) {
    propReturnObject(
      webkit_credential_copy($!wc),
      $raw,
      |self.getTypePair,
      :!ref
    );
  }

  method free {
    webkit_credential_free($!wc);
  }

  method get_certificate ( :$raw = False )
    is also<
      get-certificate
      certificate
    >
  {
    propReturnObject(
      webkit_credential_get_certificate($!wc),
      $raw,
      |GIO::TlsCertificate.getTypePair
    );
  }

  method get_password
    is also<
      get-password
      password
    >
  {
    webkit_credential_get_password($!wc);
  }

  method get_persistence ( :$enum = True )
    is also<
      get-persistence
      persistence
    >
  {
    my $p = webkit_credential_get_persistence($!wc);
    return $p unless $enum;
    WebKitCredentialPersistenceEnum($p);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &webkit_credential_get_type, $n, $t );
  }

  method get_username
    is also<
      get-username
      username
    >
  {
    webkit_credential_get_username($!wc);
  }

  method has_password is also<has-password> {
    so webkit_credential_has_password($!wc);
  }

}
