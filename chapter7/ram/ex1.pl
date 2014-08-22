#!/usr/bin/perl

use strict;
use warnings;

while ( <> ) {

  # must match fred
  if ( $_ =~ /fred/ ) {
    print $_;
  }

}

