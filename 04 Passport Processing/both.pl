use strict;
use warnings;

use List::Util qw(sum);

sub p1_valid {
    /byr/ &&
    /iyr/ &&
    /eyr/ &&
    /hgt/ &&
    /hcl/ &&
    /ecl/ &&
    /pid/;
}

sub p2_valid {
    /byr:19[2-9][0-9]|200[0-2]/ &&
    /iyr:201[0-9]|2020/ &&
    /eyr:202[0-9]|2030/ &&
    /hgt:((1[5-8]\d|19[0-3])cm|(59|6\d|7[0-6])in)/ &&
    /hcl:#[0-9a-f]{6}/ &&
    /ecl:(amb|blu|brn|gry|grn|hzl|oth)/ &&
    /pid:\d{9}[^0-9]/;
}

local $/ = "\n\n";
open my $fh, "<", "input";
my @input = <$fh>;
my $s1 = sum map {p1_valid} @input;
my $s2 = sum map {p2_valid} @input;
print "part one $s1\npart two $s2\n";