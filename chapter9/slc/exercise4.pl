#!/usr/bin/perl
use strict;
use warnings;

$^I = ".bak";

my $copyright = "## Copyright 2014 Sean Clark\n";

while (<>) {
	# print the line
	print;
    
    # if the line matches a shebang, print the copyright after
    if ( /^#!.+/i ) {
    	print $copyright;
    }
}