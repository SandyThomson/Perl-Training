#!/usr/bin/perl

use strict;
use warnings;
use feature qw(say);
use 5.010;

greet("Fred");
greet("Barney");
greet("Wilma");
greet("Betty");

sub greet {
    my ($arrival) = @_;
    state @arrivals;
    my $message = '';
    if (!@arrivals) {
        $message .= "Welcome $arrival, you are the first one here.";
    }
    else {
        $message .= "Welcome $arrival, I've seen @arrivals";
    }
    say $message;
    push @arrivals, $arrival;
}
