#!/usr/bin/perl
use strict;
use warnings;
use Scalar::Util qw(looks_like_number);
use 5.014;

# number will come in as first arg
my $no = $ARGV[0];

if ( !$no || !looks_like_number($no) ) {
	say "Usage: $0 <number>";
	exit 1;
}

my @messages = ();

given ( $no ) {
	when ( !( $_ % 3 ) ) { push @messages, "Fizz"; continue; }
	when ( !( $_ % 5 ) ) { push @messages, "Bin"; continue; }
	when ( !( $_ % 7 ) ) { push @messages, "Sausage"; }
	default { say "Uh oh, that was a bad number!" }
}

say "@messages";