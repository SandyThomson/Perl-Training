#!/usr/bin/perl

use strict;
use warnings;

# Exercise 2
print "The sum of numbers from 1 to 1000 is: " . total(1 .. 1000) . "\n";

# Function for calculating the total from exercise1
sub total {
  # Sums
  my $total = 0;
  $total += $_ foreach @_;
  return $total;
}
