#!/usr/bin/perl
use strict;
use warnings;
use 5.010;

my @inputs= ();
while(  my $input = <STDIN> ) {
  chomp( $input );
  push(@inputs , $input );
}

say "123456789012345678901234567890123456789012345678901234567890";
print( join ("\n" , map{ sprintf "%21s" , $_ } @inputs  ) );

