#!/usr/bin/perl

use strict;
use warnings;
use 5.014;
use Data::Dumper;
use Try::Tiny;
use Term::ANSIColor;

# Require an argument
if (!defined $ARGV[0]) {
	say "Usage $0 [<file>]+"	
}

# keep some colors to interpolate
my $green = color 'green';
my $red = color 'red';
my $yellow = color 'yellow';
my $clear = color 'reset';

# Create ref
my $file_lines = ();

# read in all the files and add to arrays
while (<>) {
	chomp;
	if (!defined $file_lines->{$ARGV}) {
		$file_lines->{$ARGV} = [];
	}
	push $file_lines->{$ARGV}, $_;
}

say_yellow ("Read in file(s) ", join ', ', keys %$file_lines);

# loop forever
while ( 1 ) {
	# get input
	print "Enter a regex to search for in the files: ";
	chomp(my $regex = <STDIN>);
	
	# exit if it's empty
	if ($regex eq '') {
		say "No regex entered, exiting.";
		last;
	}
	
	# look for the regex matches
	my $regex_matches = find_matches( $regex );
	
	# do we have any matches
	my @files = keys %$regex_matches;
	if ( scalar @files ) {
		# for every file we have matches print out the lines
		foreach my $f (@files) {
			printf "%sFile [%s] has %s line(s) matching the given regex /%s/%s.\n", $green, $f, scalar @{$regex_matches->{$f}}, $regex, $clear;
			foreach ( @{$regex_matches->{$f}} ) {
				# replace the matching regex with a red version and print
				$_->{line_text} =~ s/($regex)/$red$1$clear/g;
				printf ("%3s %s\n", $_->{line_no}, $_->{line_text});
			};
		}
	} else {
		# :( no matches
		say_yellow("No matches.");
	}
}

# find all the matches in all the files
sub find_matches {
	my $reg = shift;
	my $match_list = ();
	
	# Damn semi colon on the end of the catch caused me pain!
	try {
		# loop through all the lines in all the files and find the matches
		foreach my $key ( keys $file_lines ) {
			my @line_matches = ();
			while (my ($i, $l) = each $file_lines->{$key}) {
				if ( $l =~ /$reg/ ) {
					push @line_matches, { line_no => $i + 1, line_text => $l }
				}
			}
			if ( scalar @line_matches ) {
				$match_list->{$key} = \@line_matches;
			}
		}
	} catch {
		say $red, "Error caught: $_", $clear;
	};
	return $match_list;
}

# Print out something in yellow
sub say_yellow {
	say $yellow, @_, $clear;
}

