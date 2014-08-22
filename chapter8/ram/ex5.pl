#!/usr/bin/perl
use strict;
use warnings;
use 5.010;

while ( <> ) {
  chomp;
  if ( /\b(?<word>\w*a)\b(?<next_5_chars>.{0,5})/ ) {
    print "Matched: |$`<$&>$'|, \$+{word} contains '$+{word}', \$+{next_5_chars} are '$+{next_5_chars}'\n";  # the special match vars
  }
  else {
    print "No match: |$_|\n";
  }
}

