#!/usr/bin/perl
use strict;
use warnings;
use 5.010;

# sort, then map each as a 20 character right justified string and join with a newline
say join "\n", map { sprintf "%20s", $_ } sort { $a <=> $b } @ARGV;