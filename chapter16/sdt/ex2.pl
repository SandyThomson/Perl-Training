#!/usr/bin/perl

use strict;
use warnings;
use IPC::Open3; # Captures STDOUT and STDERR seperately
use Symbol;

# Junk command to give some output
my $command_with_stdout_and_err = "perl -e \"print STDOUT 'yay\n'; print STDERR 'boobs\n'; print STDOUT 'noo\n'; die 'foo\n'\"";

my $pid = open3(my $in, my $out, my $err = gensym(), $command_with_stdout_and_err);
print "[PID]: $pid\n";
waitpid($pid, 0);

while(<$err>){
  print "[ERROR] : $_";
}
while (<$out>){
  print "[OUTPUT]: $_";
}
