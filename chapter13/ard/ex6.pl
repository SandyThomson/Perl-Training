#!/usr/bin/perl -w
use strict;

use 5.010;

use File::Spec;

if ( scalar @ARGV != 2 ) {
  say "Usage: $0 <file> <link>";
  exit;
}

my ( $file, $target ) = @ARGV;

if ( !-f $file ) {
  error( "'$file' is not a valid file" );
}
if ( -d $target ) {
  $target = File::Spec->catfile( $target, $file );
}

if ( -e $target ) {
  error( "Destination file '$target' already exists - aborting." );
}

print "Linking '$file' to '$target'... ";

if ( link $file, $target ) {
  say "Done!";
}
else {
  error( $! );
}

sub error {
  my ( $error ) = @_;
  say "Error: $error";
  exit 1;
}
