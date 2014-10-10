#!/usr/bin/perl

use strict;
use warnings;
use 5.014;
use Cwd;

my $dir = getcwd;

# chdir
chdir '/tmp' or die "Cannot chdir.";

# KISS
open STDOUT, '>', "$dir/ls.out";
open STDERR, '>', "$dir/ls.err";

# Hardcoded, no need for seperate args
system "ls -l";
system "lt -l";
