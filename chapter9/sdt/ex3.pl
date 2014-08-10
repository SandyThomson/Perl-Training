#!/usr/bin/perl

use strict;
use warnings;

$^I = '.original';

while( <> ) {
  
  my $remaining_line = $_;

  while ( $remaining_line =~ m/Fred|Wilma/ip ){
    $remaining_line = ${^POSTMATCH};
    print ${^PREMATCH};
    if(${^MATCH} =~ /Fred/i){
      print "Wilma";
    } else {
      print "Fred";
    }
  }

  print $remaining_line;
}
