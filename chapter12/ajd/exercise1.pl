#!/usr/bin/perl

use strict;
use warnings;

if (!scalar( @ARGV ) ) {
  die "Usage: exercise1.pl <a bunch of files>\n";
}

foreach my $file ( @ARGV ) {
  file_info( $file );
}

sub file_info {

  my ( $file ) = @_;

  my @info;

  # Bleh, can't think of a way to reduce this without using eval
  if ( -e $ file ) {

    if ( -r _ ) {
      push( @info, 'readable' );
    }

    if ( -w _ ) {
      push( @info, 'writable' );
    }

    if ( -x _ ) {
      push( @info, 'executable' );
    }

  } else {
    push( @info, 'non existent' );
  }

  # File report
  print "File '$file' is " . ( scalar ( @info ) ? join (', ' , @info ) : "(no attributes)" ) . "\n"; 

}
