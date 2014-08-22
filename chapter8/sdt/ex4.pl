#!/usr/bin/perl

use strict;
use warnings;


while(<>){
  chomp;
  if(/\b(?<word>\w*a)\b/){
    print "\$+{word} contains '$+{word}'\n";
  } 
  else {
    print "No match |$_|\n";
  }

}
