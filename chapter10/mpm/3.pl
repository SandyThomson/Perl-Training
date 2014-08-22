#!/usr/bin/perl
use strict;
use warnings;
use List::Util qw( max );


$ENV{MY_VAR} = undef; 
my $longest_key_length =  max( map {  length($_ ) } keys %ENV ) ;
my $template = "| %-".$longest_key_length."s | %s";
print join("\n" , map { sprintf ( $template, $_ , $ENV{$_} //  "(undefined value)") } sort keys %ENV);
print "\n\n";
