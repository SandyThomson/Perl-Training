#!/usr/bin/perl

use strict;
use warnings;

$^I = '.out';

if ( !@ARGV ) {
	die "Usage: ./exercise_2.pl <FILE_NAMES>";
}

while (<>) {
	s/Fred/Larry/i;
	print;
}