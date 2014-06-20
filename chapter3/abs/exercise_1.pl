#!/usr/bin/perl

use warnings;
use strict;

chomp( my @scalar_list = <STDIN> );
my @reversed_scalar_list = reverse( @scalar_list );

print( 'Reversed input, outputing new list' . $/ x 2 );
while( my ( $index, $scalar ) = each( @reversed_scalar_list ) ) {
  print( "Item $index is '$scalar' $/" );
}
