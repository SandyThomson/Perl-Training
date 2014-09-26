#!/usr/bin/perl

use strict;
use warnings;
use Getopt::Std;
use 5.010;

my %opts = ();
getopts( 'l', \%opts );

if ( scalar @ARGV != 2 ) {
  die "Usage: $0 [-l] <existing_file> <link_to_create>";
}
my ( $file, $link ) = @ARGV;

if ( !-e $file ) {
  die "Cannot link $file to $link: $file does not exist";
}
if ( -e $link ) {
  die "Cannot link $file to $link: $link exists";
}
elsif ( exists $opts{l} && symlink $file => $link ) {
  say "Woohoo, symbolic link worked!";
}
elsif ( link $file => $link ) {
  say "Woohoo, hard link worked!";
}
else {
  warn "link $file to $link failed: $!\n";
}

my $radius = $opts{r};
