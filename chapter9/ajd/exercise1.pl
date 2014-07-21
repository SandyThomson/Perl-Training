#!/usr/bin/perl
## Copyright (C) 2014 by ajd

use strict;
use warnings;

my $what = "fred|barney";

while (<>) {
  if (/(?:$what){3}/) {
    print $_;
  }
}

