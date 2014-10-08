#!/usr/bin/perl

use strict;
use warnings;

open ( my $ls_fh, '-|', 'ls -l /' ) or die "Cannot pipe from ls: $!";
  while ( <$ls_fh> ){
    print $_;
  }
close ( $ls_fh );

if( $? ){
  die "ls: non-zero exit of $?";
}
