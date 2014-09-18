#!/usr/bin/perl -w
use strict;

use 5.010;

use File::Spec;
use Getopt::Std;

our $opt_s = 0;
getopts( "s" );

if ( scalar @ARGV != 2 ) {
  say "Usage: $0 [-s] <file> <link>\n\n  -s\tCreate symlink";
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

print( ( $opt_s ) ? 'Syml' : 'L', "inking '$file' to '$target'... " );

if ( $opt_s ) {
  symlink $file, $target or error( $! );
}
else {
  link $file, $target or error( $! );
}

say "Done!";


sub error {
  my ( $error ) = @_;
  say "Error: $error";
  exit 1;
}
