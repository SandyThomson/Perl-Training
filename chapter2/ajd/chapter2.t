#!/usr/bin/perl

use Test::More tests => 10;
use Circle;

# Exercise 1
my $output = qx{ perl exercise1.pl };
like( $output, qr/78\.5/, "Exercise 1 script" );

# Exercise 2
my $output = qx{ perl exercise2.pl 12.5 };
like( $output, qr/78\.5/, "Exercise 2 script" );

# Exercise 3
my $output = qx{ perl exercise3.pl -10 };
is( $output, "The circumference is: 0\n", "Exercise 3 with Circle" );

# Exercise 4
my $output = qx{ perl exercise4.pl 4 5 };
is( $output, "The product is 20\n", "Exercise 4 script" );

# Exercise 5
my $output = qx{ perl exercise5.pl hello 3 };
is( $output, "hello\n" x 3, "Exercise 5 script" );


## Tests using the Circle module

# Test the Circle module
my $circle = new Circle( radius => 12.5 );

like( $circle->circumference(), qr/78\.5/, "Circle Module" ); # Result should be about 78.5, not fussy about the formatting

# Negative radius test
my $circle2 = new Circle( radius => -10 );
is( $circle2->circumference(), 0, "Circle constructed with negative radius" );

# Now test the scripts

# Exercise 1
my $output = qx{ perl oo-ex1.pl };
like( $output, qr/78\.5/, "Exercise 1 with Circle" );

# Exercise 2
my $output = qx{ perl oo-ex2.pl 12.5 };
like( $output, qr/78\.5/, "Exercise 2 with Circle" );

# Exercise 3
my $output = qx{ perl oo-ex2.pl -10 };
is( $output, "The circumference is: 0\n", "Exercise 3 with Circle" );

# End
done_testing();
