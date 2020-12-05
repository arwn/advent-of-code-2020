use strict;
use warnings;
use v5.32;
use List::Util qw(max);
use Array::Utils qw(array_diff);

sub get_seatid {
    use integer;
    my @data        = split //, $_;
    my $row         = 0;
    my $row_step    = 128;
    my $column      = 0;
    my $column_step = 8;
    while (@data) {
        for ( shift @data ) {
            if (/B/) { $row_step /= 2; $row += $row_step }
            if (/F/) { $row_step    /= 2; }
            if (/R/) { $column_step /= 2; $column += $column_step }
            if (/L/) { $column_step /= 2; }
        }
    }
    my $seat_id = $row * 8 + $column;
    $seat_id;
}

sub my_seatid {
    my @taken = sort { $a <=> $b } @_;
    my @all   = ( $taken[0] .. $taken[-1] );
    my @diff  = array_diff( @taken, @all );
    return $diff[0];
}

open my $fh, "<", "input" or die "cant open file";
my @lines = <$fh>;
my @ids   = map { get_seatid } @lines;
say "max id: " . max @ids;
say "my seat: " . my_seatid @ids;
