#!/usr/bin/perl

use strict;
use warnings;

# Run an external ls -l on a big directory

# Redirect output
open ( STDOUT, '>', 'ls.out' ) || die "Couldn't redirect stdout: $!\n";
open ( STDERR, '>', 'ls.err' ) || die "Couldn't redirect stderr $!\n";

# Let's go to /etc

chdir ( '/etc' );
print qx{ ls -l };

close ( STDOUT );
close ( STDERR );

