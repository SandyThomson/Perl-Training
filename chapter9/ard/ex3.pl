#!/usr/bin/perl -w
use strict;

$^I = '.bak';

# This is the only way I can think to do this in one line. Normally I'd avoid using /e
# just because it's kind of ugly - it tells the interpreter that the substitution
# part should be evaluated as Perl code.
while ( <> ) {
  s/(fred|wilma)/{ ( $1 =~ m!^fred$!i ) ? 'Wilma' : 'Fred' }/egi;
  print;
}
