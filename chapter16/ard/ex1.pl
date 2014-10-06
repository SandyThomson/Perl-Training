#!/usr/bin/perl -w
use strict;

use 5.010;

my $dir = $ARGV[0] // '/';

chdir $dir or die "chdir failed: $!";

say "Listing for '$dir':";

!system 'ls', '-l' or die "system call failed: $!";
