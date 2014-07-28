#!/usr/bin/perl

use strict;
use warnings;

if ( !scalar( @ARGV ) ) {
  die "Usage: $0 <a bunch of files>\n";
}

# Figure out the eldest file
my $eldest_file;
my $eldest_file_age = 0; # Assuming that not all of the files are from the future

foreach my $file ( @ARGV ) {

  # Ignore files that don't exist
  if ( !-e $file ) {
    next;
  }

  # Call this once to save on reads
  my $age = -C $file;

  if ( $age > $eldest_file_age ) {
    $eldest_file = $file;
    $eldest_file_age = $age;
  }
}

# Show how many days old it is
if ( defined $eldest_file ) {
  printf ( "%s is %0.2f days old\n", $eldest_file, $eldest_file_age );
} else {
  die "None of the files listed exist, try harder\n";
}
