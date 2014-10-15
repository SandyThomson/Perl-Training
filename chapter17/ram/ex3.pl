#!/usr/bin/perl

use strict;
use warnings;

my @files = glob '*';

foreach my $file ( @files ) {
  my( $atime, $mtime ) = ( stat( $file ) )[ 8, 9 ];

  # use a map with localtime and a slice to turn the epoch times into date strings

  my @date_fields = qw/ year mon day /;
  my %atime;
  @atime{@date_fields} = ( localtime $atime )[5, 4, 3];

  # Currently the year contains no of years since 1900 so add 1900
  $atime{year} += 1900;
  # Month is 0 based so need to add 1 to make first month 1 and last one 12
  $atime{mon}++;

  my %mtime;
  @mtime{@date_fields} = ( localtime $mtime )[5, 4, 3];

  # Currently the year contains no of years since 1900 so add 1900
  $mtime{year} += 1900;
  # Month is 0 based so need to add 1 to make first month 1 and last one 12
  $mtime{mon}++;

  my $formatted_atime = sprintf( "%04d-%02d-%02d", @atime{ @date_fields } );
  my $formatted_mtime = sprintf( "%04d-%02d-%02d", @mtime{ @date_fields } );

  printf( "%-30s%20s%20s\n", $file, $formatted_atime, $formatted_mtime );
}

