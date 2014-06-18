use LearningPerl::Math qw( circumference );
use strict;
use constant {
	precision => 1,
	radius => 12.5
};

my $circumference = circumference( radius );
my $format = '%.' . precision . 'f';
my $formatted_circumference = sprintf( $format, $circumference );

CORE::say( "Your Circumference is: $formatted_circumference" );
