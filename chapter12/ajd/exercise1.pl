#!/usr/bin/perl

use strict;
use warnings;

print "Directory browser, which directory? (blank for home)\n";

my $input = <STDIN>;
chomp( $input );

if ( $input eq '' ) {
  # Could have used File::HomeDir for this, if I thought this may ever be run on Windows
  $input = $ENV{HOME};
  print "Defaulting to $input\n";
}

if ( -d $input ) {
  chdir $input;

  # So a glob is easier
  #my @files = sort glob '*';

  # I prefer directory handles though
  opendir( my $dir, '.' ) || die ( "Can't open directory $input: $!\n" );
  my @files = sort ( grep !/\./, readdir( $dir ) );
  closedir( $dir );

  print "@files\n";
}
else {
  print "Directory does not exist\n";
}

