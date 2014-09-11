#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);


for (@ARGV){
  say $_ if( -R $_ &&  -W $_ && -O $_)
}