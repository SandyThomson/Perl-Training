#!/usr/bin/perl

use strict;
use warnings;

use 5.010; # 'say'

my %names = (
  andrew => 'Davey',
  alex => 'Deas',
  robert => 'Main',
  richard => 'Ince',
  sean => 'Clark',
  mathieu => 'Patureau',
  arran => 'Stobbs',
  sandy => 'Thomson',
);

say "Please enter the first name of someone in our training group (CTRL-D to cease input)";

while( my $name = <STDIN> ){
  chomp $name;

  if( exists $names{lc $name} ){
    say "Family name: ". $names{lc $name};
  } else{
    say "I'm sorry, I'm not familiar with the name entered.. please try again";
  }
  
}
