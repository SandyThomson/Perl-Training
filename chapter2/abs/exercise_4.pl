use strict;

sub capture_numeric_input {
	my ( $order ) = @_;
	print "Enter $order number: ";
	my $input = <STDIN>;
	if ( $input !~ /^-?\d*\.?\d*$/ ) {
		CORE::say( 'Non-numeric input!' );
		return capture_numeric_input( $order );
	}
	return $input;
}

CORE::say( capture_numeric_input( '1st' ) * capture_numeric_input( '2nd' ) );
