#!/usr/bin/perl

use strict;
use warnings;

use 5.14.0;

my $date = `date | cut -d ' ' -f 1`;
process_date( $date );

$date = `date`;
$date = substr $date, 0, 3;
process_date( $date );

sub process_date {
  my $d = @_;
  given ( $d ) {
    when ( /Sun|Sat/ ) { go_play() }
    default  { get_to_work() }
  }
}

sub get_to_work {
  print "Get to work!\n";
}

sub go_play {
  say 'Go play \o/!'
}
