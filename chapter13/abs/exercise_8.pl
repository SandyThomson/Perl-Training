#!/usr/bin/perl

use warnings;
use strict;

use feature qw( say );

my @files = glob( '*' );
foreach my $file ( @files ) {
	if ( -l $file ) {
		say( "$file -> " . readlink( $file ) );
	}
}
