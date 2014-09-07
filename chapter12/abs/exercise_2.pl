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
	my %oldest_file = ( file => '', age => -1 );
	foreach my $file ( @files ) {
	
		# if the file exists set file age else default to -1
		my $age = ( -e $file ) ? -M $file : -1;
		
		if ( $age > $oldest_file{age} ) {
			# update oldest file
			$oldest_file{file} = $file;
			$oldest_file{age} = $age;
		}
	}
	
	return ( $oldest_file{file}, $oldest_file{age} );
}
