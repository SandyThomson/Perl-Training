#!/usr/bin/perl
use strict;
use warnings;
use 5.010;

print "This program will print each input line containing trailing whitespace\n";
print "followed by a line that indicates, using ^ characters, where this trailing\n";
print "whitespace resides:\n";

while ( <> ) {
  chomp;
  if ( /.(?<whitespace> +)$/ ) {
    print "$_\n";
    my $str_len = length( $+{whitespace} );
    my $before_len = length( $_ ) - $str_len;
    print " " x $before_len, "^" x $str_len, "\n";
  }
}

