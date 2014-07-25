#!/usr/bin/perl
use strict;
use warnings;

my %names = ( 
);

my @inputs = ();
while ( my $input = <STDIN>) {
    chomp  $input;
    ++$names{$input};
}

foreach my $name (sort { $names{$b} <=> $names{$a} } keys %names) {
    print "$name => ".$names{$name}."\n";
}