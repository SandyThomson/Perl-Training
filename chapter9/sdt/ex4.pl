#!/usr/bin/perl
## Copyright (C) 2014 by Yours Truly

use strict;
use warnings;

$^I = '.backup';

while( <> ) {
  s{\A#!/usr/bin/perl}{#!/usr/bin/perl\n## Copyright (C) 2014 by Yours Truly};
  print;
}
