#!/usr/bin/perl

use strict;
use warnings;

while ( <> ) {

  # must contain a word that is capitalised but not ALL capitalised
  if ( $_ =~ /[A-Z][a-z]+/ ) {
    print $_;
  }

}

