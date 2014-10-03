#!/usr/bin/perl

use strict;
use warnings;

use feature qw( say switch );

foreach my $num ( @ARGV ) {
	given ( my @divisors = divisors( $num ) ) {
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
