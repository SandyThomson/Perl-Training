#!/usr/bin/perl

use warnings;
use strict;

my %last_name = qw{
fred flintstone Wilma Flintstone Barney Rubble
betty rubble Bamm-Bamm Rubble PEBBLES FLINTSTONE
};

my @sorted_names = ();

print "Unsorted names:\n";
foreach my $key ( keys %last_name ) {
  print "$key $last_name{$key}\n";
}

print "\nSorted names:\n";

@sorted_names = sort by_last_name keys %last_name;

foreach my $name ( @sorted_names ) {
  printf( "%s %s\n", $name, $last_name{$name} );
}

sub by_last_name {
  "\L$last_name{$a}" cmp "\L$last_name{$b}"
  or
  "\L$a" cmp "\L$b"
}
