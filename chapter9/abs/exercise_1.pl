#!/usr/bin/perl

use strict;
use warnings;

my $what = 'fred|barney';

while (<>) {
	if ( /$what{3}/ ) {
		print( "Matches pattern '$what'", "\n");
	}
	else {
		print( "Doesn't match pattern '$what'", "\n");
	}
}