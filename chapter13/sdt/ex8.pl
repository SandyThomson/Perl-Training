#!/usr/bin/perl

use strict;
use warnings;
use 5.010;
use feature 'say';

say "Please enter a directory location";

my $dir;

while( $dir = readline ){
  chomp $dir;
  if( ! -d $dir ){
    say "Input isn't a directory (or doesn't exist), please try again";
  } else {
    last; # All good
  }
}

opendir( my $dh, $dir ) or die "Failed to open directory: $!";

foreach my $file ( readdir $dh ){
  if( my $dest = readlink $file ){
    say "$file -> $dest";
  }
}

closedir $dh;
