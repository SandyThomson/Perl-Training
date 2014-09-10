#!/usr/bin/perl

use strict;
use warnings;

my @potential_files = @ARGV;

my $oldest_file;
my $oldest_file_age = -1;

foreach my $file (@potential_files){
  my $age = get_file_age( $file );

  if( defined $age ){
    if( $age > $oldest_file_age ){
      $oldest_file = $file;
      $oldest_file_age = $age;
    }
  }
}

if( $oldest_file_age == -1 ){
  print "Sorry, couldn't work out the oldest file. Do the files exist?\n";
} else {
  my $age_in_days = (($oldest_file_age/60)/60)/24;
  printf "Oldest file: '%s' [%d days old]\n", $oldest_file, $age_in_days;
}



sub get_file_age {
  my $file = shift;

  if ( -e $file ){
    # Not possible to figure out file creation time in unix, so run with when file was last modified
    my $seconds_since_epoch = time - (stat _ )[9];
    return $seconds_since_epoch; 
  }

  return undef;
}
