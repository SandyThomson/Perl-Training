#!/usr/bin/perl -w

use strict;
 # TODO

while (<>) { # take one input line at a time
  chomp;
  if (/ match /) {
    say "Matched: |$`<$&>$'|"; # the special match vars
  }
  else {
    say "No match: |$_|";
  }
}
