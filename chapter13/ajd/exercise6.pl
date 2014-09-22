#!/usr/bin/perl

use strict;
use warnings;
use File::Basename;

# link @ARGV

if ( scalar( @ARGV ) < 2 ) {
  die( "Creates a link. Usage: perl $0 <file> <destination>\n" );
}

my ( $target, $destination ) = @ARGV;

if ( !-f $target ) {
  die( "'$target' is not a file, abandoning you\n" );
}

if ( -d $destination ) {
  # May as well keep the directory handling part
  $destination .= ( $destination =~ /\/\z/ ? '' : '/' ) . basename( $target );
}

link ( $target, $destination ) || die ( "Something went wrong: $!\n" );
print "Created link $destination to $target\n";
