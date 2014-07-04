#!/usr/bin/perl

use strict;
use warnings;

sub total {
  my @numbers = @_;

  my $total = 0;
  while ( my $number = pop @numbers ) {
    $total += $number;
  }

  $total;
}

my @range = (1..1000);
my $total = total( @range );
print "The total of $range[0] to $range[-1] is $total\n";
