#!/usr/bin/perl -w
use strict;

$^I = '.bak';

my $copyright = '## Copyright (C) 2014 by ard';

while ( <> ) {
  if ( /^#!.*$/ ) {
    print "$&\n$copyright";
  }
}
