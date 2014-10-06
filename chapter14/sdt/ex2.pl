#!/usr/bin/perl

use strict;
use warnings;
use 5.010;
use feature 'say';

my %last_name = qw{
  fred flintstone Wilma Flintstone Barney Rubble betty rubble Bamm-Bamm Rubble PEBBLES FLINTSTONE
};

my @sort_order = sort { "\L$last_name{$a}" cmp "\L$last_name{$b}" or "\L$a" cmp "\L$b" } keys %last_name;

foreach my $first_name ( @sort_order ){
  say $first_name." ".$last_name{$first_name};
}
