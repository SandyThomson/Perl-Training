#!/usr/bin/perl
use strict;
use warnings;

my @names = (
      {given_name => 'Fred', family_name => 'Flintstone'},
      {given_name => 'Barney', family_name => 'Rubble'},
      {given_name => 'Wilma', family_name => 'Flintstone'},
      {given_name => 'Fred', family_name => 'Knows'},
);

print "Enter a name to search for: ";
chomp(my $input_name = <STDIN>);

my @matches = grep {$_->{given_name} eq $input_name} @names;

if (@matches) {
  print "The following family name(s) match the given name $input_name: ", join ( ' ', map {$_->{family_name}} @matches), "\n";
} else {
  print "There were no matches for $input_name\n";
}