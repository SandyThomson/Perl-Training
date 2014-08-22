#!/usr/bin/perl

use strict;
use warnings;

my $what = "fred|barney";

print "Matching using $what\n";

while ( <> ) {
  if ( /($what)g{1}g{1}/ ) {
    print "$_";
  }
}

