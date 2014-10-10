#!/usr/bin/perl

use strict;
use warnings;

use feature qw( say );

#use Data::Dumper;
#say( Dumper( \%SIG ) );

my $sig_count = 0;
sub count_sigs { $sig_count++; }

foreach my $sig ( qw( ABRT TRAP EMT TTOU IO URG STOP PROF TSTP SEGV PIPE USR2 INFO
	SYS VTALRM CONT TERM CHLD BUS HUP FPE XCPU IOT TTIN XFSZ KILL QUIT
	__WARN__ WINCH USR1 ILL ALRM ) ) {
	$SIG{$sig} = 'count_sigs';
}

$SIG{INT} = sub {
	say( "Total signals: $sig_count" );
	exit 1;
};

say( "PID: $$" );

while( 1 ) { sleep 1 };
