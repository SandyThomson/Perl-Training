#!/usr/bin/perl

use strict;
use warnings;

use feature qw( say switch );

my $fav_num = 2;

foreach my $num ( @ARGV ) {
	given ( $num % 2 ) {
		when ( 0 ) {
			say( "$num is even" );
		} default {
			say( "$num is odd" );
		}
	}

	my @divisors = divisors( $num );

	if ( @divisors ~~ /$fav_num/ ) {
		say( "Woop! it's divisible by my favourite number($fav_num)!" );
	}

	given ( scalar( @divisors ) ) {
		when ( 0 ) {
			say( "$num: Too small, Can\'t be prime or have divisors" );
		} when ( 1 ) {
			say( "$num: Number is Prime" );
		} default {
			say( "$num: divisors are " . join( ', ', splice( @divisors, 0, -1 ) . " and $divisors[-1]" ) );
		}
	}
}

sub divisors {
	my $number = shift;
	my @divisors = ();
	foreach my $divisor ( 1 .. ( $number/2 ) ) {
		push @divisors, $divisor unless $number % $divisor; 
	}
	return @divisors; 
}
