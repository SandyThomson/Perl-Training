#!/usr/bin/perl

use strict;
use warnings;

my %signals = ();

$SIG{'INT'} = 'int_handler';

foreach ( keys %SIG ) {
  $SIG{$_} = 'count_signal' unless $_ eq 'INT';
}

print "hello world\n";

while ( 1 ) {
}

sub int_handler {
  print "Goodbye World!\n";
  exit 1;
}

sub count_signal {
  $signals{ $_[0] } += 1;
  print "Just saw signal $_[0]! Times we have seen that signal: $signals{ $_[0] }\n";
}
