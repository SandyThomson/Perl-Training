#!/usr/bin/perl

use strict;
use warnings;

while ( <> ) {

  # Must match a single full stop
  if ( $_ =~ /\./ ) {
    print $_;
  }

}

