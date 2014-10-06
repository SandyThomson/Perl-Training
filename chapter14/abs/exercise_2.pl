#!/usr/bin/perl

use strict;
use warnings;

use Table;

my %last_name = qw{
	fred flintstone Wilma Flintstone Barney Rubble
	betty rubble Bamm-Bamm Rubble PEBBLES FLINTSTONE
};

my $tbl = new Table( qw( first last ) );
foreach my $name ( sort by_name keys %last_name ) {
	$tbl->add_row( $name, $last_name{$name} );
}
print $tbl;

sub by_name {
	return lc( $last_name{$a} ) cmp lc( $last_name{$b} )
		or
	lc( $a ) cmp lc( $b );
}
