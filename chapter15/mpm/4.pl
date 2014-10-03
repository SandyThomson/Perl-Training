#!/usr/bin/perl
use strict;
use warnings;
use feature qw( say);
use Scalar::Util qw(looks_like_number);
use 5.010001;

# Wher / how  are you supposed to smart matchers ?

die "Pass a number a the first argument" if !defined( $ARGV[0] ) || !looks_like_number( $ARGV[0] );
my $number = $ARGV[0] ;
my $i = 2;
my  $prime = 1;
while($i< $number){
  if( ($number % $i) == 0){
    $prime = 0;
    say $i ;
  }
  $i++;
}

say "$number is prime." if $prime  ;
