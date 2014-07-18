#!/usr/bin/perl -w
use strict;
use 5.010;

say "Feed me some strings:";
my @input = ( <STDIN> );
chomp @input;

say ( ( 1..9, 0 ) x 8 );

foreach my $line ( @input ) {
  printf( "%20s\n", $line );
}
