#!/usr/bin/perl -w
use strict;
use 5.010;

my %uniq_files = ();

foreach my $pattern ( @ARGV ) {
  # Bash *will* interpolate filename patterns before handing over to Perl.  The use of
  # glob here allows the script to also handle patterns if they make it through.
  # Try running:  ex1.pl '* ex1.pl' - the single-quoted string of args will be nicely munched
  # because of the glob.
  my @files = glob "$pattern";
  say "Processing: '$pattern'";
  
  # We don't want any duplicates
  foreach my $file ( @files ) {
    $uniq_files{$file}++;
  }
}

say "\nThe following files are readable, writeable and owned by you:";

foreach my $file ( sort keys %uniq_files ) {
  if ( -e $file ) {
    perform_permission_checks( $file );
  }
}


sub perform_permission_checks {
  my ( $file ) = @_;
  
  if ( -w -r -o _ ) {
    say "  $file";
  }
}
