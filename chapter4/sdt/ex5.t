#!/usr/bin/perl

use strict;
use warnings;
use Test::More;
use ex5 qw( greet );
use Capture::Tiny qw( capture_stdout ); # libcapture-tiny-perl on Ubuntu

my $actual = capture_stdout{ greet( "Sandy" ) };
my $expected = "Hi Sandy! You are the first one here!\n";
is( $actual, $expected, "Incorrect text returned" );

$actual = capture_stdout{ greet( "Andrew" ) };
$expected = "Hi Andrew! I've seen: Sandy\n";
is( $actual, $expected, "Incorrect text returned" );

$actual = capture_stdout{ greet( "Ram" ) };
$expected = "Hi Ram! I've seen: Sandy Andrew\n";
is( $actual, $expected, "Incorrect text returned" );

$actual = capture_stdout{ greet( "Richard" ) };
$expected = "Hi Richard! I've seen: Sandy Andrew Ram\n";
is( $actual, $expected, "Incorrect text returned" );

done_testing();
