#!/usr/bin/perl

use strict;
use warnings;

use feature qw( say );

# look at the first letter of the returned value of
# `date` this is quicker than compiling a regex
if ( substr( `date`, 0, 1 ) eq 'S' ) {
	say( 'Go play' );
} else {
	say( 'Go to work' );
}
