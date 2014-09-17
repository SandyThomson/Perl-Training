#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

# Identifies the oldest file on the command line and reports its age in days.

my %files_by_mod_age;

foreach my $fn ( @ARGV ) {
  # Modification age
  my $age = -M $fn;
  push @{ $files_by_mod_age{$age} }, $fn;
}

my $oldest = ( sort { $b <=> $a } keys %files_by_mod_age )[0];
printf( "The oldest file(s) is/are called %s and is/are %d days old\n", join( ', ', @{ $files_by_mod_age{$oldest} } ), $oldest );

say "Files by modification age (oldest first)";
foreach my $mod_age ( sort { $b <=> $a } keys %files_by_mod_age ) {
   say join( ', ', @{ $files_by_mod_age{$mod_age} } );
}
