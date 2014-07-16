#!/usr/bin/perl

use strict;
use warnings;

# Need a file
if ( !defined $ARGV[0] || !-s $ARGV[0] ) {
  die( "Specify a file\n" );
}

# Backup to a tmp file
$^I = '.tmp';

# Replace
while ( <> ) {
  s/fred/Larry/ig;
  print;
}

# Sounded like the resulting file should be .out rather than
# the backup. Stealing rename from Chapter 13 since they mentioned it.
rename ("$ARGV", "$ARGV.out");
rename ("$ARGV.tmp", "$ARGV");
