#!/usr/bin/perl

use strict;
use warnings;

use constant MAX => 1000;

my $total = total(1..MAX);
print "The total is $total.\n";
# or simpler
$total = sum_to_number(MAX);
print "The total (using sum_to_number(..)) is $total.\n";

sub total {
    chomp( my @numbers = @_ );
    my $total = 0;
    foreach my $number (@numbers) {
        # I've decided it's Integers only
        if ($number =~ /^-?[0-9]+$/) {
            $total += $number;    
        } else {
            print "I'm only totalling integers, [$number] is not an integer.\n";
        }
    }
    return $total;
}

sub sum_to_number {
    my ($limit) = @_;
    return ($limit * ( $limit + 1 ) ) / 2;
}

