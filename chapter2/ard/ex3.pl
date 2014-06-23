#!/usr/bin/perl -w
use strict;
use 5.010;

use Math::Trig qw( pi );
use Scalar::Util qw( looks_like_number );
use Getopt::Std;

my %opts = ();
getopts( 'r:', \%opts );

my $radius = $opts{r};

if ( looks_like_number( $radius ) ) {
  my $circumference;
  if ( $radius < 0 ) {
    $circumference = 0;
  }
  else {
    my $circumference = $radius * 2 * pi;
  }
  say "Circumference for circle of radius $radius is $circumference.";  
}
else {
  say "Invalid or no radius provided.  Usage: ./ex2.pl -r [radius]";
}
