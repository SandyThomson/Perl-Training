#!/usr/bin/perl

use strict;
use warnings;

chdir '/' or die "Cannot chdir /: $!";
my $root_dir_listing = `ls -l`;
print $root_dir_listing;

