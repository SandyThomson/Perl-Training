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
    	# replace all freds with some placeholder (NULL)
        $line =~ s/fred/\0/ig;
        # replace wilmas with freds
        $line =~ s/wilma/Fred/ig;
        # replace NULL with Wilma
        $line =~ s/\0/Wilma/ig;
        
		# print
        say $newfile $line;
    }
}

