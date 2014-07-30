#!/usr/bin/perl

use strict;
use warnings;

while ( <> ) {
  if ( $_ =~ /fred/ ) {
    print $_;
  }
}

