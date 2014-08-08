#!/usr/bin/perl

# Adding these because why wouldn't you?
use strict;
use warnings;

while (<>) {                   # take one input line at a time
  chomp;
  if (/\b(?<name>\w+a)\b(?<extra>.{0,5})/) {
    print "Matched: |$`<$&>$'|\n";  # the special match vars
    print "'name' contains '$+{name}' and 'extra' contains '$+{extra}'\n";
  } else {
    print "No match: |$_|\n";
  }
}


