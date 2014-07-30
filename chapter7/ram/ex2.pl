#!/usr/bin/perl

use strict;
use warnings;

while ( <> ) {

  # must match fred and Fred (i.e. ignore case)
  if ( $_ =~ /fred/i ) {
    print $_;
  }

}

