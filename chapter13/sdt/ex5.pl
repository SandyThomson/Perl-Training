#!/usr/bin/perl

use strict;
use warnings;
use 5.010;
use feature 'say';
use File::Spec;

if( scalar @ARGV != 2 ){
  die "Please supply a source and a destination";
}

my $source = $ARGV[0];
my $destination = $ARGV[1];

if( -d $destination ){
  # If destination is a dir, get the source *filename* and append it to the directory to get the true destination
  my $source_filename = ( File::Spec->splitpath( $source ) )[2];
  $destination = File::Spec->catfile( $destination, $source_filename );
}

rename $source, $destination or die "Problem moving file: $!";
