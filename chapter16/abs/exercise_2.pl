#!/usr/bin/perl

use strict;
use warnings;

open( STDOUT, '>', 'ls.out' ) or die( "cannon open > ls.out" );
open( STDERR, '>', 'ls.err' ) or die( "cannon open > ls.err" );

chdir( '/' );
system( 'ls', '-l' );
