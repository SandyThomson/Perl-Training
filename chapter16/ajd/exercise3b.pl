#!/usr/bin/perl

use strict;
use warnings;
use v5.10.1;

# Parse date, react to weekdays
# You say you hate smart matching? OK!

print ${{(map { $_ => 1 } (0, 6))}}{`date +%w | tr -d '\n'`} ? "Go play!" : "Get to work", "\n";

