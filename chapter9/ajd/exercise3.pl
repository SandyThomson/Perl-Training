#!/usr/bin/perl
## Copyright (C) 2014 by ajd

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
  s{(fred|wilma)}{($1 =~ /fred/i) ? 'Wilma' : 'Fred'}ige;
  print;
}

# Sounded like the resulting file should be .out rather than
# the backup. Stealing rename from Chapter 13 since they mentioned it.
rename ("$ARGV", "$ARGV.out");
rename ("$ARGV.tmp", "$ARGV");
