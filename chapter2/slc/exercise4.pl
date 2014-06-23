#!/usr/bin/perl

use strict;
use feature qw(say);

# inputs
my $input1 = get_number(1);
my $input2 = get_number(2);

# calculate
say $input1 * $input2;

sub get_number {
  my $number = shift;
  my $tmp_input = undef;
  do {
    $tmp_input = get_input("Enter number $number:");
  } while($tmp_input !~ /^-?[0-9]+(\.[0-9]+)?$/);
  return $tmp_input;
}

sub get_input {
  my $question = shift;
  print "$question ";
  chomp(my $tmp_input = <STDIN>);
  return $tmp_input;
}