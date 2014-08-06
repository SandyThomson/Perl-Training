#!/usr/bin/perl

use strict;
use warnings;

# Numerically sort some numbers
# Let's just take them in via ARGV

printf ("%20g\n", $_) foreach sort { $a <=> $b } @ARGV;

