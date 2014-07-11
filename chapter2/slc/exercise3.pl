#!/usr/bin/perl

use strict;
use feature qw(say);

# constants
my $pi = 3.141592654;

# radius
my $radius_input = get_radius();

# calculate
my $circ = calculate_circumference( $radius_input );
say $circ;

sub calculate_circumference {
  my $radius = shift;
  
  # return 0 is radius is negative
  if ( $radius < 0 ) {
    return 0;
  }
  return $radius * $pi * 2;
}

sub get_radius {
  my $input = get_input('Enter a radius:');
}

sub get_input {
  my $question = shift;
  print "$question ";
  chomp(my $tmp_input = <STDIN>);
  return $tmp_input;
}