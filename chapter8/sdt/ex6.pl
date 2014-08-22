#!/usr/bin/perl

use strict;
use warnings;

while(<>){
  chomp;
  if(/\s\z/p){ # No need for /m as the input is broken up per line anyway
    # Excuses to use new stuff I learned in this chapter ...
    print '|'.${^PREMATCH}.'<'.${^MATCH}.'>'.${^POSTMATCH}."|\n";
  } 
  else {
    print "No match |$_|\n";
  }

}
