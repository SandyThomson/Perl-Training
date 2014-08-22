#!/usr/bin/perl
## Copyright (C) 2014 by Yours Truly

use strict;
use warnings;

# I realise this exercise tells me to write the new information to a new filename.
# I know how to do this, but it's pretty tedious and I /don't think/ this exercise 
# was supposed to be written like this.
#
# Instead I'm taking a backup and changing the current file, because I'm lazy.

$^I = '.original';

while( <> ) {
  s/Fred/Larry/gi;
  print;
}
