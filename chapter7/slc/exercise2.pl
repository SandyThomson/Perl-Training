#!/usr/bin/perl
use strict;
use warnings;

print "Printing lines with Fred:\n";
while(<>) {
    if (/fred/i) {
        print $_;
    }
}
