#!/usr/bin/perl
use strict;
use warnings;
use Module::CoreList;
use Data::Dumper;
use 5.010;

my $modules = $Module::CoreList::version{5.014};
say "Printing out all modules in perl version " . 5.014;
say Dumper( $modules );
