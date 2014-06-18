use Test::More tests => 9;
use LearningPerl::Math qw( 
	circumference
	is_numeric
);

circumference_tests();
is_numeric_tests();

sub circumference_tests {
	my $circumference = circumference( 1 );
	is( $circumference, 6.28318530717959, 'Positive Value Radius' );

	$circumference = circumference( 0 );
	is( $circumference, 0, 'Zero Value Radius' );

	$circumference = circumference( -1 );
	is( $circumference, -6.28318530717959, 'Negative Value Radius' );

	$circumference = circumference( 'abc' );
	is( $circumference, 0, 'Non-numeric Radius' );
}

sub is_numeric_tests {
	my $ok = is_numeric( 0 );
	is( $ok, 1, 'Simple Numeric Test' );

	$ok = is_numeric( -1 );
	is( $ok, 1, 'Negative Numeric Test' );

	$ok = is_numeric( 1.1 );
	is( $ok, 1, 'Decimal Numeric Test' );
	
	$ok = is_numeric( 1.1.1 );
	is( $ok, 0, 'Bad Decimal Numeric Test' );

	$ok = is_numeric( 'abc' );
	is( $ok, 0, 'Alpha Numeric Test' );
}

1;
