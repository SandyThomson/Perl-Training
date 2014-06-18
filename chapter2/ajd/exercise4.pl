#!/usr/bin/perl

use strict;
use warnings;

my ( $value1, $value2 ) = @ARGV;

# Ask for two numbers if they weren't supplied as arguments
if ( !check_number( $value1 ) ) {
  $value1 = get_number( 1 );
}

if ( !check_number( $value2 ) ) {
  $value2 = get_number( 2 );
}

# Calculate and display the product
my $product = $value1 * $value2;
print "The product is $product\n";

sub get_number {

  # Get a number from the user and validate it 

  my ( $count ) = @_;
  if ( !defined $count ) {
    $count = '';
  }
  my $number;

  # Ask for a number until the user supplies one
  do {
    print "Enter number $count: ";
    $number = <STDIN>;
  } while ( !check_number($number) );

  chomp($number);
  return $number; 

}

sub check_number {
  my ( $number ) = @_;

  # Returns a true value if supplied with a number

  if ( !defined $number ) {
    return 0;
  }

  # Quick spot of number validation
  return ( $number =~ /^-?\d+(?:\.\d+)?$/) ? 1 : 0; 
}
