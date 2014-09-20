#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

say "Please enter a directory name (so that I can cd to it and list the contents):";
chomp( my $dirname = <STDIN> );

# Change directory to the given location
if ( $dirname =~ /^\s*$/ ) {
  # Thought I'd try doing what chdir does by default for this one
  chdir $ENV{HOME} // $ENV{LOGDIR} or die "cannot chdir to user home directory: $!";
  $dirname = ".";
}
else {
  chdir $dirname or die "cannot chdir to $dirname: $!";
}

opendir my $dh, $dirname or die "Cannot open $dirname: $!";

# Now list the files
foreach ( sort readdir $dh ) {
  say "$_";
}

