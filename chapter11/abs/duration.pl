#!/usr/bin/perl

use strict;
use warnings;

use feature qw( say );

use DateTime;

my ( $year, $month, $day ) = ( @ARGV );
if ( !defined( $year ) || !defined( $month ) || !defined( $day ) ) {
	say( 'duration <year> <month> <day>' );
	exit 1;
}

my $user_date = DateTime->new(
	year => $year,
	month => $month,
	day => $day
);
my $now = DateTime->from_epoch( epoch => time );
my $difference = $now - $user_date;
say( sprintf( 'years %d, months %d, days %d', $difference->in_units( qw( years months days ) ) ) );

1;
