#!/usr/bin/perl -w
use strict;
use 5.0100;

use Scalar::Util qw( looks_like_number );


my @range = ( 1..1_000 );
my $range_total = total( @range );
say "The total of 1..1,000 is $range_total.";


sub total {
  my @args = @_;
  my $total = 0;
  
  foreach my $arg ( @args ) {
    if ( looks_like_number( $arg ) ) {
      $total += $arg;
    }
    else {
      say "'$arg' is not a number so I'll ignore it!";
    }
  }
  
  return $total;
}
