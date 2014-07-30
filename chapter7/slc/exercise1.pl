#!/usr/bin/perl
use strict;
use warnings;

print "Printing lines with fred\n";
while(<>) {
    if (/fred/) {
        print $_;
    }
}
