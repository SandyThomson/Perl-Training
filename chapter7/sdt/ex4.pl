#!/usr/bin/perl

use strict;
use warnings;

while( <> ){
  print if ( /[A-Z]+[a-z]+/ || /[a-z]+[A-Z]+/ );
}
