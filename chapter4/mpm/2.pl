#!/usr/bin/perl
use strict;
use warnings;


sub total{
  my @numbers = @_ ; 
  my $sum = 0;
  for ( @numbers ) {
      $sum += $_;
  }
  return  $sum ;
}


print "The total of those numbers is ". total(1..1000) ."\n";