#!/usr/bin/perl

use strict;
use warnings;

foreach ( @ARGV ) {
  next if ! -e $_;
  next if ! -R _;
  next if ! -W _;
  next if ! -O _;
  print "$_\n";
}
