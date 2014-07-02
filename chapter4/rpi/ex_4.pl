#!/usr/bin/perl

use strict;
use warnings;

my ( $name_one, $name_two );

sub greet {
  my ( $name ) = @_;

  if ( !$name_one ) {
    $name_one = $name;
    print "Hi $name_one! You are the first one here!\n";
  }
  else {
    if ( !$name_two ) {
      $name_two = $name;
    }
    else {
      $name_one = $name_two;
      $name_two = $name;
    }
    print "Hi $name_two! $name_one is also here!\n";
  }
}

greet( "Fred" );
greet( "Barney" );
