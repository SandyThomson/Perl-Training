#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

my @weekday = qw( Mon Tue Wed Thu Fri );
my @weekend = qw( Sat Sun );

open my $date_fh, '-|', 'date' or die "cannot pipe from date: $!";
my $date_str = <$date_fh>;
my @date_arr = split( / /, $date_str);
my $day = $date_arr[0];

given ( $day ) {
  when ( @weekday ) { say "Get to work!"; }
  when ( @weekend ) { say "Go play!"; }
  default { say "Hey I'm conversing in English here buddy!"; }
}

close $date_fh;
