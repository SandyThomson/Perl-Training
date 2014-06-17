#!/usr/bin/perl

use strict;
use warnings;
use Math::Trig qw( pi );
use 5.014;

my $radius = 12.5;
my $circumference = $radius * (2 * pi);

say "Circumference: ".$circumference;
