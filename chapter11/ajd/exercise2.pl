#!/usr/bin/perl

use strict;
use warnings;

use DateTime;

if ( scalar @ARGV < 3 ) {
  die "Usage: $0 <year> <month> <day>\n";
}

my %date_fields = (
    year => $ARGV[0],
    month => $ARGV[1],
    day => $ARGV[2],
  );

my $current = DateTime->from_epoch( epoch => time );
my $user_defined = new DateTime( \%date_fields );

my $difference = $current - $user_defined;

# Deal with dates in the future
if ( $difference->is_negative() ) {
  $difference = $difference->inverse();
}

my @units = $difference->in_units( qw/years months days/ );

printf( "%d years, %d months, and %d days\n", @units );

