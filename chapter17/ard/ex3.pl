#!/usr/bin/perl

use strict;
use warnings;
use List::MoreUtils qw( pairwise );

# Last chance for a horrific one-liner...
printf( "%-25s %4u-%02u-%02u\t\t%4u-%02u-%02u\n", $_, map { pairwise { no warnings 'once'; $a + $b } @{[ ( localtime( $_ ) )[5,4,3] ]}, @{[ 1900, 1, 0 ]} } ( stat $_ )[8,9] ) foreach ( sort glob "* .*" );
