#!/usr/bin/perl
use strict;
use warnings;

print "Printing lines with wilma and fred:\n";
while(<>) {
    if (/(wilma.*fred)|(fred.*wilma)/i) {
        print $_;
    }
}
