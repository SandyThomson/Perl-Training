#!/usr/bin/perl
use strict;
use warnings;

my %names = ( 
  "fred" => "flintstone",
  "barney" => "rubble",
  "wilma" => "flintstone"
);

print "First Name\n";
my $input = <STDIN>;
chomp $input ; 

print $names{$input}."\n";
