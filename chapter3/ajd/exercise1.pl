#!/usr/bin/perl

use strict;
use warnings;

my @list_of_strings;

print "Enter some strings on separate lines, Ctrl-D to end:\n";
chomp( @list_of_strings = <STDIN> );

# Just a reverse and print
@list_of_strings = reverse( @list_of_strings );
print( "@list_of_strings\n" );
