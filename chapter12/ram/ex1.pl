#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

# Takes a list of files named on the command line and reports for each one
# whether it is readable, writable, executable or doesn't exist.
# Key: r - readable, w - writable, x - executable

foreach my $fn ( @ARGV ) {
  say "Processing: $fn";
  my $e = -e $fn;
  my $r = -r _ ? "r" : "-";
  my $w = -w _ ? "w" : "-";
  my $x = -x _ ? "x" : "-";

  if ( $e ) {
    say "$fn exists with $r$w$x permissions";
  }
  else {
    say "$fn does not exist";
  }
}
