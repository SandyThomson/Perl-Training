#!/usr/bin/perl

use strict;
use warnings;
use Test::More;
use ex1 qw( total );

# Invoke using "prove <file>.t"

is( total( qw{ 1 3 5 7 9 } ), 25, "Count multiple items" );
is( total( qw{ 0 0 } ), 0, "Multiple zeroes" );
is( total( 0 ), 0, "Single zero" );
is( total(), 0, "No input" );
is( total( 1 ), 1, "Single value" );
is( total( 1, -2 ), -1, "Negative numbers" );
is( total( 1.3, 2.734 ), 4.034, "Decimal point numbers" );

foreach my $die_scenario ( "", " ", undef, "poo", ){
  eval{ 
    total( $die_scenario )
  };
  like( $@, qr/List contains input that's not entirely numeric at ex1\.pm/, "Check error message for ".( defined $die_scenario ? $die_scenario : "undef" ) );
}

done_testing();
