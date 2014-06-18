#!/usr/bin/perl

use Test::More tests => 5;
use Circle;

# Test the Circle module
my $circle = new Circle( radius => 12.5 );

like( $circle->circumference(), qr/78\.5/, "Circle Module" ); # Result should be about 78.5, not fussy about the formatting

# Negative radius test
my $circle2 = new Circle( radius => -10 );
is( $circle2->circumference(), 0, "Circle constructed with negative radius" );

# Now test the scripts

# Exercise 1
my $output = qx{ perl oo-ex1.pl };
like( $output, qr/78\.5/, "Exercise 1 script" );

# Exercise 2
my $output = qx{ perl oo-ex2.pl 12.5 };
like( $output, qr/78\.5/, "Exercise 2 script" );

# Exercise 3
my $output = qx{ perl oo-ex2.pl -10 };
like( $output, qr/The circumference is: 0/, "Exercise 3 (Ex2 with a negative argument)" );



done_testing();
