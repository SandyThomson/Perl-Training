#!/usr/bin/perl

use strict;
use warnings;
use v5.10.1;

# Parse date, react to weekdays

my @weekdays = qw( Monday Tuesday Wednesday Thursday Friday );
my @weekends = qw( Saturday Sunday );

# Why bother parsing date's output when you can just
# tell it what you want?
given ( qx { date +%A } ) {
  chomp;
  when ( @weekdays ) { print "Get to work!\n" }
  when ( @weekends ) { print "Go play!\n" }
  default { print "No day?! Better start drinking!\n" }
}

