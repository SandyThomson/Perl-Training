#!/usr/bin/perl

use strict;
use warnings;

use Circle;

my ( $radius ) = @ARGV;

# If a radius isn't specified, or a non-numeric one is,
# ask for a radius
while ( !defined $radius || $radius !~ /^-?\d+(?:.\d+)?$/ ) {
  print "Enter radius (any number): ";
  $radius = <STDIN>;
}

my $circle = new Circle( radius => $radius );

print "The circumference is: " . $circle->circumference() . "\n";
