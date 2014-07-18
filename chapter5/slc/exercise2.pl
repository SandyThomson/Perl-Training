#!/usr/bin/perl

use strict;
use warnings;

print "Enter some data on new lines to be formatted:\n";
my @input = ();
while (<STDIN>) {
    chomp;
    push @input, $_;
}
print "Here is the output:\n";
print "=" x 20, "\n";
foreach my $line (@input) {
    if (defined $line && length $line > 20) {
        $line = substr($line, 0, 20);
    }
    printf "%20s\n", $line;
}
print "=" x 20, "\n";