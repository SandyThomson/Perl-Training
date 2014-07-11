#!/usr/bin/perl

use strict;
use warnings;
use Test::More;
use ex3 qw( above_average );

{
  my @expected = 6..10;
  my @actual = above_average( 1..10 );

  is_deeply( \@actual, \@expected, "Incorrect list returnend" );
}

{
  my @expected = ( 5, 0, 21 );
  my @actual = above_average( -3, -10, 5, 0, -8 -6, 21 );

  is_deeply( \@actual, \@expected, "Incorrect list returnend" );
}

{
  my @expected = ( 20.6, 0.1 );
  my @actual = above_average( -20.6, 20.6, 0.1, -0.1, 0 );

  is_deeply( \@actual, \@expected, "Incorrect list returnend" );
}

done_testing();
