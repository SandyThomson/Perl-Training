#!/usr/bin/perl

use strict;
use warnings;

# Inputs
print "Newlines? (y/n): ";
chomp(my $tmp = <STDIN>);
my $separator = ( $tmp eq 'y') ? "\n" : ' ';

print "Enter some values to sort!\n";
chomp(my @input = <STDIN>);
@input = sort @input;

# names
print "\nSorted!\n";

print join( $separator, @input ), "\n";