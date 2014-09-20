#!/usr/bin/perl

use strict;
use warnings;

unlink @ARGV or warn "Some files could not be deleted: $!\n";

