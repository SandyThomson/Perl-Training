#!/usr/bin/perl -w
use strict;
use 5.010;

use DateTime;

# Map anything that's not a positive number to 0 - validation will then catch it later
my ( $y, $m, $d ) = map { ( defined $_ && $_ > 0 ) ? $_ : 0 } @ARGV[0..2];

# Make sure we have non-zero values
unless ( $y && $m && $d ) {
  say "Usage: $0 YYYY MM DD";
  exit 1;
}

my $today = DateTime->today();
my $target = DateTime->new(
  year => $y,
  month => $m,
  day => $d,
);

my $interval = $today->subtract_datetime( $target );

# There are a few ways to ditch the negatives - we can call abs() on the values in @units, or using Date::Calc::Delta_YMD(), or blah blah.
# This is probably the best balance of readability and reduced bloat.
if ( $interval->is_negative() ) {
  $interval = $interval->inverse();
}

my @units = $interval->in_units( qw( years months days ) );

printf( "Interval between %s and %s is %d years, %d months and %d days\n", $today->ymd, $target->ymd, @units );
