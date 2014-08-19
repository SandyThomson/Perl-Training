#!/usr/bin/perl

use strict;
use warnings;

main();

sub main {
  my $longest_key = 0;
  my $longest_value = 0;
	
	# start with _ to make appear last
	$ENV{_RANDOM_1} = undef;
	$ENV{_RANDOM_2} = defined;
	$ENV{_RANDOM_3} = undef;

  while ( my ( $key, $value ) = each( %ENV ) ) {
    # find longest key/value length
    $longest_key = length( $key ) if length( $key ) > $longest_key;
    $longest_value = length( $value ) if length( $value ) > $longest_value;
  }

  my $table_properties = get_table_properties( $longest_key, $longest_value );
  print_table( $table_properties );
}

sub print_table {
  my ( $table ) = @_;

  my $format = $table->{column_format};
  my $key_length = $table->{key_column_length};
  my $value_length = $table->{value_column_length};

  # print table header
  _print_divider( $table );
  printf( $format, $key_length, $table->{key_column_header}, $value_length, $table->{value_column_header} );
  _print_divider( $table );

  # print each pair of the ENV hash
  foreach my $key ( sort( keys( %ENV ) ) ) {
    printf( $format, $key_length, $key, $value_length, ( $ENV{$key} // 'undefined value' ) );
    _print_divider( $table );
  }
}

sub _print_divider {
  my ( $table ) = @_;

  print( '-' x $table->{table_length}, "\n" );
}

# Builds a hash with the properties of the table
sub get_table_properties {
  my ( $longest_key, $longest_value ) = @_;

  # table properties used while outputing the table
  my $table = {
    key_column_header => 'Key',
    value_column_header => 'Value',
    table_length => 1,
    column_format => "|%*s|%*s|\n",

    # will be set below
    key_length => undef,
    value_length => undef
    };

  # set word column length and add to table length
  if ( $longest_key > length( $table->{key_column_header} ) ) {
    $table->{key_column_length} = $longest_key;
  }
  else {
    $table->{key_column_length} = length( $table->{key_column_header} );
  }

  # Term::ReadKey was installed by default on the debian VMs but not on 
  # my home PC, let's make sure we have this module else just allow the 
  # table contents to overflow the console width by setting the width to 0
  my $width = eval {
    require Term::ReadKey;
    my ( $w ) = Term::ReadKey::GetTerminalSize();
    # we know the table will only have two columns, this width will be per column
    return $w / 2;
  };
  $width = 0 if ( $@ ); 

  # make sure the key column doesn't overflow the console, if we have this information
  if ( $width && $table->{key_column_length} > $width ) {
    $table->{key_column_length} = $width;
  }
  $table->{table_length} += $table->{key_column_length} + 1;

  # set value column length and add to table length
  if ( $longest_value > length( $table->{value_column_header} ) ) {
    $table->{value_column_length} = $longest_value;
  }
  else {
    $table->{value_column_length} = length( $table->{value_column_header} );
  }
  # make sure the value column doesn't overflow the console, if we have this information
  if ( $width && $table->{value_column_length} > $width ) {
    $table->{value_column_length} = $width;
  }
  $table->{table_length} += $table->{value_column_length} + 1;

  return $table
} ## end sub get_table_properties

