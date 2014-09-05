#!/usr/bin/perl

use strict;
use warnings;

use Module::CoreList;
use Data::Dumper qw/ Dumper /;

print Dumper( $Module::CoreList::version{5.014} );

