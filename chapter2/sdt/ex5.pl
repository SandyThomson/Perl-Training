#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

sub main {
	say "Please enter the text to repeat";
	my $text = <STDIN>;

	say "How many times should it be repeated?";
	my $repeat = get_positive_integer();

	print $text x $repeat;
}

sub get_positive_integer {
	my $positive_integer = <STDIN>;

	while (!positive_integer( $positive_integer )){
		say "Sorry, the text you entered isn't a positive integer, please try again";
		$positive_integer = <STDIN>;
	}

	return $positive_integer;
}

sub positive_integer {
	my ( $positive_integer ) = @_;

	if( defined $positive_integer && $positive_integer =~ /^[0-9]+$/ && $positive_integer > 0 ){
		return 1;
	} else {
		return 0;
	}
}

main();
