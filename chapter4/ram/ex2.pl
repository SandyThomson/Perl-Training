#!/usr/bin/perl

use strict;
use warnings;
use Utils qw( total );

my $one_to_thousand = total( 1 .. 1000 );
print "Total of all numbers between 1 and 1000 inclusive is $one_to_thousand\n";
