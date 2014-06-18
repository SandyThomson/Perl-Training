#!/usr/bin/perl

use strict;
use warnings;

my ( $phrase, $number ) = @ARGV;

if ( !defined $phrase ) {
  # Don't need to validate this
  print "Enter a phrase: ";
  $phrase = <STDIN>;
  chomp( $phrase );
}

# Require a number otherwise the next part won't work
while ( !defined $number || $number !~ /^-?\d+(?:.\d+)?$/ ) {
  print "Enter a number: ";
  $number = <STDIN>;
}

print "$phrase\n" x $number;
