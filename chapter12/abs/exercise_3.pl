#!/usr/bin/perl

use strict;
use warnings;

use feature qw( say );

use Table;
use Getopt::Std;

# show usage if unknown opt or less than one ARGV
usage() if ( !getopts("v", my $opts = {}) || @ARGV < 1 );

my $table = new Table( qw( file readable writable ), 'owned by you' );

foreach my $file ( @ARGV ) {
	# override to see all the files output
	if ( $opts->{v} ) {
		$table->add_row( $file,
			-r $file ? 'yes' : 'no',
			-w $file ? 'yes' : 'no',
			-o $file ? 'yes' : 'no' );
		next;
	}
	
	if ( -r -w -o $file ) {
		$table->add_row( $file, 'yes', 'yes', 'yes' );
	}
}

print( $table );

sub usage {
	say( "\t$0 [-v] <filenames>" );
	exit 1;
}