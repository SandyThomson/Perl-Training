#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;
use Module::CoreList qw( version );

# Install CPAN using the system package manager
# Install Module::CoreList using CPAN

# I play by my own rules and don't want to dereference
# the hash to just use the reference of the hash 
# my %modules = { $Module::CoreList::version{ 5.014 } };
print( Dumper( $Module::CoreList::version{ 5.014 } ) );

1;