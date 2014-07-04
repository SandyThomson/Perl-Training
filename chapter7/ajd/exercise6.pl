#!/usr/bin/perl

use strict;
use warnings;

if (! scalar @ARGV ) {
  print "Enter some lines, Ctrl-D to exit:\n";
}

# Keeping line breaks because lazy
my @lines = <>;

print "\nLines Containing fred and wilma:\n";
print grep( /(fred.*wilma|wilma.*fred)/, @lines );

