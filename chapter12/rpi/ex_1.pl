#!/usr/bin/perl

use strict;
use warnings;

foreach my $file ( @ARGV ) {
  print "Looking at the file $file\n";
  printf "This file %s\n", -e $file ? "exists" : "does not exist";
  next if ! -e _;
  printf "This file is %s\n", -R $file ? "readable" : "un-readable";
  printf "This file is %s\n", -W $file ? "writable" : "un-writable";
  printf "This file is %s\n", -X $file ? "executable" : "un-executable";
}
