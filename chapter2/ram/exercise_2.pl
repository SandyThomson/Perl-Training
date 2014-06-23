#!/usr/bin/perl
use strict;
use warnings;

my $pi = 3.141592654;
my $radius = 1;
my $circumference = 0;

# Read a radius
print "Enter a radius:\n";
$radius = <>;
chomp $radius;

# Calculate the circumference for a circle with this radius
$circumference = 2 * $pi * $radius;

# Display the result
print "Circumference for circle with radius [$radius] is [$circumference].\n";
