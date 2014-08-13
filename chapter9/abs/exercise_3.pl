#!/usr/bin/perl

use strict;
use warnings;

$^I = '.out';

while (<>) {
	s/Fred/Wilma/i;
	s/Wilma/Fred/i;
	print;
}