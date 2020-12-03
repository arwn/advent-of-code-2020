use strict;
use warnings;
use v5.13;

my $valid;

open my $fh, "<", "input";

for my $line (<$fh>) {
    my ($pos_a, $pos_b, $char, $str) = ($line =~ /(\d+)-(\d+) ([a-z]): ([a-z]+)/);
    my $val_a = substr $str, $pos_a - 1, 1;
    my $val_b = substr $str, $pos_b - 1, 1;
    $valid++ if  ($val_a eq $char) xor ($val_b eq $char);
}

say $valid;