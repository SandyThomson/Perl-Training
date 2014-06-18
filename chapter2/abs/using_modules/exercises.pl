use LearningPerl::Math qw( circumference );
use LearningPerl::Interactive qw(
	capture_input
	capture_numeric_input
);
use strict;
use constant {
	precision => 1,
	radius => 12.5
};

CORE::say( 'Running Exercise 1' );
one();

CORE::say( 'Running Exercise 2' );
two();

CORE::say( 'Running Exercise 3' );
three();

CORE::say( 'Running Exercise 4' );
four();

CORE::say( 'Running Exercise 5' );
five();

sub one {
	my $circumference = circumference( radius );
	my $format = '%.' . precision . 'f';
	my $formatted_circumference = sprintf( $format, $circumference );

	CORE::say( "Your Circumference is: $formatted_circumference" );
}

sub two {
	my $radius = capture_numeric_input( 'Enter Radius: ' );
	my $circumference = circumference( $radius );
	my $format = '%.' . precision . 'f';
	my $formatted_circumference = sprintf( $format, $circumference );

	CORE::say( "Your Circumference is: $formatted_circumference" );
}

sub three {
	my $radius = capture_numeric_input( 'Enter Radius: ' );
	my $circumference = circumference( $radius > 0 ? $radius : 0 );
	my $format = '%.' . precision . 'f';
	my $formatted_circumference = sprintf( $format, $circumference );
	CORE::say( "Your Circumference is: $formatted_circumference" );
}

sub four {
	my $first = capture_numeric_input( 'Enter 1st number: ' );
	my $second = capture_numeric_input( 'Enter 2st number: ' );
	my $multiplied = $first * $second;
	CORE::say( "$first * $second = $multiplied" );
}

sub five {
	my $word = capture_input( 'Enter word to repeat: ' );
	my $repeat = capture_numeric_input( 'How many times would you like to repeat that? ' );
	print( ( $word . $/ ) x $repeat );
}

1;
