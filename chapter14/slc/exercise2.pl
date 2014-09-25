#!/usr/bin/perl
use strict;
use warnings;
use 5.010;

my %last_name = qw ( fred flintstone Wilma Flintstone Barney Rubble betty rubble Bamm-Bamm Rubble PEBBLES FLINTSTONE );

# sort, then map each as a 20 character right justified string and join with a newline
say join "\n", map { sprintf "%s %s", $_, $last_name{$_}} sort { "\L$last_name{$a}" cmp "\L$last_name{$b}" or "\L$a" cmp "\L$b" } keys %last_name;