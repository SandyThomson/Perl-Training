#!/usr/bin/perl

use strict;
use warnings;

my @flintstones = qw( fred betty barney dino wilma pebbles bamm-bamm );
my @list_of_numbers;

print( "Enter some numbers between 1 and 7 on separate lines. Use EOF (CTRL-D on unix and CTRL-Z on Windows) on empty line when finished:\n" );
while ( my $input_string = <STDIN> ) {
  chomp $input_string;
  if ( $input_string =~ /^[1-7]$/ ) {
    push @list_of_numbers, $input_string;
  }
  else {
    print "Value entered is not a number between 1 and 7\n";
  }
}

print( "Printing Flintstones corresponding to the numbers entered:\n" );
foreach my $flintstone ( @list_of_numbers ) {
  printf( "%s\n", $flintstones[$flintstone - 1] );
}

