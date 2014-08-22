#!/usr/bin/perl

use strict;
use warnings;

use Getopt::Long;
use Safe;

use vars qw( $names $custom_names );
$names = {
  fred => 'flintston',
  barney => 'rubble',
  wilma => 'flintstone'
};


# Parse CL Opts
use vars qw( $file $help );
GetOptions(
  'f|file=s' => \$file,
  'h|help' => \$help
) or die $@;

if ( $help ) {
  print( "./exercise_1.pl --file <file-name>", "\n" );
  exit( 0 );
}

# Load Custom Names
if ( defined( $file ) ) {
  my $s = new Safe;
  # may have stole this from the diffgen CGI but this takes a file
  # and executes the code returning the last value executed, seems
  # like a nice way to quickly read a data structure into the program
  $custom_names = $s->rdo( $file ) or die "Error loading custom name file($file): $@";
}

# Start Interactive Part
print( 'Enter a name: ' );
chomp( my $name = <STDIN> );
print( get_surname_output( $name, $names, $custom_names ), "\n" );

sub get_surname_output {
  my ( $person, $names, $custom_names ) = @_;

  my $output = _get_surname( $person, $names );
  return $output if ( defined( $output ) );

  $output = _get_surname( $person, $custom_names );
  return $output if ( defined( $output ) );

  return "$name who? Sorry, don't know the fella";
}

sub _get_surname {
  my ( $person, $names ) = @_;

  my $surname = $names->{$person};
  if ( length( $surname // '' ) ) {
    return "Surname of '$name' is '$surname'";
  }
  return undef;
}

