#!/usr/bin/perl

use strict;
use warnings;

use Scalar::Util qw( looks_like_number );

use feature qw( switch );

# prints Fizz Bin Sausage
print divisor( 105 );

print divisor( @ARGV );

sub divisor {
	my ( @args ) = @_;
	
	my $ret;
	foreach my $arg ( @args ) {
		$ret .= $arg . ': ';
		given( $arg ) {
			when ( !looks_like_number( $arg ) ) {
				$ret .= 'None-numeric'
			} when ( $arg % 3 == 0 ) {
				$ret .= 'Fizz ';
				continue;
			} when ( $arg % 5 == 0 ) {
				$ret .= 'Bin ';
				continue;
			} when ( $arg % 7 == 0 ) {
				$ret .= 'Sausage';
			}
		}
		$ret .= "\n";
	}
	return $ret;
}
