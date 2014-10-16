#!/usr/bin/perl

use warnings;
use strict;
use 5.010;
use autodie;

my @lines = <>;

while ( my $input = <STDIN> ){

  chomp $input;
  exit 0 if $input eq "";

  my @matching_lines = ();
  eval {
    # I should attempt to stop someone putting /'s in the input, but I CBA
    @matching_lines = grep { $_ =~ $input } @lines;
  };

  if ( $@ ){
    say "Sorry, there was a problem with your input, please try again";
  }
  else {
    say "There were ". scalar @matching_lines ." matching_lines";
    say "=" x 20;
    print @matching_lines;
    say "=" x 20;
  }
}
