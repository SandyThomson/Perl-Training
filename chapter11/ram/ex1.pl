#!/usr/bin/perl

use strict;
use warnings;

use Module::CoreList;

my %modules = %{ $Module::CoreList::version{5.014} };

print( join( "\n", sort keys %modules ) );

