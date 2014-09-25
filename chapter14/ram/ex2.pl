#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

#
# Sorts the last_name hash by last name and first name ignoring case
#
my %last_name = qw {
  fred flintsone Wilma Flintstone Barney Rubble
  betty rubble Bamm-Bamm Rubble PEBBLES FLINTSTONE
};

my @sorted_names = sort by_last_name_and_first_name_ignoring_case keys %last_name;

foreach ( @sorted_names ) {
  say "$_ $last_name{$_}";
}

########################################

# Sorting routines
sub by_last_name_and_first_name_ignoring_case {
  lc($last_name{$a}) cmp lc($last_name{$b}) 
  or lc($a) cmp lc($b)
}
