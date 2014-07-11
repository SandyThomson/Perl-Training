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

sub average{
  my @numbers = @_ ; 
  return total(@numbers) / scalar( @numbers ); 
}

sub above_average{
  my @numbers = @_ ; 
  my $avg =  average( @numbers );
  return grep { $_ >  $avg }  @numbers;
}

my @numbers = (1, 4 ,6 ,8 , 1, 10) ;
print "Numbers above average : ". average( @numbers )."  => ". join( ', ', above_average( @numbers )) ."\n";


my @fred = above_average(1..10);
print "\@fred is @fred\n";
print "(Should be 6 7 8 9 10)\n";
my @barney = above_average(100, 1..10);
print "\@barney is @barney\n";
print "(Should be just 100)\n";