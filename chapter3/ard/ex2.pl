#!/usr/bin/perl -w
use strict;
use 5.010;

use Scalar::Util qw( looks_like_number );

my @names = qw( fred betty barney dino wilma pebbles bamm-bamm );
my @input = ();

say "Enter indices: (Ctrl-D to stop)";
while ( my $line = <STDIN> ) {
  push @input, $line;
}
chomp @input;

say "\nChosen names:";
foreach my $index ( @input ) {
  if ( is_valid_index( $index ) ) {
    say "$index: $names[$index-1]";
  }
}


sub is_valid_index {
  my ( $index ) = @_;
  if (    looks_like_number( $index )
       && $index > 0 
       && $index <= $#names + 1 ) {
    return 1;
  }
  return 0;
}
