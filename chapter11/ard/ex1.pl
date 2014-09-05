#!/usr/bin/perl -w
use strict;

use 5.010;
use Module::CoreList;

my $version = 5.014;

my %modules = %{ $Module::CoreList::version{$version} };

my $title = "Core modules for Perl $version";
$title .= "\n" . '=' x length( $title ) . "\n";

say $title;
say join( "\n", map { "  $_" } sort keys %modules );
