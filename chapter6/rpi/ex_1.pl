#!/usr/bin/perl

use strict;
use warnings;

my %names = (
        fred => 'flintstone',
        barney => 'rubble',
        wilma => 'flintstone'
);

print "Please input one of the following names:\n";
for my $key ( keys %names ) {
        print "$key\n";
}

while ( <> ) {
        chomp;
        my $surname = $names{$_};
        if ( !$surname ) {
                print "$_ is not one of the possible names\n";
        }
        else {
                print "$_ $surname is the full name you were after";
        }
}
