#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);


for (@ARGV){
  say "$_ :  ";
  say( ( -e $_ ) ? " exists " : " does not exist " );
  say( ( -R $_ ) ? " readable " : " not readable " );
  say( ( -W $_ ) ? " writable " : " not writable " );
  say( ( -X $_ ) ? " executable " : " not executable " );
}