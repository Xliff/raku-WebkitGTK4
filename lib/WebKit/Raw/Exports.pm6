use v6.c;

unit package WebKit::Raw::Exports:ver<4>;

our @wk4-exports is export;

BEGIN {
  @wk4-exports = <
    WebKit::Raw::Definitions
    WebKit::Raw::Enums
  >;
}
