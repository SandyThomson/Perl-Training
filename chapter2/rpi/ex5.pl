#!/usr/bin/perl -w

use Math::Trig;

print "Lets print a string some number of times\n";
print "Please input the string you wish to print : ";

my $first = <STDIN>;

while ( $first eq "\n" ) {
        print "\nYou need to input a string : ";
        $first = <STDIN>;
}

chomp( $first );

print "Please input the number of times to print your string : ";

my $second = <STDIN>;

while ( $second eq "\n" ) {
        print "\nYou need to input a number : ";
        $second = <STDIN>;
}

print "The result is : \n";
print ( $first x $second );
print "\n";
