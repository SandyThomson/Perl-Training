#!/usr/bin/perl
use strict;
use warnings;
use feature qw( say);

# install using  sudo cpan DateTime
use DateTime;

my $date = DateTime->new(
                       year   => $ARGV[0],
                       month  => $ARGV[1],
                       day    => $ARGV[2],
                     );

my $now = DateTime->now();

my $dur = $date->subtract_datetime($now);
say $dur->years() . " years , ".  $dur->months() . " months, ".  $dur->days()  . " days";
