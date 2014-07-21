#!/usr/bin/perl
## Copyright (C) 2014 by ajd

use strict;
use warnings;

# Set backup extension
$^I = '.bak';

while ( <> ) {
  if ( /\A#!.*/s ) {
    print "$&## Copyright (C) 2014 by ajd\n";
  } else {
    print;
  }
}

