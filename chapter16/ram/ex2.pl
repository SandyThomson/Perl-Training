#!/usr/bin/perl

use strict;
use warnings;

open STDOUT, '>', 'ls.out';
open STDERR, '>', 'ls.err';

chdir '/' or die "Cannot chdir /: $!";
system "ls -l";

