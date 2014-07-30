#!/usr/bin/perl
use strict;
use warnings;

print "Printing lines with a period:\n";
while(<>) {
    if (/\./) {
        print $_;
    }
}
