#/usr/bin/perl

use strict;
use warnings;

foreach ( @ARGV ) {
  print "Writing new file for: $_\n";
  write_new_file( $_ );
}

sub write_new_file {
  my ( $src ) = @_;
  print "I got $src\n";
  my $dest = $src . ".out";
  open ( my $in, "<", $src ) || die ( "Can't open file $src: $!\n" );
  open ( my $out, ">", $dest ) || die ( "Can't open file $dest: $!\n" );
  while ( <$in> ) {
    s/fred/Larry/ig;
    print $out $_;
  }
}
