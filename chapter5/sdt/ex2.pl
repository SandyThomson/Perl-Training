#!/usr/bin/perl

use strict;
use warnings;

use 5.010; # I'm using 'say'

# Ah shit, after now reading exercise 3 I may have overengineered this solution - it wasn't entirely clear 
# what we had to do, so I assumed each line of input was a table row, and each comma denoted a column boundary
# (i.e CSV input for formatting).

say "Please enter tabular data, seperated by commas and new lines (CTRL-d to cease input)";

my @lines = <STDIN>;
my $column_count;

while ( my ($line_number, $line) = each @lines ){

  chomp $line;

  my @columns = split ',', $line;
  
  if( !defined $column_count ){
    $column_count = scalar @columns;
    my $rulersection = "1234567890";
    say $rulersection x ($column_count*2);
  }  

  if($column_count != scalar @columns){
    die 'Inconsistent number of columns on line: '.($line_number+1).'. Expected: '.$column_count.' columns but saw: '. scalar @columns;
  }

  foreach my $column (@columns) {
    printf "%20.20s", $column;
  }

  print "\n";
}

