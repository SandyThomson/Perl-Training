#!/usr/bin/perl

use strict;
use warnings;
use Test::More;
use ex4 qw( greet );
use Capture::Tiny qw( capture_stdout ); # libcapture-tiny-perl on Ubuntu

my $actual = capture_stdout{ greet( "Sandy the terrible Perl dev" ) };
my $expected = "Hi Sandy the terrible Perl dev! You are the first one here!\n";
is( $actual, $expected, "Incorrect text returned" );

$actual = capture_stdout{ greet( "Andrew the better Perl dev" ) };
$expected = "Hi Andrew the better Perl dev! Sandy the terrible Perl dev is also here!\n";
is( $actual, $expected, "Incorrect text returned" );

done_testing();
