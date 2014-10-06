#!/usr/bin/perl
use strict;
use warnings;
use 5.014;
use Data::Dumper;

my @messages = ();

foreach ( glob '*' ) {
	my $output = {
		name => $_,
		read => 0,
		write => 0,
		execute => 0
	};
	push @messages, $output;
	
	when ( -r $_ ) { $output->{read} = 1; continue; }
	when ( -w _ ) { $output->{write} = 1; continue; }
	when ( -x _ ) { $output->{execute} = 1; continue; }
}

say $_ foreach ( map { sprintf "%s%s%s   $_->{name}", $_->{read} ? 'r' : '-', $_->{write} ? 'w' : '-', $_->{execute} ? 'x' : '-' } @messages );