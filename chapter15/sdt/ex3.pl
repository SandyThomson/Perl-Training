#!/usr/bin/perl

use strict;
use warnings;
no warnings 'experimental::smartmatch';

use 5.018;
use feature 'say';

foreach( @ARGV ){
  
  my ($exists, $readable, $writable, $executable) = (0,0,0,0);
  print "File: '$_' ";

  if ( -e ){
    $exists = 1;
    if ( -r _ ){
      $readable = 1;
    }
    if ( -w _ ){
      $writable = 1;
    }
    if ( -x _ ){
      $executable = 1;
    }
  }
  default {
    if ($exists){
      say "[r:$readable, w:$writable, x:$executable]";
    } else {
      say "doesn't exist";
    }
  }
}

