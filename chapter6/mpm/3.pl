#!/usr/bin/perl
use strict;
use warnings;
use List::Util qw( max );

my $longest_key_length =  max( map {  length($_ ) } keys %ENV ) ;
my $template = "| %-".$longest_key_length."s | %s";
print join("\n" , map { sprintf ( $template, $_ , $ENV{$_} ) } sort keys %ENV);
print "\n\n";
