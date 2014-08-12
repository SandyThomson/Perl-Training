#!/usr/bin/perl
## Copyright (C) by Yours Truly

use strict;
use warnings;

$^I = ".bak";

while ( <> ) {
  s|(?<firstline>#!/usr/bin/perl.*$)|$+{firstline}\n## Copyright (C) by Yours Truly|ig;
  print;
}

