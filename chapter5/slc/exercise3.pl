#!/usr/bin/perl

use strict;
use warnings;

print "Enter a line length: ";
chomp(my $line_length = <STDIN>);
print "Enter some data on new lines to be formatted to $line_length characters:\n";
my @input = ();
while (<STDIN>) {
    chomp;
    push @input, $_;
}
print "Here is the output:\n";
print "=" x $line_length, "\n";
foreach my $line (@input) {
    if (defined $line && length $line > $line_length) {
        $line = substr($line, 0, $line_length);
    }
    printf "%${line_length}s\n", $line;
}
print "=" x $line_length, "\n";