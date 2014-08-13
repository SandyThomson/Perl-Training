#!/usr/bin/perl

use strict;
use warnings;

$^I = '.out';
my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
$year = sprintf("%02d", $year % 100);

while (<>) {
	s/(#!.*\n)/$1## Copyright (C) $year by Arran Stobbs\n/;
	print;
}