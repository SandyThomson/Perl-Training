#!/usr/bin/perl
use strict;
use warnings;
use feature qw( say);
use 5.14.0;

my $process_number = $$;
say "Process number : $process_number";

my $hup_count = 0;
my $usr1_count = 0;
sub int_handler {
  die "Killing process...\n";
}

sub hup_handler {
  $hup_count++;
  say  "Hup... $hup_count";
}

sub usr1_handler {
  $usr1_count++;
  say  "MPM ! $usr1_count";
}


$SIG{'INT'} = 'int_handler';
$SIG{'HUP'} = 'hup_handler';
$SIG{'USR1'} = 'usr1_handler';

while(1){
  # LOOOOOOOOOP !
}

