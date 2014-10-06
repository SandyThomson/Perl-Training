#!/usr/bin/perl

use strict;
use warnings;
no warnings 'experimental::smartmatch';

use Scalar::Util qw( looks_like_number );
use 5.018;
use feature 'say';

say "Type a number";

given( <STDIN> ){

  when( $_ % 3 == 0 ){
    say "Fizz"; continue
  }
  when( $_ % 5 == 0 ) {
    say "Bin"; continue 
  }
  when( $_ % 7 == 0 ) {
    say "Sausage";
  }
}

# 210 ?
