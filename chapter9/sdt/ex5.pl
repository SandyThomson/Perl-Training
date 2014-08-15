#!/usr/bin/perl
## Copyright (C) 2014 by Yours Truly

use strict;
use warnings;

$^I = '.backup';

my $previous_line_was_shebang = 0;

while( my $current_line = <> ) {

  if( $previous_line_was_shebang ){
    if( $current_line !~ m|^## Copyright \(C\)| ){
      $current_line = "## Copyright (C) 2014 by Yours Truly\n".$current_line;
    }
  }

  $previous_line_was_shebang = ( $current_line =~ m|^#!/usr/bin/perl\s*$| ) ? 1 : 0;
  print $current_line;
}
