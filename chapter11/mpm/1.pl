#!/usr/bin/perl
use strict;
use warnings;
use feature qw( say);

# install using  sudo cpan Module::CoreList
use Module::CoreList;

my %modules = %{ $Module::CoreList::version{5.014} };

say %modules