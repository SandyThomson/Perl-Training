#!/usr/bin/perl -w
use strict;
use 5.010;

use Math::Trig qw( pi );
use Scalar::Util qw( looks_like_number );
use Getopt::Std;

my %opts = ();
getopts( 'r:', \%opts );

my $radius = $opts{r};

if ( !defined $radius ) {
  print "No radius provided - please enter one: ";
  $radius = <STDIN>;
  chomp $radius;
}

if ( looks_like_number( $radius ) ) {
  my $circumference = $radius * 2 * pi;
  say "Circumference for circle of radius $radius is $circumference.";  
}
else {
  say "Invalid or no radius provided.  Usage: ./ex2.pl -r [radius]";
}
