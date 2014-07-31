#!/usr/bin/perl

use warnings;
use strict;
use Getopt::Std;
use Switch;

my %opts = ();
getopts( 'e:', \%opts );

my $regex = '';

switch ($opts{e}) {
  case 1 { $regex = 'fred'; }
  case 2 { $regex = "[fF]red"; }
  case 3 { $regex = '\.'; }
  case 4 { $regex = '[A-Z][a-z]+'; }
  case 5 { $regex = '(\S)\1'; }
  case 6 { $regex = 'fred.*wilma|wilma.*fred'; }
  else { usage()  }
}

print "Matching using $regex\n";

while ( <> ) {
  if ( /$regex/ ) {
    print "$_";
  }
}

sub usage {
  print "Usage:\n";
  print "You must supply the -e flag with a valid exercise number!\n";
  print "The valid exercise numbers are 1, 2, 3, 4, 5 and 6\n";
  exit 1;
}
