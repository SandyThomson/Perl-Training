#!/usr/bin/perl

use strict;
use warnings;

my @files = `ls`;

foreach ( @files ) {
  chomp;
  my ($atime, $mtime) = ( stat $_ )[8,9];
  # I wasn't sure if the commented lines were the same or not, feedback please
  #my @stats = ( stat $_ )[9,10];
  printf "%20s%20d%20d\n", $_, $atime, $mtime;
  #printf "%20s%20d%20d\n", $_, @stats;
}
