#!/usr/bin/perl
use strict;
use warnings;
use 5.010;

# Find the indexes of the substring in the string.
my $string = $ARGV[0];
my $sub = $ARGV[1];

# OK slightly lazy, flag would have worked better
my $case_insensitive = ( $ARGV[2] eq 'true' );

if ( !defined $sub || $sub eq '' ) {
	say "Substring must be defined.";
	say "$0 <string> <substring>";
	exit 1;
}

if ( $case_insensitive ) {
	$string = lc $string;
	$sub = lc $sub; 
}

# array to put matches in
my @matches = ();
my $i = 0;

while ( ( $i = index( $string, $sub, $i ) ) != -1 ) {
	push @matches, $i;
	$i++;
}

printf "The substring [%s] was found in string [%s] %s times.\n", $sub, $string, scalar @matches;
if ( scalar @matches ) {
	say join "\n", map { "Index $_" } @matches;	
}
