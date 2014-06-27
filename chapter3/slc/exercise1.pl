#!/usr/bin/perl

use strict;
use warnings;

# Inputs
print "Enter some values to be sorted on new lines:\n";
my @input = <STDIN>;

# reverse reverse
print "\nHere are your values in reverse order:\n";
print reverse @input;