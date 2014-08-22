#!/usr/bin/perl
use strict;
use warnings;
use 5.010;

$^I = ".bak";

my $copyright = "## Copyright 2014 Sean Clark\n";
my $copyright_expected = 0;
while (<>) {
	if ($copyright_expected) {
    	if ($_ eq $copyright) {
            print STDOUT "Copyright already exists for $ARGV\n";
        } else {
            print STDOUT "Adding copyright to $ARGV\n";
            print $copyright;
        }
        $copyright_expected = 0;
    }

	# print the line
	print;
    
    # if the line matches a shebang, we'll expect the next line to be the copyright
    if ( /^#!.+/i ) {
    	$copyright_expected = 1;
    }
}