#!/usr/bin/perl
use strict;
use warnings;
use 5.010;
use Cwd;

# Check we have something to check.
if (!scalar @ARGV) {
    say "At least 1 argument expected:";
    say "$0 [file [file][...]] | *";
    die;
}

my @files;

# Validate use of star
if ( "*" eq $ARGV[0] ) {
    # make sure we have no other arguments
    if ($#ARGV > 0) {
        say "Wildcard can only be used on its own.";
        die;
    }
    # find the files
    opendir (DIR, getcwd) or die $!;
    while (my $file = readdir(DIR)) {
    	if ( -f $file ) {
            push @files, $file;
        }
    }
} else {
    @files = @ARGV;
}

if (!scalar @ARGV) {
    say "No files";
} else {
    say "Checking files";
}

# check the details for each file.
foreach my $file( @files ) {
    # not sure if the -C is the correct operator here...
	if ( -r -w -o $file ) {
    	say "You own, can read from and write to $file";
    }
}
