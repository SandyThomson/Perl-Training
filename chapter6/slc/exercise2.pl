#!/usr/bin/perl
use strict;
use warnings;

print "Enter some lines to count: \n";
my @input = <STDIN>;
chomp(@input);

my %counts = get_counts( @input );

print "\nHere are the counts: \n";
foreach my $key (sort keys %counts) {
  printf "%20s => $counts{$key}\n", $key;
}

sub get_counts {
  my @input = @_;
  
  my %tmp_counts = ();
  
  if (@input) {
    for my $line (@input) {
      # add if not there
      if (!exists $tmp_counts{$line}) {
        $tmp_counts{$line} = 0;
      }
      # always increment
      $tmp_counts{$line} += 1;
    }
  }
  
  return %tmp_counts;
}