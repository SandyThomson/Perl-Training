#!/usr/bin/perl

use strict;
use warnings;

$^I = ".out";

while ( <> ) {
  s/Fred/Larry/ig;
  print;
}

