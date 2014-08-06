#!/usr/bin/perl

use strict;
use warnings;

# Sort these guys into family and by first name

my %last_name = qw( fred flintstone Wilma Flintstone Barney Rubble betty rubble Bamm-Bamm Rubble PEBBLES FLINTSTONE );

print "$_ $last_name{$_}\n" foreach sort { lc $last_name{$a} cmp lc $last_name{$b} or lc $a cmp lc $b } keys %last_name;

