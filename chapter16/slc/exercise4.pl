#!/usr/bin/perl

use strict;
use warnings;
use 5.014;
use Data::Dumper;

# get an array with all the possible signals
my @signals = sort keys %SIG;

# OK, fork you
defined( my $pid = fork ) or die "Couldn't fork: $!";

# the child will go into an infinite loop
unless( $pid ) {
	# set up the actions for the signals
	for my $signal ( @signals ) {
		$SIG{$signal} = sub { state $counter = 0; $counter++; say "CHILD: $_[0] has been called $counter times.";}
	}
	
	# set a special action for SIGINT
	$SIG{'INT'} = sub { say "Uh oh, SIGINT called"; exit 0; };
	# loop forever
	while ( 1 ) {
	}
	exit 0;
} else {
	# now let's randomly send some signals to the child.
	for ( 0..100 ) {
		sleep(1);
		
		# I left it in but this never seems to be called
		unless ( kill 0, $pid ) {
			say "Child process stopped.";
			last;
		}
		
		# pick a random signal and send it
		# some like STOP/KILL end the child still :/
		my $random_sig = $signals[rand @signals];
		say "PARENT sending signal $random_sig";
		kill $random_sig, $pid or die "Cannot signal $pid with $random_sig: $!";
	}
}

# Make the parent wait for the child
waitpid( $pid, 0 );

