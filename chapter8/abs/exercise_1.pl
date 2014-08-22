#!/usr/bin/perl

use strict;
use warnings;
use feature qw( say );

say( "Enter some input containing the word 'match'..." );
while ( <> ) {
  chomp;
  if ( /match/ ) {
    say( "Matched: |$`<$&>$'|" );
  } else {
    say( "No match: |$_|" );
  }
}
