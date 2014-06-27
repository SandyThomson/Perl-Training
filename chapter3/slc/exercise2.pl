#!/usr/bin/perl

use strict;
use warnings;

# Names
my @names = qw( fred betty barney dino wilma pebbles bamm-bamm );

# Inputs
print "Print some names!\n";
while (my ($index, $value) = each @names) {
    print "[" . ($index + 1) . "] - $value\n";
}
chomp(my @input = <STDIN>);


# names
print "\nHere are the names (I'm ignoring any stupid selections)\n";
my $output = "";
while (my ($index, $value) = each @names) {
   if ( ($index + 1) ~~ @input) {
	$output .= $value . ' ';
    }
}

print $output . "\n";