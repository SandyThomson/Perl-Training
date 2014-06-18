#!/usr/bin/perl

use strict;
use warnings;

use constant PI => 3.141592654;

my ( $radius ) = @ARGV;

# If a radius isn't specified, or a non-numeric one is,
# ask for a radius
while ( !defined $radius || $radius !~ /^-?\d+(?:.\d+)?$/ ) {
  print "Enter radius (any number): ";
  $radius = <STDIN>;
}

# If the radius is less than zero we don't have a circle
# set the radius to 0
if ( $radius < 0 ) {
  $radius = 0;
}

my $circumference = ( ( 2 * PI ) * $radius );

print "The circumference is: $circumference\n";
