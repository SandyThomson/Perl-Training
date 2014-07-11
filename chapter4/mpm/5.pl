#!/usr/bin/perl
use strict;
use warnings;
my @last_names = (); 

sub greet{
  my ($name) = @_ ; 
  print "Hi $name! ";
  if( scalar( @last_names) == 0  ){
    print "You are the first one here!\n";
  }else{
    print "I've seen: ". join( ' ' , @last_names) ."\n";
  }
  push @last_names ,  $name ; 
}

greet( "Fred" );
greet( "Barney" );
greet( "Wilma" );
greet( "Betty" );