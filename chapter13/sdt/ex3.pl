#!/usr/bin/perl

use strict;
use warnings;
use 5.010;
use feature 'say';

say "Please enter a directory location";

my $dir;

while( $dir = readline ){
  chomp $dir;
  if( ! -d $dir ){
    say "Input isn't a directory (or doesn't exist), please try again";
  } else {
    last; # All good
  }
}

#CBA changing CWD
my @filelist = glob "$dir/.* $dir/*";

say join "\n", sort @filelist;

