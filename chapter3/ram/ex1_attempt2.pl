#!/usr/bin/perl

use strict;
use warnings;

my @list_of_strings;

print( "Enter strings, one per line. Use EOF (CTRL-D on unix and CTRL-Z on Windows) on empty line when finished:\n" );
while ( my $input_string = <STDIN> ) {
  push @list_of_strings, $input_string;
}
chomp @list_of_strings;

print( "Printing strings input, in reverse order:\n" );
foreach my $input_string ( reverse @list_of_strings ) {
  printf( "%s\n", $input_string );
}

