#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);


my  $dir =  $ARGV[0];
$dir = "~" if $ARGV[0] eq '' ;
die "Provide a valid directory" if  ! -d $dir;


chdir $dir;
my @all_files = glob '.* *';

for( @all_files){
  say $_;
}
