#!/usr/bin/perl

use strict;
use warnings;

my $string = <<EOQ;
As you see, the assigned (sub)string doesn’t have to be the same length as the substring
it’s replacing. The string’s length is adjusted to fit. Or if that wasn’t cool enough to
impress you, you could use the binding operator (=~) to restrict an operation to work
with just part of a string. This example replaces fred with barney wherever possible
within just the last 20 characters of a string:
EOQ

my $substring = "a";

while( my $pos = index( $string, $substring ) ){
 last if( $pos == -1);

 $string = substr ( $string, $pos+1 );
 print "$pos\n";
}

