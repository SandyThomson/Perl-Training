#!/usr/bin/perl

use strict;
use warnings;

use Getopt::Long;
use File::Slurp;

# Find the indexes of occurences of a string within a larger string

# Preamble, getting options, checking files and so on
my ( $file, $word );

GetOptions(
  'file:s'  => \$file,
  'word:s'  => \$word,
  );

if ( !$file || !$word ) {
  die "Usage: $0 --file <file> --word <word>\n";
}

my $content;

if ( -e $file ) {
  # File::Slurp is way faster than using <> or regular file handles
  $content = read_file( $file );
}
else {
  die( "Couldn't read '$file': $!\n" );
}

# Start doing things to the data

# What the exercise asked for
print( "Positions of '$word' in the text: " . join( ', ', @{find_indices( $content, $word )} ) . "\n" );

# Something a bit fancier
print( "\nLines containing '$word':\n\n" );

foreach my $line ( split( /\n/, $content ) ) {

  chomp( $line );

  # Get the indices for each line
  my @indices = @{find_indices( $line, $word )};

  # If there are any, print out the line followed by another line marking where
  if ( scalar @indices ) {
    print( "$line\n" );

    # Produce a marker line
    my $marker_line = ' ' x length( $line );
    foreach my $index ( @indices ) {
      # Use substr to replace blanks with marks
      # May have been easier with a substitution
      substr ( $marker_line, $index, length( $word ) ) = '^' x length( $word );
    }
    print( "$marker_line\n" );
  }
}

sub find_indices {

  my ( $text, $word ) = @_;
  my $current = -1; # Start at -1 to make the first loop work
  my @positions; 

  # Work through the text, picking out the indices of $word
  # This would have been a regular while, but index doesn't populate $_
  do {
    $current = index( $text, $word, $current + 1 ) ;
    push( @positions, $current );
  } while ( $current >= 0 );

  # There will be a -1 on the end of the list
  pop( @positions );

  # Returning an arrayref because I'm into that
  return \@positions;
}

