#!/usr/bin/perl
use strict;
use warnings;
use feature qw( say);
use 5.14.0;

# evil one liner 
say `date` =~ /^S/  ?  "play" : "work";

