#!/usr/bin/perl

use strict;
use warnings;

use POSIX;

printf( "%20s %20s %20s\n", $_, 
		map { POSIX::strftime( '%Y-%m-%d', localtime( $_ ) ) } (stat($_))[8,9])
			foreach ( glob( '*' ) );
