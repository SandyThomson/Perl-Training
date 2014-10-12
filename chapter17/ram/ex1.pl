#!/usr/bin/perl

use strict;
use warnings;
use Getopt::Std;
use 5.014;

my %options;
getopts('df:', \%options);

say "Debug mode enabled" if defined $options{d};

# Check that we have a file to read
usage() if not defined $options{f};
say "Attempting to open $options{f}" if defined $options{d};

# Read input file into array
my @input_strs = ();
open my $input_file, '<', $options{f} or die "Unable to open file $options{f}: $!\n";
while( <$input_file> ) {
  chomp;
  push( @input_strs, $_ );
}
close $input_file;
say "Read " . scalar @input_strs . " lines from $options{f}" if defined $options{d};
say join( ", \n", @input_strs ) if defined $options{d};

# Now ask the user what they want to search for
while( 1 ) {
  say "Please enter a pattern to search for (or press enter to quit):";
  chomp( my $pattern = <STDIN> );

  # Does the user wish to exit
  if ( length( $pattern ) == 0 ) {
    last;
  }

  # Is the pattern valid
  my $regex = eval { qr/$pattern/ };
  if ( $@ ) {
    say "Invalid regex: $@";
    next;
  }

  # Check for matches ignoring case for ease of use
  my @matching_lines = grep /$pattern/i, @input_strs;
  say "There are " . scalar @matching_lines . " matches";
  say "Matches:";
  say join( ", \n", @matching_lines );
}

# Simple usage subroutine
sub usage {
  say "ex1.pl [-d] -f <filename>";
  exit(0);
}
