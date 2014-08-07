#!/usr/bin/perl

use strict;
use warnings;

use 5.010;

while (<>) { # take one input line at a time
  chomp;
  if ( /\b(?<word>\w*a)\b/i ) {
    say "Matched: |$`<$&>$'|";
    say "\t'word' contains '$+{word}'";
  }
  else {
    say "No match: |$_|";
  }
}