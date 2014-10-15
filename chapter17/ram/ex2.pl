#!/usr/bin/perl

use strict;
use warnings;

my @files = glob '*';

foreach my $file ( @files ) {
  my( $atime, $mtime ) = ( stat( $file ) )[ 8, 9 ];
  printf( "%-30s%20d%20d\n", $file, $atime, $mtime );
}
