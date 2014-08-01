#!/usr/bin/perl

use strict;
use warnings;

while( <> ){
  print if ( /(.)\g{-1}/ );
}
