#!/usr/bin/perl

use strict;
use warnings;

if (! scalar @ARGV ) {
  print "Enter some lines, Ctrl-D to exit:\n";
}

# Keeping line breaks because lazy
my @lines = <>;

print "\nLines Containing a capitalised word that isn't all capitalised:\n";
print grep( /\b[A-Z]\w*[a-z]+\w*\b/, @lines );

