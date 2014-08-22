#!/usr/bin/perl

use strict;
use warnings;

use 5.010;

while (<>) { # take one input line at a time
  chomp;
  if ( /\b(\w*a)\b/i ) {
    say "Matched: |$`<$&>$'|";
    say "\t\$1 contains '$1'";
  }
  else {
    say "No match: |$_|";
  }
}
