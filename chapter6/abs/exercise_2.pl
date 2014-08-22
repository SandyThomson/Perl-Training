#!/usr/bin/perl

use strict;
use warnings;

main();

sub main {
  my $longest_word = 0;
  my $highest_count = 0;
  my %words_seen = ();

  print( "Enter input (use CTRL-D when finished):", "\n" );

  # read input
  while ( <> ) {
    chomp;
    $words_seen{$_}++;

    # keep track of the longest input for the column width
    $longest_word = length( $_ ) if length( $_ ) > $longest_word;
    # keep track of the largest count the column width
    $highest_count = $words_seen{$_} if $words_seen{$_} > $highest_count;
  }

  my $table_properties = get_table_properties( $longest_word, length( $highest_count ) );
  print_header( $table_properties );
  print_content( $table_properties, \%words_seen );
}

# Simply prints the table header
sub print_header {
  my ( $table ) = @_;

  _print_divider( $table );
  printf( $table->{column_format}, $table->{word_column_length}, $table->{word_column_header}, $table->{count_column_length}, $table->{count_column_header} );
  _print_divider( $table );
}

# Prints the words seen and divides that row from the next
sub print_content {
  my ( $table, $word_counts ) = @_;

  my $format = $table->{column_format};
  my $word_length = $table->{word_column_length};
  my $count_length = $table->{count_column_length};

  foreach my $word ( sort( keys( $word_counts ) ) ) {
    printf( $format, $word_length, $word, $count_length, $word_counts->{$word} );
    _print_divider( $table );
  }
}

sub _print_divider {
  my ( $table ) = @_;

  print( '-' x $table->{table_length}, "\n" );
}

# Builds a hash with the properties of the table
sub get_table_properties {
  my ( $longest_word, $highest_count ) = @_;

  my $table = {
    word_column_header => 'Word',
    count_column_header => 'Count',
    table_length => 1,
    column_format => "|%*s|%*s|\n",

    # will be set below
    word_column_length => undef,
    count_column_length => undef
    };

  # set word column length and add to table length
  if ( $longest_word > length( $table->{word_column_header} ) ) {
    $table->{word_column_length} = $longest_word;
  }
  else {
    $table->{word_column_length} = length( $table->{word_column_header} );
  }
  $table->{table_length} += $table->{word_column_length} + 1;

  # set count column length and add to table length
  if ( $highest_count > length( $table->{count_column_header} ) ) {
    $table->{count_column_length} = $highest_count;
  }
  else {
    $table->{count_column_length} = length( $table->{count_column_header} );
  }
  $table->{table_length} += $table->{count_column_length} + 1;

  return $table
} ## end sub get_table_properties


