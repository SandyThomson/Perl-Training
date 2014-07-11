#!/usr/bin/perl

use strict;
use warnings;

use constant OUTPUT_WIDTH => 20;

print( ( ( 1..9, 0 ) x 3 ), $/ );

chomp( my @input = <STDIN> );

foreach my $line ( @input ) {
  printf( "%*s", OUTPUT_WIDTH + 1, $line . $/ );
}
