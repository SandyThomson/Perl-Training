#!/usr/bin/perl
use strict;
use warnings;

my $first = 0;
my $second = 0;
my $result = "nan";

# Read the first value
print "Enter the first value:\n";
$first = <>;
chomp $first;

# Read the second value
print "Enter the second value:\n";
$second = <>;
chomp $second;

# Calculate the circumference for a circle with this radius
if ( ( $first =~ /^-??\d+?\.??\d*?$/a ) && ( $second =~ /^-??\d+?\.??\d*?$/a ) ) {
  $result = $first * $second;
}

# Display the result
print "Product of [$first] and [$second] is [$result].\n";
