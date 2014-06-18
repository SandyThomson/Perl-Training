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

my $circumference = ( ( 2 * PI ) * $radius );

print "The circumference is: $circumference\n";
