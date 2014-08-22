#!/usr/bin/perl

use strict;
use warnings;
use feature qw( say );

say( "Enter a word ending an 'a'..." );
while ( <> ) {
  chomp;
  if ( /\b\w*a\b # \b using the word-boundary anchor
  	/x# allow tabs, spaces and comments in regex...nice ;)
  	) {
    say( "Matched: |$`<$&>$'|" );
  } else {
    say( "No match: |$_|" );
  }
}
