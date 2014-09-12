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

my $oldest = undef;
# check the details for each file.
foreach my $file( @files ) {
    # not sure if the -C is the correct operator here...
	my $file_hash = { file => $file, age => -e $file ? (-C _) : undef };
    if (defined $file_hash->{age} && ( !defined $oldest || $file_hash->{age} > $oldest->{age} )) {
        $oldest = $file_hash;
    }
}

if ($oldest) {
    say "The oldest file was $oldest->{file}.";
} else {
    say "There was no oldest file.";
}
