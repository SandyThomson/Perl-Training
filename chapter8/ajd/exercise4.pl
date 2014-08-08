#!/usr/bin/perl

# Adding these because why wouldn't you?
use strict;
use warnings;

while (<>) {                   # take one input line at a time
  chomp;
  if (/\b(?<name>\w+a)\b/) {
    print "Matched: |$`<$&>$'|\n";  # the special match vars
    print "'name' contains '$+{name}'\n";
  } else {
    print "No match: |$_|\n";
  }
}


