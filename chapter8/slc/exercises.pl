#!/usr/bin/perl
use strict;
use warnings;

my %exercises = (
	'ex1' => qr/match/,
	'ex2' => qr/\b\w*a\b/,
	'ex3' => qr/\b(\w*a)\b/,
	'ex4' => qr/\b(?<word>\w*a)\b/,
	'ex5' => qr/\b\w*a\b(.{0,5})/,
);

my $input;
do {
	print "Enter exercise: ";
	chomp($input = <STDIN>);	
} while($input && !exists $exercises{$input});

my $regex = $exercises{$input};

print "Printing lines with regex: [$regex]\n";
while(<>) {
	chomp;
    if ($_ =~ $regex) {
        print "Matched: |$`<$&>$'|\n";
        if ($1) {
        	print "Capture group 1: $1\n";
        }
        if ($+{word}) {
        	print "Named capture group \"word\": $+{word}\n";
        }
    } else {
        print "No match: |$_|\n";
    }
    print "\n";
}
