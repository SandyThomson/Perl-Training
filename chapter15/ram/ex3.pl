#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

for ( @ARGV ) {
  my @permissions = qw( - - - );
  when( ! -f $_ ) { say "No such file: $_"; next; }
  when(   -r  _ ) { $permissions[0] = "r"; continue; }
  when(   -w  _ ) { $permissions[1] = "w"; continue; }
  when(   -x  _ ) { $permissions[2] = "x"; continue; }
  default         { print( join( '', @permissions ) . " $_\n" ); }
}

