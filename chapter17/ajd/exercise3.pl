#!/usr/bin/perl

use strict;
use warnings;

# Capture the contents of a directory with grep,
# stat the atime and mtime, then format it nicely

foreach my $file ( sort glob '*' ) {
  printf ( "%-20s\t%-10s\t%-10s\n", $file, map { format_date($_) } ( stat ( $file ) )[ 8, 9 ] ); 
}

sub format_date {
  
  # Turn epoch date into a useful format
  my ( $date ) = @_;
  my @date_parts = ( localtime $date )[ 5, 4, 3 ];

  # Add 1900 to the year and 1 to the month
  $date_parts[0] += 1900;
  $date_parts[1] += 1;

  return sprintf ( "%4d-%02d-%02d", @date_parts );

}
