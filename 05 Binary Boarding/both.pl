use strict;
use warnings;
use v5.32;
use List::Util qw(max);
use Array::Utils qw(array_diff);

sub get_seatid {
    s/R/1/g;
    s/L/0/g;
    s/F/0/g;
    s/B/1/g;
    my $row    = sprintf( "%d", eval( "0b" . substr $_, 0, 7 ) );
    my $column = sprintf( "%d", eval( "0b" . substr $_, 7, 10 ) );
    my $seat_id = $row * 8 + $column;
    $seat_id;
}

sub my_seatid {
    my @taken = sort { $a <=> $b } @_;
    my @all   = ( $taken[0] .. $taken[-1] );
    my @diff  = array_diff( @taken, @all );
    $diff[0];
}

open my $fh, "<", "input" or die "cant open file";
my @lines = <$fh>;
my @ids   = map { get_seatid } @lines;
say "max id: " . max @ids;
say "my seat: " . my_seatid @ids;
