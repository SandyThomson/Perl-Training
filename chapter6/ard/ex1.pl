#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

my %people = (
  andrew => 'davey',
  alex => 'deas',
  sean => 'clark',
  arran => 'stobbs',
  sandy => 'thomson',
  richard => 'ince',
  mathieu => 'patureau',
  robert => 'main',
);

say "Give me some first names (^D to quit): ";

while ( my $input = <STDIN> ) {
  if ( $input ) {
    chomp $input;
    if ( exists $people{$input} ) {
      say "We know $input $people{$input}";
    }
    else {
      say "We don't know $input";
    }
  }
  else {
    say "We have no anonymous people!";
  }
}
