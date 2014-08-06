#!/usr/bin/perl

use strict;
use warnings;
use feature qw( say );

say( "Enter a word ending with an 'a'..." );
while ( <> ) {
  chomp;
  if ( 
  	/\b(?<word> # assign any word ending with an 'a' to the 'word' key in the %+ hash
    \w*a)\b/x ) {
    say( "Matched: |$`<$&>$'|" );
    say( "'word' contains $+{word}" );
  } else {
    say( "No match: |$_|" );
  }
}
