#!/usr/bin/perl -w

use Math::Trig;

print "Please input a radius : ";

my $radius = <STDIN>;

while ( $radius eq "\n" ) {
        print "\nYou need to input a radius : ";
        $radius = <STDIN>;
}

if ( $radius < 0 ) {
        print "0\n";
}
else {

        print ( ( 2 * pi ) * $radius );
        print "\n";
}
