#!/usr/bin/perl -w

use Math::Trig;

print "Please input a radius : ";

my $radius = <STDIN>;

while ( $radius eq "\n" ) {
        print "\nYou need to input a radius : ";
        $radius = <STDIN>;
}

print ( ( 2 * pi ) * $radius );
print "\n";
