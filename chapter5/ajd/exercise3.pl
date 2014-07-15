#!/usr/bin/perl

use strict;
use warnings;

my $width;
print "Enter a number for the column width:\n";

while (!defined $width || $width !~ /^\d+$/) {
  chomp( $width = <STDIN> );
}

print "Type a bunch of lines, end with Ctrl-D:\n";
chomp( my @lines = <STDIN> );

# Ruler
print  "\n" , ( map { $_ % 10 } ( 1 .. $width ) ) , "\n" ;

foreach my $line (@lines) {
  printf( "%${width}s\n", $line );
}
