#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

my @characters = qw/ fred betty barney dino wilma pebbles bamm-bamm /;

# List the available characters, because context
print "Available characters:\n";

while ( my ( $index, $character ) = each @characters ) {
  print $index + 1 . ") $character\n";
}

print "Enter the number of some characters, one per line, Ctrl-D to end:\n";

my @list_of_characters = <STDIN>;

# Use some witchcraft to filter out anything other than useful numbers, then replace the number with a character from the list
@list_of_characters = map { $characters[$_ - 1] } grep ( /^(??{"[1-" . scalar @characters . "]"})$/, @list_of_characters );

print "@list_of_characters\n";
