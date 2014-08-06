#!/usr/bin/perl

use strict;
use warnings;
use feature qw( say );

say( "Enter lines ending with a whitespace..." );
while ( <> ) {
  chomp;
  if ( /(?<whitespace>\s)\z/ ) {
  say( "Ohhh ahhh...look at the white space '$+{whitespace}'" );
  } else {
    say( "'$_' does that look like it ends in a whitespace?" );
  }
}
