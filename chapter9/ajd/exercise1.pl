#!/usr/bin/perl

use strict;
use warnings;

my $what = "fred|barney";

while (<>) {
  if (/(?:$what){3}/) {
    print $_;
  }
}

