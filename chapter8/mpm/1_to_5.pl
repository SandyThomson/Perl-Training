#!/usr/bin/perl -w

use strict;
use Switch;


switch ($ARGV[0]) {
		case 1 { match_program( 'match' ); }
    case 2 { match_program( '\b\w*a\b' ); }
    case 3 { match_program( '\b(\w*a)\b' ); }
    case 4 { match_program( '\b(?<word>\w*a)\b' ); }
    case 5 { match_program( '\b(\w*a)\b(.{1,5})' ); }

		else { print "The exercice $ARGV[0] does not exist" }
	}



sub match_program {
  my $regex = $_[0] ;
  print "regex =  $regex\n";
  while (<STDIN>) {
      chomp;

      if (/$regex/) {
         print "Matched: |$`<$&>$'|\n";
         print "\$1 contains '$1'\n" if defined $1;
         print "\$2 contains '$2'\n" if defined $2;
         print "word contains '$+{word}'\n" if defined $+{word};
      } else {
         print "No match.\n";
      }
  }


}
