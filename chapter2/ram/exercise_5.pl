#!/usr/bin/perl
use strict;
use warnings;

my $repeatable_str = 0;
my $times = 0;

# Read the string
print "Enter a string:\n";
$repeatable_str = <>;
chomp $repeatable_str;

# Read the number of times to display the string
print "Enter the number of times to display the above string:\n";
$times = <>;
chomp $times;

# If the number of times to print is not a valid integer, default to 1
if ( $times !~ /^\d+?$/a ) {
  $times = 1;
}

# Display the result
print( $repeatable_str x $times . "\n" );
