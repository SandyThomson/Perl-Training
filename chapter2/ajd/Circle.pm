#!/usr/bin/perl

use strict;
use warnings;

package Circle;

use Moose;
use constant PI => 3.141592654; # The exact value of PI

has 'radius' => (
      is  =>  'ro',
      isa =>  'Num',
      default => 1,
    );

# For Exercise 3, intercept negative radius values and replace them with 0
around BUILDARGS => sub {

  my ( $orig, $class, %attributes ) = @_; 

  # The radius can't be less than 0
  if ( $attributes{'radius'} < 0 ) {
    $attributes{'radius'} = 0;
  } 

  return $class->$orig( %attributes );
};

sub circumference {

    my ( $self ) = @_;

    return ( ( 2 * PI ) * $self->radius );
}

1;
