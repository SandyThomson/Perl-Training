#!/usr/bin/perl
## Copyright (C) by Yours Truly

use strict;
use warnings;

my $what = "fred|barney";

while ( <> ) {
  chomp;
  if ( /(?:$what){3}/ ) {
    print "[$_] matched.\n";
  }
}
