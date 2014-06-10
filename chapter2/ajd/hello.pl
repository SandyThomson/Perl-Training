#!/usr/bin/perl

use strict;
use warnings;

if ( getpwuid( $< ) eq 'sdt' ) {
  print "Hello bitches\n";
}
else {
  print "Hello dudes\n";
}
