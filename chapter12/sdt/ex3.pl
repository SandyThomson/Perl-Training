#!/usr/bin/perl

use strict;
use warnings;

my @potential_files = @ARGV;


foreach my $file (@potential_files){
  if( -R -W -O $file ){
    print "File: '$file' is readable, writable and owned by user: ".getlogin."\n";
  }
}


