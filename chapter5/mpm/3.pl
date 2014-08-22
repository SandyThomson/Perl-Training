#!/usr/bin/perl
use strict;
use warnings;
use 5.010;

my $padding = <STDIN> ;
chomp( $padding  );
$padding = $padding ;

my @inputs= ();
while(  my $input = <STDIN> ) {
  chomp( $input );
  push(@inputs, $input );
}

say "padding :".$padding;
say "123456789_" x ( $padding / 10 +1 );

my @padded_inputs = map{ sprintf ("%${padding}s" , $_ ) } @inputs ;

say( join ("\n" , @padded_inputs  ) );
