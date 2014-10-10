#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

# I like qx better than the backticks :)
my $date = qx( date );

# link a regex to a message
my %hash = (
	weekday => {
		regex => qr/^(Mon|Tue|Wed|Thu|Fri)/i,
		message => 'get to work!'
	},
	weekend => {
		regex => qr/^(Sat|Sun)/i,
		message => 'get play!'
	},
);

# loop through keys and decide which one
foreach my $key ( keys %hash ) {
	if ($date =~ $hash{$key}->{regex}) {
		say $hash{$key}->{message};
		last;
	}
}