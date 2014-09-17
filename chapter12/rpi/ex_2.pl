#!/usr/bin/perl

use strict;
use warnings;

my %age;
foreach my $file ( @ARGV ) {
  $age{$file} = -M _ if -e $file;
}

my $oldest;
my $oldest_age = 0;

foreach ( keys %age ) {
  if ( $age{$_} > $oldest_age ) {
    $oldest = $_ ;
    $oldest_age = $age{$_};
  }
}

print "$oldest is the oldest at $oldest_age old\n" if defined $oldest;
