#!/usr/bin/perl

use strict;
use warnings;

if (! scalar @ARGV ) {
  print "Enter some lines, Ctrl-D to exit:\n";
}

# Keeping line breaks because lazy
my @lines = <>;

print "\nLines Containing 'fred' somewhere:\n";
print grep( /[Ff]red/, @lines );

print "\nLines Containing the word 'fred':\n";
print grep( /\b[Ff]red\b/, @lines );

