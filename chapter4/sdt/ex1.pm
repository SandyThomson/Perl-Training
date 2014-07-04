package ex1;

use strict;
use warnings;
use feature 'say';
use Exporter;
use Scalar::Util qw( looks_like_number );
our @ISA = qw( Exporter );
our @EXPORT_OK = qw( total is_list_entirely_numeric );

sub total {
  my @numbers = @_;
  my $total = 0;

  if( !is_list_entirely_numeric( @numbers ) ){
    die "List contains input that's not entirely numeric";
  }

  foreach my $number (@numbers) {
    $total += $number;
  }

  return $total;
}

sub is_list_entirely_numeric {
  my @numbers = @_;

  if( grep { ! looks_like_number( $_ ) } @numbers ) {
    return 0;
  } else {
    return 1;
  }
}

1;
