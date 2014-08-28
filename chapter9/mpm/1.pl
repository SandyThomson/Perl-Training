#!/usr/bin/perl

use strict;
use warnings;

my $what = "fred|barney";

while (<>) {
  chomp;
  if (/(?:$what){3}/) {
    print "$_ matched\n";
  }else{
    print "$_ did not matched\n";
  }
}

