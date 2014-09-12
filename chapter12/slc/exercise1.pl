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
    check_file( $file );
}

# checks the current file
sub check_file {
    my $tmpfile = shift;
    say "\nChecking file $tmpfile...";
    # check file
    if ( -e $tmpfile ) {
        say "File exists";
        # readable
        if ( -r _ ) {
            say "File is readable";
        }
        #writeable
        if ( -w _ ) {
            say "File is writable"
        }
        # executable
        if ( -x _ ) {
            say "File is executable"
        }
    } else {
        say "File doesn't exist";
    }
}

