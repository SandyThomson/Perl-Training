#!/usr/bin/perl
use strict;
use warnings;


# computes the circumference of a circle
use constant PI => 3.141592654;
my $radius =  12.5;

print 2 * PI * $radius . "\n"; 

# Second question 
print "Enter radius: ";
$radius = <STDIN>; # I moved chomp to a new line to make it more readable
chomp $radius ; # Get rid of newline character at the end

print "Circonf : " . 2 * PI * $radius . "\n"; 


# Third question 
my $circonf = 0;
print "Enter radius: ";
$radius = <STDIN>; # I moved chomp to a new line to make it more readable
chomp $radius ; # Get rid of newline character at the end
if( $radius  >= 0 ){
  $circonf  =  2 * PI * $radius ;
}

print "Circonf : $circonf \n"; 


# 4th question 
print "Enter first number: ";
my $number1 = <STDIN>; 
chomp $number1 ; 
print "Enter 2nd number: ";
my $number2 = <STDIN>; 
chomp $number2 ; 

print "$number1 * $number2  = " . $number1 * $number2 ."\n"; 



# 5th question 
print "Enter a string : ";
my $string = <STDIN>; 
chomp $string ; 
print "Enter a number of times : ";
my $count = <STDIN>; 
chomp $count ; 

for (my $i=1; $i <= $count; $i++) {
   print "$i] $string \n";
}
# or 
print "$string \n" x $count;



