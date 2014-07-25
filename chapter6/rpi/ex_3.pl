#!/usr/bin/perl

use strict;
use warnings;

for my $key ( sort { $a cmp $b } keys %ENV ) {
        printf "%-20s %s\n", $key, $ENV{$key};
}
