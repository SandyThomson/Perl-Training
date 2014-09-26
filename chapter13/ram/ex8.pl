#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

# List only the links and where they point (and if that location exists)
my @all_files = glob '.* *';
foreach my $fn ( @all_files ) {
  if ( -l $fn ) {
    my $where = readlink $fn;
    my $link_exists = -e $where ? "" : "(but it doesn't exist)";
    say "$fn -> $where $link_exists";
  }
}

