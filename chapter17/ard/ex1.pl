#!/usr/bin/perl

use strict;
use warnings;

use 5.010001;
use autodie;

use Try::Tiny;

my @strings;
say "Reading text file into memory\n";


try {
  open INPUT, 'sample_text.txt';
  chomp( @strings = <INPUT> );
  close INPUT;
}
catch {
  say "There was an error handling the input file: $_";
  exit;
};


while ( 1 ) {
  print "Give me a pattern to look for (or empty string to quit): ";
  chomp( my $input = <STDIN> );

  given ( $input ) {
    when ( '' ) {
      say "\nGoodbye!";
      last;
    }
  }
  my @results;
  try {
    @results = grep { m/$input/ } @strings;
  }
  catch {
    say "\nError matching '$input': $_";
    next;
  };
  
  my $hits = scalar @results;
  say "\nThe pattern '$input' matched $hits line", ( $hits != 1 ) ? 's' : '', ":\n";
  if ( $hits ) {
    say join( "\n", @results, '' );
  }
  else {
    say "Nothing to see!\n";
  }
}
