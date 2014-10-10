#!/usr/bin/perl -w
use strict;

use 5.010;

open( STDOUT, '>ls.out' ) or die "failed to redirect STDOUT: $!";
open( STDERR, '>ls.err' ) or die "failed to redirect STDERR: $!";

my $dir = $ARGV[0] // '/';

chdir $dir or die "chdir failed: $!";

say "Listing for '$dir':";

!system 'ls', '-l' or die "system call failed: $!";
