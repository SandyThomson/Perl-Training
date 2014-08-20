#!/usr/bin/perl -w
use strict;

# I couldn't think how to achieve the exact requirement in the exercise (write
# modded content to new file with different name) without using file i/o stuff
# that we've not been taught yet.  This is one of the lessons from the chapter:

$^I = '.bak';

while ( <> ) {
  s/fred/Larry/gi;
  print;
}
