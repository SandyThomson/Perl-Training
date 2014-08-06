#!/usr/bin/perl

use strict;
use warnings;
use feature qw( say );

say( "Enter a word ending with an 'a' and then some random stuff..." );
while ( <> ) {
  chomp;
  if ( /\b(?<word>\w*a)\b # same business as previous exercise
  	#\s (?<up_to_five_characters>\w{0,5}) using \w is not as flexable as the below, this won't allow wilma-bob
    (?<up_to_five_characters>.{0,5}) # using '.' as using \w means specifing every possible character after the word ending in 'a'
  	/x ) {
    
    say( "Matched: |$`<$&>$'|" );
    say( "'word' contains $+{word}" );
    say( "Up to five trailing characters: $+{up_to_five_characters}" );
    
  } else {
    say( "No match: |$_|" );
  }
}
