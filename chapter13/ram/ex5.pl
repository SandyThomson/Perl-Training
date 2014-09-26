#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

if ( scalar @ARGV != 2 ) {
  die "Usage: $0 <old_filename> <new_filename>";
}
my ( $old, $new ) = @ARGV;

if ( !-e $old ) {
  die "Cannot rename $old to $new: $old does not exist";
}
if ( -e $new ) {
  die "Cannot rename $old to $new: $new exists";
}
elsif ( rename $old => $new ) {
  say "Woohoo, it worked!";
}
else {
  warn "rename $old to $new failed: $!\n";
}

