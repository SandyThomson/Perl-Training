#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);


my  $dir =  $ARGV[0];
$dir = "~" if $ARGV[0] eq '' ;
die "Provide a valid directory" if  ! -d $dir;


chdir $dir;
my @all_files = glob '*';

# not required
# @all_files =  grep {  $_  !~ /^\./ }  @all_files;
for( @all_files){
  say $_;
}
