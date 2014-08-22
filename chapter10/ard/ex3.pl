#!/usr/bin/perl -w
use strict;
use 5.010;

# We're taking a copy in case anything is monkeying with them in the background
my %env = %ENV;

# Shove in a few extras for testing...
$env{BOGUS_UNDEF} = undef;
$env{BOGUS_ZERO} = 0;
$env{BOGUS_EMPTY} = '';
$env{BOGUS_NORMAL} = 'argle blargle';


# Get the display width - basically just find the largest value of the lengths of all of the keys.
# We could use a foreach, but this is much cooler ;-)
my $width = ( sort { $b <=> $a } map { length $_ } keys %env )[0];

say "Environment variables:\n";

foreach my $key ( sort keys %env ) {
  printf( "%*s => %s\n", $width, $key, $env{$key} // '(undefined value)' );
}
