#!/usr/bin/perl
## Copyright (C) by Yours Truly

use strict;
use warnings;

# Full list
my %files_to_update = map { $_ => 1 } @ARGV;
print("Full list of files:\n");
print( join(", ", sort keys %files_to_update), "\n");

# Find the files containing the copyright already
while ( <> ) { 
  if ( /^## Copyright \(C\) by Yours Truly$/ ) {
    delete $files_to_update{$ARGV};
  }
}

print("Modified list, once files already containing change have been removed:\n");
print( join(", ", sort keys %files_to_update), "\n");

# Filter the argument list
@ARGV = keys %files_to_update;

# Only process if there are files to update!
if ( @ARGV ) {
  $^I = ".bak";
  
  while ( <> ) {
    s|(?<firstline>^#!/usr/bin/perl.*$)|$+{firstline}\n## Copyright (C) by Yours Truly|ig;
    print;
  }
}

