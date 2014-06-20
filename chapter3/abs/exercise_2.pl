#!/usr/bin/perl

use warnings;
use strict;

use Scalar::Util qw( looks_like_number );

use constant names => [ qw( fred betty barney dino wilma pebbles bamm-bamm ) ];

chomp( my @name_indexes = <STDIN> );

foreach my $name_index ( @name_indexes ) {
  if ( !looks_like_number( $name_index ) || !defined( names->[$name_index] ) ) {
    print( 'No name for: ' . $name_index . $/ );
    next;
  }

  print( names->[$name_index] . $/ );
}
