#!/usr/bin/perl

use strict;
use warnings;
use 5.010;
use feature 'say';
use File::Spec;

my $symlink = 0;

if( scalar @ARGV == 3 ){
  if ( ! shift @ARGV eq '-s' ){
    die "Invalid command line switch";
  }
  $symlink = 1;
}
  
if( scalar @ARGV != 2 ){
  die "Please supply a source and a destination";
}

my $source = File::Spec->canonpath( $ARGV[0] );
my $destination = File::Spec->canonpath( $ARGV[1] );

  
if( -d $destination ){
  # If destination is a dir, get the source *filename* and append it to the directory to get the true destination
  my $source_filename = ( File::Spec->splitpath( $source ) )[2];
  $destination = File::Spec->catfile( $destination, $source_filename );
}

if( $symlink ){
  # This doesn't quite work when creating symlinks in other directories, but I don't care, mkay
  # I needed to do more work to figure out how the various paths relate
  symlink $source, $destination or die "Problem symlinking file: $!";
} else {
  link $source, $destination or die "Problem linking file: $!";
}
