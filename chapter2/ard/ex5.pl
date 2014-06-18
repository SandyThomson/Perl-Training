#!/usr/bin/perl -w
use strict;
use 5.010;

use Scalar::Util qw( looks_like_number );

my ( $text, $reps );

print "Enter text: ";
$text = <STDIN>;

while ( !looks_like_number( $reps ) || $reps < 0 ) {
  print "How many repetitions? ";
  $reps = <STDIN>;
}
chomp $reps;

print "\n", $text x $reps, "\nDone\n";
