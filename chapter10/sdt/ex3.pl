#!/usr/bin/perl

use strict;
use warnings;

use 5.010; # 'say' and //

my $maxkeylength = 0;

$ENV{PERL_TEST_VARIABLE} = undef;

foreach my $key (keys %ENV){
  if( length $key > $maxkeylength) {  
    $maxkeylength = length $key;
  }
}

foreach my $key ( keys %ENV){
  printf "%-*s", $maxkeylength+1, $key;
  say $ENV{$key} // '(undefined value)';
}
