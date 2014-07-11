#!/usr/bin/perl

use strict;
use warnings;

my @fred = qw{ 1 3 5 7 9 };
my $fred_total = total(@fred);
print "The total of \@fred is $fred_total.\n";
print "Enter some numbers on seperate lines:\n";
my $user_total = total(<STDIN>);
print "The total of these numbers is $user_total.\n";

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