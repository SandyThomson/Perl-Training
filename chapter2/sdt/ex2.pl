#!/usr/bin/perl

use strict;
use warnings;
use Math::Trig qw( pi );
use Getopt::Long;
use 5.014;

sub main {
	my $radius;

	GetOptions( "radius=s" => \$radius ) or die "Error in command line options";

	while( !valid_radius( $radius ) ){
		say "No radius / invalid radius supplied";
		say "Please enter the radius of the circle to compute";
		$radius = <STDIN>;
	}

	my $circumference = $radius * (2 * pi);
	say "Circumference: ".$circumference;
}

sub valid_radius {
	my ( $radius ) = @_;

	if( defined $radius && $radius =~ /^[0-9\.]+$/ ){
		return 1;
	} else {
		return 0;
	}
}

main();
