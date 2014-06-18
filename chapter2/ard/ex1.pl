#!/usr/bin/perl -w
use strict;
use 5.010;

use Math::Trig qw( pi );

my $radius = 12.5;
my $circumference = 2 * pi * $radius;

say "Circumference for a circle of radius $radius is $circumference.";
