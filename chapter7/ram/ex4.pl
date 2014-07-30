#!/usr/bin/perl

use strict;
use warnings;

while ( <> ) {
  if ( $_ =~ /[A-Z][a-z]+/ ) {
    print $_;
  }
}

