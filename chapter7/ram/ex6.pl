#!/usr/bin/perl

use strict;
use warnings;

while ( <> ) {

  # Must match both wilma and fred (ignores case)
  if ( $_ =~ /wilma/i && $_ =~ /fred/i ) {
    print $_;
  }

}

