#!/usr/bin/perl
use strict;
use warnings;


print "Enter a name( Press Ctrl+D when finished) : ";


my $continue = 1;
my @output = ();
do{
  my $input = <STDIN>;
  if(defined $input){ #  If Ctrl + D is pressed then $input is not defined 
    chomp $input ; 
    push( @output,  $input);
  }else{
    $continue = 0;
  }
}
while($continue);


print ( join(', ', sort(@output) ) . "\n") ; 


