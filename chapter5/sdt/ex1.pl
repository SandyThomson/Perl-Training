#!/usr/bin/perl

use strict;
use warnings;

# This script is not efficient, as it needs to read all
# of the file contents into memory, rather than "streaming" the data,
# however I think it's what the exercise is after
my @file_contents = <>;
print reverse @file_contents;
