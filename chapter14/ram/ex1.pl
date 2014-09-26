#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

my @numbers;

# Deal with input
foreach ( @ARGV ) {
  if ( $_ =~ /^-?[0-9]*\.?[0-9]+/ ) {
    push @numbers, $_;
  }
  else {
    say "Warning: $_ is not a number";
  }
}

@numbers = sort { $a <=> $b } @numbers;

say( join( ", ", @numbers ) );
