#!/usr/bin/perl

use strict;
use warnings;
use 5.010;
use DateTime;                       # installed from libdatetime-perl

# Compute the interval between now and a date that you enter as the year, month
# and day on the command line:
#
# $ perl duration.pl 1960 9 30
# 50 years, 8 months, and 20 days

my ( $yr, $mon, $day ) = @ARGV;

if ( !(    defined $yr
        && defined $mon
        && defined $day ) ) {
  say "Usage: ";
  say "   duration.pl <year> <month> <day>";
  exit 1;
}

my $dt = DateTime->new(
  year  => $yr,
  month => $mon,
  day   => $day 
  );
  

my $now = DateTime->today( time_zone => 'Europe/London' );

my $duration = $now - $dt;

# From the book
# This gives negative numbers without use of abs()
my @units = $duration->in_units( qw( years months days ) );
printf( "%d years, %d months, and %d days\n", @units );

# From http://search.cpan.org/~drolsky/DateTime-1.12/lib/DateTime/Duration.pm
# This works out the difference nicely
printf( "%d years, %d months, and %d days\n", $duration->years(), $duration->months(), $duration->days() );

