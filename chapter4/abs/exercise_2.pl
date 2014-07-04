#!/usr/bin/perl

use strict;
use warnings;

sub total {
  my ( @numbers ) = @_;

  my $total;
  foreach my $number ( @numbers ) {
    $total += $number;
  }

  return $total;
}

my $total = total( 1..1000 );
print "The total of 1 to 1,000 is $total.\n";
