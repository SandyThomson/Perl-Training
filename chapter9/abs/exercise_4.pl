#!/usr/bin/perl

use strict;
use warnings;

$^I = '.out';

# grab the year(6th value) from the return array
# of &localtime. this is the number of years since
# 1990, so add this for the actual current year
my $year = [localtime(time)]->[5] + 1900;
my $copyright = "## Copyright (C) $year by Arran Stobbs\n";

while (<>) {
	s/(?<shebang>#!.*\n)/$+{shebang}$copyright/;
	print;
}