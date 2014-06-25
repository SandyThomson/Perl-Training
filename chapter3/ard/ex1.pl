#!/usr/bin/perl -w
use strict;
use 5.010;

my @input = ();

say "Feed me some input! (Ctrl-D to end) ";

while ( my $line = <STDIN> ) {
  push @input, $line;
}

chomp @input;

say "\nYou fed me, in reverse:";
say join "\n", reverse @input;

