package LearningPerl::Math;

use Math::Trig ':pi';

use strict;
use vars qw( @ISA @EXPORT_OK );
@ISA = qw( Exporter );
@EXPORT_OK = qw( 
	circumference
	is_numeric
);

sub circumference {
	my ( $radius ) = @_;
	
	if ( is_numeric( $radius ) ) {
		return 2 * pi * $radius;
	}
	return 0;
}

sub is_numeric {
	my ( $input ) = @_;
	
	return ( $input =~ /^-?\d*\.?\d*$/ ? 1 : 0 );
}

1;
