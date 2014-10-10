#!/usr/bin/perl
use strict;
use warnings;
use feature qw( say);
use 5.14.0;

open STDOUT, '>', 'ls.out';
open STDERR, '>', 'ls.err' ;
chdir '/tmp/';
say `ls -l`;

