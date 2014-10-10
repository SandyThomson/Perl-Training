#!/usr/bin/perl

use strict;
use warnings;

my %signal_count;

sub main {

  foreach my $signal ( keys %SIG ){
    $SIG{$signal} = 'signal_handler';
  }

  while(1){
    # Do nothing
  }
}


sub signal_handler {
  my $signame = shift; 
  
  print "Received $signame.\n";
  print "=" x 20;
  print "\n";

  $signal_count{$signame}++;

  foreach my $key (sort keys %signal_count){
    printf "%4s:%d\n", $key, $signal_count{$key};
  }
  print "=" x 20;
  print "\n";
  
  if( $signame eq 'INT' ){
    print "Exiting\n";
    exit;
  }
  print "\n";

  return; 
}

main();
