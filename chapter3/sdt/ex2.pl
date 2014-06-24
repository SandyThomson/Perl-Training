#!/usr/bin/perl

use strict;
use warnings;
use feature "say";
use Scalar::Util qw( looks_like_number );

my @flintstones = qw( fred betty barney dino wilma pebbles bamm-bamm );

sub get_indexes {
  my @list_indexes;

  say "Please enter a list of integers >= 0 on seperate lines (Press Ctrl-D [EOF] to stop input)";
  say "=" x 20;

  while( my $input = <STDIN> ){  # Limit of 500 collected integers
    if( looks_like_number($input) && $input =~ /^\d+$/ ){
      if( $input >= 0 && $input <= $#flintstones ){
        push @list_indexes, $input;
      } else {
        die "Input is invalid (valid values are 0 to ".$#flintstones.")\n";
      }
    }
    else {
      die "Input is not a positive whole number\n";
    }
  } 
  return \@list_indexes; # Pass an arrayref back to the caller
}

sub print_flintstones {
  my ( $indexes_to_print ) = @_;

  say "Flintstones:";
  say "=" x 20;

  foreach my $index (@$indexes_to_print){
    say $flintstones[$index]; 
  }
}

sub main {
  my $indexes_to_print = get_indexes();
  print_flintstones( $indexes_to_print );
}

main();
