#!/usr/bin/perl

use strict;
use warnings;

my %words;

while ( <> ) {
        chomp;
        my $count = $words{$_};
        $words{$_} = $count + 1;
}

for my $key ( sort keys %words ) {
        print "$key was seen $words{$key} times\n";
}
