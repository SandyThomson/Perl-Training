#!/usr/bin/perl

use strict;
use warnings;

my $directory = "/home";
my $pwd;
chomp ( $pwd = `pwd` );

my $out = $pwd."/ls.out";
my $err = $pwd."/ls.err";

open STDOUT, '>', $out;
exec "cd $directory; ls -l 2>$err";
