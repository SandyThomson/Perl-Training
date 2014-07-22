#!/usr/bin/perl

use strict;
use warnings;

# Pick a number, have them guess it
my $number = int( rand(100) + 1 );
my %exit = map { $_ => 1 } ('', 'quit', 'exit');

my %response = (
    -1  => "Too low, try again: ",
    0   => "Correct\n",
    1   => "Too high, try again: ",
  );

print "I'm thinking of a number between 1 and 100, have a guess: ";

while ( my $guess = <STDIN> ) {

  chomp( $guess );

  if ( defined $exit{$guess} ) {
    print "You're no fun\n";
    last;
  }
  elsif ( $guess !~ /\A-??\d+(?:\.\d+)??\z/ ) {
    print "A number I said, try harder: ";
    next;
  }

  print $response{ $guess <=> $number };
  last unless $guess <=> $number;

}
