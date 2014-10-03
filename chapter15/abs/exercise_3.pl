#!/usr/bin/perl

use strict;
use warnings;

use feature qw( say switch );

foreach ( @ARGV ) {
	when( !-e $_ ) {
		say( "$_ doesn't exist!" );
	} when ( -r _ ) {
		say( "$_ is readable" );
		continue;
	} when ( -w _ ) {
		say( "$_ is writable" );
		continue;
	} when ( -x _ ) {
		say( "$_ is executable" );
	}
}