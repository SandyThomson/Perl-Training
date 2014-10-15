#!/usr/bin/perl

use strict;
use warnings;

my @date_fields = qw/ year mon day /;
my @files = glob '*';

foreach my $file ( @files ) {
  # use a map with localtime and a slice to turn the epoch times into date strings
  my( $atime, $mtime ) = ( stat( $file ) )[ 8, 9 ];

  # 0 - atime, 1 - mtime
  my @file_times = ( stat( $file ) )[ 8, 9 ];
  my @formatted_file_times = map { format_unixtimestamp( $_ ) } @file_times;
  printf( "%-30s%20s%20s\n", $file, @formatted_file_times );
}

# Takes a unix timestamp and formats in the format YYYY-MM-DD
sub format_unixtimestamp {
  my ( $timestamp ) = @_;

  my %time;
  @time{@date_fields} = ( localtime $timestamp )[5, 4, 3];

  # Currently the year contains no of years since 1900 so add 1900
  $time{year} += 1900;
  # Month is 0 based so need to add 1 to make first month 1 and last one 12
  $time{mon}++;
  
  return sprintf( "%04d-%02d-%02d", @time{ @date_fields } );
}
