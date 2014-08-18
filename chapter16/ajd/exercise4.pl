#!/usr/bin/perl

use strict;
use warnings;

# Signal catching

print "The PID for this process is $$\n";

# Let's go for all of the signals because it doesn't matter how many there are
# Apparently perl doesn't like the SIG(MAX-|MIN+)\d+ signals though
my @signals = qw/
   SIGHUP        SIGINT        SIGQUIT       SIGILL        SIGTRAP
   SIGABRT       SIGBUS        SIGFPE        SIGKILL       SIGUSR1
   SIGSEGV       SIGUSR2       SIGPIPE       SIGALRM       SIGTERM
   SIGSTKFLT     SIGCHLD       SIGCONT       SIGSTOP       SIGTSTP
   SIGTTIN       SIGTTOU       SIGURG        SIGXCPU       SIGXFSZ
   SIGVTALRM     SIGPROF       SIGWINCH      SIGIO         SIGPWR
   SIGSYS        SIGRTMIN      SIGRTMAX
/;

# Set a handler function for all of the signals that increments a counter
my %signal_counts;

foreach my $signal ( @signals ) {
  $signal =~ s/SIG//; # strip it down
  # Using anonymous functions because names are overrated
  $SIG{$signal} = sub { print "Received $signal\n"; $signal_counts{$signal}++ };
}

# Not strictly an infinite loop, but it exits at the right time
# Could have written a separate handler for INT that did it, but I didn't want to
while ( !$signal_counts{INT} ) {

  print "Signal count:\n";
  foreach my $key ( sort keys %signal_counts ) {
    print "$key => $signal_counts{$key}\n";
  }

  sleep ( 10 );
}

