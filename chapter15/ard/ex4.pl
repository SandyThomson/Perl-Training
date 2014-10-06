#!/usr/bin/perl -w
use strict;

use 5.010001;

my $num = $ARGV[0] // '';

given ( $num ) {
  when ( !/^\d+$/ ) { say "Please provide a positive integer" }
  
  my @divisors = divisors( $_ );
  
  when ( @divisors ~~ [] ) { say "$_ is prime" }

  default { say "Divisors of $_ are ".join( ', ', @divisors ) }
}


sub divisors {
  my $number = shift;

  my @divisors = ();
  foreach my $divisor ( 2 .. ( $number/2 ) ) {
    push @divisors, $divisor unless $number % $divisor;
  }
  return @divisors;
}
