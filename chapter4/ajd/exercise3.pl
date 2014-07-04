#!/usr/bin/perl

use strict;
use warnings;

# Test program
my @fred = above_average(1..10);
print "\@fred is @fred\n";
print "(Should be 6 7 8 9 10)\n";
my @barney = above_average(100, 1..10);
print "\@barney is @barney\n";
print "(Should be just 100)\n";

# Exercise 4 parts
sub above_average {
  # Get the mean of the list and return anything greater than it
  my $mean = mean(@_);
  return grep ( $_ > $mean, @_ );
}

sub mean {
  # Get the total and divide it
  return total(@_) / scalar(@_);
};

# Function for calculating the total from exercise1
sub total {
  # Sums
  my $total = 0;
  $total += $_ foreach @_;
  return $total;
}
