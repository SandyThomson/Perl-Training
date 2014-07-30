#!/usr/bin/perl
use strict;
use warnings;

print "Printing lines with 2 of the same non-space characters together:\n";
while(<>) {
    if (/([^\s])\g{1}/) {
        print $_;
    }
}
