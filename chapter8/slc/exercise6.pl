#!/usr/bin/perl
use strict;
use warnings;
use 5.010;

print "Printing lines with trailing whitespace (Replacing spaces with `):\n";
while(<>) {
	# We only want to capture horizonal whitespace and have an optional newline at the end
	if ( /\A(.*?)(\h+)\Z/ ) {
		print $1, "`" x length($2), "\n";
	}
}