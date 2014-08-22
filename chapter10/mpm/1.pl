#!/usr/bin/perl
use strict;
use warnings;
use feature qw( say);

my $secret = int(1 + rand 100);


while(<>) {
	chomp;
	if ( $_ eq "quit" || 
		 $_ eq "exit" ||
		 $_ eq "" ||
		 $_ eq $secret
		 ) {
		exit;
	}
	
	if( $_ eq  "cheat" ){
		say "pss... the number is $secret" ;
		next;
	}
	
	
	if( $_ > $secret){
		say "Too high" ;
		next;
	}
	
	if( $_ < $secret){
		say "Too low" ;
	}
	
}
