#!/usr/bin/perl

use strict;
use warnings;

my @potential_files = @ARGV;


foreach my $file (@potential_files){
  my ($exists, $readable, $writable, $executable) = check_file( $file );
  print "File: '$file' ";

  if ($exists){
    print "[r:$readable, w:$writable, x:$executable]";
  } else {
    print "doesn't exist";
  }
  print "\n";
}


sub check_file {
  my $file = shift;

  my ($exists, $readable, $writable, $executable) = (0,0,0,0);

  if ( -e $file ){
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

  return ($exists, $readable, $writable, $executable);
}
