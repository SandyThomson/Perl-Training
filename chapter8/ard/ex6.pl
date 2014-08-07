#!/usr/bin/perl

use strict;
use warnings;

use 5.010;

my @input = (<>);
chomp @input;
my @output = grep { /\s$/ } @input;

if ( scalar @output ) {
  say "The following lines end with whitespace:";
  say join( "\n", map { "\t|$_|" } @output );
}
else {
  say "Either there was no input, or none of the lines ended with whitespace.";
}
