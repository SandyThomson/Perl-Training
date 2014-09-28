#!/usr/bin/perl -w
use strict;
use 5.010001;

foreach ( @ARGV ) {
  print "$_: ";
  when ( !-e $_ ) { say "File does not exist" }
  when ( -r _ ) { print "r"; continue }
  when ( -w _ ) { print "w"; continue }
  when ( -x _ ) { print "x"; continue }
  default { print "\n" }
}
