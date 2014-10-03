#!/usr/bin/perl

use strict;
use warnings;
use 5.010001;

# Check all the files supplied on the cmd line
# Say whether they're readable, writeable and executable

if (!@ARGV) { die ( "List some files\n" ) };

foreach ( @ARGV ) {
  print "File $_ is:\n";
  when ( -r $_ ) { print "Readable\n"; continue; }
  when ( -w _ ) { print "Writable\n"; continue; }
  when ( -x _ ) { print "Executable\n"; continue; }
  when ( -e _ ) { } # It should at least exist
  default { print "Non-existent\n"; } # if not
}

