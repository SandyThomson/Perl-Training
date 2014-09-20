#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);


my  $dir =  $ARGV[0];
$dir = "~" if $ARGV[0] eq '' ;
die "Provide a valid directory" if  ! -d $dir;


chdir $dir;

opendir my $dh, $dir or die "Cannot open $dir: $!";
foreach my $file (readdir $dh) {
  say  $file;
}
closedir $dh;