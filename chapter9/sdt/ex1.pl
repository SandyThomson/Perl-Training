#!/usr/bin/perl

use strict;
use warnings;

my $what = 'fred|barney';
my $regex = qr/(?:$what){3}/;

my $string = 'foorbafredfredbarneyfredfred';

if( $string =~ $regex ) {
  print "Matched $what exactly 3 times with $`<$&>$'\n";
} 
else {
  print "$what didn't match 3 times\n";
}
