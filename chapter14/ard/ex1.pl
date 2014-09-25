#!/usr/bin/perl -w
use strict;
use 5.010;

use Scalar::Util qw( looks_like_number );

my @input = ();

say "Feed me some numbers: (Ctrl-D to stop)";
while ( my $line = <STDIN> ) {
  chomp $line;
  if ( looks_like_number( $line ) ) {
    push @input, $line;
  }
  else {
    say "Input is not a number - ignoring";
  }
}

my $display_width = 0;

foreach my $num ( @input ) {
  if ( length $num > $display_width ) {
    $display_width = length $num;
  }
}

my @sorted_input = sort { $a <=> $b } @input;

say "Sorted input:";
foreach my $num ( @sorted_input ) {
  printf "  %*s\n", $display_width, $num;
}
