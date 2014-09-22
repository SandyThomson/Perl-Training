#!/usr/bin/perl

use warnings;
use strict;

use Getopt::Long;
use Term::ANSIColor;

use feature qw( say switch );

use vars qw( @occurrences );

my ( $input, $substring );
GetOptions( 
	'input=s' => \$input,
	'substring=s' => \$substring
)	or die_displaying_the_programs_usage();
do_we_have_the_args_that_we_need_to_finish_running_the_program_otherwise_die( $input, $substring );

update_terminals_colour( 'start' );
say( "Looking for occurrences of '$substring' in '$input'" );

# starting from 0, check we have a match and assign the location, 
# then incr to not match the same again
for ( my $i = 0; ($i=index( $input, $substring, $i )) != -1; $i++ ) {
	push @occurrences, $i;
}

# save number of occurrences in case we need to check this value again
if ( my $count = scalar( @occurrences ) ) {
	update_terminals_colour( 'good' );
	my $o = "$count occurrence";
	
	if ( $count > 1 ) {
		# if we have more than one then lets format the string correctly
		$o .= 's found at indexes: ' . join( ', ', splice( @occurrences, 0, -1 ) ) . " and $occurrences[-1]";
		
	} else {
		# else nothing special to do
		$o .= " found at index: $occurrences[0]";
	}
	
	say( $o );
} else {
	update_terminals_colour( 'bad' );
	say( "No occurrences of '$substring' found" );
}

# no value resets the terminals colour
update_terminals_colour();

# descriptive subroutine names FTW!
sub do_we_have_the_args_that_we_need_to_finish_running_the_program_otherwise_die {
	my ( $input, $substring ) = @_;
	
	if ( !( defined( $input ) || length( $input ) ) ) {
		die_displaying_the_programs_usage();
	} elsif ( !( defined( $substring ) || length( $substring ) ) ) {
		die_displaying_the_programs_usage();
	}
}

sub die_displaying_the_programs_usage {
	# should die but need to reset the terminals colour, so lets <strike>warn</strike> tell the user
	# and exit with a non-successful value ( not sure why but warn doesn't use the colours w/o another module )
	update_terminals_colour( 'bad' );
	say( "$0: [-i|--input] <input-string> [-s|--substring] <substring>" );
	update_terminals_colour();
	exit 1;
}

sub update_terminals_colour {
	my ( $action ) = @_;
	
	my $colour;
	for ( $action ) {
		when( 'start' ) { $colour = 'blue'; }
		when( 'good' ) { $colour = 'green'; }
		when( 'bad' ) { $colour = 'red'; }
		default { $colour = 'reset'; }
	}
	print( color( $colour ) );
}
