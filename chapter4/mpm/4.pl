#!/usr/bin/perl
use strict;
use warnings;
my $last_name ; 

sub greet{
  my ($name) = @_ ; 
  print "Hi $name! ";
  if( defined $last_name){
    print "$last_name is also here!\n";
  }else{
    print "You are the first one here!\n";
  }
  $last_name =  $name ; 
}

greet( "Fred" );
greet( "Barney" );