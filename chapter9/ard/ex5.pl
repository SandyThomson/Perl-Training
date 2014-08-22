#!/usr/bin/perl -w
use strict;

$^I = '.bak';

my $copyright = '## Copyright (C) 2014 by ard';

while ( <> ) {
  if ( /^#!.*$/s ) {
    # found the shebang line, so print it
    print;
    
    # now grab the next line and see if it already has the copyright line
    my $nextline = <>;
    if ( $nextline =~ /^## Copyright.*/ ) {
      # it does - just print it
      print $nextline;
    }
    else {
      # it doesn't - prepend and print
      print "$copyright\n$nextline";
    }
  }
  else {
    # we're past the shebang - just spit out the line as-is
    print;
  }
}
