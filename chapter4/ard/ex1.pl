#!/usr/bin/perl -w
use strict;
use 5.0100;

use Scalar::Util qw( looks_like_number );


my @fred = qw( 1 3 5 7 9 );
my $fred_total = total( @fred );
say "The total of \@fred is $fred_total.";

say "Enter some numbers on separate lines:";
my $user_total = total ( <STDIN> );
say "The total of those numbers is $user_total.";


sub total {
  my @args = @_;
  my $total = 0;
  
  foreach my $arg ( @args ) {
    if ( looks_like_number( $arg ) ) {
      $total += $arg;
    }
    else {
      say "'$arg' is not a number so I'll ignore it!";
    }
  }
  
  return $total;
}
