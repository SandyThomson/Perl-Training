#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

if ( scalar @ARGV != 2 ) {
  die "Usage: $0 <existing_file> <link_link>";
}
my ( $file, $link ) = @ARGV;

if ( !-e $file ) {
  die "Cannot link $file to $link: $file does not exist";
}
if ( -e $link ) {
  die "Cannot link $file to $link: $link exists";
}
elsif ( link $file => $link ) {
  say "Woohoo, it worked!";
}
else {
  warn "link $file to $link failed: $!\n";
}

