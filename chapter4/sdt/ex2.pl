#!/usr/bin/perl

use strict;
use warnings;
use ex1 qw( total );

my $total = total( 1..1000 );
print "The sum of numbers in the range 1 to 1000 (inclusive) is $total.\n";
