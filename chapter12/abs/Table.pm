package Table;

use warnings;
use strict;

sub new {
	my $self = bless( {}, shift );
	$self->_initialise( @_ );
	return $self;
}

sub _initialise {
	my ( $self, @headers ) = @_;
	
	# expecting at least 1 header
	$self->{_info}->{column_count} = scalar( @headers // () );
	die 'Missing table headers' if ( $self->{_info}->{column_count} < 1 );
	$self->{_info}->{headers} = \@headers;
	# 0-width columns requires a table width same as the 
	# number of columns to account for dividers
	$self->{_info}->{output}->{table_width} = $self->{_info}->{column_count};
	$self->_update_column_widths( @headers );
	$self->{_rows} = [];
}

sub add_row {
	my ( $self, @row ) = ( @_ );
	
	my $column_count = scalar( @row );
	my $expected = $self->{_info}->{column_count};
	if ( $column_count != $expected ) {
		die "Table requires $expected columns. Row contains $column_count columns";
	}
	
	$self->_update_column_widths( @row );
	push $self->{_rows}, \@row;
}

sub _update_column_widths {
	my ( $self, @row ) = @_;
	
	for ( my $i = 0; $i < $self->{_info}->{column_count} ; $i++ ) {
	
		my $new_width = length( $row[$i] );
		my $old_width = ( $self->{_info}->{output}->{"column_width_$i"} // 0 );
		
		if ( $new_width > $old_width ) {
			# extend the overall table width to account for the extra column width
			$self->{_info}->{output}->{table_width} += ( $new_width - $old_width );
			# update columns width with new width
			$self->{_info}->{output}->{"column_width_$i"} = $new_width;
		}
	}
}

#override stringify, for example 'print( $self );' or '' . "$self"
use overload fallback => 1, '""' => sub { 
	my ( $self ) = @_;

	# divider > header > divider
	my $output = $self->_table_divider();
	$output .= $self->_get_row_output( $self->{_info}->{headers} );
	$output .= $self->_table_divider();
	# foreach row: row > divider
	foreach my $row_ref ( @{$self->{_rows}} ) {
		$output .= $self->_get_row_output( $row_ref )	. $self->_table_divider();
	}
	return $output;
};

sub _get_row_output {
	my ( $self, $row ) = @_;
	
	my $output = '|';
	for ( my $i = 0; $i < $self->{_info}->{column_count}; $i++ ) {
		$output .= sprintf( '%*s|', $self->{_info}->{output}->{"column_width_$i"}, $row->[$i] );
	}
	return "$output\n";
}

sub _table_divider {
	my ( $self ) = @_;
	return "+" . ( '-' x ( $self->{_info}->{output}->{table_width} - 1 ) ) . "+\n";
}

1;
