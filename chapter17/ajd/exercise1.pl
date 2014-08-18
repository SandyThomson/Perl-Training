#!/usr/bin/perl

use strict;
use warnings;

use Getopt::Long;
use File::Slurp;

# Read some words from a file, then let the user enter some regexes
# show which words match, deal with any errors

my ( $input_file, $help );

GetOptions ( 'help' => \$help );

if ( $help ) {
  print "Usage: $0 [file of words]\n";
  exit (0);
}

# If the assignment doesn't work, or the file doesn't exist, use the default
if ( !( $input_file = $ARGV[0] ) || !-e $input_file ) {
  print "No file specified, using default\n";
  $input_file = 'sample_text';
}

# Read the file
my @lines = read_file ( $input_file );

print "Enter a pattern to match (blank to exit): ";

while ( my $pattern = <STDIN> ) {
  chomp ( $pattern );

  # Bail if there's no pattern
  if ( !$pattern ) {
    last;
  }
  
  # Capture the matching lines
  my @matches;
  eval {
    @matches = grep ( /$pattern/, @lines );
  };

  # Catch fails or print matches, whichever works
  if ( $@ ) {
    print ( "Invalid pattern, try again: ");
  } else {
    print "The following lines matched:\n@matches";
    print "Enter another pattern (blank to exit): ";
  }
}
