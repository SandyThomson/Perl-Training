#!/usr/bin/perl

use strict;
use warnings;

# Full list
my %files_to_update = map { $_ => 1 } @ARGV;
print("Full list:\n");
print( join(", ", keys %files_to_update), "\n");

# Find the files containing the copyright already
while ( <> ) { 
  if ( /## Copyright \(C\) by Yours Truly/ ) {
    delete $files_to_update{$ARGV};
  }
}

print("Updated list:\n");
print( join(", ", keys %files_to_update), "\n");

@ARGV = keys %files_to_update;

$^I = ".bak";

while ( <> ) {
  s|(?<firstline>#!/usr/bin/perl.*$)|$+{firstline}\n## Copyright (C) by Yours Truly|ig;
  print;
}

