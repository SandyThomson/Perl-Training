#!/usr/bin/perl
use strict;
use warnings;
use 5.014;
use Scalar::Util qw(looks_like_number);

# number will come in as first arg
my $no = $ARGV[0];

my @divs = ();
my %favourite_number = ( 
	'7' => 1,
	'16' => 1
);

# not I know it says to use smart matching but my head hurts and I want bed
given ( $no ) {
	when ( !looks_like_number( $_ ) ) { say "Not even a number" }
	# now we'll get the number
	@divs = divisors( $_ );
	# I'm missing the point of this I feel
	when ( @divs ~~ /^2$/ ) { say "Number is even"; continue; }
	when ( @divs ~~ %favourite_number ) { say "This number is divisable by a favourite number"; continue; }
	when ( scalar @divs ~~ 0) { say "$_ is a prime number" }
	when ( scalar @divs > 0  ) { say "$_ has these divisors [@divs]" }
}

sub divisors {
	my $number = shift;
	
	my @divisors = ();
	foreach my $divisor ( 2 .. ($number / 2)) {
		push @divisors, $divisor unless ( $number % $divisor );
	}
	return @divisors;
}
