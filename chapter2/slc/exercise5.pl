#!/usr/bin/perl

use strict;

# Inputs
my $text = get_text();
my $number = get_positive_number();

# Print message
print "$text\n" x $number;

sub get_positive_number {
  my $tmp_input = undef;
  do {
    $tmp_input = get_input("Enter number:");
  } while($tmp_input !~ /^[0-9]+$/);
  return $tmp_input;
}

sub get_text {
  my $tmp_input = undef;
  do {
    $tmp_input = get_input("Enter some text:");
  } while($tmp_input !~ /^.+$/);
  return $tmp_input;
}

sub get_input {
  my $question = shift;
  print "$question ";
  chomp(my $tmp_input = <STDIN>);
  return $tmp_input;
}