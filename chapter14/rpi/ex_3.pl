#!/usr/bin/perl

use warnings;
use strict;

#no validation I know but I can't be bothered writing it for a training exercise
my ( $string, $sub ) = @ARGV;

print "Looking for $sub in $string\n";

my $index = -1;
while ( $index = index ( $string, $sub, $index + 1 ) ) {
  last if ( $index < 0 );
  print "$index\n";
}

