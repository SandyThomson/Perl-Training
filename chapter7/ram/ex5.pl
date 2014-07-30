#!/usr/bin/perl

use strict;
use warnings;

while ( <> ) {

  # Any non-space character that is repeated
  # Could also be written as /([^\s])\g{1}/
  if ( $_ =~ /(\P{Space})\g{1}/ ) {
    print $_;
  }

}

