#!/usr/bin/perl -w
use strict;

use 5.010;

my @files = @ARGV;

foreach my $file ( @files ) {
  if ( -f -e $file ) {
    print "Deleting '$file'... ";
    unlink $file;
    if ( $! ) {
      say "Failed: $!";
    }
    else {
      say "Done!";
    }
  }
  else {
    say "Skipping '$file' - it's either non-existent or not a regular file";
  }
}
