use strict;
use constant {
	pi => 3.14159265359,
	precision => 1,
	radius => 12.5
};

sub get_circumference {
	my ( $radius ) = @_;
	return 2 * pi * $radius;
}

my $circumference = get_circumference( radius );
my $format = '%.' . precision . 'f';
my $formatted_circumference = sprintf( $format, $circumference );

CORE::say( "Your Circumference is: $formatted_circumference" );
