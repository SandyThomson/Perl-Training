#!/usr/bin/perl

use strict;
use warnings;

my @fred = above_average(1..10, 'e', -1);
print "\@fred is @fred\n";
print "Should be 6 7 8 9 10\n";
my @barney = above_average(100, 1..10);
print "\@barney is @barney\n";
print "Should be 100\n";

sub above_average {
    chomp( my @numbers = @_ );
    @numbers = filter_positive_integers( @numbers );
    my $average = get_average( @numbers );
    my @above_average = ();
    foreach my $number (@numbers) {
        if ($number > $average) {
            push @above_average, $number;
        }
    }
    return @above_average;
}

sub filter_positive_integers {
    return grep(/^[0-9]+$/, @_);
}

sub get_average {
    return total(@_)/scalar @_;
}

sub total {
    chomp( my @numbers = @_ );
    my $total = 0;
    foreach my $number (@numbers) {
        $total += $number;    
    }
    return $total;
}

