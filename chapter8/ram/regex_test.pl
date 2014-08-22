#!/usr/bin/perl
use strict;
use warnings;

while ( <> ) {
  chomp;
  if ( /PATTERN/ ) {
    print "Matched: |$`<$&>$'|\n";  # the special match vars
  }
  else {
    print "No match: |$_|\n";
  }
}

