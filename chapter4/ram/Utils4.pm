package Utils4;

use strict;
use warnings;
use 5.010;

require Exporter;
use vars qw( @ISA @EXPORT @EXPORT_OK );

@ISA = qw( Exporter );
@EXPORT_OK = qw( greet );

sub greet {
  my ( $person ) = @_;

  state $last_person;

  if ( !defined $last_person ) {
    print "Hi $person! You are the first one here!\n";
  }
  else {
    print "Hi $person! $last_person is also here!\n";
  }
  $last_person = $person;
}

1;
