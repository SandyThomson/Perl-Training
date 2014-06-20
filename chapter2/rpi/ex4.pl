#!/usr/bin/perl -w

use Math::Trig;

print "Lets multiply some numbers\n";
print "Please input your first number : ";

my $first = <STDIN>;

while ( $first eq "\n" ) {
        print "\nYou need to input a number : ";
        $first = <STDIN>;
}

print "Please input your second number : ";

my $second = <STDIN>;

while ( $second eq "\n" ) {
        print "\nYou need to input a number : ";
        $second = <STDIN>;
}

print "The result is : ";
print ( $first * $second );
print "\n";
