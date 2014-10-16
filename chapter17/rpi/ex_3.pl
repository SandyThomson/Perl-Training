#!/usr/bin/perl

use strict;
use warnings;
use POSIX 'strftime';

my @files = `ls`;

foreach ( @files ) {
  chomp;
  # Oh well looks like I'm using them now
  my @stats = ( stat $_ )[9,10];
  printf "%20s%20s%20s\n", $_, map { ( strftime "%Y-%m-%d", localtime $_ ) } @stats;
}
