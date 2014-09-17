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

foreach my $file ( sort keys %uniq_files ) {
  print "  '$file' ";
  if ( -e "$file" ) {
    say 'exists.';
    perform_permission_checks();
  }
  else {
    say 'does not exist.';
  }
}


sub perform_permission_checks {
  # To save some repetition in the output, and enable us to add more checks later,
  # here's a hash of check names to anonymous subroutines which perform the check
  # and return true/false.
  my %checks = (
    'executable' => sub { return ( -x _ ); },
    'readable' => sub { return ( -r _ ); },
    'writeable' => sub { return ( -w _ ); },
  );
  
  foreach my $check ( sort keys %checks ) {
    say '    It is ', ( &{ $checks{$check} } ) ? '' : 'not ', $check;
  }
}
