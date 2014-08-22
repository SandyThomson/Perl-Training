#!/usr/bin/perl

use strict;
use warnings;

my %names = ( Andrew => "Davey",
              Sandy => "Thomson",
              Alex => "Deas",
              Arran => "Stobbs",
              Sean => "Clark",
              Mathieu => "Patereau",
              Richard => "Ince",
              Robert => "Main",
              Fred => "Flintstone",
              Barney => "Rubble",
              Wilma => "Flintstone",
            ); 
my $given_name;
my $output_str;

print "Please enter a given name:\n";
chomp ( $given_name = <STDIN> );
if ( defined( $given_name ) ) {
  $given_name = ucfirst( lc( $given_name ) );
  if ( exists( $names{$given_name} ) ) {
    $output_str = sprintf( "%s\'s surname is %s", $given_name, $names{$given_name} );
  }
}

if ( !defined( $output_str ) ) {
  $output_str = sprintf( "I don\'t know that person. I only know:\n%s", join( ", ", sort ( keys ( %names ) ) ) );
}

print( "$output_str\n" );

