#!/usr/bin/perl -w
use strict;
use 5.010;

say "Feed me some input! (Ctrl-D to end) ";

my @input = <STDIN>;
chomp @input;

my @sorted = sort @input;

say "\nYou fed me, in code-point order: @sorted\n" . join "\n", @sorted;

