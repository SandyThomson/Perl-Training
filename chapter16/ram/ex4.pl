#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

my $sighup_count = 0;
my $sigquit_count = 0;
my $sigusr1_count = 0;

sub my_int_handler {
  die "interrupted, exiting...\n";
}

sub my_hup_handler {
  say "I've just caught a SIGHUP. I've seen these $sighup_count time(s) before";
  $sighup_count++;
}

sub my_quit_handler {
  say "I've just caught a SIGQUIT. I've seen these $sigquit_count time(s) before";
  $sigquit_count++;
}

sub my_usr1_handler {
  say "I've just caught a SIGUSR1. I've seen these $sigusr1_count time(s) before";
  $sigusr1_count++;
}

$SIG{'INT'} = 'my_int_handler';
$SIG{'HUP'} = 'my_hup_handler';
$SIG{'QUIT'} = 'my_quit_handler';
$SIG{'USR1'} = 'my_usr1_handler';

# intentional infinite loop
say "Remember, my PID is $$";
while ( 1 ) {
  # do nothing, forever
}
