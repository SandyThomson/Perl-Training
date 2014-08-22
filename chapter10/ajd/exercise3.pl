#!/usr/bin/perl

use strict;
use warnings;

# Updated version: Set some undefined and false environment variables
%ENV = (
    %ENV,
    FALSE_VALUE => 0,
    UNDEFINED_VALUE => undef,
    SOME_OTHER_VALUE => 8,
    A_STRING => "String you",
  );

# First, find out which environment variable has the longest name
my $width = 0;

# Walk the array to find the length of the longest element
foreach my $key ( keys %ENV ) {
  if ( length $key > $width ) {
    $width = length $key;
  }
}

# Print the keys and values in a nice format
printf ( "%-*s %s\n", $width, 'Variable', 'Value' );
foreach my $key ( sort keys %ENV ) {
  printf ( "%-*s %s\n", $width, $key, $ENV{$key} // "(Undefined Value)" );
}
