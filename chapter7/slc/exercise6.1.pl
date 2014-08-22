#!/usr/bin/perl
use strict;
use warnings;

print "Printing lines with wilma and fred:\n";
while(<>) {
    if (/wilma/i && /fred/i) {
        print $_;
    }
}
