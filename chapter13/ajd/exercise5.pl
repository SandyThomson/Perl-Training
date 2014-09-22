#!/usr/bin/perl

use strict;
use warnings;
use File::Basename;

# rename @ARGV

if ( scalar( @ARGV ) < 2 ) {
  die( "Renames/moves files. Usage: perl $0 <file> <destination>\n" );
}

my ( $target, $destination ) = @ARGV;

if ( !-f $target ) {
  die( "'$target' is not a file, abandoning you\n" );
}

if ( -d $destination ) {
  # This part handles directory destinations
  # Check whether the destination has a trailing slash and add one if not
  # Use the basename of the target as it may also be in a directory
  $destination .= ( $destination =~ /\/\z/ ? '' : '/' ) . basename( $target );
}

rename ( $target, $destination ) || die ( "Something went wrong: $!\n" );
print "Moved $target to $destination\n";
