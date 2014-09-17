#!/usr/bin/perl
use strict;
use warnings;
use 5.010;
use DateTime;

if ( scalar @ARGV != 3 ) {
	die "Incorrect number or args. 3 parameters expected: year, month, day"
}

# validate we have correct number of args
my ($year, $month, $day) = @ARGV;

my $comparison_date = DateTime->new(
	year => $year,
    month => $month,
    day => $day
);
my $today = DateTime->now;

# entered date
say "Comparison Date: ", $comparison_date->dmy('/');
say "Today's Date:    ", $today->dmy('/');

# compare
my $diff = $today - $comparison_date;
my $is_future = 0;
if ( $diff->is_negative ) {
	$is_future = 1;
    $diff = $diff->inverse();
}

# print the difference
my @units = $diff->in_units( qw(years months days) );
printf "The comparison date is %s years, %s months and %s days %s.\n", @units, $is_future ? 'in the future' : 'in the past';