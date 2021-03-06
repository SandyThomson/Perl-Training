#!/usr/bin/perl

use strict;
use warnings;

# Check whether there are any file arguments
if (! scalar @ARGV ) {
  print "Enter some lines, Ctrl-D to exit:\n";
}

# Keeping line breaks because lazy
my @lines = <>;

# Rather than write separate scripts, here's a hash with the exercises as keys
# Each exercise has a regex and a description
# The qr// thing quotes a regex, which you can use like: $something =~ $quoted_regex
my %exercises = (
    1   => { regex => qr/fred/, description => 'fred' },
    1.1 => { regex => qr/\bfred\b/, description => 'fred (standalone)' }, # Using word boundaries
    2   => { regex => qr/[Ff]red/, description => 'fred or Fred' },
    2.1 => { regex => qr/\b[Ff]red\b/, description => 'fred or Fred (standalone)' }, # Using word boundaries
    3   => { regex => qr/\./, description => 'a full stop' },
    4   => { regex => qr/\b[A-Z]\w*[a-z]+\w*\b/, description => "a capitalised word that isn't all capitalised" },
    5   => { regex => qr/(\w)\1/, description => 'a double letter' },
    6   => { regex => qr/(?:fred.*wilma|wilma.*fred)/, description => 'fred and wilma' },
    );

# Check each exercise against the input lines
foreach my $exercise (sort keys %exercises) {
  printf ( "\nExercise %s:\n", $exercise );
  printf ( "\nLines Containing: %s\n", $exercises{$exercise}->{description} );
  print grep( /$exercises{$exercise}->{regex}/, @lines );
}

