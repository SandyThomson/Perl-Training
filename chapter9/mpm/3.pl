#!/usr/bin/perl

use strict;
use warnings;

$^I = '.out';

while (<>) {
	s/fred/__PLACEHOLDER__/ig; # yes ard that can be broken
	s/wilma/Fred/ig;
	s/__PLACEHOLDER__/Wilma/ig;
	print;
}


