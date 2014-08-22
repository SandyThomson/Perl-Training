#!/usr/bin/perl
## Copyright (C) 2014 by ajd

use strict;
use warnings;

my $copyright = "## Copyright (C) 2014 by ajd";

# If ARGV is empty, bail
if ( !@ARGV ) { die (" Specify some perl scripts as arguments\n" ) }

# Set backup extension
$^I = '.bak';

while ( <> ) {
  if ( /\A#!.*/s ) {
    print;

    # Check the next line and prepend the copyright if it isn't there
    # Also make sure the next line isn't the last
    if ( !eof ARGV ) { # Turns out ARGV is the name of <>'s filehandle
      my $line = <>;
      if ( $line =~ /\A## Copyright.*/ ) {
        print $line;
      } else {
        print "$copyright\n$line";
      }
    } else {
      print "$copyright\n";
    }
  } else {
    print;
  }
}

