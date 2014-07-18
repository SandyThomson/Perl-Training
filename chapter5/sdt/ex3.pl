#!/usr/bin/perl

use strict;
use warnings;

use 5.010; # I'm using 'say'

say "Please enter data on seperate lines. The first line should be the column width to use, followed by actual data on subsequent lines. (CTRL-d to cease input)";

my @lines = <STDIN>;

# CBA validating - I do this every exercise - lets assume it's a valid int
my $column_width = $lines[0];

# We need a certain number of rulersection multiples, then we need to truncate that to the exact column width
my $rulersection = "1234567890";
my $multiplesrequired = ( $column_width / length $rulersection ) + 1;
printf "%*.*s", $column_width, $column_width, $rulersection x $multiplesrequired ;
print "\n";

for (my $i = 1; $i <= $#lines; $i++) {
  my $line = $lines[$i];
  chomp $line;
  printf "%*.*s", $column_width, $column_width, $line;
  print "\n";
}
