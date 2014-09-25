#!/usr/bin/perl

use warnings;
use strict;

my @numbers = ();
my $size = 0;

while ( <> ) {
  chomp;
  push @numbers, $_;
}

@numbers = sort by_number_to_column @numbers;

$size = $size > 10 ? $size : 10;

foreach my $number ( @numbers ) {
  printf( "%${size}d\n", $number );
}

sub by_number_to_column {
  if ( $a < $b ) {
    $size = length( $b );
    -1;
  }
  elsif ( $a > $b ) {
    $size = length( $a );
    1;
  }
  else {
    $size = length( $a );
    0;
  }
}
