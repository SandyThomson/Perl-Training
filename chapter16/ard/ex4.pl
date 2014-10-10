#!/usr/bin/perl -w
use strict;

use 5.010;

# Oddly, the output from the backticked call doesn't match the format of
# issuing the command directly in the terminal, at least on OS X
my @raw = `kill -l`;
my @sigs = ();

foreach my $line ( @raw ) {
  chomp $line;
  push @sigs, $line =~ m/\b(\w+)\b/g;
}

# This sets up all of the handler subroutine calls
foreach my $sig ( @sigs ) {
  $SIG{ uc $sig } = "my_${sig}_handler";
}

say "Running with PID $$";

while ( 1 ) {
  sleep 1;
}

sub my_int_handler {
  say "Caught signal INT - exiting";
  exit;
}

## This is what I used to generate the following subroutines...
#foreach ( sort @sigs ) {
#  next if ( $_ eq 'int' );
#  say "sub my_${_}_handler {";
#  say '  state $count;';
#  say '  say "Caught signal ' . uc( $_ ) . '; count: " . ++$count;';
#  say '}';
#}

sub my_abrt_handler {
  state $count;
  say "Caught signal ABRT; count: " . ++$count;
}

sub my_alrm_handler {
  state $count;
  say "Caught signal ALRM; count: " . ++$count;
}

sub my_bus_handler {
  state $count;
  say "Caught signal BUS; count: " . ++$count;
}

sub my_chld_handler {
  state $count;
  say "Caught signal CHLD; count: " . ++$count;
}

sub my_cont_handler {
  state $count;
  say "Caught signal CONT; count: " . ++$count;
}

sub my_emt_handler {
  state $count;
  say "Caught signal EMT; count: " . ++$count;
}

sub my_fpe_handler {
  state $count;
  say "Caught signal FPE; count: " . ++$count;
}

sub my_hup_handler {
  state $count;
  say "Caught signal HUP; count: " . ++$count;
}

sub my_ill_handler {
  state $count;
  say "Caught signal ILL; count: " . ++$count;
}

sub my_info_handler {
  state $count;
  say "Caught signal INFO; count: " . ++$count;
}

sub my_io_handler {
  state $count;
  say "Caught signal IO; count: " . ++$count;
}

# This doesn't work - 'kill -9' will always terminate the process. Which is probably a good thing.
sub my_kill_handler {
  state $count;
  say "Caught signal KILL; count: " . ++$count;
}

sub my_pipe_handler {
  state $count;
  say "Caught signal PIPE; count: " . ++$count;
}

sub my_prof_handler {
  state $count;
  say "Caught signal PROF; count: " . ++$count;
}

sub my_quit_handler {
  state $count;
  say "Caught signal QUIT; count: " . ++$count;
}

sub my_segv_handler {
  state $count;
  say "Caught signal SEGV; count: " . ++$count;
}

sub my_stop_handler {
  state $count;
  say "Caught signal STOP; count: " . ++$count;
}

sub my_sys_handler {
  state $count;
  say "Caught signal SYS; count: " . ++$count;
}

sub my_term_handler {
  state $count;
  say "Caught signal TERM; count: " . ++$count;
}

sub my_trap_handler {
  state $count;
  say "Caught signal TRAP; count: " . ++$count;
}

sub my_tstp_handler {
  state $count;
  say "Caught signal TSTP; count: " . ++$count;
}

sub my_ttin_handler {
  state $count;
  say "Caught signal TTIN; count: " . ++$count;
}

sub my_ttou_handler {
  state $count;
  say "Caught signal TTOU; count: " . ++$count;
}

sub my_urg_handler {
  state $count;
  say "Caught signal URG; count: " . ++$count;
}

sub my_usr1_handler {
  state $count;
  say "Caught signal USR1; count: " . ++$count;
}

sub my_usr2_handler {
  state $count;
  say "Caught signal USR2; count: " . ++$count;
}

sub my_vtalrm_handler {
  state $count;
  say "Caught signal VTALRM; count: " . ++$count;
}

sub my_winch_handler {
  state $count;
  say "Caught signal WINCH; count: " . ++$count;
}

sub my_xcpu_handler {
  state $count;
  say "Caught signal XCPU; count: " . ++$count;
}

sub my_xfsz_handler {
  state $count;
  say "Caught signal XFSZ; count: " . ++$count;
}
