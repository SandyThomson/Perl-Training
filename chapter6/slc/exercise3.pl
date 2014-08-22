#!/usr/bin/perl
use strict;
use warnings;
use List::Util qw(reduce);
use Data::Dumper;


print "Printing environment variables: \n";

map{printf "%-*s   $ENV{$_}\n", length (reduce{ length($a) > length($b) ? $a : $b } keys %ENV), $_} sort { $a cmp $b } keys %ENV; 