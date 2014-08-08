#!/usr/bin/perl
use strict;
use warnings;
use 5.010;

while ( <> ) {
  chomp;
  if ( /\b(?<word>\w*a)\b/ ) {
    print "Matched: |$`<$&>$'|, \$+{word} contains '$+{word}'\n";  # the special match vars
  }
  else {
    print "No match: |$_|\n";
  }
}

