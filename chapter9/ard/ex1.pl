#!/usr/bin/perl -w
use strict;
use 5.010;

my $what = 'fred|barney';

say "Pattern: '$what'";

while ( <> ) {
  chomp;
  if ( m/(?:$what){3}/ ) {
    say "   Match: '$_'";
  }
  else {
    say "No match: '$_'";
  }
}
