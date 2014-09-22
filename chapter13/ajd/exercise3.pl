#!/usr/bin/perl

use strict;
use warnings;

print "Directory browser, which directory? (blank for home)\n";

my $input = <STDIN>;
chomp( $input );

if ( $input eq '' ) {
  $input = $ENV{HOME};
  print "Defaulting to $input\n";
}

if ( -d $input ) {
  chdir $input;

  # glob-o-time
  my @files = sort ( glob '* .*' );

  print "@files\n";
}
else {
  print "Directory does not exist\n";
}

