#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

chomp( my @input = (<>) );

my $input;

if ( scalar @input ) {
  $input = join( ' ', @input );
}

while ( !defined $input || $input eq '' ) {
  say "Enter a line of text: ";
  chomp( $input = <> );
}

my @words = $input =~ m/(\w+(?:['-]\w*)*)/mgs;

my %seen = ();

foreach my $word ( @words ) {
  $seen{$word}++;
}

foreach my $word ( sort keys %seen ) {
  say qq("$word" was seen $seen{$word} times);
}
