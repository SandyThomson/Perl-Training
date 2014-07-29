#!/usr/bin/perl

use strict;
use warnings;

while( <> ){
  # Ordinarily I'd break this apart into multiple lines, I think
  print if ( /[A-Z]+[a-z]+/ || /[a-z]+[A-Z]+/ );
}
