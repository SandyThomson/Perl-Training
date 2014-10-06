#!/usr/bin/perl -w
use strict;
use 5.010;

my $test_string = 'This is a test.';
my $substring = 'is';

my @indices = ();

say "Target string: '$test_string'";
say "Substring: '$substring'";

my $first_index = index( $test_string, $substring );

if ( $first_index != -1 ) {
  push @indices, $first_index;
  while ( my $index = index( $test_string, $substring, $indices[-1] + 1 ) ) {
    last if ( $index == -1 );
    push @indices, $index;
  }
  say "Found at position(s): " . join( ', ', @indices );
}
else {
  say "Not found";
}
