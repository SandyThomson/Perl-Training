#!/usr/bin/perl

use strict;
use warnings;
use Scalar::Util qw( looks_like_number );
use Getopt::Std;

my %opts = ();
getopts( 'd', \%opts );

my $number = new_random_number();
print "The number selected to guess is $number\n" if $opts{d};

print "Please guess the secret number.\n";

while ( 1 ) {
  print "1-100 >";
  chomp ( my $guess = <STDIN> );
  
  if ( $guess eq '' || $guess =~ /exit|quit/ ) {
    print "Exiting awesome number guessing program.\nThe number was $number by the way.\n";
    print "Wimp\n" if $opts{d};
    last;
  }
  elsif ( !looks_like_number( $guess ) ) {
    print "Your guess must be a number\n";
    next;
  }
  elsif ( $number == $guess ) {
    print "Congratulations, you correctly guessed $number\n";
    last;
  }
  else {
    if ( $guess > $number ) {
      print "Too high\n";
      my $diff = $guess - $number;
      print "You are $diff off\n" if $opts{d};
    }
    else {
      print "Too low\n";
      my $diff = $number - $guess;
      print "You are $diff off\n" if $opts{d};
    }
  }
}


sub new_random_number {
  return int(1 + rand 100);
}
