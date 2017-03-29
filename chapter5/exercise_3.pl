#!/usr/bin/perl

use strict;
use warnings;

use Scalar::Util qw( looks_like_number );
use POSIX qw( ceil );

use constant OUTPUT_WIDTH => 20;

my $width = get_line_width();
print( ( ( 1..9, 0 ) x ( ceil( $width / 10 ) + 1 ) ), $/ );

chomp( my @input = <STDIN> );

foreach my $line ( @input ) {
  printf( "%*s", $width + 1, $line . $/ );
}

sub get_line_width {
  print( 'Enter line width: ' );
  my $width = <STDIN>;

  if ( !looks_like_number( $width ) ) {
    print( "Non-numeric input! Using default of 20.$/" );
    return OUTPUT_WIDTH;
  }
  elsif ( $width < 1 ) {
    print( "Width is a negative number! Using default of 20.$/" );
    return OUTPUT_WIDTH;
  }
  return $width;
}
