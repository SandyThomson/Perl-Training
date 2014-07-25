#!/usr/bin/perl

use strict;
use warnings;

my %words = ();
my $input;

print "Enter some words, one per line. Use EOF (CTRL-D on linux or CTRL-Z on Windows) to terminate input.\n";
while ( $input = <STDIN> ) {
  chomp $input;

  # just referring to $words{$input} gives a warning
  my $count = 1 + ( $words{$input} // 0 );
  $words{$input} = $count;
}

# Basic ordering
print "Here\'s what you entered:\n";
while ( (my $key, my $value ) = each( %words ) ) {
  print "$key => $value\n";
}

print "Here\'s what you entered once it has been sorted:\n";
foreach my $key ( sort( keys( %words ) ) ) {
  print "$key => $words{$key}\n";
}

