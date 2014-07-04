#!/usr/bin/perl

use strict;
use warnings;
use feature qw(say);
use 5.010;

greet("fred");
greet("barney");

sub greet {
    my ($arrival) = @_;
    state @arrivals;
    my $message = '';
    if (!@arrivals) {
        $message .= "Welcome $arrival, you are the first one here.";
    }
    else {
        $message .= "Welcome $arrival, you arrived just after $arrivals[-1]";
    }
    say $message;
    push @arrivals, $arrival;}