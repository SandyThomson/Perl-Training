#!/usr/bin/perl
## Copyright (C) 2014 by Yours Truly

use strict;
use warnings;

$^I = '.original';

while( my $remaining_line = <> ) {

  # There must be a better way to do this whole thing, perhaps using one regex?
  # How readable would that be though?  
  while ( $remaining_line =~ m/Fred|Wilma/ip ){
    $remaining_line = ${^POSTMATCH};
    print ${^PREMATCH};

    # I was wondering if I could have done the next bit without a regex,
    # perhaps using $1, $2 etc from the regex above, however I didn't even
    # try. 

    if(${^MATCH} =~ /^Fred$/i){
      print "Wilma";
    } else {
      print "Fred";
    }
  }

  print $remaining_line;
}
