#!/usr/bin/perl
use strict;
use warnings;
use feature qw( say);
use 5.010001;

my $secret = int(1 + rand 100);

while(<>) {
	chomp;
  given( $_){
    when( $_ eq "cheat" ) { say "pss... the number is $secret" ; break; }
    when( $_ eq "quit" ||  $_ eq "exit" || $_ eq "" || $_ ~~ $secret) { say "Win !" if $_ eq $secret ;exit; }
    when( $_ > $secret ) { say "Too high" ; break; }
    when( $_ < $secret ) {say "Too low" ; break; }
  }
}
