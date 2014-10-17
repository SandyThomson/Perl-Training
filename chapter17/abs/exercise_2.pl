#!/usr/bin/perl

use strict;
use warnings;

printf( "%20s %20s %20s\n", $_, (stat($_))[8,9]) foreach ( glob( '*' ) );
