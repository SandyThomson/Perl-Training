#!/usr/bin/perl

use strict;
use warnings;

# Test program
my @fred = qw( 1 3 5 7 9 );
my $fred_total = total(@fred);
print "The total of \@fred is $fred_total.\n";
print "Enter some numbers on separate lines: ";
my $user_total= total(<STDIN>);
print "The total of those numbers is $user_total.\n";

# Function for calculating the total
sub total {
  # Sums
  my $total = 0;
  $total += $_ foreach @_;
  return $total;
}
