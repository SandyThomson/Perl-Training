#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

my @files;

# create hashes for each file
for (glob '*') {
	next if ( ! -f $_ );
	my $file_details = ();
	$file_details->{filename} = $_;
	($file_details->{last_access}, $file_details->{last_mod}) = (stat $_)[8, 9];
	push @files, $file_details;
}

# loop through and print out
if (scalar @files) {
	my $format = "%-20s %-15s %-15s\n";
	printf $format, 'Filename', 'Last Access', 'Last Modification';
	printf $format, $_->{filename}, $_->{last_access}, $_->{last_mod} foreach ( @files );
}
else {
	say "No files in current directory.";
}


