#!/usr/bin/perl

use strict;
use feature qw(say);

# constants
my $pi = 3.141592654;

# radius
my $radius_input = 12.5;

# calculate
my $circ = calculate_circumference( $radius_input );
say $circ;

sub calculate_circumference {
  my $radius = shift;
  return $radius * $pi * 2;
}