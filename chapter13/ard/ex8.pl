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

if ( -d $dir && chdir $dir ) {
  list_files();
}
else {
  error( $! );
}

sub list_files {
  say "Directory contains the following symlinks:";
  foreach my $file ( glob "* .*" ) {
    next unless ( -l $file );
    my $target = readlink $file or error( $! );
    say "'$file' -> '$target'";
  }
}

sub error {
  my ( $error ) = @_;
  say "Directory change failed: $error";
  exit 1;
}
