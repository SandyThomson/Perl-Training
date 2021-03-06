#!/usr/bin/perl
## Copyright 2014 Sean Clark
use strict;
use warnings;
use 5.010;
use autodie;
use feature qw(say);

my @files = @ARGV;

foreach my $file (@files) {
	open my $infile, '<', $file;
    open my $newfile, '>', "$file.out";
    while (my $line = <$infile>) {
    	chomp($line);
    	$line =~ s/fred/Larry/ig;
        say $newfile $line;
    }
}
