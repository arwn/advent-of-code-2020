use strict;
use warnings;
use v5.12;

my @lines;

open my $fh, '<', 'data';
while (<$fh>) { chomp; push @lines, $_ }

my $width = length $lines[0];

my $s1 = find_trees( 3, 1 );

my $s2 =
  find_trees( 1, 1 ) *
  find_trees( 3, 1 ) *
  find_trees( 5, 1 ) *
  find_trees( 7, 1 ) *
  find_trees( 1, 2 );

say "solution_one{$s1}, solution_two{$s2}.";

sub find_trees {
    my $right   = shift;
    my $down    = shift;
    my $linenum = $down;
    my $colnum  = $right;
    my $trees   = 0;
    while ( $linenum < @lines ) {
        my $line = $lines[$linenum];
        my $char = substr $line, $colnum, 1;
        if ( $char eq "#" ) { $trees++ }
        $colnum = ( $colnum + $right ) % $width;
        $linenum += $down;
    }
    return $trees;
}
