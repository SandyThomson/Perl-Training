#!/usr/bin/perl

use strict;
use warnings;

use feature qw( say );

use Table;

if ( @ARGV < 1 ) {
	say( "\t$0 <filenames>" );
	exit 1;
}
	
my $table = Table->new( qw( file exists readable writable executable ) );
foreach my $file ( @ARGV ) {
	$table->add_row( $file, _get_file_info( $file ) );
}

print( $table );

#returns ( exists, readable, writable, executable )
sub _get_file_info {
	my ( $file ) = @_;
	
	if ( !-e $file ) {
		return ( 'no', '-', '-', '-' );
	}
	return ( 'yes',
		-r $file ? 'yes' : 'no', 
		-w $file ? 'yes' : 'no', 
		-x $file ? 'yes' : 'no' );
}