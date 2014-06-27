#!/usr/bin/perl

use strict;
use warnings;
use Getopt::Long;

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
    print "Enter some things over several lines :\n";
    chomp( @input = <STDIN> );
  }
}

print "\n\nAnd in reverse:\n\n";
my $line = pop @input;
while ( defined $line ) {
  print "$line\n";
  $line = pop @input;
}
