#!/usr/bin/perl

use strict;
use warnings;

# First, find out which environment variable has the longest name
my $width = 0;

# Walk the array to find the length of the longest element
foreach my $key ( keys %ENV ) {
  if ( length $key > $width ) {
    $width = length $key;
  }
}

# Print the keys and values in a nice format
printf ( "%-${width}s %s\n", 'Variable', 'Value' );
foreach my $key ( sort keys %ENV ) {
  printf ( "%-${width}s %s\n", $key, $ENV{$key} );
}
