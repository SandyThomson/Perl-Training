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
	# for a change I'll do this on a seperate line
	@files = map { $_->{last_access} = ts_to_ymd($_->{last_access}); $_->{last_mod} = ts_to_ymd($_->{last_mod}); $_ } @files;
	my $format = "%-20s %-15s %-15s\n";
	printf $format, 'Filename', 'Last Access', 'Last Modification';
	printf $format, $_->{filename}, $_->{last_access}, $_->{last_mod} foreach ( @files );
}
else {
	say "No files in current directory.";
}

# converts a timestamp to yyyy-mm-dd format.
sub ts_to_ymd {
	my $ts = shift;
	my ($day, $month, $year) = ( localtime( $ts ) )[3, 4, 5];
	# increment month by 1
	$month++;
	# add 1900 to year
	$year += 1900;
	return "$year-$month-$day";
}
