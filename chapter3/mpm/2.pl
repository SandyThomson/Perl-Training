#!/usr/bin/perl
use strict;
use warnings;


print "Enter a list of number ( Press Ctrl+D when finished) : ";

my @names = qw(fred betty barney dino wilma pebbles bamm-bamm);

my $continue = 1;
my @output = ();
do{
  my $input = <STDIN>;
  if(defined $input){ #  If Ctrl + D is pressed then $input is not defined 
    chomp $input ; 
    push( @output,  $names[$input]);
  }else{
    $continue = 0;
  }
}
while($continue);


print ( join(', ', @output ) . "\n") ; 


