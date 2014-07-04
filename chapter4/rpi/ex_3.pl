#!/usr/bin/perl

use strict;
use warnings;

sub total {
  my @numbers = @_;

  my $total = 0;
  while ( my $number = pop @numbers ) {
    $total += $number;
  }

  $total;
}

sub average {
  my @set = @_;
  my $total = total( @set );
  $total / ( $#set + 1 );
}

sub above_average {
  my @numbers = @_;
  my $average = average( @numbers );

  @numbers = sort {$b <=> $a} @numbers;

  my @output = ();
  while ( $numbers[0] > $average ) {
    unshift @output, shift @numbers;
  }

  return @output;
}

my @fred = above_average(1..10);
print "\@fred is @fred\n";
print "(Should be 6 7 8 9 10)\n";
my @barney = above_average(100, 1..10);
print "\@barney is @barney\n";
print "(Should be just 100)\n";
