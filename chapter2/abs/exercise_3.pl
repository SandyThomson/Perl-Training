use strict;
use constant {
	pi => 3.14159265359,
	precision => 1
};

sub get_circumference {
	my ( $radius ) = @_;
	return 2 * pi * $radius;
}

sub get_radius {
	print( 'Enter Radius: ' );
	my $radius = <STDIN>;
	if ( $radius !~ /^-?\d*\.?\d*$/ ) {
		CORE::say( 'Non-numeric input!' );
		return get_radius();
	}
	return ( $radius > 0 ? $radius : 0 );
}

my $circumference = get_circumference( get_radius() );
my $format = '%.' . precision . 'f';
my $formatted_circumference = sprintf( $format, $circumference );
CORE::say( "Your Circumference is: $formatted_circumference" );
