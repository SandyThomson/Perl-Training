#!/usr/bin/perl

use strict;
use warnings;

use 5.010; # 'say'

my $maxkeylength = 0;

foreach my $key (keys %ENV){
  if( length $key > $maxkeylength) {  
    $maxkeylength = length $key;
  }
}

foreach my $key ( keys %ENV){
  printf "%-*s", $maxkeylength+1, $key;
  say $ENV{$key};
}
