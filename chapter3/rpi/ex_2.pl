#!/usr/bin/perl

use strict;
use warnings;
use Getopt::Long;

my @names = qw ( fred betty barney dino wilma pebbles bamm-bamm );

my $file_name;

GetOptions( "file=s", \$file_name );

my @input = ();

print "Hello World!\n";

if ( defined $file_name ) {
  open ( my $file, "<", $file_name ) or die "Cannot open file : $file_name";
  chomp( @input = <$file> );
}
else {
  while ( $#input < 0 ) {
    print "Enter the numbers of the names (0-6) you want :\n";
    chomp( @input = <STDIN> );
  }
}

print "\n\nYou have selected the following names:\n\n";
my $line = shift @input;
while ( defined $line ) {
  if ( defined $names[$line] ) {
    print "$names[$line]\n";
  }
  else {
    print "Nice try, number should be between 0 and 6\n";
  }
  $line = shift @input;
}
