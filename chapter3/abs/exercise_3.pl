#!/usr/bin/perl

use warnings;
use strict;

chomp( my @scalar_list = <STDIN> );
my @sorted_scalar_list = sort( @scalar_list );

print( 'Sorted input using default sorting rules, outputing new list' . $/ x 2 );
while( my ( $index, $scalar ) = each( @sorted_scalar_list ) ) {
  print( "Item $index is '$scalar' $/" );
}
