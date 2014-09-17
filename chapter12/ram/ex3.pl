#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

foreach my $fn ( @ARGV ) {
  if ( -e -r -w -o $fn ) {
    say "$fn is readable, writable and owned by you";
  }
}
