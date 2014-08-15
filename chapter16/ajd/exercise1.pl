#!/usr/bin/perl

use strict;
use warnings;

# Run an external ls -l on a big directory

# Let's go to /etc

chdir ( '/etc' );
print qx{ ls -l };

