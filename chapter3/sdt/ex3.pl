#!/usr/bin/perl

use strict;
use warnings;
use feature "say";
use Getopt::Long;

my $newline;

GetOptions( "newline" => \$newline ) or die "Error in command line options";

sub read_input {
  my @input;

  while( my $line = <STDIN> ){ 
    chomp $line;
    if( defined $line && $line ne "" ){
      push @input, $line;
    }
  } 
  return \@input; # Pass an arrayref back to the caller
}

sub main {

  say "Please enter a list of strings (Press Ctrl-D [EOF] to stop input)";
  say "=" x 20;

  my $input = read_input();
  my @sorted = sort( @$input );

  say "=" x 20;

  if( $newline ){
    say join "\n", @sorted;
  } else {
    # Note that if the input contains whitespace, you may not be able to differentiate between each of the strings in the output
    say join " ", @sorted;
  }
}

main();
