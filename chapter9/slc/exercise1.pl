#!/usr/bin/perl
use strict;
use warnings;

print "Enter some text to match 3 times: ";
chomp(my $what = <STDIN>);
while(<>) {
	chomp;
	if ( /($what){3}/ ) {
		print "Matched: [$_]\n";
	}
}