#!/usr/bin/perl

use strict;
use warnings;

$^I = '.out';

if ( !@ARGV ) {
	die "Usage: ./exercise_2.pl <FILE_NAMES>";
}

while (<>) {
	# split on \n, so lets use this as a
	# placeholder for what will be 'Wilma'
	s/Fred/\n/i;
	# replace wilma with fred
	s/Wilma/Fred/i;
	# update placeholders
	s/\n/Wilma/;
	print;
}