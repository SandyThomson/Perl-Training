package Utils;

use strict;
use warnings;
use 5.010;

require Exporter;
use vars qw( @ISA @EXPORT @EXPORT_OK );

@ISA = qw( Exporter );
@EXPORT_OK = qw( total average above_average greet );

sub total {

  my ( @params ) = @_;
  my $running_total = 0;

  foreach ( 0 .. $#params ) {
    $running_total += $params[$_];
  }

  return $running_total;
}

sub average {

  my ( @params ) = @_;
  my $tot = total( @params );
  my $elem_count = scalar( @params );

  return ( $tot / $elem_count );
}

sub above_average {

  my ( @params ) = @_;
  my @above_avg_params;
  my $avg = average( @params );

  foreach ( 0 .. $#params ) {
    if ( $params[$_] > $avg ) {
      push @above_avg_params, $params[$_];
    }
  }

  return @above_avg_params;
}

sub greet {
  my ( $person ) = @_;

  state $people = [];

  if ( scalar( @$people ) == 0 ) {
    print "Hi $person! You are the first one here!\n";
  }
  else {
    print "Hi $person! I've seen: @$people\n";
  }
  push @$people, $person;
}

1;
