#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

# Capture the contents of a directory with grep,
# stat the atime and mtime, then format it nicely

foreach my $file ( sort glob '*' ) {
  printf ( "%-20s\t%-10d\t%-10d\n", $file, ( stat ( $file ) )[ 8, 9 ] ); 
}
