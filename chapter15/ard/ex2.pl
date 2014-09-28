#!/usr/bin/perl -w
use strict;
use 5.010001;

use Scalar::Util qw( looks_like_number );

# Print:
#   “Fizz” if it is divisible by 3
#   “Bin” if it is divisible by 5
#   “Sausage” if it is divisible by 7

# First num to hit all 3 is 105:
#   $ for NUM in {1..200}; do ./ex2.pl $NUM ; done | grep "z Bin S"
#   105: Fizz Bin Sausage 

given ( $ARGV[0] ) {
  when ( !defined $_ || !looks_like_number( $_ ) ) { say "Usage: $0 <number>" }
  print "$_: ";
  when ( !( $_ % 3 ) ) { print 'Fizz '; continue }
  when ( !( $_ % 5 ) ) { print 'Bin '; continue }
  when ( !( $_ % 7 ) ) { print 'Sausage '; continue }
  default { print "\n" }
}
