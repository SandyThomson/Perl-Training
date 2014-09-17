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

my %oldest_file = (
  name => undef,
  age => 0,
);

foreach my $file ( sort keys %uniq_files ) {
  if ( -e $file ) {
    check_if_oldest( $file );
  }
}

if ( defined $oldest_file{name} ) {
  printf( "\nThe oldest target file is %s at %f days\n", $oldest_file{name}, $oldest_file{age} );
}
else {
  say "\nEither no filenames were provided or none of them exist.";
}


sub check_if_oldest {
  my ( $file ) = @_;
  my $file_age = -M _;
  if ( $file_age > $oldest_file{age} ) {
    $oldest_file{name} = $file;
    $oldest_file{age} = $file_age;
  }
}
