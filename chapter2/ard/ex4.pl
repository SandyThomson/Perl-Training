#!/usr/bin/perl -w
use strict;
use 5.010;

use Scalar::Util qw( looks_like_number );

my ( $num1, $num2 ) = @ARGV;

if ( looks_like_number( $num1 ) && looks_like_number( $num2 ) ) {
  my $product = $num1 * $num2;
  say "Product of $num1 and $num2 is $product.";
}
else {
  say "Expected 2 numbers.  Usage: ./ex4.pl [num] [num]";
}
