#!/usr/bin/perl

use strict;
use warnings;

# List symlinks in current dir

opendir( my $dir, "." ) || die( "Couldn't open current directory, no idea how you got here: $!\n" );

print "Symlinks in the current directory:\n";

foreach my $file ( readdir( $dir ) ) {

  if ( my $link = readlink( $file ) ) {
    
    # Add some colours because fancy
    if ( -e $link ) {
      print "[1;36m$file[0m -> $link\n";
    }
    else { 
      print "[1;31m$file[0m -> [1;31m$link[0m\n";
    }
  }

}

closedir( $dir ) || die( "You got problems: $!\n" );
