use strict;
use warnings;
use v5.12;

open my $fh, "<", "input";

my $valid = 0;

for my $line (<$fh>) {
    chomp $line;
    my ($min, $max, $char, $str) = ($line =~ /(\d+)-(\d+) ([a-z]): ([a-z]+)/);
    my $matches = () = $str =~ /$char/g; # count matches of single char
    if ($matches >= $min && $matches <= $max) {
        $valid++;
    }
}

say $valid;