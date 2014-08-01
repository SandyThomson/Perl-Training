#!/usr/bin/perl

use strict;
use warnings;

print "Directory browser, which directory? (blank for home)\n";

my $input = <STDIN>;
chomp( $input );

if ( $input eq '' ) {
  # Surely no one would log in as root just to break this?
  $input = "/home/" . getlogin();
  print "Defaulting to $input\n";
}

if ( -d $input ) {
  chdir $input;

  # Same as the last time, with less grep
  opendir( my $dir, '.' ) || die ( "Can't open directory $input: $!\n" );
  my @files = sort ( readdir( $dir ) );
  closedir( $dir );

  print "@files\n";
}
else {
  print "Directory does not exist\n";
}

