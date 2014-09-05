#!/usr/bin/perl
use strict;
use warnings;
use List::Util qw(reduce);
use Data::Dumper;


print "Printing environment variables: \n";

$ENV{'empty'} = '';
$ENV{'undefined'} = undef;
$ENV{'zero'} = 0;

map{printf "%-*s   %s\n", length (reduce{ length($a) > length($b) ? $a : $b } keys %ENV), $_, $ENV{$_} // "Undefined Value"} sort { $a cmp $b } keys %ENV; 