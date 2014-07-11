package ex3;

use strict;
use warnings;
use feature 'say';
use Exporter;
use ex1 qw( total is_list_entirely_numeric );
our @ISA = qw( Exporter );
our @EXPORT_OK = qw( above_average );

sub above_average {
  my @numbers = @_;
  my $total = 0;


  my $mean = calculate_mean( @numbers );

  my @above_average = grep { $_ > $mean } @numbers;

  return @above_average;
}


sub calculate_mean {
  my @numbers = @_;

  # Adds all elements of the list together, and then divides by the number of elements in the list
  # Ordinarily I'd use List::Util qw( sum ), however the exercise is supposed to reuse total() I think
  return total( @numbers ) / @numbers;

}

1;
