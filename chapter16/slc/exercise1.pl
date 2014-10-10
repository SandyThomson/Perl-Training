#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

# chdir
chdir '/tmp' or die "Cannot chdir.";

# Hardcoded, no need for seperate args
system "ls -l";
