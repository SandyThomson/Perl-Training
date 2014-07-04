#!/usr/bin/perl

use strict;
use warnings;

sub average {
  my ( @numbers ) = @_;

  my $total;
  map { $total += $_ } @numbers;

  return $total / scalar( @numbers );
}

sub above_average {
  my ( @numbers ) = @_;

  my $average = average( @numbers );

  my @above_average;
  foreach my $number ( @numbers ) {
    if ( $number > $average ) {
      push @above_average, $number;
    }
  }
  return @above_average;
}

my @fred = above_average( 1..10 );
print "\@fred is @fred\n";
print "(should be 6 7 8 9 10)\n";
my @barney = above_average( 100, 1..10 );
print "\@barney is @barney\n";
print "(should be just 100)\n";
