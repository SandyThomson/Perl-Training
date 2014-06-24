#!/usr/bin/perl

use strict;
use warnings;
use feature "say";

say "Please enter a list of strings (Press Ctrl-D [EOF] to stop input)";
say "=" x 20;

# sdt - Using pop later instead of reverse could be more efficient here?
# sdt - There is no way I'd do this for any serious code. Always try to define limits, even as a sanity check.
my @input = reverse ( <STDIN> );

if( !@input ) {
  warn "Your list is empty!\n";
}
else {
	say "Your list, in input reversed:";
	say "=" x 20;

	print @input;
}
