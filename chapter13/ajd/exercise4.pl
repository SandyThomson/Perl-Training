#!/usr/bin/perl

use strict;
use warnings;

# Short & naïve version: unlink @ARGV;

if ( !scalar( @ARGV ) ) {
  die "This script will delete your files (for reals): perl $0 <files> <to> <delete> ...\n";
}

foreach my $file ( @ARGV ) {
  delete_file( $file );
}

sub delete_file { 

  my ( $file ) = @_;

  if ( !-e $file ){
    # File not found
    print "$file doesn't exist so it can't be deleted\n";
  }
  elsif ( -d _ ) {
    # Let's leave directories alone for now
    print "$file is a directory, leave it alone\n";
  }
  else {
    # It's file deletin' time!
    unlink $file || warn ( "Couldn't delete $file because: $!" );
  }
} 
