#!/usr/bin/perl
use strict;
use warnings;
use feature qw( say);
use 5.010001;


foreach ( @ARGV ) {
  say "\nProcessing $_";
  when ( -e  $_  ) { say "$_ exists"; continue;  }
  when ( -r  $_  ) { say "$_ is readable"; continue; }
  when ( -w  $_  ) { say "$_ is writtable"; continue; }
  when ( -x  $_  ) { say "$_ is executable"; continue; }
}

