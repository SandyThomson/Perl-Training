package LearningPerl::Interactive;

use strict;
use vars qw( @ISA @EXPORT_OK );
@ISA = qw( Exporter );
@EXPORT_OK = qw(
	capture_input
	capture_numeric_input
);

sub capture_input {
	my ( $message ) = @_;
	print $message;
	
	my $input = <STDIN>;
	chomp( $input );
	if ( length( $input ) == 0 ) {
		CORE::say( 'How about actually typing something?' );
		return capture_input( $message );
	}
	return $input;
}

sub capture_numeric_input {
	my ( $message ) = @_;
	
	my $input = capture_input( $message );
	if ( $input !~ /^-?\d*\.?\d*$/ ) {
		CORE::say( 'Non-numeric input!' );
		return capture_numeric_input( $message );
	}
	return $input;
}

1;
