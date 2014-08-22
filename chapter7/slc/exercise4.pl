#!/usr/bin/perl
use strict;
use warnings;

print "Printing lines with a capital letter but not all capitals\n";
while(<>) {
    if (/([A-Z].*[^A-Z\s])|([^A-Z\s].*[A-Z])/) {
        print $_;
    }
}
