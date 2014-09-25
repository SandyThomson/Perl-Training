#!/usr/bin/perl

use strict;
use warnings;
use Getopt::Std;
use 5.010;

my %opts = ();
getopts( 'v', \%opts );

say "Please enter the string to search:";
chomp( my $input_str = <STDIN> );

say "Now, please enter the substring to look for:";
chomp( my $sub_str = <STDIN> );

my $starting_pos = 0;
my $last_match = -1;
my @matches;

# Take a backup of the input_str as it gets corrupted by the while loop
my $input_str_backup = $input_str;

# Record the matches
while ( $input_str_backup =~ s/^(.*?)($sub_str)//s ) {
  $last_match = $starting_pos + length($1);

  say "Looking for a match (starting_pos: [$starting_pos]):" if exists $opts{v};
  say "Match found at position $last_match" if exists $opts{v};

  push @matches, $last_match;
  $starting_pos += length($1) + length($2);
}

say "";
display_debug() if exists $opts{v};

foreach ( @matches ) {
  say "Match found at position $_";
}
say "";


#####################################

# Print a ruler and the input string
sub display_debug {

  my @ruler_tens = map { substr( sprintf( "%02d", $_ % 100 ), 0, 1 ) } ( 0 .. length( $input_str ) - 1 );
  my @ruler_units = map { $_ % 10 } ( 0 .. length( $input_str ) - 1 );
  my @ruler_lines = map { '-' } ( 1 .. length( $input_str ) );

  foreach ( @matches ) {
    $ruler_lines[$_] = 'v';
  }

  say '-' x length( $input_str );
  say @ruler_tens if length( $input_str ) > 9;
  say @ruler_units;
  say @ruler_lines;
  say $input_str;
  say '-' x length( $input_str );
  say "";
}
