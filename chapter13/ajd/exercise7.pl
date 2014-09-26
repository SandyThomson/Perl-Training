#!/usr/bin/perl

use strict;
use warnings;
use File::Basename;
use Getopt::Long; # Better than your weak Getopt::Std

# No shortcut to this one

my $symlink;

GetOptions (
    'symbolic|soft' => \$symlink,
    );

if ( scalar( @ARGV ) < 2 ) {
  die( "Creates a link, optionally a symlink. Usage: perl $0 [-s|--symbolic|--soft] <file> <destination>\n" );
}

my ( $target, $destination ) = @ARGV;

if ( !-f $target ) {
  die( "'$target' is not a file, abandoning you\n" );
}

if ( -d $destination ) {
  # May as well keep the directory handling part
  $destination .= ( $destination =~ /\/\z/ ? '' : '/' ) . basename( $target );
}

if ( $symlink ) {
  symlink ( $target, $destination ) || die ( "Something went wrong: $!\n" );
  print "Created symlink $destination to $target\n";
} else {
  link ( $target, $destination ) || die ( "Something went wrong: $!\n" );
  print "Created link $destination to $target\n";
}
