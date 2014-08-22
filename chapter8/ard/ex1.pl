#!/usr/bin/perl

use strict;
use warnings;

use 5.010;

while (<>) { # take one input line at a time
  chomp;
  if (/ match /) {
    say "Matched: |$`<$&>$'|"; # the special match vars
  }
  else {
    say "No match: |$_|";
  }
}
