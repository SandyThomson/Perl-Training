#!/usr/bin/perl

use strict;
use warnings;
use feature qw( say );

say( "Enter a word ending with an 'a'..." );
while ( <> ) {
  chomp;
  if ( /\b(\w*a)\b/ ) {
    say( "Matched: |$`<$&>$'|" );
    # numeric group capture
    say( "\$1 contains $1" );
  } else {
    say( "No match: |$_|" );
  }
}
