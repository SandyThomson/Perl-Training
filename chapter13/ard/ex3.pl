#!/usr/bin/perl -w
use strict;

use 5.010;

use File::HomeDir;

print 'Enter directory name: ';

chomp( my $dir = <STDIN> );

if ( $dir =~ m/^\s*$/ ) {
  say "No path provided - defaulting to your homedir. Hope there's nothing incriminating in there!";
  $dir = File::HomeDir->my_home;
}
else {
  $dir =~ s/^\s*|\s*$//g;
}

say "Changing to '$dir'";

opendir DH, $dir or die( 'Failed to open directory:', $! );
my @files = readdir DH;
closedir DH or die( 'Failed to close directory:', $! );

say "Directory contains the following files:";
foreach my $file ( sort @files ) {
  say $file;
}
