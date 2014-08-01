#!/usr/bin/perl
use strict;
use warnings;
use 5.010;

chomp( my @input = ( <STDIN> ) );

my @output = grep { m/[Ff]red/ } @input;

say 'The following lines matched:';
say join( "\n", @output );

