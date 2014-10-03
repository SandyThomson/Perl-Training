#!/usr/bin/perl
use strict;
use warnings;
use feature qw( say);
use 5.010001;


my $number = $ARGV[0] // 105; # 105 is the answer
given( $number  ){
  when( ( $_ % 3 ) == 0  ) { print "Fizz " ; continue; }
  when( ( $_ % 5 ) == 0  ) { print "Bin " ; continue;}
  when( ( $_ % 7 ) == 0  ) { print "Sausage " ; continue; }
  default { print "\n" ;  }
}
