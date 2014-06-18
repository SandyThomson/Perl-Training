#!/usr/bin/perl

use strict;
use warnings;

use Circle;

my $circle = new Circle( radius => 12.5 );

print $circle->circumference . "\n";
