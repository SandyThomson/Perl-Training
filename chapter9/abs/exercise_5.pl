#!/usr/bin/perl
## Copyright (C) 2014 by Arran Stobbs

use strict;
use warnings;

# prep variables
my ( $copyright, %files ) = ( '## Copyright' );

# keep track of all files passed in,
# and use this to restore the ARGV
# array once we've figured out which 
# files don't yet contain a copyright
map { $files{$_} = undef } @ARGV;
while(<>) {
	# don't bother with files that already have a copyright
	if( /^$copyright/ ) {
		printf( "'%s' already contains copyright...skipping\n", $ARGV );
		delete( $files{$ARGV} ) 
	}
}

# restore the ARGV array
@ARGV = keys( %files );
if ( !@ARGV ) {
	die "No files to update!"
}

$^I = '.out';

# grab the year(6th value) from the return array
# of &localtime. this is the number of years since
# 1990, so add this for the actual current year
my $year = [localtime(time)]->[5] + 1900;

while (<>) {
	s/(?<shebang>^#!.*\n)/$+{shebang}$copyright (C) $year by Arran Stobbs\n/;
	print;
}