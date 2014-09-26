#!/usr/bin/perl

use strict;
use warnings;
use Scalar::Util qw( looks_like_number );
use 5.010;
use feature 'say';

my @numbers = map { looks_like_number( $_ ) ? $_ : () } @ARGV;

if( scalar @numbers == 0){
  say "No valid numeric input supplied";
}

my @sorted_numbers = sort { $a <=> $b } @numbers;
my $max_length = get_length_of_biggest_string( @numbers );

foreach my $number ( @sorted_numbers ) {
   printf "%*s\n", $max_length, $number;
}

sub get_length_of_biggest_string {
  my @strings = @_;

  my $max_length = 0;

  foreach my $string (@strings){
    if( length $string > $max_length ){
      $max_length = length $string;
    }
  }

  return $max_length;
}
