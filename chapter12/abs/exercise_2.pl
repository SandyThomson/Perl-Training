#!/usr/bin/perl

use strict;
use warnings;

use feature qw( say );

use Table;

if ( @ARGV < 1 ) {
	say( "\t$0 <filenames>" );
	exit 1;
}

my $table = new Table( qw/ file age(days) / );
$table->add_row( _find_oldest_file( @ARGV ) );
print( $table );

sub _find_oldest_file {
	my ( @files ) = @_;
	
	# set starting point
	my $file = '';
	my $age = -1 ;
	foreach my $new_file ( @files ) {
	
		# if the file exists set file age else default to -1
		my $new_age = ( -e $new_file ) ? -M $new_file : -1;
		
		if ( $new_age > $age ) {
			# update oldest file
			$file = $new_file;
			$age = $new_age;
		}
	}
	
	return ( $file, $age );
}
