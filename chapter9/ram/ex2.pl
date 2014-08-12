#!/usr/bin/perl
## Copyright (C) by Yours Truly

use strict;
use warnings;

$^I = ".out";

while ( <> ) {
  s/Fred/Larry/ig;
  print;
}

