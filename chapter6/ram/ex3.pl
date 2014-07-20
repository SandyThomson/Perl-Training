#!/usr/bin/perl

use strict;
use warnings;

my $colwidth = 20;

foreach my $key ( keys( %ENV ) ) {
  my $keylength = length( $key );
  if ( $keylength > $colwidth ) {
    $colwidth = $keylength;
  }
}

my $colformat = "%-${colwidth}.${colwidth}s | %s\n";
printf( $colformat, "Environment Variable", "Value" );
print( "-" x $colwidth . " | " . "-" x $colwidth . "\n" );

foreach my $key ( sort( keys( %ENV ) ) ) {
  printf( "%-${colwidth}.${colwidth}s | %s\n", $key, $ENV{$key} );
}

