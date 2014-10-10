#!/usr/bin/perl -w
use strict;

use 5.010001;

my @weekdays = qw( Mon Tue Wed Thu Fri );
my @weekend = qw( Sat Sun );

chomp( my $date = qx( date ) );

my ( $day ) = $date =~ m/^(\S*)/;

# Because I learned something from the previous chapter...
given ( $day ) {
  print "$_: ";
  when( @weekdays ) { say 'get to work' }
  when( @weekend ) { say 'go play' }
}


# Or we could do it a more "old Perl" way...
print "$day: ";
if ( $day =~ /^S/ ) {
  say "go play";
}
else {
  say "get to work";
}
