#!/usr/bin/perl

use strict;
use warnings;

my %staff_list;

# Build up the staff list from the supplied data
while ( my $person = <DATA> ) {
  chomp ( $person );

  if ( $person =~ /^(\w+) ([\w ]+)$/ ) {
    my ( $firstname, $surname ) = ( $1, $2 );

    # Easy approach - overwrites some people
    #$staff_list{$firstname} = $surname;

    # Complicated approach
    # For duplicate first names, turn the value into an arrayref to
    # preserve all of them
    if ( defined $staff_list{$firstname} ) {
      if ( ref $staff_list{$firstname} eq 'ARRAY' ) {
        push ( $staff_list{$firstname}, $surname );
      }
      else {
        $staff_list{$firstname} = [ $staff_list{$firstname}, $surname ];
      }
    }
    else {
      $staff_list{$firstname} = $surname;
    }
  }
}

# Ask for a first name, try to find any surnames
print "Enter the first name of someone in the office: ";
while ( my $name = <STDIN> ) {
  chomp ( $name );

  # Handle the lists and single names
  if ( defined $staff_list{$name} ) {
    if ( ref ( $staff_list{$name} ) eq 'ARRAY' ) {
      foreach my $surname ( @{$staff_list{$name}} ) {
        printf ( "Found %s %s\n", $name, $surname );
      }
    }
    else {
      printf ( "Found %s %s\n", $name, $staff_list{$name} );
    }
  }
  else {
    print "No one called '$name' works here\n";
  }

  print "Another name? Ctrl-D to end: ";
} 

# Throw down a newline for a tidier exit from that loop.
print "\n";

# All the people
__DATA__
Alex Deas
Alex Panayotopoulos
Alison Johnstone
Andrew Davey
Andrew Grant
Andrew Palmer
Andrew Waterson
Andy Diack
Anil Chugh
Ann Rautenbach
Arran Stobbs
Christian Lillie
Christine Beaumont
Colin Maughan
Dave Cox
Dave McCraw
David Caldwell
David Zhivkov
Euan Roddie
Fraser McCoull
Garry Dale
Gary Brownlee
Graham Burke
Graham Davidson
Greg Dolan
Greg Shepherd
Ian Kirkpatrick
Jacob Pappe
James Sturrock
John Birtley
John Watson
Jonathan Thomson
Kamil Miekus
Kas Robson
Kate McKinnon
Kenny Scott
Krishna Kalangi
Lee Aitkenhead
Lee McMillan
Mairi Warren
Malcolm Murray
Martin Macdonald
Mathieu Patureau
Michael Wambeek
Michail Rallis
Neil Bartley
Neil Galvin
Nestor Milyaev
Norman Little
Paula van der Salm
Richard Ince
Robert Dailey
Robert Durie
Robert Main
Ron Chan
Ryan McNally
Sandy Thomson
Sarah Aouane
Sean Clark
Simon Gross
Suresh Kavali
Suresh Nuzella
Thierry Roisin
Wayne Booth
