use strict;

my $word = capture_input( 'Enter word to repeat: ' );
my $repeat = capture_numeric_input( 'How many times would you like to repeat that? ' );
print( ( $word . $/ ) x $repeat );

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
