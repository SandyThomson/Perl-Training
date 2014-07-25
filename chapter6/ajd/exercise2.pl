#!/usr/bin/perl

use strict;
use warnings;

my %usage;

# Get some words, add up the totals as we go
print "Enter some words, one per line, Ctrl-D to end:\n";
while ( my $word = <STDIN> ) {
  chomp ( $word );
  $usage{$word} += 1;
}

# Output the totals
foreach my $key ( sort keys %usage ) {
  printf ( "The word %s was seen %d time%s\n", $key, $usage{$key}, $usage{$key} > 1 ? 's' : '' );
}

