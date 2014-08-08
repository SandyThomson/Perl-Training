#!/usr/bin/perl

use strict;
use warnings;


while(<>){
  chomp;
  if(/\b(?<word>\w*a)\b(?<trailing_chars>.{0,5})/){
    print "\$+{word} contains '$+{word}'\n";
    print "\$+{trailing_chars} contains '$+{trailing_chars}'\n";
  } 
  else {
    print "No match |$_|\n";
  }

}
