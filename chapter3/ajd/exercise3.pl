#!/usr/bin/perl

use strict;
use warnings;

# Get words and sort them
print "Enter some words, one per line, Ctrl-D to end:\n";
chomp( my @words = <STDIN> );
@words = sort ( @words );

# Ask which output style is wanted
print "Do you want them all on one line? [Y|n]: ";
chomp( my $sort = <STDIN> );

# I could have cheated and only chomped the newlines if one line
# output was asked for, but that was too easy
print join ( ( $sort =~ /^n/i ) ? "\n" : " ", @words ) . "\n";

