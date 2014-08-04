#!/usr/bin/perl
use strict;
use warnings;

$^I = ".out";

while(<>) {
	# split up on fred
	my @tmp = split /fred/i, $_;
	
	# replace wilma with Fred
	foreach (@tmp) {
		s/wilma/Fred/ig;
	}
	
	# join all together with Wilma :)
	print join "Wilma", @tmp;
}