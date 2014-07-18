#!/usr/bin/perl -w
use strict;
use 5.010;

say "Feed me some strings. First line denotes line width:";
my @input = ( <STDIN> );
chomp @input;

my $width = shift @input;

if ( $width !~ /[0-9]+/ ) {
  die "First entry must be an integer!";
}

say( ( 1..9, 0 ) x int( $width / 10 + 1 ) );

foreach my $line ( @input ) {
  printf( "%${width}s\n", $line );
}
