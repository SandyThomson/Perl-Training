#!/usr/bin/perl

use strict;
use warnings;
use utf8;

my @list_of_strings;

print( "Enter some strings on separate lines and I will order them in code point order.\nUse EOF (CTRL-D on unix and CTRL-Z on Windows) on empty line when finished:\n" );
chomp( @list_of_strings = <STDIN> );

print( "Printing strings in code point order.\n" );
foreach my $single_string ( sort( @list_of_strings ) ) {
  printf( "%s\n",  $single_string );
}

