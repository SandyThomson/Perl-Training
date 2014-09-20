#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

say "Please enter a directory name (so that I can cd to it and list the contents):";
chomp( my $dirname = <STDIN> );

# Change directory to the given location
if ( $dirname =~ /^\s*$/ ) {
  chdir or die "cannot chdir to user home directory: $!";
}
else {
  chdir $dirname or die "cannot chdir to $dirname: $!";
}

# Now list the files
my @all_files = glob '*';
foreach ( @all_files ) {
  say "$_";
}

