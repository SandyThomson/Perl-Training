#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

sub main {
	my $number1 = get_number( "first number" );
	my $number2 = get_number( "second number" );

	my $product = $number1 * $number2;
	say "Product: ".$product;
}

sub get_number {
	my ( $text_description ) = @_;
	
	say "Please enter the ".$text_description;
	my $number = <STDIN>;

	while (!valid_number( $number )){
		say "Sorry, the number you entered is invalid, please try again";
		$number = <STDIN>;
	}

	return $number;
}

sub valid_number {
	my ( $number ) = @_;

	if( defined $number && $number =~ /^[0-9\.\-]+$/ ){
		return 1;
	} else {
		return 0;
	}
}

main();
