#!/usr/bin/perl

use strict;
use warnings;

# %u   day of week (1..7); 1 is Monday
open ( my $date_fh, '-|', 'date +%u' ) or die "Cannot pipe from date: $!";
  my $dow = <$date_fh>;
  print "get to work\n" if( grep { $dow == $_ } (1..5) );
  print "go play\n" if( grep { $dow == $_ } (6..7) );
close( $date_fh );

if( $? ){
  die "date: non-zero exit of $?";
}
