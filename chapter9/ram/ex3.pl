#!/usr/bin/perl
## Copyright (C) by Yours Truly

use strict;
use warnings;

$^I = ".out";

while ( <> ) {
  s/Fred/<Placeholder1>/ig;
  s/Wilma/Fred/ig;
  s/<Placeholder1>/Wilma/g;
  print;
}

