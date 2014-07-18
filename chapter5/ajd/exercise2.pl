#!/usr/bin/perl

use strict;
use warnings;

print "Type a bunch of lines, end with Ctrl-D:\n";
chomp( my @lines = <STDIN> );

# Ruler
print "\n" , ( map { $_ % 10 } ( 1 .. 20 ) ) , "\n";

foreach my $line (@lines) {
  printf( "%20s\n", $line );
}
