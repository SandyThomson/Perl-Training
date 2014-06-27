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
    print "Enter the string the you want to sort :\n";
    chomp( @input = <STDIN> );
  }
}

@input = sort @input;
print "\n\nAll sorted, here are your string in order:\n\n";
my $line = shift @input;
while ( defined $line ) {
  print "$line\n";
  $line = shift @input;
}
