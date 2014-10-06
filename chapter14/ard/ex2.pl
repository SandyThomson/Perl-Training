#!/usr/bin/perl -w
use strict;
use 5.010;

use Data::Dumper;

my %lastname = qw(
  fred flintstone
  Wilma Flintstone
  Barney Rubble
  betty rubble
  Bamm-Bamm Rubble
  PEBBLES FLINTSTONE
);

say "Raw data:";
say Dumper( \%lastname );

my @sorted = sort by_lastname_then_firstname keys %lastname;

say "Sorted by lastname/firstname, case insensitive:";

foreach my $firstname ( @sorted ) {
  say "$firstname $lastname{$firstname}";
}

sub by_lastname_then_firstname {
  lc( $lastname{ $a } ) cmp lc( $lastname{ $b } )
  or
  lc( $a ) cmp lc( $b );
}
