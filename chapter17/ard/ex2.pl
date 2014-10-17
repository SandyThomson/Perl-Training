#!/usr/bin/perl

use strict;
use warnings;

printf( "%-25s %s\t\t%s\n", $_, ( stat $_ )[8,9] ) foreach ( sort glob "* .*" );
