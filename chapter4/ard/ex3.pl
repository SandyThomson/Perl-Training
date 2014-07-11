#!/usr/bin/perl -w
use strict;
use 5.0100;

use Scalar::Util qw( looks_like_number );


my @fred = above_average( 1..10 );
say "\@fred is @fred";
say "(should be 6 7 8 9 10)";

my @barney = above_average( 100, 1..10 );
say "\@barney is @barney";
say "(should be just 100)";

say "Enter some numbers on separate lines:";
chomp( my @input = <STDIN> );
my @numbers = validate( @input );

say "You entered (ignoring non-numerics): @numbers";
my @above_average = above_average( @numbers );
say "Those above average are: @above_average";


sub validate {
  my @input = @_;
  my @numbers = grep { looks_like_number( $_ ) } @input;
  if ( scalar @numbers ) {
    return @numbers;
  }
  else {
    die "You didn't provide any numbers!";
  }
}

sub above_average {
  my @args = @_;
  my $average = average( @args );
  # OK, we've not learned about grep yet, but it's tailor made for this kind of task :-)
  return grep { $_ > $average } @args;
}

sub average {
  my @args = @_;
  return total( @args ) / scalar @args;
}

sub total {
  my @args = @_;
  my $total = 0;
  
  foreach my $arg ( @args ) {
    $total += $arg;
  }
  
  return $total;
}
