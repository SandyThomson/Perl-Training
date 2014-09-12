#!/usr/bin/perl

use strict;
use warnings;

if ( !scalar( @ARGV ) ) {
  die "Usage: $0 <a bunch of files>\n";
}

my @files; # array for the files of interest

foreach my $file ( @ARGV ) {

  # Ignore files that don't exist
  if ( !-e $file ) {
    next;
  }

  if ( -r -w -o $file ) {
    push( @files, $file );
  }
}

# Show how many days old it is
if ( scalar( @files ) ) {
  print ( "These files are readable, writeable and owned by you: @files\n" );
} else {
  die( "None of the files readable, writeable and owned by you, try harder\n" );
}
