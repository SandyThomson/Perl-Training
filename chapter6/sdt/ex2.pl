#!/usr/bin/perl

use strict;
use warnings;

use 5.010; # 'say'

my %wordcount;

say "Please enter words on seperate lines (CTRL-D to cease input)";
say "=" x 20;

while( my $word = <STDIN> ){
  chomp $word;
  if( $word !~ /^\w+$/ ){
    say "Please enter a valid word (Ignoting).";
    next;
  }

  $wordcount{lc $word} += 1;
}

say "Counts ordered by word code point";
say "=" x 20;

my %countstowords; # Count[key] => \( W1, W2 ... ) [arrayref value]

foreach my $word ( sort keys %wordcount ){
  say $word .": ".$wordcount{$word};

  # Now reorganise data so we can list the words which have appeared the most times at the top
  my @words = ( exists $countstowords{$wordcount{$word}} ) ? @{$countstowords{$wordcount{$word}}} : ();;
  push @words, $word;
  $countstowords{$wordcount{$word}} = \@words;
}

say "Counts ordered numerically (y'know, more brownie points)";
say "=" x 20;

# Based on the stuff we did in the last foreach loop, we can sort the wordcounts (descending) and get the list of words for each count
foreach my $wordcount (sort {$b <=> $a} keys %countstowords){

  my @words = @{$countstowords{$wordcount}};

  foreach my $word ( @words  ){
    say $word .": ".$count;
  }
} 
