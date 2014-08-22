#!/usr/bin/perl

use strict;
use warnings;

while ( my $line = <> ) {
  # Cleanup the input newline to make things easier
  chomp ($line);

  # catch lines with additional whitespace on the end
  if ( $line =~ /\s+\z/ ) {

    # replace trailing whitespace with a character
    # (without using a substitution)
    printf( "%s%s\n", $`, '·' x length($&));
  }
}

