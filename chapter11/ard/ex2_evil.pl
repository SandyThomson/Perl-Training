#!/usr/bin/perl -w
use strict;
use DateTime;

# Just for (some value of) fun...
printf( "Interval is %d years, %d months and %d days\n", map { abs $_ } DateTime->today()->subtract_datetime( DateTime->new( year => $ARGV[0] // 0, month => $ARGV[1] // 0, day => $ARGV[2] // 0 ) )->in_units( qw( years months days ) ) );
