#!/usr/bin/perl

use strict;
use warnings;

print( "Matches: \n\t", join( ", \n\t", grep( { chomp; /(?=.*fred)(?=.*wilma)/ } <> ) ), "\n" );
