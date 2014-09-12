#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);
use List::Util qw(reduce );
use File::stat;

sub find_oldest_file{
  my @files = @_;
  
  # keep the only the existing  files
  @files =  grep { -e $_  } @files; 
  
  die "Provide at least one valid file" if (scalar @files == 0);
  
  my $oldest =  reduce { stat($a)->mtime < stat($b)->mtime ? $a : $b } @files  ;
  
  return $oldest;
}

sub to_days{
  my ($time_in_sec )= @_;
  return int($time_in_sec / (60 * 60 * 24) );
}

my $oldest_file = find_oldest_file(@ARGV);
my $age = time - stat($oldest_file)->mtime;
say "$oldest_file is ". to_days($age). " days old.";