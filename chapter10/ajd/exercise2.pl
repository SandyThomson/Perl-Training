#!/usr/bin/perl

use strict;
use warnings;

# Pick a number, have them guess it
my $number = int( rand(100) + 1 );
my $disable_debug = 1;
my %exit = map { $_ => 1 } ('', 'quit', 'exit');

my %response = (
    -1  => "Too low, try again",
    0   => "Correct",
    1   => "Too high, try again",
  );

print "I'm thinking of a number between 1 and 100, have a guess\n";

while ( my $guess = <STDIN> ) {

  chomp( $guess );

  if ( defined $exit{$guess} ) {
    print "You're no fun\n";
    last;
  }
  elsif ( $guess eq "debug" ) {
    $disable_debug = ( $disable_debug ? undef : 1 );
    print "Debug mode " . ($disable_debug ? "disabled" : "enabled" ) . ", continue\n";
    next;
  }
  elsif ( $guess !~ /\A-??\d+(?:\.\d+)??\z/ ) {
    print "A number I said, try harder:\n";
    next;
  }

  print $response{ $guess <=> $number } . "\n";
  last unless $guess <=> $number;

} continue {
  # Didn't really like doing it this way, but they insisted
  $disable_debug // print "DEBUG: The number is $number\n";
}
