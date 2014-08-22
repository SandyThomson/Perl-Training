#!/usr/bin/perl

use strict;
use warnings;
use Scalar::Util qw( looks_like_number );
use Log::Log4perl;

Log::Log4perl->init("ex2_log4perl.conf");
my $log = Log::Log4perl->get_logger("ex2");

$log->info("Starting program");

my $magical_number = int(1 + rand 100);
$log->debug("The generated magic number is $magical_number");

print "Guess the number, from 1 to 100. (Type 'exit' / 'quit' or an empty line to stop)\n";

while( my $input = <STDIN> ){

  chomp $input;

  if( $input =~ /^(quit|exit|)$/ ){
    print "Exiting by request\n";
    last;
  }

  if( !looks_like_number( $input ) || int( $input ) != $input ){
    print "Please enter a valid integer, mkay!\n";
    next;
  }
  
  if( $input < 1 || $input > 100 ){
    print "Your guess is out of bounds, please try again!\n";
    next;
  }

  if( $input == $magical_number ){
    print "CORRECT! Good guess!\n";
    $log->info("Correct number guessed");
    last;
  } 
  elsif ( $input > $magical_number ){
    print "Too high\n";
  } elsif ( $input < $magical_number ){
    print "Too low\n";
  } else {
    warn "Something odd happened, exiting with an error code.\n";
    $log->error("Unexpected problem with input: [$input], you'd better investigate!");
    exit 1;
  }
}

$log->info("Program finished");
